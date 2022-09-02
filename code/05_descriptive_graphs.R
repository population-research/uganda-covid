# Descriptive stats/graphs

# So far only the original stringency index by day for presentation to Howard

# Load data
library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(labelled)  # For data checking
library(lubridate)

# Functions
rename_to_lower_snake <- function(df) {
  df %>%
    rename_with(~ gsub("([a-z])([A-Z])", "\\1_\\2", .x)) %>% # Adds _ to camel case var names
    rename_with(~ tolower(gsub("[ /]+", "_", .x))) # Converts to lower and substitutes _ for spaces and /
}

# Theme changes ----
theme_uft <- theme_classic() +
  theme(
    axis.text = element_text(
      colour = "black"
    ),
    legend.title = element_blank(),
    legend.key.width = unit(1, "cm"),
    strip.background = element_blank()
  )

theme_set(theme_uft)

# Interview dates by round ----

base <- read_rds(here("data", "base.rds")) %>% 
  select(survey, interview_date) %>% 
  group_by(survey) %>% 
  summarise(
    first_date = min(interview_date),
    last_date = max(interview_date)
  )



## Data source: OUR WORLDIN DATA
## Description Link: https://docs.owid.io/projects/covid/en/latest/dataset.html
## Data URL: https://covid.ourworldindata.org/data/owid-covid-data.csv

## load data 
data <- read_csv(url("https://covid.ourworldindata.org/data/owid-covid-data.csv")) %>% 
  rename_to_lower_snake() %>%
  filter(iso_code == "UGA") %>% 
  select(date, stringency_index) %>% 
  mutate(
    date = ymd(date)
  ) %>% 
  filter(date < ymd("2021-12-01"))
  

## Time series graph of stringency measure

ggplot(data,aes(x=date, y=stringency_index)) + 
  geom_line() + 
  xlab("Date") +
  ylab("Daily Stringency Index") +
  annotate("rect", xmin = base$first_date[1], xmax = base$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[2], xmax = base$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[3], xmax = base$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[4], xmax = base$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[5], xmax = base$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[6], xmax = base$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[7], xmax = base$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) 

ggsave(here("figures", "stringency_index.pdf"),
       width = 20, height = 15, units = "cm")  



# Google Mobility Data -----

## Data source: Google Mobility Data
## Description Link: https://www.google.com/covid19/mobility/
## Data URL: https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv

## load data 
df <- read_csv(url("https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv")) %>% 
  rename_to_lower_snake() %>%
  filter(country_region_code == "UG") %>% # Uses only the 2 letter code
  select(date, sub_region_1, sub_region_2, iso_3166_2_code, ends_with("from_baseline")) %>% 
  filter(date < ymd("2021-12-01")) %>% 
  rename_with(
    ~ str_replace(., "_percent_change_from_baseline", "")
  )

# National Level mobility ----

national_level <- df %>% filter(is.na(sub_region_1))

ggplot(national_level,aes(x = date)) + 
  geom_line(aes(y = residential)) + 
  # geom_line(aes(y = grocery_and_pharmacy)) + 
  geom_line(aes(y = transit_stations)) +
  xlab("Date") +
  annotate("rect", xmin = base$first_date[1], xmax = base$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[2], xmax = base$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[3], xmax = base$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[4], xmax = base$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[5], xmax = base$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[6], xmax = base$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[7], xmax = base$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) 

ggsave(here("figures", "google_mobility_national.pdf"),
       width = 20, height = 15, units = "cm")

# Regional level mobility ----

regional <- df %>% filter(!is.na(sub_region_1) & is.na(sub_region_2))

ggplot(regional, aes(x = date)) + 
  geom_line(aes(y = residential, color = sub_region_1)) + 
  xlab("Date") +
  annotate("rect", xmin = base$first_date[1], xmax = base$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[2], xmax = base$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[3], xmax = base$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[4], xmax = base$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[5], xmax = base$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[6], xmax = base$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[7], xmax = base$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) 

ggsave(here("figures", "google_mobility_regional.pdf"),
       width = 20, height = 15, units = "cm")


