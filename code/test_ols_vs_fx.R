# Compare fixed effects with OLS

library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking

# Load data
base <- read_rds(here("data", "base.rds")) %>% 
  mutate(
    across(starts_with("food"), ~ case_match(., 2 ~ 0, 1 ~ 1)),
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7"))
  )

#  OLS Regress each of the food variables against survey dummies and cases
map(
  c("food_insufficient_worry", "food_healthy_lack"), 
  ~ lm(as.formula(paste0(.x, " ~ as.factor(survey) + cases_smooth_per_100000")), data = base) ) 


%>% 
    summary() %>% broom::tidy() %>% 
    select(term, estimate, p.value) %>% 
    mutate(variable = .x) %>% 
    select(variable, everything()) %>% mutate(estimate = round(estimate, 3), p.value = round(p.value, 3)) %>% write_csv(here("output", paste0(.x, ".csv")))
    

