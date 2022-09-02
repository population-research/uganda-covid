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
  annotate("rect", xmin = ymd("2020-06-01"), xmax = ymd("2020-06-30"),
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = ymd("2020-08-01"), xmax = ymd("2020-08-31"),
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = ymd("2020-09-01"), xmax = ymd("2020-09-30"),
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = ymd("2020-10-01"), xmax = ymd("2020-10-31"),
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = ymd("2021-02-01"), xmax = ymd("2021-02-28"),
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = ymd("2021-03-01"), xmax = ymd("2021-03-31"),
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = ymd("2021-10-01"), xmax = ymd("2021-10-31"),
           ymin = -Inf, ymax = Inf, alpha = 0.4) 

ggsave(here("figures", "stringency_index.pdf"))  

