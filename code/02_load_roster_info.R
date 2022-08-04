# Load Uganda Panel Data 2019/2020 for household roster information

# Load data
library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(labelled)  # For data checking
library(glue)

# Functions
rename_to_lower_snake <- function(df) {
  df %>% 
    rename_with( ~gsub("([a-z])([A-Z])", "\\1_\\2", .x) ) %>%  # Adds _ to camel case var names
    rename_with( ~tolower(gsub("[ ]+", "_", .x)) )  # Converts to lower and substitutes _ for spaces
}


# Map approach to loading data ----

roster <- map_dfr(
  1:7, ~ {
    # Identify section 1 file
    .sec1_name <- list.files(
      here("raw_data", paste0("round", .x)),
      pattern = "(?i)sec1.dta"
    )
    
    # Create roster count data
    .df <- read_dta(here( "raw_data", paste0("round", .x), .sec1_name )) %>%
      rename_to_lower_snake() %>% 
      # drop hh guests ( s1q02a) and s1q03 == 2 no longer hh member
      filter(s1q02a != 2 | is.na(s1q02a)) %>%
      filter(s1q03 != 2 | is.na(s1q03)) %>%
      arrange(hhid, hh_roster__id) %>% 
      group_by(hhid) %>% 
      add_count(name = "hh_total_members") %>% # total household members
      add_tally((s1q05 == 1 & s1q06 >= 18), name = "hh_adult_males") %>% 
      add_tally((s1q05 == 2 & s1q06 >= 18), name = "hh_adult_females") %>% 
      add_tally((s1q05 == 2 & s1q07 == 1),  name = "hh_head_female") %>% # Just to count number of female heads!
      add_tally(s1q05 == 1, name = "hh_total_males") %>%   # total hh males
      add_tally((s1q05 == 2), name = "hh_total_females") %>% # total hh females
      add_tally((s1q06 < 5), name = "hh_younger_five") %>% 
      mutate(survey = .x) %>% 
      select(hhid, survey, starts_with("hh_"), -hh_roster__id) %>% # All the counts use hh_ as prefix of variable names
      slice_head() %>% 
      ungroup()
  }
)


# Prior round roster counts ----

# 2019/2020 Panel data for round 1 prior roster count

# The 2019/2020 Panel has 7 possible residential statuses in the questionnaire,
# but only 5 are in the data (plus 5 NAs), presumably members who left more than
# 6 months ago (code 6) and those who left permanently (code 7) are dropped from
# the roster. This leaves 275 guests to drop. The remaining household members
# are divided into usual members and regular members, and both these categories
# are further divided into present and absent. No mater which group you belong
# to, you are still listed in the first round of the phone survey. The hh_size
# variable in round 1 appears to correspond nicely with the panel data
# information.

# HHID across panel and phone survey to get correspondance in household ids
hhid_correspondance  <- read_dta(here( "raw_data", "round1", "Cover.dta")) %>% 
  select(HHID, baseline_hhid) %>% 
  rename_to_lower_snake()

# 2019/2020 Panel survey roster data
panel_hh_roster <- read_dta(here("raw_data", "panel_19_20", "HH", "gsec2.dta")) %>% 
  rename_to_lower_snake() %>% 
  rename(baseline_hhid = hhid) %>% 
  left_join(hhid_correspondance, by = "baseline_hhid") %>% 
  filter(!is.na(hhid)) %>% # Not in the phone survey
  filter(h2q7 %in% c(1:4)) %>%  # Usual and regular members, whether present or absent
  arrange(hhid, pid) %>% 
  group_by(hhid) %>% 
  add_count(name = "hh_total_members_prior") %>% # total household members
  add_tally((h2q3 == 1 & h2q8 >= 18), name = "hh_adult_males_prior") %>% 
  add_tally((h2q3 == 2 & h2q8 >= 18), name = "hh_adult_females_prior") %>% 
  add_tally((h2q3 == 2 & h2q4 == 1),  name = "hh_head_female_prior") %>% 
  add_tally(h2q3 == 1, name = "hh_total_males_prior") %>%   # total hh males
  add_tally(h2q3 == 2, name = "hh_total_females_prior") %>% # total hh females
  add_tally((h2q8 < 5), name = "hh_younger_five_prior") %>%
  slice_head() %>% 
  ungroup() %>% 
  mutate(survey = 1) %>% # prior in round 1
  select(hhid, survey, starts_with("hh_"))

# Other rounds 
roster_prior <- roster %>% 
  rename_with(~ glue("{.}_prior"), starts_with("hh_")) %>% 
  mutate(survey = survey + 1) %>% 
  filter(survey != max(survey)) %>%  # drop latest survey
  bind_rows(panel_hh_roster, .)


# Merge into main data and save ----

all_rounds_df <- read_rds(here("data", "load_1.rds")) %>% 
  left_join(roster, by = c("hhid", "survey")) %>% 
  left_join(roster_prior, by = c("hhid", "survey")) %>% 
  relocate( # Relocate roster information to after region information
    starts_with("hh_"), .before = starts_with("food")
  ) %>% 
  select(-hh_size)  # do not need this anymore

all_rounds_df %>% 
  write_rds(here("data", "base.rds"))

all_rounds_df %>% 
  write_dta(
    here("data", "base.dta"),
    version = 14,
  )

