# Descriptive stats/graphs

# Load data
library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(labelled)  # For data checking
library(lubridate)
library(cowplot)
library(ggfittext)

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
    strip.background = element_blank(),
    panel.grid.major.y = element_line(color = "lightgray",
                                      size = 0.5)
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
our_world_data <- read_csv(url("https://covid.ourworldindata.org/data/owid-covid-data.csv")) %>% 
  rename_to_lower_snake() %>%
  filter(iso_code == "UGA") %>% 
  select(date, stringency_index, new_cases_smoothed, new_deaths_smoothed, population) %>% 
  mutate(
    date = ymd(date),
    cases_smooth_per_100000 = (new_cases_smoothed / population) * 100000,
    deaths_smooth_per_100000 = (new_deaths_smoothed / population) * 100000
  ) %>% 
  filter(date < ymd("2021-12-01"))
  

## Time series graph of stringency measure

ggplot(our_world_data, aes(x=date, y=stringency_index)) + 
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
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 100)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 


ggsave(here("figures", "stringency_index.pdf"),
       width = 20, height = 15, units = "cm")  

## Time series graphs of new cases and deaths smooth ----

ggplot(our_world_data, aes(x=date, y=cases_smooth_per_100000)) + 
  geom_line() + 
  xlab("Date") +
  ylab("New Cases Per 100,000 (Smooth)") +
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
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 


ggsave(here("figures", "cases.pdf"),
       width = 20, height = 15, units = "cm")  


ggplot(our_world_data, aes(x=date, y=deaths_smooth_per_100000)) + 
  geom_line() + 
  xlab("Date") +
  ylab("New Deaths Per 100,000 (Smooth)") +
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
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 


ggsave(here("figures", "deaths.pdf"),
       width = 20, height = 15, units = "cm")  




# Our version of the stringency index ----

oxford_base <- read_csv(url("https://raw.githubusercontent.com/OxCGRT/covid-policy-tracker/master/data/OxCGRT_nat_latest.csv")) %>%
  rename_to_lower_snake() %>%
  filter(country_code == "UGA") %>%
  # select(date, matches("[ce]\\d")) %>%
  mutate(
    date = ymd(date)
  ) %>% 
  filter(date < ymd("2021-12-01")) %>%  # Does not need information after that
  arrange(date) 

calculate_index <- function(part_name, part_max) {
  var_number <- str_which(names(oxford_base), paste0(part_name, "_(?!flag)"))
  flag_number <- str_which(names(oxford_base), paste0(part_name, "_(?=flag)"))
  oxford_base %>% 
    transmute(
      index = case_when(
        oxford_base[[var_number]] == 0 ~ 0,
        oxford_base[[var_number]] != 0 ~ 100 * ((oxford_base[[var_number]] - 0.5*(1 - oxford_base[[flag_number]])) / part_max),
        TRUE ~ NA_real_
      ) 
    ) %>% 
    # rename(!!part_name := index)
    rename(!!paste0("index_", part_name) := index)
}

vec_names <- c("c1m", "c2m", "c3m", "c4m", "c5m", "c6m", "c7m", "h1")
vec_max <- c(3, 3, 2, 4, 2, 3, 2, 2)

oxford <- map2_dfc(vec_names, vec_max, ~ calculate_index(.x, .y)) %>% 
  bind_cols(oxford_base) %>% 
  mutate(
    index_c8ev = 100 * (c8ev_international_travel_controls / 4)
  ) %>% 
  select(date, stringency_index_average, contains(vec_names), index_c8ev, c8ev_international_travel_controls) %>% 
  mutate(
    # test_index = rowSums(across((starts_with("index") & !contains("c1") & !contains("c3") & !contains("c4") & !contains("c8") & !contains("h1") ))) / 4
    index_4 = rowSums(across(c(index_c2m, index_c5m, index_c6m, index_c7m))) / 4,
    index_3 = rowSums(across(c(index_c2m, index_c5m, index_c6m))) / 3
  ) %>% 
  relocate(date, stringency_index_average, index_4, index_3)

ggplot(oxford, aes(x=date, y=index_4)) + 
  geom_line() + 
  xlab("Date") +
  ylab("Daily Stringency Index (restricted version)") +
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
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 100)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 


ggsave(here("figures", "stringency_index_restricted.pdf"),
       width = 20, height = 15, units = "cm")  



# Google Mobility Data -----

## Data source: Google Mobility Data
## Description Link: https://www.google.com/covid19/mobility/
## Data URL: https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv

# Even with the timeout increace, this failed to load sometimes, so I downloaded 
# the data and saved it locally, using the following:
# 
# options(timeout = 600) # Increase timeout to 10 minutes
# download.file("https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv", here("raw_data", "Global_Mobility_Report.csv"))

## load data (original version where data are downloaded on demand)
# google <- read_csv(url("https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv")) %>% 
#   rename_to_lower_snake() %>%
#   filter(country_region_code == "UG") %>% # Uses only the 2 letter code
#   select(date, sub_region_1, sub_region_2, iso_3166_2_code, ends_with("from_baseline")) %>% 
#   filter(date < ymd("2021-12-01")) %>% 
#   rename_with(
#     ~ str_replace(., "_percent_change_from_baseline", "")
#   )

google <- read_csv(here("raw_data", "external_data", "Global_Mobility_Report.csv")) %>% 
  rename_to_lower_snake() %>%
  filter(country_region_code == "UG") %>% # Uses only the 2 letter code
  select(date, sub_region_1, sub_region_2, iso_3166_2_code, ends_with("from_baseline")) %>% 
  filter(date < ymd("2021-12-01")) %>% 
  rename_with(
    ~ str_replace(., "_percent_change_from_baseline", "")
  )


# National Level mobility ----

national_level <- google %>% filter(is.na(sub_region_1))

ggplot(national_level,aes(x = date)) + 
  geom_line(aes(y = residential)) + 
  # geom_line(aes(y = grocery_and_pharmacy)) + 
  # geom_line(aes(y = transit_stations)) +
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
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 

ggsave(here("figures", "google_mobility_national.pdf"),
       width = 20, height = 15, units = "cm")

# Regional level mobility ----

regional <- google %>% filter(!is.na(sub_region_1) & is.na(sub_region_2))

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


# Combine graphs ----


p_index <- ggplot(oxford, aes(x=date, y=index_4)) + 
  geom_line() + 
  ylab("Daily Stringency Index \n (restricted version)") +
  annotate("rect", xmin = base$first_date[1], xmax = base$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "1", xmin = base$first_date[1], xmax = base$last_date[1],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = base$first_date[2], xmax = base$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "2", xmin = base$first_date[2], xmax = base$last_date[2],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = base$first_date[3], xmax = base$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "3", xmin = base$first_date[3], xmax = base$last_date[3],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = base$first_date[4], xmax = base$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "4", xmin = base$first_date[4], xmax = base$last_date[4],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = base$first_date[5], xmax = base$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "5", xmin = base$first_date[5], xmax = base$last_date[5],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = base$first_date[6], xmax = base$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "6", xmin = base$first_date[6], xmax = base$last_date[6],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = base$first_date[7], xmax = base$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "7", xmin = base$first_date[7], xmax = base$last_date[7],
                    ymin = 80, ymax = 100)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 100)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank())


p_mobility <- ggplot(national_level,aes(x = date)) + 
  geom_line(aes(y = residential)) + 
  # geom_line(aes(y = grocery_and_pharmacy)) + 
  # geom_line(aes(y = transit_stations)) +
  ylab("Time Spent at Residencies \n (Base: 01/03-02/06, 2020)") +
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
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank())


p_cases <- ggplot(our_world_data, aes(x=date, y=cases_smooth_per_100000)) + 
  geom_line() + 
  ylab("New Cases Per \n 100,000 (Smooth)") +
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
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank())

p_deaths <- ggplot(our_world_data, aes(x=date, y=deaths_smooth_per_100000)) + 
  geom_line() + 
  xlab("Date") +
  ylab("New Deaths Per \n 100,000 (Smooth)") +
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
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 



plot_grid(p_index, p_mobility, p_cases, p_deaths, ncol = 1, align = "v")

ggsave(here("figures", "combined.pdf"),
       width = 19, height = 25, units = "cm")


