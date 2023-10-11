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
    across(starts_with("food"), ~ case_match(., 2 ~ 0, 1 ~ 1))
  ) %>% 
  select(
    survey, survey_factor, hhid, starts_with("food"), 
    lockdown_1, lockdown_2, lockdown_7,
    cases_smooth_per_100000
    )

# extract all variable names from base that begins with "food"
food_vars <- base %>% select(starts_with("food")) %>% names()

# Add missing rows for each household from the first survey observed up to survey 7
test_base <- base %>% 
  arrange(hhid, survey) %>% 
  # For each household, first find the first survey the household is observed in and then the last survey the household is observed in.
  group_by(hhid) %>%
  mutate(
    first_survey = min(survey),
    last_survey = max(survey)
  ) %>%
  ungroup() %>% 
  # Add missing rows from last survey observed up to survey 7
  complete(hhid, survey) %>% 
  fill(first_survey, last_survey) %>%
  # Drop rows for surveys before the household is first observed
  filter(survey >= first_survey) %>%
  # Create factor for surveys and lockdown dummies
  mutate(
    survey_factor = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7")),
    lockdown_1 = survey_factor %in% c("1"),
    lockdown_2 = survey_factor %in% c("2"),
    lockdown_7 = survey_factor %in% c("7")
  )

# Things that I need to address:
# - There is no survey date for missing households
# - The missing COVID-19 cases data is not included and might have to be averaged within rounds since no survey date is available
# - There are no weights for missing households; use average within survey round?
#
# Also need to include fill in missing values for food security variables 



