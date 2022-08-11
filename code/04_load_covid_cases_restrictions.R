# Load data
library(tidyverse)
library(haven)
library(here)
library(janitor) # For data checking
library(vtable) # For data checking
library(labelled) # For data checking
library(lubridate)
library(zoo)

# Functions
rename_to_lower_snake <- function(df) {
  df %>%
    rename_with(~ gsub("([a-z])([A-Z])", "\\1_\\2", .x)) %>% # Adds _ to camel case var names
    rename_with(~ tolower(gsub("[ /]+", "_", .x))) # Converts to lower and substitutes _ for spaces and /
}

Mode <- function(x, na.rm = FALSE) {
  if (na.rm) {
    x <- x[!is.na(x)]
  }

  ux <- unique(x)
  return(ux[which.max(tabulate(match(x, ux)))])
}

# Covid data ----

## Data source: OUR WORLDIN DATA
## Description Link: https://docs.owid.io/projects/covid/en/latest/dataset.html
## Data URL: https://covid.ourworldindata.org/data/owid-covid-data.csv

## load data
covid_cases_base <- read_csv(url("https://covid.ourworldindata.org/data/owid-covid-data.csv")) %>%
  rename_to_lower_snake() %>%
  filter(iso_code == "UGA")

covid_cases <- covid_cases_base %>%
  mutate( # splitting date into year month and day
    year  = year(date),
    month = month(date),
    day   = day(date)
  ) %>%
  select(-date) %>%
  # getting new cases by month and new cases per 100,000 per month
  group_by(year, month) %>%
  summarize(
    cases_month       = sum(new_cases, na.rm = TRUE),
    population        = mean(population, na.rm = TRUE),
    stringency_index  = mean(stringency_index, na.rm = TRUE),
    reproduction_rate = mean(reproduction_rate)
  ) %>%
  ungroup() %>% 
  mutate(
    cases_month_per_100000 = (cases_month / population) * 100000
  ) %>%
  select(-population)

covid_cases_by_day <- covid_cases_base %>% 
  mutate(
    date = ymd(date)
  ) %>% 
  arrange(date) %>% 
  select(date, new_cases, new_cases_smoothed, population, stringency_index, reproduction_rate) %>% 
  mutate(
    cases = rollapply(new_cases, list(seq(-30, -1)), sum, na.rm = TRUE, align = "right", fill = NA),
    cases_smooth = rollapply(new_cases_smoothed, list(seq(-30, -1)), sum, na.rm = TRUE, align = "right", fill = NA),
    cases_per_100000 = (cases / population) * 100000,
    cases_smooth_per_100000 = (cases_smooth / population) * 100000,
    stringency = rollapply(stringency_index, list(seq(-30, -1)), mean, na.rm = TRUE, align = "right", fill = NA),
    reproduction_rate = rollapply(reproduction_rate, list(seq(-30, -1)), mean, na.rm = TRUE, align = "right", fill = NA),
  ) %>% 
  select(-new_cases, -new_cases_smoothed, -population, -stringency_index, -reproduction_rate)

  
# Oxford Covid restriction measures ----

# Documentation on coding
# https://github.com/OxCGRT/covid-policy-tracker/blob/master/documentation/codebook.md#containment-and-closure-policies

# Variable types:
# C - containment and closure policies
# E - economic policies
# H - health system policies
# V - vaccination policies
# M - miscellaneous policies

# We focus on C and E here because that is what is most likely to impact food
# security

# C1M_School closing	Record closings of schools and universities
# C2M_Workplace closing	Record closings of workplaces
# C3M_Cancel public events	Record cancelling public events
# C4M_Restrictions on gatherings	Record limits on gatherings
# C5M_Close public transport	Record closing of public transport
# C6M_Stay at home requirements	Record orders to "shelter-in-place" and otherwise confine to the home
# C7M_Restrictions on internal movement	Record restrictions on internal movement between cities/regions
# C8 is for international travel; we ignore that

# Flags for C:
# Binary flag for geographic scope
# 0 - targeted
# 1- general
# Blank - no data

# E1_Income support (for households) Record if the government is providing
# direct cash payments to people who lose their jobs or cannot work. Note: only
# includes payments to firms if explicitly linked to payroll/salaries

# E2_Debt/contract relief (for households) Record if the government is freezing
# financial obligations for households (eg stopping loan repayments, preventing
# services like water from stopping, or banning evictions)

# E3_Fiscal measures Announced economic stimulus spending Note: only record
# amount additional to previously announced spending; almost all 0 so drop

# E4 is support to other countries; we ignore that

# Flag for E1:
# Binary flag for sectoral scope
# 0 - formal sector workers only or informal sector workers only
# 1 - all workers
# All are all workers so we can drop this

# # Check flags
# oxford %>%
#   select(ends_with("flag")) %>%
#   map(~tabyl(.))

oxford_base <- read_csv(url("https://raw.githubusercontent.com/OxCGRT/covid-policy-tracker/master/data/OxCGRT_nat_latest.csv")) %>%
  rename_to_lower_snake() %>%
  filter(country_code == "UGA") %>%
  select(date, matches("[ce]\\d")) %>%
  filter(date < 20220725) %>% # No information available after
  arrange(date) %>% 
  select(-starts_with("c8"), -starts_with("e4")) %>% # do not care about international
  select(-starts_with("e3")) %>% # minimal variation
  select(-matches("c[1234]m_flag"), -e1_flag) %>% # No action for these flags, so drop
  # Shorten names
  rename(
    gov_close_transport_flag = c5m_flag,
    gov_stay_home_flag       = c6m_flag,
    gov_restrict_move_flag   = c7m_flag
  ) %>%
  rename_with(
    ~ str_replace(., "[ce]\\d.*?_", "gov_") # Change prefix for easier reading
  ) %>%
  rename(
    gov_close_transport = gov_close_public_transport,
    gov_restrict_gather = gov_restrictions_on_gatherings,
    gov_restrict_move   = gov_restrictions_on_internal_movement,
    gov_stay_home       = gov_stay_at_home_requirements
  ) %>%
  # Indicator for whether any restriction is targeted to a specific group/area.
  # No information on which areas are targeted. 1: targeted 0: Not targeted/no
  # restriction
  mutate(
    across(
      ends_with("_flag"),
      ~ case_when(
        .x == 0 ~ 1,
        .x == 1 ~ 0,
        TRUE ~ 0
      )
    )
  ) %>%
  rename_with(
    ~ str_replace(., "_flag", "_target")
  )

oxford <- oxford_base %>%
  # splitting date into year month and day for grouping
  mutate(year = year(ymd(date)), month = month(ymd(date)), day = day(ymd(date))) %>% 
  group_by(year, month) %>%
  summarise(
    across(starts_with("gov_"),
      list(
        mode = ~ Mode(.x, na.rm = TRUE),
        min  = ~ min(.x, na.rm = TRUE),
        max  = ~ max(.x, na.rm = TRUE)
      ),
      .names = "{.col}_{.fn}"
    )
  ) %>% 
  ungroup()

oxford_by_day <- oxford_base %>%
  mutate(
    date = ymd(date), 
    across(starts_with("gov_"),
      list(
        mode = ~ rollapply(.x, list(seq(-30, -1)), Mode, na.rm = TRUE, align = "right", fill = NA),
        min = ~ rollapply(.x, list(seq(-30, -1)), min, na.rm = TRUE, align = "right", fill = NA),
        max = ~ rollapply(.x, list(seq(-30, -1)), max, na.rm = TRUE, align = "right", fill = NA)
      ),
      .names = "{.col}_{.fn}"
    )
  ) %>% 
  select(
    date, (starts_with("gov_") & (ends_with("_mode") | ends_with("_min") | ends_with("_max")))
  )


# Combine data frames and save ----

# By month measures - not merged into base data
covid_oxford <- full_join(covid_cases, oxford, by = c("year", "month"))

covid_oxford %>% 
  write_rds(here("data", "covid_oxford.rds"))

covid_oxford %>% 
  write_dta(
    here("data", "covid_oxford.dta"),
    version = 14,
  )
  
# Prior 30 days measures - merged into base data

covid_oxford_by_day <- 
  full_join(covid_cases_by_day, oxford_by_day, by = "date") %>% 
  arrange(date)

base <- read_rds(here("data", "load_3.rds")) %>% 
  left_join(covid_oxford_by_day, by = c("interview_date" = "date")) 

base %>%   
  write_rds(here("data", "base.rds"))

base %>% 
  write_dta(
    here("data", "base.dta"),
    version = 14,
  )

