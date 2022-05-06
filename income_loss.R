# Load data for income loss sections
library(tidyverse)
library(haven)
library(here)

## round 1 ---- 

## import raw data
round1_sec_6 <- read_dta(here( "raw_data", "round1", "SEC6.dta" ))

renamed_round1_sec_6 <- round1_sec_6 %>% 
  rename(
    hhid = HHID,
    income_source = s6q01,
    income_source_other = s6q01_Other,
    income_level_since_march = s6q02
)
colnames(renamed_round1_sec_6)


## round 2 ---- 
round2_sec_6 <- read_dta(here( "raw_data", "round2", "SEC6.dta" ))

renamed_round2_sec_6 <- round2_sec_6 %>% 
  rename(
    hhid = HHID,
    income_source = s6q01,
    income_source_other = s6q01_Other,
    income_level_since_march = s6q02
  )

## round 3 ---- 
round3_sec_6 <- read_dta(here( "raw_data", "round3", "sec6.dta" ))

renamed_round3_sec_6 <- round3_sec_6 %>% 
  rename(
    income_source = s6q01,
    income_source_other = s6q01_Other,
    income_level_since_march = s6q02
  )


## round 4 ---- 
round4_sec_6 <- read_dta(here( "raw_data", "round4", "SEC6.dta" ))

renamed_round4_sec_6 <- round4_sec_6 %>% 
  rename(
    hhid = HHID,
    income_source = s6q01,
    income_level_since_march = s6q02,
    income_level_annual = s6q03
  )


## round 5 ---- 
round5_sec_6 <- read_dta(here( "raw_data", "round5", "sec6.dta" ))

renamed_round5_sec_6 <- round5_sec_6 %>% 
  rename(
    income_source = s6q01,
    income_level_since_march = s6q02,
    income_level_annual = s6q03
  )


## round 6 ---- 
round6_sec_6 <- read_dta(here( "raw_data", "round6", "sec6.dta" ))

renamed_round6_sec_6 <- round6_sec_6 %>% 
  rename(
    income_source = s6q01,
    income_level_since_march = s6q02,
    income_level_annual = s6q03
  )

## no income loss data for round 7
