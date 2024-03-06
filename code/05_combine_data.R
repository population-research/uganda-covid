# Combine data into base analysis file

library(tidyverse)
library(haven)
library(here)
library(lubridate)
library(janitor)   # For data checking
library(vtable)    # For data checking


# Load in data ----

hh <- read_rds(here("data", "temp_hh_survey.rds")) # HH survey data
roster <- read_rds(here("data", "temp_roster_info.rds")) # Roster information
pre_covid <- read_rds(here("data", "temp_pre_covid_hh_data.rds")) # Pre covid hh data
covid <- read_rds(here("data", "temp_covid_cases_restrictions.rds")) # Covid cases and restrictions


# Combine data and clean region information----

base <- hh %>% 
  left_join(roster, by = c("hhid", "survey")) %>% 
  left_join(pre_covid, by = c("hhid")) %>% 
  left_join(covid, by = c("interview_date" = "date")) %>% 
  # Generate psu variable
  mutate(
    psu = str_sub(hhid, 1, 4)
  ) %>% 
  # Relocate roster information to after region information
  relocate( 
    starts_with("hh_"), .before = starts_with("food")
  ) %>% 
  # Clean region information
  filter(region != "##N/A##") %>%
  mutate(
    region = if_else(region == "Kampala", "Central", region),
  ) %>% 
  select(-hh_size)  # do not need this anymore


# Create food insecurity variables ----

base <- base %>% 
  # recode all variables that begin with food so 2 becomes 0
  mutate(
    across(starts_with("food"), ~ case_match(., 2 ~ 0, 1 ~ 1))
  ) %>%
  # create a variable that is the sum of all food insecurity variables and any,
  # moderate, and severe variables
  mutate(
    insecure_sum = rowSums(across(starts_with("food"))),
    # Any food insecurity
    insecure_any = case_when(
      insecure_sum > 0 ~ 1,
      TRUE ~ 0
    ),
    # Moderate or severe food insecurity
    insecure_moderate = case_when(
      insecure_sum >= 4 ~ 1,
      TRUE ~ 0
    ),
    # Severe food insecurity
    insecure_severe = case_when(
      insecure_sum >= 7 ~ 1,
      TRUE ~ 0
    )
  ) %>%
  relocate(
    insecure_any, insecure_moderate, insecure_severe, .before = starts_with("food")
  )


# Save data ----

base %>%   
  write_rds(here("data", "base.rds"))

# Shorten variable names to maximum of 32 characters and save as .dta file
base %>% 
  rename_with(~substr(., 1, 32)) %>%
  write_dta(
    here("data", "base.dta"),
    version = 14,
  )
