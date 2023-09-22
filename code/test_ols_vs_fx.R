# Compare fixed effects with OLS

library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(plm)       # For fixed effects
library(tidymodels) # For extracting model coefficients

# Load data
base <- read_rds(here("data", "base.rds")) %>% 
  mutate(
    across(starts_with("food"), ~ case_match(., 2 ~ 0, 1 ~ 1)),
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7")),
    lockdown_1 = survey %in% c("1"),
    lockdown_2 = survey %in% c("2"),
    lockdown_7 = survey %in% c("7")
  ) 

# extract all variable names from base that begins with "food"
food_vars <- base %>% select(starts_with("food")) %>% names()

#  OLS Regress each of the food variables against survey dummies and cases
ols <- map(
  food_vars, 
  ~ lm(as.formula(paste0(.x, " ~ lockdown_1 + lockdown_2 + lockdown_7 + cases_smooth_per_100000")), data = base) %>% 
    tidy() %>%
    select(term, estimate, std.error, p.value) %>%
    mutate(variable = .x) %>%
    select(variable, everything()) %>% mutate(estimate = round(estimate, 3), p.value = round(p.value, 3)) %>%
    rename(ols_estimate = estimate, ols_std.error = std.error, ols_p.value = p.value)
)

# Fixed effects regress each of the food variables against survey dummies and cases
fx <- map(
  food_vars, 
  ~ plm(as.formula(paste0(.x, " ~ lockdown_1 + lockdown_2 + lockdown_7 + cases_smooth_per_100000")), 
        data = base, 
        index = c("hhid", "survey"), 
        model = "within"
        ) %>% 
    tidy() %>% 
    select(term, estimate, std.error, p.value) %>% 
    mutate(variable = .x) %>% 
    select(variable, everything()) %>% mutate(estimate = round(estimate, 3), p.value = round(p.value, 3)) %>% 
    rename(fx_estimate = estimate, fx_std.error = std.error, fx_p.value = p.value)
)

# Turn ols and fx into tibbles
ols <- ols %>% 
  map_dfr(as_tibble)
fx <- fx %>% 
  map_dfr(as_tibble)


# Join ols and fx
ols_vs_fx <- ols %>% 
  left_join(fx, by = c("variable", "term")) %>% 
  # Calculate the difference between ols and fx using a z test with the standard error to test for difference
  # https://stats.stackexchange.com/questions/93540/testing-equality-of-coefficients-from-two-different-regressions
  # Clogg et al. 1995 and Paternoster et al. 1998
  mutate(
    diff = ols_estimate - fx_estimate,
    se = sqrt(ols_std.error^2 + fx_std.error^2),
    z = diff / se,
    p.value = 2 * pnorm(-abs(z)),
    # Calculate differences in ols_std.error and fx_std.error
    diff_se = ols_std.error - fx_std.error
  ) 



