# Load data
library(tidyverse)
library(haven)
library(here)
library(janitor) # For data checking
library(vtable) # For data checking
library(labelled) # For data checking
library(lubridate)
library(zoo)
library(curl)

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

# We use locally saved data as the new online data is per week rather than per day


## load data
# covid_cases_base <- read_csv(url("https://covid.ourworldindata.org/data/owid-covid-data.csv")) %>%
#   rename_to_lower_snake() %>%
#   filter(iso_code == "UGA")

covid_cases_base <- read_csv(here("raw_data", "external_data", "owid-covid-data.csv")) %>%
  rename_to_lower_snake() %>%
  filter(iso_code == "UGA")

# covid_cases <- covid_cases_base %>%
#   mutate( # splitting date into year month and day
#     year  = year(date),
#     month = month(date),
#     day   = day(date)
#   ) %>%
#   select(-date) %>%
#   # getting new cases by month and new cases per 100,000 per month
#   group_by(year, month) %>%
#   summarize(
#     cases_month       = sum(new_cases, na.rm = TRUE),
#     population        = mean(population, na.rm = TRUE),
#     stringency_index  = mean(stringency_index, na.rm = TRUE),
#     reproduction_rate = mean(reproduction_rate)
#   ) %>%
#   ungroup() %>% 
#   mutate(
#     cases_month_per_100000 = (cases_month / population) * 100000
#   ) %>%
#   select(-population)

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
    stringency_daily = stringency_index
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

# oxford_base <- read_csv(url("https://raw.githubusercontent.com/OxCGRT/covid-policy-tracker/master/data/OxCGRT_nat_latest.csv")) %>%
#   rename_to_lower_snake() %>%
#   filter(country_code == "UGA") %>%
#   select(date, matches("[ce]\\d")) %>%
#   filter(date < 20220725) %>% # No information available after
#   arrange(date) %>% 
#   select(-starts_with("c8"), -starts_with("e4")) %>% # do not care about international
#   select(-starts_with("e3")) %>% # minimal variation
#   select(-matches("c[1234]m_flag"), -e1_flag) %>% # No action for these flags, so drop
#   # Shorten names
#   rename(
#     gov_close_transport_flag = c5m_flag,
#     gov_stay_home_flag       = c6m_flag,
#     gov_restrict_move_flag   = c7m_flag
#   ) %>%
#   rename_with(
#     ~ str_replace(., "[ce]\\d.*?_", "gov_") # Change prefix for easier reading
#   ) %>%
#   rename(
#     gov_close_transport = gov_close_public_transport,
#     gov_restrict_gather = gov_restrictions_on_gatherings,
#     gov_restrict_move   = gov_restrictions_on_internal_movement,
#     gov_stay_home       = gov_stay_at_home_requirements
#   ) %>%
#   # Indicator for whether any restriction is targeted to a specific group/area.
#   # No information on which areas are targeted. 1: targeted 0: Not targeted/no
#   # restriction
#   mutate(
#     across(
#       ends_with("_flag"),
#       ~ case_when(
#         .x == 0 ~ 1,
#         .x == 1 ~ 0,
#         TRUE ~ 0
#       )
#     )
#   ) %>%
#   rename_with(
#     ~ str_replace(., "_flag", "_target")
#   )
# 
# oxford <- oxford_base %>%
#   # splitting date into year month and day for grouping
#   mutate(year = year(ymd(date)), month = month(ymd(date)), day = day(ymd(date))) %>% 
#   group_by(year, month) %>%
#   summarise(
#     across(starts_with("gov_"),
#       list(
#         mode = ~ Mode(.x, na.rm = TRUE),
#         min  = ~ min(.x, na.rm = TRUE),
#         max  = ~ max(.x, na.rm = TRUE)
#       ),
#       .names = "{.col}_{.fn}"
#     )
#   ) %>% 
#   ungroup()
# 
# oxford_by_day <- oxford_base %>%
#   mutate(
#     date = ymd(date), 
#     across(starts_with("gov_"),
#       list(
#         mode = ~ rollapply(.x, list(seq(-30, -1)), Mode, na.rm = TRUE, align = "right", fill = NA),
#         min = ~ rollapply(.x, list(seq(-30, -1)), min, na.rm = TRUE, align = "right", fill = NA),
#         max = ~ rollapply(.x, list(seq(-30, -1)), max, na.rm = TRUE, align = "right", fill = NA)
#       ),
#       .names = "{.col}_{.fn}"
#     )
#   ) %>% 
#   select(
#     date, (starts_with("gov_") & (ends_with("_mode") | ends_with("_min") | ends_with("_max")))
#   )

# oxford_base <- read_csv(url("https://raw.githubusercontent.com/OxCGRT/covid-policy-tracker/master/data/OxCGRT_nat_latest.csv")) %>%
#   rename_to_lower_snake() %>%
#   filter(country_code == "UGA") %>%
#   # select(date, matches("[ce]\\d")) %>%
#   filter(date < 20220725) %>% # No information available after
#   arrange(date) 

oxford_base <- read_csv(here("raw_data", "external_data", "OxCGRT_nat_latest.csv")) %>%
  rename_to_lower_snake() %>%
  filter(country_code == "UGA") %>%
  # select(date, matches("[ce]\\d")) %>%
  filter(date < 20220725) %>% # No information available after
  arrange(date) 

calculate_index <- function(part_name, part_max) {
  var_number <- str_which(names(oxford_base), paste0(part_name, "_(?!flag)"))
  flag_number <- str_which(names(oxford_base), paste0(part_name, "_(?=flag)"))
  oxford_base %>% 
    transmute(
      index = case_when(
        oxford_base[[var_number]] == 0 ~ 0,
        oxford_base[[var_number]] != 0 ~ 100 * ((oxford_base[[var_number]] - 0.5*(1 - oxford_base[[flag_number]])) / part_max),
        TRUE ~ NA_real_
      ) 
    ) %>% 
    # rename(!!part_name := index)
    rename(!!paste0("index_", part_name) := index)
}

# Each restriction has a different max so make two lists to loop over
vec_names <- c("c1m", "c2m", "c3m", "c4m", "c5m", "c6m", "c7m", "h1")
vec_max <- c(3, 3, 2, 4, 2, 3, 2, 2)

oxford_by_day <- map2_dfc(vec_names, vec_max, ~ calculate_index(.x, .y)) %>% 
  bind_cols(oxford_base) %>% 
  mutate(
    date = ymd(date)
  ) %>% 
  filter(date < ymd("2021-12-01")) %>% 
  mutate(
    index_c8ev = 100 * (c8ev_international_travel_controls / 4)
  ) %>% 
  select(date, stringency_index_average, contains(vec_names), index_c8ev, c8ev_international_travel_controls) %>% 
  mutate(
    index_4_daily = rowSums(across(c(index_c2m, index_c5m, index_c6m, index_c7m))) / 4,
  ) %>% 
  select(date, index_4_daily) %>% 
  mutate(
    index_4 = rollapply(index_4_daily, list(seq(-30, -1)), mean, na.rm = TRUE, align = "right", fill = NA),
  )



# Google Mobility data ----

## Data source: Google Mobility Data
## Description Link: https://www.google.com/covid19/mobility/
## Data URL: https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv

# Even with the timeout increace, this failed to load sometimes, so I downloaded 
# the data and saved it locally, using the following:
# 
# options(timeout = 600) # Increase timeout to 10 minutes
# download.file("https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv", here("raw_data", "Global_Mobility_Report.csv"))

## load data 
google <- read_csv(here("raw_data", "external_data", "Global_Mobility_Report.csv")) %>% 
    rename_to_lower_snake() %>%
  filter(country_region_code == "UG") %>% # Uses only the 2 letter code
  select(date, sub_region_1, sub_region_2, iso_3166_2_code, ends_with("from_baseline")) %>% 
  filter(date < ymd("2021-12-01")) %>% 
  rename_with(
    ~ str_replace(., "_percent_change_from_baseline", "")
  ) %>% 
  filter(is.na(sub_region_1)) %>% 
  select(-sub_region_1, -sub_region_2, -iso_3166_2_code) %>% 
  arrange(date) %>% 
  mutate(
    across(retail_and_recreation:residential, 
           list(
             daily = ~ .x,
             pre_01_30  = ~ rollapply(.x, list(seq(-30, -1)), mean, na.rm = TRUE, align = "right", fill = NA),
             pre_31_60 = ~ rollapply(.x, list(seq(-60, -31)), mean, na.rm = TRUE, align = "right", fill = NA)
           ),
           .names = "{.col}_{.fn}"
    )
  ) %>% 
  select(date, contains(c("_pre_", "_daily")))


# Function for generating to/from lockdown variables ----

# This code is ugly as sin, but it works!
add_days_to_from_lockdown <- function(df, var, cutoff) {
  .org_df <- df
  
  .df <- df %>% 
    # Find first and last day of lock-downs based on occurrences 7 days before and after
    mutate(
      var_cutoff = if_else(abs({{ var }}) >= abs(cutoff), 1, 0),
      prior_7_days = rollapply(var_cutoff, list(seq(-7, -1)), sum, na.rm = TRUE, align = "right", fill = NA),
      next_7_days = rollapply(var_cutoff, list(seq(1, 7)), sum, na.rm = TRUE, align = "left", fill = NA),
      first = if_else(
        var_cutoff == 1 & prior_7_days == 0  & next_7_days > 0, date, as_date(NA)
      ),
      last = if_else(
        var_cutoff == 1 & prior_7_days > 0  & next_7_days == 0, date, as_date(NA)
      )
    ) %>% 
    select(date, first, last)
  
  # Create data frames for the first and last day of the lockdowns for easier joining
  lockdown_began <- .df %>% distinct(first) %>% 
    filter(!is.na(first)) %>%
    mutate(n = row_number()) %>% 
    pivot_wider(names_from = n, values_from = first, names_prefix = "lockdown_began_") 
  
  lockdown_ended <- .df %>% distinct(last) %>%
    filter(!is.na(last)) %>%
    mutate(n = row_number()) %>% 
    pivot_wider(names_from = n, values_from = last, names_prefix = "lockdown_ended_")
  
  # Assign the first and last day of the lockdowns to the data frame
  .df <- .df %>% 
    select(date) %>% 
    add_column(lockdown_began, lockdown_ended) %>% 
    mutate(
      time_to_lockdown = case_when(
        # Before first lock
        date < lockdown_began_1 ~ lockdown_began_1 - date,
        # In first or second lockdown
        date %within% interval(lockdown_began_1, lockdown_ended_1) |
          date %within% interval(lockdown_began_2, lockdown_ended_2) ~ ddays(0),
        # Between first and second lockdown
        date %within% interval(lockdown_ended_1, lockdown_began_2) ~ lockdown_began_2 - date,
        # After second lockdown or otherwise not calculated
        TRUE ~ ddays(NA)
      ),
      time_from_lockdown = case_when(
        # Before first lock
        date < lockdown_began_1 ~ ddays(NA),
        # In first or second lockdown
        date %within% interval(lockdown_began_1, lockdown_ended_1) |
          date %within% interval(lockdown_began_2, lockdown_ended_2) ~ ddays(0),
        # Between first and second lockdown
        date %within% interval(lockdown_ended_1, lockdown_began_2) ~ date - lockdown_ended_1,
        # After second lockdown 
        date > lockdown_ended_2 ~ date - lockdown_ended_2,
        # Otherwise not calculated
        TRUE ~ ddays(NA)
      )
    ) %>% 
    # Convert to days 
    mutate(
      "lockdown_to_{{ var }}" := as.numeric(time_to_lockdown, "days"),
      "lockdown_from_{{ var }}" := as.numeric(time_from_lockdown, "days")
    ) %>%
    select(date, starts_with(c("lockdown_to", "lockdown_from"))) %>% 
    # Remove _daily from variable names
    rename_with(
      ~ str_replace(., "_daily", "")
    )
  
  # Add the new variables to the original data frame
  .org_df %>% 
    left_join(.df, by = "date") 
}

# Combine data frames, add days to/from lockdown variables, and save ----

full_join(covid_cases_by_day, oxford_by_day, by = "date") %>% 
  full_join(google, by = "date") %>% 
  arrange(date) %>% 
  add_days_to_from_lockdown(index_4_daily, 75) %>% 
  add_days_to_from_lockdown(residential_daily, 30) %>% 
  # negative, but function set up to do absolute to deal with this
  add_days_to_from_lockdown(retail_and_recreation_daily, 50) %>%
  write_rds(here("data", "temp_covid_cases_restrictions.rds"))








  


