# Load data
library(tidyverse)
library(haven)
library(here)

## import data
sec4  <- read_dta(here("raw_data", "original_Data", "round1","SEC4.dta")) 
sec5  <- read_dta(here("raw_data", "original_Data", "round1","SEC5.dta")) 
sec5a  <- read_dta(here("raw_data", "original_Data", "round1","SEC5A.dta")) 
sec6  <- read_dta(here("raw_data", "original_Data", "round1","SEC6.dta")) 
sec7  <- read_dta(here("raw_data", "original_Data", "round1","SEC7.dta")) 
sec9  <- read_dta(here("raw_data", "original_Data", "round1","SEC9.dta")) 

## roster data (interview info and results?) 
interview_info <- read_dta(here("raw_data", "original_Data", "round1","Interview_info.dta"))
interview_result <- read_dta(here("raw_data", "original_Data", "round1","interview_result.dta"))
cover  <- read_dta(here("raw_data", "original_Data", "round1","Cover.dta")) 

