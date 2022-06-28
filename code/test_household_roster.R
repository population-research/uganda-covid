# Test household roster counts on Round 1

# Load data
library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(labelled)  # For data checking


round_1_sec1 <- read_dta(here( "raw_data", "round1", "SEC1.dta" )) 

# Claus's suggested code

test <- round_1_sec1 %>% 
  filter(s1q02a == 1 & s1q03 == 1) %>% 
  arrange(hhid, hh_roster__id) %>% 
  group_by(hhid) %>% 
  add_tally((s1q05 == 1 & s1q06 >= 18), name = "hh_adult_males") %>% 
  add_tally((s1q05 == 2 & s1q06 >= 18), name = "hh_adult_females") %>% 
  # Easy version is just to count the number of female heads! We can always make
  # it a factor later
  add_tally((s1q05 == 2 & s1q07 == 1),  name = "hh_head_female") %>% 
  # All the other counts here using hh_ as prefix of variable names
  select(hhid, starts_with("hh_"), -hh_roster__id) %>% 
  slice_head() %>% 
  ungroup() # speeds up the processing when we merge
  




## drop out hh guests ( s1q02a) and s1q03 == 2 nolonger hh member
non_guests <- round_1_sec1 %>% 
  filter(s1q02a == 1 & s1q03 == 1)

## female led household dummy variable 
female_led <- round_1_sec1 %>% ## filter seems to work without using the function any()
  filter(s1q05 == 2 & s1q07 == 1)

fem_led <- round_1_sec1 %>%
  group_by(s1q05) %>% 
  mutate(
    fem = case_when(
      s1q05 == 2 ~ TRUE,
      s1q07 == 1 ~ TRUE,
      TRUE ~ FALSE
    )
  )



## number of adult males and adult females.
male_adults <- add_tally(round_1_sec1, s1q05 == 1 & s1q06 >= 18, sort = FALSE) ## creates repetitive total value which is queer
female_adults <- add_tally(round_1_sec1, s1q05 == 2 & s1q06 >= 18, sort = FALSE)

male_adults <- round_1_sec1 %>% 
  group_by(s1q05) %>% 
  mutate(
    male_adu = case_when(
      s1q05 == 1 ~ TRUE,
      s1q06 >= 18 ~ TRUE,
      TRUE ~ FALSE
    )
  ) %>% 
  mutate(count = n())

female_adults <- round_1_sec1 %>% 
  group_by(s1q05) %>% 
  mutate(
    female_adu = case_when(
      s1q05 == 1 ~ TRUE,
      s1q06 >= 18 ~ TRUE,
      TRUE ~ FALSE
    )
  ) %>% 
  mutate(count = n())

