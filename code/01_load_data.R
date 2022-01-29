# Load data
library(tidyverse)
library(haven)
library(here)

## import data
sec4  <- read_dta(here("raw_data", "Original_Data", "round1","SEC4.dta")) 
sec5  <- read_dta(here("raw_data", "Original_Data", "round1","SEC5.dta")) 
sec5a  <- read_dta(here("raw_data", "Original_Data", "round1","SEC5A.dta")) 
sec6  <- read_dta(here("raw_data", "Original_Data", "round1","SEC6.dta")) 
sec7  <- read_dta(here("raw_data", "Original_Data", "round1","SEC7.dta")) 
sec9  <- read_dta(here("raw_data", "Original_Data", "round1","SEC9.dta")) 


