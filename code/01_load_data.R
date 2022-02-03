# Load data
library(tidyverse)
library(haven)
library(here)

## round 1 ---- 

## roster data (interview info and results?) 
round_1_interview_info <- read_dta(here(" raw_data", "round1", "Interview_info.dta "))
round_1_interview_result <- read_dta(here(" raw_data", "round1", "interview_result.dta "))
round_1_cover  <- read_dta(here( "raw_data", "round1", "Cover.dta" )) 


## import raw data
round_1_sec1 <- read_dta(here( "raw_data", "round1", "SEC1.dta" )) 
round_1_sec4  <- read_dta(here( "raw_data", "round1", "SEC4.dta" )) 
round_1_sec5  <- read_dta(here( "raw_data", "round1", "SEC5.dta" )) 
round_1_sec5a  <- read_dta(here( "raw_data", "round1", "SEC5A.dta" )) 
round_1_sec6  <- read_dta(here( "raw_data", "round1", "SEC6.dta" )) 
round_1_sec7  <- read_dta(here( "raw_data", "round1", "SEC7.dta" )) 
round_1_sec9  <- read_dta(here( "raw_data", "round1", "SEC9.dta" )) 

## round 2 ---- 
round_2_interview_info <- read_dta(here(" raw_data", "round2", "Interview_info.dta "))
round_2_interview_result <- read_dta(here(" raw_data", "round2", "interview_result.dta "))
round_2_cover  <- read_dta(here( "raw_data", "round2", "Cover.dta" )) 


round_2_sec1 <- read_dta(here( "raw_data", "round2", "SEC1.dta" )) 
round_2_sec4  <- read_dta(here( "raw_data", "round2", "SEC4.dta" )) 
round_2_sec5  <- read_dta(here( "raw_data", "round2", "SEC5.dta" )) 
round_2_sec5a  <- read_dta(here( "raw_data", "round2", "SEC5A.dta" )) 
round_2_sec6  <- read_dta(here( "raw_data", "round2", "SEC6.dta" )) 
round_2_sec7  <- read_dta(here( "raw_data", "round2", "SEC7.dta" )) 
round_2_sec9  <- read_dta(here( "raw_data", "round2", "SEC9.dta" )) 

