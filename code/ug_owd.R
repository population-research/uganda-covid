# Load data
library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(labelled)  # For data checking
library(lubridate)

## Data source: OUR WORLDIN DATA
## Description Link: https://docs.owid.io/projects/covid/en/latest/dataset.html
## Data URL: https://covid.ourworldindata.org/data/owid-covid-data.csv

## load data 
data <- read_csv(url("https://covid.ourworldindata.org/data/owid-covid-data.csv"))

# Getting data for Uganda
ug_data = data[data$iso_code == 'UGA',] %>%
mutate(year = year(date), month = month(date), day = day(date)) # splitting date into year month and day


## getting cases data by month and cases per 100,000 per month
new_cases_monthly <- ug_data %>%
  group_by(year,month) %>% 
    summarize(new_mon_cases = sum(new_cases), mean_population = mean(population), mean_stringency_index = (stringency_index), mean_reproduction_rate =  mean(reproduction_rate)) %>%
       mutate(
           monthly_new_cases_per_100000 = (new_mon_cases/ug_data$population[1]) * 100000
  )

