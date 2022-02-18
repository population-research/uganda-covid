# Load data
library(tidyverse)
library(haven)
library(here)



## round 1 ---- 

## roster data (interview info and results?) 
round_1_interview_info <- read_dta(here("raw_data", "round1", "Interview_info.dta"))
round_1_interview_result <- read_dta(here("raw_data", "round1", "interview_result.dta"))
round_1_cover  <- read_dta(here( "raw_data", "round1", "Cover.dta")) 



## import raw data
round_1_sec1 <- read_dta(here( "raw_data", "round1", "SEC1.dta" )) ## individual level
round_1_sec4  <- read_dta(here( "raw_data", "round1", "SEC4.dta" )) 
round_1_sec5  <- read_dta(here( "raw_data", "round1", "SEC5.dta" )) 
round_1_sec5a  <- read_dta(here( "raw_data", "round1", "SEC5A.dta" )) 
round_1_sec6  <- read_dta(here( "raw_data", "round1", "SEC6.dta" )) ## individual level
round_1_sec7  <- read_dta(here( "raw_data", "round1", "SEC7.dta" )) 
round_1_sec9  <- read_dta(here( "raw_data", "round1", "SEC9.dta" )) ## individual leve

View(round_1_sec4)

## rename hhid to HHID in round1 sec1 data
round_1_sec1 <- round_1_sec1 %>%
  rename(HHID = hhid)

## merge round1 datasets

merged_r1 <- left_join(round_1_interview_info, round_1_interview_result, by = c("HHID")) %>% 
  left_join(round_1_cover, by = c("HHID")) %>% 
  left_join(round_1_sec4, by = c("HHID")) %>% 
  left_join(round_1_sec5, by = c("HHID")) %>% 
  left_join(round_1_sec5a, by = c("HHID")) %>% 
  left_join(round_1_sec7, by = c("HHID")) %>% 
  mutate(round = 1)



## round 2 ---- 
round_2_interview_info <- read_dta(here("raw_data", "round2", "Interview_info.dta"))
round_2_interview_result <- read_dta(here("raw_data", "round2", "interview_result.dta"))
round_2_cover  <- read_dta(here( "raw_data", "round2", "Cover.dta" )) 


round_2_sec1 <- read_dta(here( "raw_data", "round2", "SEC1.dta" )) 
round_2_sec4  <- read_dta(here( "raw_data", "round2", "SEC4.dta" )) 
round_2_sec5  <- read_dta(here( "raw_data", "round2", "SEC5.dta" )) 
round_2_sec5a  <- read_dta(here( "raw_data", "round2", "SEC5A.dta" )) 
round_2_sec6  <- read_dta(here( "raw_data", "round2", "SEC6.dta" )) 
round_2_sec7  <- read_dta(here( "raw_data", "round2", "SEC7.dta" )) 
round_2_sec9  <- read_dta(here( "raw_data", "round2", "SEC9.dta" )) 

## merge round2 datasets
merged_r2 <- left_join(round_2_interview_info, round_2_interview_result, by = c("HHID")) %>% 
  left_join(round_2_cover, by = c("HHID")) %>% 
  left_join(round_2_sec4, by = c("HHID")) %>% 
  left_join(round_2_sec5, by = c("HHID")) %>% 
  left_join(round_2_sec5a, by = c("HHID")) %>% 
  left_join(round_2_sec7, by = c("HHID")) %>% 
  mutate(round = 2)



## round 3 ---- 
round_3_interview_info <- read_dta(here( "raw_data", "round3", "interview_info.dta"))
round_3_interview_result <- read_dta(here("raw_data", "round3", "interview_result.dta"))
round_3_cover  <- read_dta(here( "raw_data", "round3", "cover.dta" )) 

round_3_sec1 <- read_dta(here( "raw_data", "round3", "SEC1.dta" )) 
round_3_sec4  <- read_dta(here( "raw_data", "round3", "sec4.dta" )) 
round_3_sec5  <- read_dta(here( "raw_data", "round3", "sec5.dta" )) 
round_3_sec5a  <- read_dta(here( "raw_data", "round3", "sec5a.dta" )) 
round_3_sec6  <- read_dta(here( "raw_data", "round3", "sec6.dta" )) 
round_3_sec7  <- read_dta(here( "raw_data", "round3", "sec7a_1.dta" )) 
round_3_sec9  <- read_dta(here( "raw_data", "round3", "sec9.dta" )) 

## merge round3 datasets
merged_r3 <- left_join( round_3_interview_info, round_3_interview_result, by = c("hhid")) %>% 
  left_join(round_3_cover, by = c("hhid")) %>% 
  left_join(round_3_sec4, by = c("hhid")) %>% 
  left_join(round_3_sec5, by = c("hhid")) %>% 
  left_join(round_3_sec5a, by = c("hhid")) %>% 
  left_join(round_3_sec7, by = c("hhid")) %>% 
  mutate(round = 3)



## round 4 ---- 
round_4_interview_info <- read_dta(here( "raw_data", "round4", "Interview_info.dta"))
round_4_interview_result <- read_dta(here("raw_data", "round4", "interview_result.dta"))
round_4_cover  <- read_dta(here( "raw_data", "round4", "Cover.dta" )) 


round_4_sec1 <- read_dta(here( "raw_data", "round4", "SEC1.dta" )) 
round_4_sec4  <- read_dta(here( "raw_data", "round4", "SEC4.dta" )) 
round_4_sec5  <- read_dta(here( "raw_data", "round4", "SEC5.dta" )) 
round_4_sec5a  <- read_dta(here( "raw_data", "round4", "SEC5A.dta" )) 
round_4_sec6  <- read_dta(here( "raw_data", "round4", "SEC6.dta" )) 
## sec7 found to be sec8 
round_4_sec8  <- read_dta(here( "raw_data", "round4", "SEC8.dta" )) 
round_4_sec9  <- read_dta(here( "raw_data", "round4", "SEC9.dta" )) 

## rename hhid to HHID in round4 sec1 data
round_4_sec1 <- round_4_sec1 %>%
  rename(HHID = hhid)

## merge round4 datasets
merged_r4 <- left_join( round_4_interview_info, round_4_interview_result, by = c("HHID")) %>% 
  left_join(round_4_cover, by = c("HHID")) %>% 
  left_join(round_4_sec4, by = c("HHID")) %>% 
  left_join(round_4_sec5, by = c("HHID")) %>% 
  left_join(round_4_sec5a, by = c("HHID")) %>%
  left_join(round_4_sec8, by = c("HHID")) %>% ##as sec 7
  mutate(round = 4)

## round 5 ---- 
round_5_interview_info <- read_dta(here( "raw_data", "round5", "interview_info.dta"))
round_5_interview_result <- read_dta(here("raw_data", "round5", "interview_result.dta"))
round_5_cover  <- read_dta(here( "raw_data", "round5", "cover.dta" )) 

round_5_sec1 <- read_dta(here( "raw_data", "round5", "SEC1.dta" )) 
round_5_sec4  <- read_dta(here( "raw_data", "round5", "sec4.dta" )) 
round_5_sec5  <- read_dta(here( "raw_data", "round5", "sec5.dta" )) 
round_5_sec5a  <- read_dta(here( "raw_data", "round5", "sec5a.dta" )) 
round_5_sec6  <- read_dta(here( "raw_data", "round5", "sec6.dta" )) 
# sec 7 as sec8
round_5_sec8 <- read_dta(here( "raw_data", "round5", "sec8.dta" )) 
round_5_sec9  <- read_dta(here( "raw_data", "round5", "sec9.dta" )) 

## merge round5 datasets
merged_r5 <- left_join( round_5_interview_info, round_5_interview_result, by = c("hhid")) %>% 
  left_join(round_5_cover, by = c("hhid")) %>%
  left_join(round_5_sec4, by = c("hhid")) %>% 
  left_join(round_5_sec5, by = c("hhid")) %>% 
  left_join(round_5_sec5a, by = c("hhid")) %>%
  left_join(round_5_sec8, by = c("hhid")) %>% # as sec 7
  mutate(round = 5)

## round 6 ----
round_6_interview_info <- read_dta(here( "raw_data", "round6", "interview_info.dta"))
round_6_interview_result <- read_dta(here("raw_data", "round6", "interview_result.dta"))
round_6_cover  <- read_dta(here( "raw_data", "round6", "cover.dta" )) 

round_6_sec1 <- read_dta(here( "raw_data", "round6", "sec1.dta" )) 
round_6_sec4  <- read_dta(here( "raw_data", "round6", "sec4_1.dta" )) 
round_6_sec5a  <- read_dta(here( "raw_data", "round6", "sec5a.dta" )) 
#  sec5 as sec5resp and sec5other
round_6_sec5_resp <- read_dta(here( "raw_data", "round6", "sec5_resp.dta" ))
round_6_sec5_other <- read_dta(here( "raw_data", "round6", "sec5_other.dta" ))

round_6_sec5  <- read_dta(here( "raw_data", "round6", "sec6.dta" )) 
round_6_sec6  <- read_dta(here( "raw_data", "round6", "sec6.dta" )) 
# sec7 as sec 8
round_6_sec8  <- read_dta(here( "raw_data", "round6", "sec8.dta" )) 
round_6_sec9  <- read_dta(here( "raw_data", "round6", "sec9.dta" )) 

## merge round6 datasets
merged_r6 <- left_join( round_6_interview_info, round_6_interview_result, by = c("hhid")) %>% 
  left_join(round_6_cover, by = c("hhid")) %>%
  left_join(round_6_sec4, by = c("hhid")) %>% 
  left_join(round_6_sec5_resp, by = c("hhid")) %>% 
  left_join(round_6_sec5_other, by = c("hhid")) %>% 
  left_join(round_5_sec5a, by = c("hhid")) %>% 
  left_join(round_5_sec8, by = c("hhid")) %>% 
  mutate(round = 6)

