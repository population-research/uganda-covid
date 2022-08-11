# Pre-Covid Panel data

# Did the family run a non-farm family business
# Land size available (owned vs rent)
# Wealth/asset measures
# Income/poverty (pov2019_20.dta should have the needed information)

library(tidyverse)
library(haven)
library(here)
library(janitor) # For data checking
library(vtable) # For data checking
library(labelled) # For data checking
library(glue)

# Functions
rename_to_lower_snake <- function(df) {
  df %>%
    rename_with(~ gsub("([a-z])([A-Z])", "\\1_\\2", .x)) %>% # Adds _ to camel case var names
    rename_with(~ tolower(gsub("[ /-]+", "_", .x))) # Converts to lower and substitutes _ for spaces and /
}


# HHID correspondance ----
hhid_correspondance <- read_dta(here("raw_data", "round1", "Cover.dta")) %>%
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
  right_join(hhid_correspondance, by = "baseline_hhid") %>%
  select(-baseline_hhid)


# Land size ----

land <- read_dta(here("raw_data", "panel_19_20", "Agric", "agsec2a.dta")) %>%
  rename_to_lower_snake() %>%
  rename(baseline_hhid = hhid) %>%
  filter(!is.na(s2aq4) & s2aq11b != 3) %>% # size available and not rented out
  group_by(baseline_hhid) %>%
  summarise(
    land_size = sum(s2aq4) # land in acres
  ) %>%
  ungroup() %>%
  right_join(hhid_correspondance, by = "baseline_hhid") %>%
  select(-baseline_hhid) %>%
  mutate(
    land_size = replace_na(land_size, 0)
  )



# Non-farm enterprise ----

nfe <- read_dta(here("raw_data", "panel_19_20", "HH", "gsec12_2.dta")) %>%
  rename_to_lower_snake() %>%
  rename(baseline_hhid = hhid) %>%
  mutate(nfe_operate = 1) %>%
  group_by(baseline_hhid) %>%
  slice_head() %>%
  ungroup() %>%
  select(baseline_hhid, nfe_operate) %>%
  right_join(hhid_correspondance, by = "baseline_hhid") %>%
  mutate(
    nfe_operate = case_when(
      nfe_operate == 1 ~ 1,
      TRUE ~ 2 # maintain coding of no
    )
  ) %>%
  select(-baseline_hhid)


# Assets/wealth ----

assets <- read_dta(here("raw_data", "panel_19_20", "HH", "gsec14.dta")) %>%
  rename_to_lower_snake() %>%
  rename(baseline_hhid = hhid) %>%
  filter(h14q03 != 2) %>% # Does not have that asset
  filter((h14q02 != 21 & h14q02 != 22)) %>% # 21 and 22 are other
  mutate(
    own = 1, # By definition
    asset_type = case_when(
      h14q02 == 1 ~ "Owner House",
      h14q02 == 2 ~ "Other Buildings",
      h14q02 == 3 ~ "Non-Ag Land",
      h14q02 == 4 ~ "Furniture",
      h14q02 == 5 ~ "Appliances",
      h14q02 == 23 ~ "Cooker",
      h14q02 == 24 ~ "Refrigerator",
      h14q02 == 25 ~ "Washing machine",
      h14q02 == 6 ~ "Television",
      h14q02 == 26 ~ "Radio",
      h14q02 == 27 ~ "Music system",
      h14q02 == 7 ~ "DVD",
      h14q02 == 8 ~ "Generators",
      h14q02 == 9 ~ "Solar panel",
      h14q02 == 10 ~ "Bicycle",
      h14q02 == 11 ~ "Motorcycle",
      h14q02 == 12 ~ "Motorvehicle",
      h14q02 == 13 ~ "Boat",
      h14q02 == 14 ~ "Other Transport",
      h14q02 == 15 ~ "Jewelry",
      h14q02 == 28 ~ "Fixed phone",
      h14q02 == 16 ~ "Mobile phone",
      h14q02 == 17 ~ "Computer Tablets",
      h14q02 == 18 ~ "Internet Access",
      h14q02 == 19 ~ "Other electronic",
      h14q02 == 20 ~ "Other assets",
      TRUE ~ NA_character_
    )
  ) %>%
  select(baseline_hhid, own, asset_type) %>%
  pivot_wider(
    id_cols = baseline_hhid,
    names_from = asset_type,
    values_from = own,
    names_prefix = "asset_",
    names_sort = TRUE,
    values_fill = 0
  ) %>%
  rename_to_lower_snake() %>%
  right_join(hhid_correspondance, by = "baseline_hhid") %>%
  select(-baseline_hhid)

# Combine all data and save ----

panel_19_20 <- poverty %>%
  left_join(land, by = "hhid") %>%
  left_join(nfe, by = "hhid") %>%
  left_join(assets, by = "hhid") %>%
  relocate(hhid) %>% 
  rename_with(~str_c("precovid_", .), -hhid)

all_rounds_df <- read_rds(here("data", "load_2.rds")) %>% 
  left_join(panel_19_20, by = "hhid") 

all_rounds_df %>%   
  write_rds(here("data", "load_3.rds"))





