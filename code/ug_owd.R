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
data <- read.csv(url("https://covid.ourworldindata.org/data/owid-covid-data.csv"))

# Getting data for Uganda
ug_data = data[data$iso_code == 'UGA',] %>%
mutate(Year = year(date), Month = month(date), Day = day(date)) # splitting date into year month and day


## getting cases data by month
tot_monthly <- ug_data %>%
group_by(Month) %>%
summarize(tot_mon_cases = sum(total_cases))

## cases per 100,000 per month
mon_per_hundred <- tot_monthly %>%
mutate(
monthly_per_100000 = tot_mon_cases/100000
)
