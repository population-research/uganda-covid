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
  select(HHID, baseline_hhid) %>% 
  rename_to_lower_snake()

# Income/poverty data ----

poverty <- read_dta(here("raw_data", "panel_19_20", "pov2019_20.dta"))
