# Load data
library(tidyverse)
library(haven)
library(here)

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



