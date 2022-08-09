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


# HHID correspondance ----
hhid_correspondance  <- read_dta(here( "raw_data", "round1", "Cover.dta")) %>% 
  rename_to_lower_snake() %>% 
  select(hhid, baseline_hhid)  

# Income/poverty data ----

poverty <- read_dta(here("raw_data", "panel_19_20", "pov2019_20.dta")) %>% 
  rename_to_lower_snake() %>% 
  mutate(
    food_poor_2020 = welfare <= hpline
  ) %>% 
  rename(
    poor_2020_quints = quints
  ) %>% 
  select(
    hhid, welfare, food_poor_2020, poor_2020, poor_2020_quints
  )


# Land size ----

land <- read_dta(here("raw_data", "panel_19_20", "Agric", "agsec2a.dta")) %>% 
  rename_to_lower_snake() %>% 
  filter(!is.na(s2aq4) & s2aq11b != 3) %>%  # size available and not rented out
  group_by(hhid) %>% 
  summarise(
    land_size = sum(s2aq4) # land in acres
  )



