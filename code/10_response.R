# Household response to lockdowns

library(tidyverse)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(plm)       # For fixed effects
library(tidymodels) # For extracting model coefficients
library(haven)
library(data.table)


# Graph theme set-up ----
theme_uft <- theme_classic() +
  theme(
    axis.text = element_text(
      colour = "black"
    ),
    legend.title = element_blank(),
    legend.key.width = unit(1, "cm"),
    strip.background = element_blank(),
    panel.grid.major.y = element_line(
      color = "lightgray",
      linewidth = 0.5
    )
  )

theme_set(theme_uft)

# http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
color_palette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


# Load data ----
base <- read_rds(here("data", "base.rds")) %>% 
  zap_labels()

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


# Creating NFE variables ----


base <- base %>%
  mutate(
    nfe = case_when(
      survey >= 2 & survey <= 7 & nfe_operate == 1 ~ 1,  # Operates a business
      survey >= 2 & survey <= 7 & nfe_temporary_close_status == 1 ~ 1,  # Business is open
      survey >= 2 & survey <= 7 ~ 0,  # Falls within survey range but doesn't meet above conditions
      TRUE ~ NA_real_  # Default case to handle values outside specified conditions
    )
  )

# Correcting income data ----

variables <- c("inc_level_farm", "inc_level_nfe", "inc_level_wage", 
               "inc_level_assets", "inc_level_pension", "inc_level_remittance", 
               "inc_level_family", "inc_level_non_family", "inc_level_ngo", 
               "inc_level_govt")

base <- base %>%
  mutate(across(all_of(variables), ~case_when(
    . == 2 ~ 0,                              # Stays the same
    . >= 3 & . <= 4 ~ -1,                    # Decrease or complete loss
    is.na(.) & survey != 7 ~ 0,              # Missing and survey not equal to 7
    TRUE ~ .                                 # Keep original value otherwise
  )))


# Correcting complicated employment related variables ----

base <- base %>%
  mutate(
    work_same_before = case_when(
      survey == 2 ~ work_same_before_no,
      work_same_before == 2 ~ 0,
      TRUE ~ work_same_before
    ),
    work_area = work_main_business_area
  ) %>%
  arrange(hhid, survey)

base <- base %>%
  group_by(hhid) %>%
  mutate(
    lag_work_main_business_area = lag(work_main_business_area),
    lag_work_main_activity = lag(work_main_activity),
    work_area = case_when(
      survey == 2 & work_same_before_yes == 1 & is.na(work_area) ~ lag_work_main_activity,
      survey == 2 & work_same_before_no == 1 ~ lag_work_main_business_area,
      TRUE ~ work_area
    )
  ) %>%
  ungroup()

for(i in 3:7) {
  base <- base %>%
    group_by(hhid) %>%
    mutate(
      lag_work_area = lag(work_area),
      work_area = if_else(is.na(work_area) & !is.na(lag_work_area) & work_same_before == 1 & survey == i, lag_work_area, work_area)
    ) %>%
    ungroup() %>%
    select(-lag_work_area)
}

base <- base %>%
  group_by(hhid) %>%
  mutate(
    lag_work_area = lag(work_area),
    lag_work_for_pay = lag(work_for_pay),
    ag_switch = case_when(
      survey == 1 & work_area == 11111 & work_before_main_activity != 11111 & !is.na(work_before_main_activity) & work_for_pay == 1 ~ 1,
      survey != 1 & work_area == 11111 & lag_work_area != 11111 & !is.na(lag_work_area) & lag_work_for_pay == 1 & work_for_pay == 1 ~ 1,
      TRUE ~ 0
    ),
    nonag_switch = case_when(
      survey == 1 & work_area != 11111 & !is.na(work_area) & work_before_main_activity == 11111 & work_for_pay == 1 ~ 1,
      survey != 1 & work_area != 11111 & !is.na(work_area) & lag_work_area == 11111 & lag_work_for_pay == 1 & work_for_pay == 1 ~ 1,
      TRUE ~ 0
    ),
    ag = case_when(
      survey >= 2 & survey <= 7 & lag_work_area == 11111 & lag_work_for_pay == 1 ~ 1,
      survey == 1 & (work_main_activity == 11111 | work_before_main_activity == 11111 | (work_main_business_area == 11111 & work_same_before == 1)) ~ 1,
      TRUE ~ NA_real_
    )
  ) %>%
  ungroup()

base$ag[is.na(base$ag)] <- 0

base <- base %>%
  mutate(
    work_same_before = case_when(
      !work_same_before %in% c(1, 0) & !is.na(work_same_before) ~ NA_real_,
      (work_for_pay == 0 & survey >= 2 & survey <= 7) | (is.na(lag_work_for_pay) & survey >= 2 & survey <= 7) | (work_for_pay == 0 & survey == 1) ~ NA_real_,
      TRUE ~ work_same_before
    )
  )

# Migration related variables ----

base <- base %>%
  # Generating household composition variables
  mutate(
    hh_adults = hh_adult_males + hh_adult_females,
    hh_child = hh_total_members - hh_adults,
    hh_adults_prior = hh_adult_males_prior + hh_adult_females_prior,
    hh_child_prior = hh_total_members_prior - hh_adults_prior,
    # Generating change variables
    hhmem_change = hh_total_members - hh_total_members_prior,
    adult_change = hh_adults - hh_adults_prior,
    child_change = hh_child - hh_child_prior
  ) %>%
  # Replacing urban variable values
  mutate(
    urban = case_when(
      urban == 3 ~ 0,  # Rural
      urban == 2 ~ 1,  # Other urban
      TRUE ~ urban     # Keeps the original value if not 2 or 3
    )
  )


# Estimations ----

base <- base %>% 
  mutate(
    l1 = survey == 1,
    l2 = survey == 2,
    l7 = survey == 7,
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7"))
  )


plm(work_for_pay ~ l1 + l2 + l7 + cases_smooth_per_100000, 
            data = base, 
            index = c("hhid", "survey"), 
            model = "within",
            effect = "individual",
            # weighting using weight_final
            weights = weight_final
      )





