# Pre-Covid Panel data 

# Did the family run a non-farm family business
# Land size available (owned vs rent)
# Wealth/asset measures
# Income/poverty (pov2019_20.dta should have the needed information)

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
    rename_with(~ gsub("([a-z])([A-Z])", "\\1_\\2", .x)) %>% # Adds _ to camel case var names
    rename_with(~ tolower(gsub("[ /]+", "_", .x))) # Converts to lower and substitutes _ for spaces and /
}


# HHID correspondance ----
hhid_correspondance  <- read_dta(here( "raw_data", "round1", "Cover.dta")) %>% 
  rename_to_lower_snake() %>% 
  select(hhid, baseline_hhid)  

# Income/poverty data ----

poverty <- read_dta(here("raw_data", "panel_19_20", "pov2019_20.dta")) %>% 
  rename_to_lower_snake() %>% 
  rename(baseline_hhid = hhid) %>% 
  mutate(
    food_poor_2020 = welfare <= hpline
  ) %>% 
  rename(
    poor_2020_quints = quints
  ) %>% 
  select(
    baseline_hhid, welfare, food_poor_2020, poor_2020, poor_2020_quints
  ) %>% 
  right_join(hhid_correspondance, by = "baseline_hhid")


# Land size ----

land <- read_dta(here("raw_data", "panel_19_20", "Agric", "agsec2a.dta")) %>% 
  rename_to_lower_snake() %>% 
  rename(baseline_hhid = hhid) %>% 
  filter(!is.na(s2aq4) & s2aq11b != 3) %>%  # size available and not rented out
  group_by(baseline_hhid) %>% 
  summarise(
    land_size = sum(s2aq4) # land in acres
  ) %>% 
  right_join(hhid_correspondance, by = "baseline_hhid")


# Non-farm enterprise ----

nfe <- read_dta(here("raw_data", "panel_19_20", "HH", "gsec12_2.dta")) %>% 
  rename_to_lower_snake() %>% 
  rename(baseline_hhid = hhid) %>% 
  mutate(nfe_operate = 1) %>% 
  group_by(baseline_hhid) %>% 
  slice_head() %>% 
  select(baseline_hhid, nfe_operate) %>% 
  right_join(hhid_correspondance, by = "baseline_hhid") %>% 
  mutate(
    nfe_operate = case_when(
      nfe_operate == 1 ~ 1,
      TRUE             ~ 2 # maintain coding of no
    )
  )
