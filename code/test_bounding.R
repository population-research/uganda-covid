# Sensitivity of the model to attrition

library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(plm)       # For fixed effects
library(tidymodels) # For extracting model coefficients

# Assume that households that attrit are at the extreme ends of the distribution
# of food consumption, so either zero for everyone or one for everyone. Need to
# identify households that attrit

# Load data ----
base <- read_rds(here("data", "base.rds")) %>% 
  mutate(
    # Original 1: Yes, 2: No to food insecure; recode to 1: yes, 0: No
    across(starts_with("food"), ~ case_match(., 2 ~ 0, 1 ~ 1))
  ) %>% 
  select(
    survey, hhid, weight_final, starts_with("food"), cases_smooth_per_100000
  ) %>% 
  drop_na()

# extract all variable names from base that begins with "food"
food_vars <- base %>% select(starts_with("food")) %>% names()

# By round, show the number of households for whom that is the last round
# observed
base %>% 
  arrange(hhid, survey) %>% 
  group_by(hhid) %>% 
  mutate(
    last_survey = max(survey)
  ) %>%
  # keep one row per household
  slice_head() %>%
  ungroup() %>% 
  tabyl(last_survey)
  

# Data transformations ----

# Goal: Create a data frame with all households observed in each survey round from the
# first round their are observed up to survey 7

base <- base %>% 
  arrange(hhid, survey) %>% 
  # For each household, first find the first survey the household is observed in
  # and then the last survey the household is observed in.
  group_by(hhid) %>%
  mutate(
    first_survey = min(survey),
    last_survey = max(survey)
  ) %>%
  ungroup() %>%
  # Add missing rows for 1-7 survey rounds for each household
  complete(hhid, survey) %>% 
  # Drop rows for surveys before the household is first observed; fill did not
  # work as intended, so use the originally observed values for first and last
  # survey
  group_by(hhid) %>%
  mutate(
    first_survey = min(first_survey, na.rm = TRUE),
    last_survey = max(last_survey, na.rm = TRUE)
  ) %>% 
  filter(survey >= first_survey) %>%
  # Create factor for surveys, lockdown dummies, and household not observed
  mutate(
    survey_factor = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7")),
    lockdown_1 = survey_factor %in% c("1"),
    lockdown_2 = survey_factor %in% c("2"),
    lockdown_7 = survey_factor %in% c("7"),
    # Create dummy if all food variables are missing
    all_food_missing = if_all(starts_with("food"), ~ is.na(.x)),
    not_observed = (last_survey < survey) 
  ) 


# Things to address:
# - There are no survey dates for missing households
# - The missing COVID-19 cases data is not included; use average within rounds since no survey date is available
# - There are no weights for missing households; use average within survey round
base <- base %>% 
  # Calculate average weights and COVID-19 cases per 100,000 people within each survey round
  group_by(survey_factor) %>% 
  mutate(
    avg_cases_smooth_per_100000 = mean(cases_smooth_per_100000, na.rm = TRUE),
    avg_weights = mean(weight_final, na.rm = TRUE)
  ) %>% 
  ungroup() %>%
  # Substitute in average weights and COVID-19 cases per 100,000 people within each survey round if missing
  mutate(
    cases_smooth_per_100000 = if_else(is.na(cases_smooth_per_100000), avg_cases_smooth_per_100000, cases_smooth_per_100000),
    weight_final = if_else(is.na(weight_final), avg_weights, weight_final)
  ) 

# Estimations ----

# Check that we get same results when not filling in missing food variables
#  OLS Regress each of the food variables against survey dummies and cases
ols_base <- map(
  food_vars, 
  ~ lm(as.formula(paste0(.x, " ~ lockdown_1 + lockdown_2 + lockdown_7 + cases_smooth_per_100000")), 
       data = base,
       # weighting using weight_final
       weights = weight_final
  ) %>% 
    tidy() %>%
    select(term, estimate, std.error, p.value) %>%
    mutate(variable = .x) %>%
    select(variable, everything()) 
)

# Change all missing food variables to zero; Missing households are *NOT* food insecure
base_0 <- base %>% 
  mutate(
    across(starts_with("food"), ~ if_else(is.na(.x), 0, .x))
  ) 

ols_0 <- map(
    food_vars, 
    ~ lm(as.formula(paste0(.x, " ~ lockdown_1 + lockdown_2 + lockdown_7 + cases_smooth_per_100000")), 
         data = base_0,
         # weighting using weight_final
         weights = weight_final
    ) %>% 
      tidy() %>%
      select(term, estimate, std.error, p.value) %>%
      mutate(variable = .x) %>%
      select(variable, everything()) %>%
      rename(estimate_0 = estimate, std.error_0 = std.error, p.value_0 = p.value)
  )

# Change all missing food variables to one; missing households *ARE* food insecure
base_1 <- base %>% 
  mutate(
    across(starts_with("food"), ~ if_else(is.na(.x), 1, .x))
  ) 

ols_1 <- map(
  food_vars, 
  ~ lm(as.formula(paste0(.x, " ~ lockdown_1 + lockdown_2 + lockdown_7 + cases_smooth_per_100000")), 
       data = base_1,
       # weighting using weight_final
       weights = weight_final
  ) %>% 
    tidy() %>%
    select(term, estimate, std.error, p.value) %>%
    mutate(variable = .x) %>%
    select(variable, everything()) %>%
    rename(estimate_1 = estimate, std.error_1 = std.error, p.value_1 = p.value)
)



# Combine results into one data frame
ols_base <- ols_base %>% 
  map_dfr(as_tibble)
ols_0 <- ols_0 %>% 
  map_dfr(as_tibble)
ols_1 <- ols_1 %>% 
  map_dfr(as_tibble)

# Compare and test differences in estimates
compare <- ols_base %>%
  left_join(ols_0, by = c("variable", "term")) %>%
  left_join(ols_1, by = c("variable", "term")) %>%
  mutate(
    # Calculate the difference between ols and ols_0 using a z test with the standard error to test for difference
    diff_0 = estimate - estimate_0,
    se_0 = sqrt(std.error^2 + std.error_0^2),
    z_0 = diff_0 / se_0,
    p.value_z_0 = 2 * pnorm(-abs(z_0)),
    # Calculate the difference between ols and ols_1 using a z test with the standard error to test for difference
    diff_1 = estimate - estimate_1,
    se_1 = sqrt(std.error^2 + std.error_1^2),
    z_1 = diff_1 / se_1,
    p.value_z_1 = 2 * pnorm(-abs(z_1))
  ) 


# Show results in LaTeX table ----

