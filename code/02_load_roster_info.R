# Load Uganda Panel Data 2019/2020 for household roster information

# Load data
library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(labelled)  # For data checking

# Functions
rename_to_lower_snake <- function(df) {
  df %>% 
    rename_with( ~gsub("([a-z])([A-Z])", "\\1_\\2", .x) ) %>%  # Adds _ to camel case var names
    rename_with( ~tolower(gsub("[ ]+", "_", .x)) )  # Converts to lower and substitutes _ for spaces
}

# HHID across panel and phone survey
round_1_cover  <- read_dta(here( "raw_data", "round1", "Cover.dta")) %>% 
  select(HHID, baseline_hhid) %>% 
  rename_to_lower_snake()

# The 2019/2020 Panel has 7 possible residential statuses in the questionnaire,
# but only 5 are in the data (plus 5 NAs), presumably members who left more than
# 6 months ago (code 6) and those who left permanently (code 7) are dropped from
# the roster. This leaves 275 guests to drop. The remaining household members
# are divided into usual members and regular members, and both these categories
# are further divided into present and absent. No mater which group you belong
# to, you are still listed in the first round of the phone survey.

# 2019/2020 Panel survey roster data
panel_hh_roster <- read_dta(here("raw_data", "panel_19_20", "HH", "gsec2.dta")) %>% 
  rename(baseline_hhid = hhid) %>% 
  left_join(round_1_cover, by = "baseline_hhid") %>% 
  filter(!is.na(hhid)) %>% # Not in the phone survey
  filter(h2q7 %in% c(1:4)) %>%  # Usual and regular members, whether present or absent
  arrange(hhid, pid) %>% 
  group_by(hhid) %>% 
  add_tally((h2q3 == 1 & h2q8 >= 18), name = "hh_adult_males") %>% 
  add_tally((h2q3 == 2 & h2q8 >= 18), name = "hh_adult_females") %>% 
  # Easy version is just to count the number of female heads! We can always make
  # it a factor later
  add_tally((h2q3 == 2 & h2q4 == 1),  name = "hh_head_female") %>% 
  add_tally(h2q3 == 1, name = "hh_total_males") %>%   # total hh males
  add_tally(h2q3 == 2, name = "hh_total_females") %>% # total hh females
  add_count(name = "hh_total_members") %>% # total household members
  add_tally((h2q8 < 5), name = "hh_younger_five") %>% 
  # All the other counts here using hh_ as prefix of variable names
  select(hhid, starts_with("hh_")) %>% 
  slice_head() %>% 
  ungroup()

