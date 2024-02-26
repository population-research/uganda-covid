# Household response to lockdowns

library(tidyverse)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(plm)       # For fixed effects
library(fixest)    # For fixed effects
library(tidymodels) # For extracting model coefficients
library(haven)
library(data.table)
library(rio)
library(RStata)
options("RStata.StataPath" = "/Applications/Stata/StataMP.app/Contents/MacOS/stata-mp")
options("RStata.StataVersion" = 18)


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


# Functions ----

# Custom function to tidy the model and add n_obs and n_fixef
enhance_feols_summary <- function(.model) {
  # Tidy the model
  tidied_model <- tidy(
    .model,
    conf.int = TRUE,
    cluster = ~psu
  )
  
  # Extract the dependent variable
  y_var <- as.character(.model$fml[[2]])
  
  # Extract the number of observations
  n_obs <- summary(.model)$nobs
  
  # Extract the number of fixed effects
  n_fixef <- summary(.model)$fixef_sizes
  
  # Add n_obs and n_fixef as new columns
  tidied_model_enhanced <- tidied_model %>%
    filter(term != "cases_smooth_per_100000") %>% 
    add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
    arrange(term) %>% 
    mutate(
      n_obs = n_obs,
      n_fixef = n_fixef,
      variable = y_var
    ) %>% 
    mutate(
      term = str_remove(term, "survey")
    ) %>% 
    select(variable, everything())
  
  return(tidied_model_enhanced)
}

# Function to map original variables to their labels and format the output
generate_labels <- function(.model_summaries, .labels_mapping) {
  # Ensure labels_mapping is a tibble with specific columns: 'org_variable' and 'label'
  if (!("org_variable" %in% names(.labels_mapping)) | !("label" %in% names(.labels_mapping))) {
    stop("labels_mapping must be a tibble with 'org_variable' and 'label' columns")
  }
  
  .model_summaries %>%
    group_by(org_variable) %>%
    summarise(n_fixef = first(n_fixef)) %>%
    left_join(.labels_mapping, by = "org_variable") %>%
    mutate(
      variable = if_else(is.na(label), as.character(org_variable), as.character(label)),
      new_variable = paste0(variable, " (Number of households: ", format(n_fixef, big.mark = ","), ")")
    ) %>%
    select(org_variable, new_variable) %>%
    deframe()
}



# Load data ----
base <- read_rds(here("data", "base.rds")) %>% 
  zap_labels() %>% 
  mutate(
    psu = str_sub(hhid, 1, 4)
  )

# Define the vector of variables to drop
vars_to_drop <- c("medical_access_lack_why_spec", "medical_need_2019_04_2020_04",
                  "medical_access__2019_04_2020_04", "medical_need_fp", "medical_need_vac",
                  "medical_need_maternal", "medical_need_child_health", "medical_need_adult_health",
                  "medical_need_emergency_care", "medical_need_pharmacy", "medical_type_1",
                  "medical_access_1", "medical_access_lack_why_1", "medical_type_2", "medical_access_2",
                  "medical_access_lack_why_2", "medical_type_3", "medical_access_3", "medical_access_lack_why_3",
                  "ag_crops_plant_plan", "ag_no_grow_home", "ag_seeds_why_shops_no_stock",
                  "ag_seeds_why_markets_closed", "ag_seeds_why_limited_transport",
                  "ag_seeds_why_travel_restrict", "ag_seeds_why_price_increase", "ag_seeds_why_money_lack",
                  "ag_seeds_why_other", "ag_fertil_no_trans_why", "ag_fertil_no_trans_why_other",
                  "ag_crops_progress",
                  "ag_plant_what_covid_measures", "ag_plant_what_no_workers_hired",
                  "ag_plant_what_fewer_workers", "ag_plant_safety_mask", "ag_plant_safety_no_hand_shakes",
                  "ag_plant_safety_gloves", "ag_plant_safety_distance", "ag_plant_safety_others",
                  "ag_plant_why_not_hire_workers", "ag_expected_output", "ag_expected_harvest_quantity",
                  "ag_expected_harvest_unit", "ag_expected_harvest_kg", "ag_price_small_banana",
                  "ag_price_medium_banana", "ag_price_large_banana", "ag_price_100kg_cassava_bag",
                  "ag_price_basin_dry_casava_chips", "ag_price_kg_dry_cassava_flour",
                  "ag_price_kg_dry_beans", "ag_price_basin_fresh_beans", "ag_price_kg_maize_grains",
                  "ag_no_grow_less_labor", "ag_no_grow_restrict", "ag_no_grow_no_seeds",
                  "ag_no_grow_no_fertilizer", "ag_no_grow_no_other", "ag_no_grow_no_outputs",
                  "ag_no_grow_family_ill", "ag_plant_what_area_increased", "ag_plant_how_delay_sell_outputs",
                  "ag_plant_how_care_ill_fammily", "ag_plant_what_area_reduced", "ag_main_crop",
                  "ag_main_crop_completed_plant", "ag_main_crop_area_acres", "ag_main_crop_expect_output",
                  "educ_any_child_3_to_18", "educ_attend_pre_covid", "educ_engage_after",
                  "educ_engage_assigs_completed", "educ_engage_mobile_learning", "educ_engage_tv_programs",
                  "educ_engage_radio_programs", "educ_engage_tutor", "educ_engage_gov_materials",
                  "educ_engage_other", "s4q15_other", "educ_teacher_contact", "educ_teacher_contact_sms",
                  "educ_teacher_contact_online", "educ_teacher_contact_email", "educ_teacher_contact_mail",
                  "educ_teacher_contact_phone", "educ_teacher_contact_whatsapp",
                  "educ_teacher_contact_facebook", "educ_teacher_contact_physically",
                  "educ_teacher_contact_others", "s4q17_other", "financial_access", "financial_access_success",
                  "financial_access_why", "financial_access_why_spec", "nfe_place_closure_other_why",
                  "nfe_closure_why_no_customers",
                  "nfe_closure_why_travel_restrict", "nfe_closure_why_ill_cvd", "nfe_closure_why_ill_other",
                  "nfe_closure_why_care_family", "nfe_closure_why_seasonal", "nfe_closure_why_vacation",
                  "nfe_closure_why_other", "nfe_cvd_challenges_op_money",
                  "nfe_cvd_challenges_loans", "nfe_cvd_challenges_rent", "nfe_cvd_challenges_pay_workers",
                  "nfe_cvd_challenges_sales", "nfe_cvd_challenges_other")

# Drop these variables from the data frame
base <- base %>%
  select(-all_of(vars_to_drop))




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

# Getting base data frame ready for analysis ----

base <- base %>% 
  mutate(
    l1 = survey == 1,
    l2 = survey == 2,
    l7 = survey == 7,
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7"))
  )


# Impact on work and employment outcomes ----

# Original Table 3, panel A

work_employment <- map(
  c("work_for_pay", "nfe", "work_same_before"), 
  ~ feols(as.formula(paste0(.x, " ~ survey + cases_smooth_per_100000 | hhid")), 
        data = base, 
        weights = ~weight_final
  ) 
) %>%
  map(enhance_feols_summary) %>% 
  list_rbind() %>% 
  mutate(
    org_variable = factor(
      variable,
      levels = c("work_for_pay", "nfe", "work_same_before")
    )
  )

  
work_mapping <- tribble(
  ~org_variable, ~label,
  "work_for_pay",     "Likelihood of market work",
  "nfe",              "Likelihood of operating a non-farm family business",
  "work_same_before", "Working in same job as before"
)  
  
work_labels <- generate_labels(work_employment, work_mapping)

work_employment %>%
  ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange() +
  labs(
    x = "Survey",
    y = "Coefficient"
  ) +
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~org_variable, scales = "fixed", ncol = 1,
             labeller = labeller(org_variable = work_labels)) 

# still need to add the multinomial model here on switching between agricultural, non-agricultural work, and no work
# The code below adds a round 0 to capture the last UNPS before Covid.
# Hence, there are in effect 8 rounds in the data

# Shamma's code for creating the data set he used:
# *************************************************************************************************************************************************************************
#   * Creating ag variable for round 0
# *************************************************************************************************************************************************************************
#   
#   use "C:\Users\alams\Dropbox\Uganda\stata\base.dta", clear
# keep if survey==1
# replace survey=0
# gen agri=0
# replace agri=1 if work_before_main_activity==11111  
# replace agri=1 if work_main_activity==11111  
# replace agri=1 if work_main_business_area==11111 & work_same_before==1
# // work_before_main_activity asks people who were working in R1, what job they were working on before Covid if they did change jobs since then 
# // work_main_activity asks in R1 for people who were not working, where they were working before Covid
# 
# replace agri=2 if work_before==2   // work_before - Whether working before covid, 2 rep No
# 
# keep hhid survey agri
# save "C:\Users\alams\OneDrive - Dickinson College\Documents\Research\Uganda HF\Data\Ag hh.dta", replace

# His analysis code:
# append using "C:\Users\alams\OneDrive - Dickinson College\Documents\Research\Uganda HF\Data\Ag hh.dta"
# 
# tsset, clear
# tsset hhid survey
# bysort hhid: egen wt2 = mean(weight_final)
# 
# replace cases_smooth_per_100000=0 if survey==0
# replace lockdown=0                if survey==0
# replace lockdown_2=0 if survey==0
# replace lockdown_3=0 if survey==0
# replace agri=0 if work_area~=11111 & work_for_pay==1 & survey>=1 & survey<=7
# replace agri=1 if work_area==11111 & work_for_pay==1 & survey>=1 & survey<=7
# replace agri=2 if                    work_for_pay==0 & survey>=1 & survey<=7
# 
# xtmlogit agri i.lockdown lockdown_2 lockdown_3 cases_smooth_per_100000 [pw=wt2], fe rrr baseoutcome(0)  


ggsave(here("figures", "work_employment.pdf"),  width = 8, height = 6, units = "in")  
  
  
# Impact on income sources ----

# Original Table 3, panel B

reduced_df <- base %>% 
  select(hhid, survey, cases_smooth_per_100000, l1, l2,
         starts_with("inc")) %>% 
  filter(survey != "7") %>%
  mutate(
    survey_num = as.numeric(as.character(survey))
  ) %>% 
  arrange(hhid, survey_num)

# export(reduced_df, "reduced_df.dta")

income_vars <- c("inc_level_farm", "inc_level_nfe", "inc_level_wage", "inc_level_assets")

map(income_vars,
    ~ {
      y <- stata(
        paste0( 
          "feologit ", .x, " ib4.survey_num cases_smooth_per_100000, group(hhid)
          regsave, ci"
        ),
        data.in = reduced_df,
        data.out = TRUE
      ) %>% 
        mutate(
          variable = .x
        )
    }
    ) %>%
  list_rbind() %>% 
  filter(var != "cases_smooth_per_100000") %>%
  # Keep first number in observations in var 
  mutate(var = str_extract(var, "\\d+")) %>% 
  # Recode variable to readable names
  mutate(
    variable = case_when(
      variable == "inc_level_farm" ~ "Farm Income",
      variable == "inc_level_nfe" ~ "Non-farm Income",
      variable == "inc_level_wage" ~ "Wage Income",
      variable == "inc_level_assets" ~ "Income from Assets",
      variable == "inc_level_pension" ~ "Pension Income",
      TRUE ~ variable
    )
  ) %>% 
  ggplot(aes(x = var, y = coef, ymin = ci_lower, ymax = ci_upper)) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange() +
  labs(
    x = "Survey",
    y = "Coefficient"
  ) +
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~variable, scales = "fixed", ncol = 1) 


# Table 4: Impact of lockdowns on different kinds of coping mechanisms 

# Assistance received ----
assistance_vars <- c("inc_level_remittance", "inc_level_family", "inc_level_non_family", "inc_level_ngo", "inc_level_govt")

inc_assistance <- map(assistance_vars,
    ~ {
      y <- stata(
        paste0( 
          "feologit ", .x, " ib4.survey_num cases_smooth_per_100000, group(hhid)
          regsave, ci detail(scalars)"
        ),
        data.in = reduced_df,
        data.out = TRUE
      ) %>% 
        mutate(
          variable = .x
        )
    }
) %>%
  list_rbind() %>% 
  filter(var != "cases_smooth_per_100000") %>%
  # Keep first number in observations in var 
  mutate(var = str_extract(var, "\\d+")) %>% 
  # There are two different variables here to allow for both factoring and
  # labels to be added. There may be a smarter way to do this, but it works.
  mutate(
    org_variable = variable,
    variable = factor(variable, levels = c(
      "inc_level_remittance", 
      "inc_level_family", 
      "inc_level_non_family", 
      "inc_level_ngo", 
      "inc_level_govt"
    ))
  ) 


# Generate labels for each variable in the graph that includes the N_group value
inc_assistance_labels <- inc_assistance %>% 
  group_by(org_variable) %>%
  # Select the first value of N_group
  summarise(N_group = first(N_group)) %>% 
  mutate(
    variable = case_when(
      org_variable == "inc_level_family" ~ "Assistance from family within country",
      org_variable == "inc_level_govt" ~ "Assistance from government",
      org_variable == "inc_level_ngo" ~ "Assistance from NGOs",
      org_variable == "inc_level_non_family" ~ "Assistance from non-family individuals",
      org_variable == "inc_level_remittance" ~ "Remittance",
      TRUE ~ org_variable
    )
  ) %>% 
  # Combine the variable and N_group
  mutate(
    new_variable = paste0(variable, " (Number of households: ", format(N_group, big.mark = ","), ")")
  ) %>% 
  select(org_variable, new_variable) %>% 
  # Convert to a vector with values from org_variable as names and new_variable as values in quotes
  deframe() 

# Produce graph
inc_assistance %>% 
  ggplot(aes(x = var, y = coef, ymin = ci_lower, ymax = ci_upper)) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange() +
  labs(
    x = "Survey",
    y = "Coefficient"
  ) +
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~org_variable, scales = "free_y", ncol = 1,
             labeller = labeller(org_variable = inc_assistance_labels)) 

ggsave(here("figures", "income_assistance.pdf"), width = 8, height = 6, units = "in")


# Household composition and urban location ----

# Map over different dependent variables and apply the custom function
hh_composition <- map(
  c("hhmem_change", "adult_change", "child_change", "urban"), 
  ~ feols(as.formula(paste0(.x, " ~ survey + cases_smooth_per_100000 | hhid")), 
          data = base, 
          weights = ~weight_final
  )
) %>% map(enhance_feols_summary) %>%  
  list_rbind() %>% 
  mutate(
    term = str_remove(term, "survey")
  ) %>% 
  # First step in recoding variable to readable names
  mutate(
    org_variable = factor(variable, levels = c("hhmem_change", "adult_change", "child_change", "urban")),
  ) 

# Define the mapping of org_variable to human-readable labels
labels_mapping <- tribble(
  ~org_variable, ~label,
  "adult_change", "Change in Number of Adults",
  "hhmem_change", "Change in Number of Household Members", 
  "child_change", "Change in Number of Children", 
  "urban",        "Likelihood of Urban Location"
)

# Now, call the function with your dataset and the labels mapping
hh_composition_labels <- generate_labels(hh_composition, labels_mapping)

# Produce graphs
hh_composition %>%
  ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange() +
  labs(
    x = "Survey",
    y = "Coefficient"
  ) +
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~org_variable, scales = "fixed", ncol = 1,
             labeller = labeller(org_variable = hh_composition_labels)) 

ggsave(here("figures", "household_composition_and_urban_location.pdf"), width = 8, height = 6, units = "in")


# Agricultural households and food insecurity ----

# Use agricultural household status, ag, from the first survey observed

base <- base %>% 
  mutate(
    survey_num = as.numeric(as.character(survey))
  ) %>% 
  arrange(hhid, survey_num) %>%
  group_by(hhid) %>%
  mutate(
    ag_first = first(ag, order_by = survey_num)
  ) %>% 
  ungroup() %>% 
  mutate(
    ag_first = factor(ag_first, levels = c(0, 1), labels = c("Non-agricultural", "Agricultural")),
    ag_0 = factor(ag, levels = c(0, 1), labels = c("Non-agricultural", "Agricultural")),
    ag_1 = factor(ag, levels = c(1, 0), labels = c("Agricultural", "Non-agricultural"))
  )

# extract all variable names from base that begins with "food"
food_vars <- base %>% 
  select(starts_with("insecure")) %>%
  select(-ends_with("sum")) %>%
  names()


# Run on agricultural and non-agricultural households separately
agri_separately <- base %>% 
  nest(.by = ag_first) %>%
  mutate(
    ag_result = map(data, function(df) { 
      map(
        food_vars, 
        ~ plm(as.formula(paste0(.x, " ~ survey + cases_smooth_per_100000")), 
              data = df, 
              index = c("hhid", "survey"), 
              model = "within",
              effect = "individual",
              # weighting using weight_final
              weights = weight_final
        ) %>% 
          tidy(conf.int = TRUE) %>% 
          # select(term, estimate, std.error, p.value) %>%
          filter(term != "cases_smooth_per_100000") %>% 
          add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
          arrange(term) %>% 
          mutate(variable = .x) %>% 
          select(variable, everything())
      ) %>% 
        list_rbind()
    })
  ) %>% 
  select(ag_first, ag_result) %>% 
  unnest(cols = ag_result) %>% 
  mutate(
    term = str_remove(term, "survey"),
    variable = str_to_title(str_remove(variable, "insecure_"))
  ) 

# Allow the agricultural status to vary over time
non_agri <- map(
  food_vars, 
  ~ plm(as.formula(paste0(.x, " ~ survey*ag_0 + cases_smooth_per_100000")), 
        data = base, 
        index = c("hhid", "survey"), 
        model = "within",
        effect = "individual",
        # weighting using weight_final
        weights = weight_final
  ) %>% 
    tidy(conf.int = TRUE) %>% 
    # select(term, estimate, std.error, p.value) %>%
    filter(term != "cases_smooth_per_100000") %>% 
    add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
    arrange(term) %>% 
    mutate(variable = .x) %>% 
    select(variable, everything())
) 

agri <- map(
  food_vars, 
  ~ plm(as.formula(paste0(.x, " ~ survey*ag_1 + cases_smooth_per_100000")), 
        data = base, 
        index = c("hhid", "survey"), 
        model = "within",
        effect = "individual",
        # weighting using weight_final
        weights = weight_final
  ) %>% 
    tidy(conf.int = TRUE) %>% 
    # select(term, estimate, std.error, p.value) %>%
    filter(term != "cases_smooth_per_100000") %>% 
    add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
    arrange(term) %>% 
    mutate(variable = .x) %>% 
    select(variable, everything())
) 

non_agri <- non_agri %>% 
  list_rbind() %>% 
  mutate(
    term = str_remove(term, "survey"),
    variable = str_to_title(str_remove(variable, "insecure_"))
  ) %>% 
  # Remove observations with "Agricultural" in term
  filter(
    !str_detect(term, "Agri")
  ) %>% 
  mutate(
    type = "Non-agricultural"
  )

# Do the same thing for agricultural households
agri <- agri %>% 
  list_rbind() %>% 
  mutate(
    term = str_remove(term, "survey"),
    variable = str_to_title(str_remove(variable, "insecure_"))
  ) %>% 
  # Remove observations with "Non-agricultural" in term
  filter(
    !str_detect(term, "Non")
  ) %>% 
  mutate(
    type = "Agricultural"
  ) 



# Combine the two data frames and plot
bind_rows(non_agri, agri) %>% 
  mutate(
    type = factor(type, levels = c("Non-agricultural", "Agricultural"))  
  ) %>% 
  ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange() +
  labs(
    x = "Survey",
    y = "Coefficient"
  ) +
  facet_grid(vars(variable), vars(type), scales = "fixed")

agri_separately %>% 
  mutate(
    type = case_when(
      ag_first == "Agricultural" ~ "Agricultural before Covid",
      ag_first == "Non-agricultural" ~ "Non-agricultural before Covid"
    )
  ) %>% 
  bind_rows(non_agri) %>% 
  bind_rows(agri) %>%
  ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange() +
  labs(
    x = "Survey",
    y = "Coefficient"
  ) +
  facet_grid(vars(variable), vars(type), scales = "fixed")


agri_separately %>% 
  mutate(
    type = case_when(
      ag_first == "Agricultural" ~ "Agricultural Pre-Covid",
      ag_first == "Non-agricultural" ~ "Non-agricultural Pre-Covid"
    )
  ) %>% 
  bind_rows(non_agri) %>% 
  bind_rows(agri) %>%
  mutate(
    type = factor(type, levels = c("Non-agricultural Pre-Covid", "Agricultural Pre-Covid", "Non-agricultural", "Agricultural"))  
  ) %>%
  ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange() +
  labs(
    x = "Survey",
    y = "Coefficient"
  ) +
  facet_grid(variable ~ type , scales = "fixed")

ggsave(here("figures", "agri_vs_non_agri.pdf"), width = 8, height = 6, units = "in")
