# Agricultural household response to lockdowns

library(tidyverse)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(fixest)    # For fixed effects
library(tidymodels) # For extracting model coefficients
library(patchwork) # For plotting
library(haven)     # For zapping labels


# Load data ----
base <- read_rds(here("data", "base.rds")) %>% 
  zap_labels() %>% 
  mutate(
    survey_num = survey
  ) %>%   
  mutate(
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7")),
  ) 


# Correcting agricultural variables ----

base <- base %>%
  mutate(ag_crops_plant = case_when(
    ag_crops_plant %in% c(2, 3) ~ 0, # Both 2 and 3 represent no
    survey %in% c(2, 4, 5, 6) ~ NA_real_,  # For R2 R4 R6, numbers from prior round preloaded, and the number of yes goes down by 9 or 10
    TRUE ~ ag_crops_plant
  ))

#  Planting question asked in R1,4,7. For R5, prior rnd resp used. Harvesting question in R2. No question in R3 and 6
base <- base %>%
  mutate(ag_plant_change = case_when(
    survey %in% c(2, 5) ~ NA_real_,
    ag_plant_change %in% c(2, 3) ~ 0, # Both 2 and 3 represent no
    TRUE ~ ag_plant_change
  ))

variables <- c("ag_plant_what_abandoned", "ag_plant_what_area_reduce", 
               "ag_plant_what_area_increase", "ag_plant_what_fast_crops", 
               "ag_plant_what_less_variety", "ag_plant_what_more_variety", 
               "ag_plant_what_delayed")

base <- base %>%
  mutate(across(all_of(variables), ~case_when(
    survey %in% c(2, 3, 5, 6) ~ NA_real_, # These questions were not asked for these rounds
    ag_plant_change != NA_real_ & is.na(.) ~ 0, # If there is a change in ag planting, but missing value for the specific strategy, then the dummy should be 0
    TRUE ~ .
  )))

variables_2 <- c("ag_farm_products_sell_need", "ag_farm_products_sell_able", "work_for_pay")

base <- base %>%
  mutate(across(all_of(variables_2), ~case_when(
    . %in% c(2) ~ 0, # 2 rep No
    TRUE ~ .
  )))

# Estimations ----

feols(ag_plant_change ~ survey + cases_smooth_per_100000 | hhid,
          data = base,
          cluster = ~ psu,
          weights = ~ weight_final
  ) %>% 
  tidy(conf.int = TRUE) %>% 
  # select(term, estimate, std.error, p.value) %>%
  filter(term != "cases_smooth_per_100000") %>% 
  add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
  arrange(term)

# Generate tables of means by survey ----

base %>%
  filter(survey %in% c(1, 4, 7)) %>%
  group_by(survey) %>%
  summarise(
    ag_crops_plant = weighted.mean(ag_crops_plant, weight_final, na.rm = TRUE),
    ag_plant_change = weighted.mean(ag_plant_change, weight_final, na.rm = TRUE),
    ag_plant_what_abandoned = weighted.mean(ag_plant_what_abandoned, weight_final, na.rm = TRUE),
    ag_plant_what_area_reduce = weighted.mean(ag_plant_what_area_reduce, weight_final, na.rm = TRUE),
    ag_plant_what_area_increase = weighted.mean(ag_plant_what_area_increase, weight_final, na.rm = TRUE),
    ag_plant_what_fast_crops = weighted.mean(ag_plant_what_fast_crops, weight_final, na.rm = TRUE),
    ag_plant_what_less_variety = weighted.mean(ag_plant_what_less_variety, weight_final, na.rm = TRUE),
    ag_plant_what_more_variety = weighted.mean(ag_plant_what_more_variety, weight_final, na.rm = TRUE),
    ag_plant_what_delayed = weighted.mean(ag_plant_what_delayed, weight_final, na.rm = TRUE),
    ag_farm_products_sell_need = weighted.mean(ag_farm_products_sell_need, weight_final, na.rm = TRUE),
    ag_farm_products_sell_able = weighted.mean(ag_farm_products_sell_able, weight_final, na.rm = TRUE),
    work_for_pay = weighted.mean(work_for_pay, weight_final, na.rm = TRUE)
  ) %>% 
  tabyl()
  
  # Pivot so each survey is a column
  pivot_longer(!survey, names_to = "survey", values_to = "value")
  
  




*************************************************************************************************************************************************************************
  * Estimations on agriculture
*************************************************************************************************************************************************************************
  xtreg ag_crops_plant lockdown lockdown_2 lockdown_3 `controls' `wt', fe     
outreg2 using "`output'\Est6.xml", e(N df_m F r2) excel replace dec(3) 

foreach i in  ag_plant_change ag_farm_products_sell_able {
	xtreg `i' lockdown lockdown_2 lockdown_3  `controls' `wt', fe     
	outreg2 using "`output'\Est6.xml", e(N df_m F r2) excel append dec(3) 
}	

foreach i in ag_plant_change  ag_plant_what_area_reduce ag_plant_what_area_increase  ag_plant_what_less_variety ag_plant_what_more_variety ag_plant_what_delayed ag_plant_what_fast_crops ag_plant_what_abandoned {
	tab survey `i'
}	


