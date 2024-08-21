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
library(ggtext)

# Functions
rename_to_lower_snake <- function(df) {
  df %>%
    rename_with(~ gsub("([a-z])([A-Z])", "\\1_\\2", .x)) %>% # Adds _ to camel case var names
    rename_with(~ tolower(gsub("[ /]+", "_", .x))) # Converts to lower and substitutes _ for spaces and /
}

# Graph theme set-up ----
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

# http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
color_palette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")



# Load survey_dates data to get interview dates by round ----

survey_dates <- read_rds(here("data", "base.rds")) %>% 
  select(survey, interview_date) %>% 
  group_by(survey) %>% 
  summarise(
    first_date = min(interview_date),
    last_date = max(interview_date)
  )


# Our World In Data ----

## Data source: OUR WORLD IN DATA
## Description Link: https://docs.owid.io/projects/covid/en/latest/dataset.html
## Data URL: https://covid.ourworldindata.org/data/owid-covid-data.csv

# We use locally saved data as the new online data is per week rather than per day

## load data 
# our_world_data <- read_csv(url("https://covid.ourworldindata.org/data/owid-covid-data.csv")) %>% 
our_world_data <- read_csv(here("raw_data", "external_data", "owid-covid-data.csv")) %>%
  rename_to_lower_snake() %>%
  filter(iso_code == "UGA") %>% 
  select(date, stringency_index, new_cases_smoothed, new_deaths_smoothed, population) %>% 
  mutate(
    date = ymd(date),
    cases_smooth_per_100000 = (new_cases_smoothed / population) * 100000,
    deaths_smooth_per_100000 = (new_deaths_smoothed / population) * 100000
  ) %>% 
  filter(date < ymd("2021-12-01"))
  

## Time series graph of OWID stringency measure ----

ggplot(our_world_data, aes(x=date, y=stringency_index)) + 
  geom_line() + 
  xlab("Date") +
  ylab("Daily Stringency Index") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
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
  ylab("Daily New Cases Per 100,000 (Smooth)") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
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
  ylab("Daily New Deaths Per 100,000 (Smooth)") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 


ggsave(here("figures", "deaths.pdf"),
       width = 20, height = 15, units = "cm")  




# Our version of the stringency index ----

# oxford_survey_dates <- read_csv(url("https://raw.githubusercontent.com/OxCGRT/covid-policy-tracker/master/data/OxCGRT_nat_latest.csv")) %>%
oxford_survey_dates <- read_csv(here("raw_data", "external_data", "OxCGRT_nat_latest.csv")) %>%
  rename_to_lower_snake() %>%
  filter(country_code == "UGA") %>%
  # select(date, matches("[ce]\\d")) %>%
  mutate(
    date = ymd(date)
  ) %>% 
  filter(date < ymd("2021-12-01")) %>%  # Does not need information after that
  arrange(date) 

calculate_index <- function(part_name, part_max) {
  var_number <- str_which(names(oxford_survey_dates), paste0(part_name, "_(?!flag)"))
  flag_number <- str_which(names(oxford_survey_dates), paste0(part_name, "_(?=flag)"))
  oxford_survey_dates %>% 
    transmute(
      index = case_when(
        oxford_survey_dates[[var_number]] == 0 ~ 0,
        oxford_survey_dates[[var_number]] != 0 ~ 100 * ((oxford_survey_dates[[var_number]] - 0.5*(1 - oxford_survey_dates[[flag_number]])) / part_max),
        TRUE ~ NA_real_
      ) 
    ) %>% 
    # rename(!!part_name := index)
    rename(!!paste0("index_", part_name) := index)
}

vec_names <- c("c1m", "c2m", "c3m", "c4m", "c5m", "c6m", "c7m", "h1")
vec_max <- c(3, 3, 2, 4, 2, 3, 2, 2)

oxford <- map2_dfc(vec_names, vec_max, ~ calculate_index(.x, .y)) %>% 
  bind_cols(oxford_survey_dates) %>% 
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
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
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
#   select(date, sub_region_1, sub_region_2, iso_3166_2_code, ends_with("from_survey_datesline")) %>% 
#   filter(date < ymd("2021-12-01")) %>% 
#   rename_with(
#     ~ str_replace(., "_percent_change_from_survey_datesline", "")
#   )

google <- read_csv(here("raw_data", "external_data", "Global_Mobility_Report.csv")) %>% 
  rename_to_lower_snake() %>%
  filter(country_region_code == "UG") %>% # Uses only the 2 letter code
  select(date, sub_region_1, sub_region_2, iso_3166_2_code, ends_with("from_baseline")) %>% 
  filter(date < ymd("2021-12-01")) %>% 
  rename_with(
    ~ str_replace(., "_percent_change_from_baseline", "")
  )

# The mobility variables are: retail_and_recreation, grocery_and_pharmacy, parks, transit_stations, workplaces, residential


# National Level mobility ----

national_level <- google %>% filter(is.na(sub_region_1))

gg_mob_res <- ggplot(national_level,aes(x = date)) + 
  geom_line(aes(y = residential)) + 
  ylab("Percentage Change in Time Spent at\nResidencies (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 

gg_mob_res

ggsave(here("figures", "mobility_national_residential.tiff"),
       width = 20, height = 10, units = "cm")

gg_mob_res +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_national_residential.pdf"),
       width = 20, height = 10, units = "cm")

gg_mob_work <- ggplot(national_level,aes(x = date)) + 
  geom_line(aes(y = workplaces)) + 
  ylab("Percentage Change in Visits to\nWorkplaces (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 

gg_mob_work

ggsave(here("figures", "mobility_national_workplaces.tiff"),
       width = 20, height = 10, units = "cm")

gg_mob_work +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_national_workplaces.pdf"),
       width = 20, height = 10, units = "cm")

gg_mob_groc <- ggplot(national_level,aes(x = date)) + 
  geom_line(aes(y = grocery_and_pharmacy)) + 
  ylab("Percentage Change in Visits to\nGroceries and Pharmacies (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 

gg_mob_groc

ggsave(here("figures", "mobility_national_grocery.tiff"),
       width = 20, height = 10, units = "cm")

gg_mob_groc +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_national_grocery.pdf"),
       width = 20, height = 10, units = "cm")

gg_mob_park <- ggplot(national_level,aes(x = date)) + 
  geom_line(aes(y = parks)) + 
  ylab("Percentage Change in Visits to\nParks (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 

gg_mob_park

ggsave(here("figures", "mobility_national_parks.tiff"),
       width = 20, height = 10, units = "cm")

gg_mob_park +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_national_parks.pdf"),
       width = 20, height = 10, units = "cm")


gg_mob_transit <- ggplot(national_level,aes(x = date)) + 
  geom_line(aes(y = transit_stations)) + 
  ylab("Percentage Change in Visits to\nTransit Stantions (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 

gg_mob_transit

ggsave(here("figures", "mobility_national_transit.tiff"),
       width = 20, height = 10, units = "cm")

gg_mob_transit +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_national_transit.pdf"),
       width = 20, height = 10, units = "cm")


ggplot(national_level,aes(x = date)) + 
  geom_line(aes(y = retail_and_recreation)) + 
  ylab("Percentage Change in Visits to\nRetail and Recreation (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 

ggsave(here("figures", "mobility_national_retail.pdf"),
       width = 20, height = 10, units = "cm")





# Regional level mobility ----

regional <- google %>% filter(!is.na(sub_region_1) & is.na(sub_region_2))

gg_mob_reg_retail <- ggplot(regional, aes(x = date)) + 
  geom_line(aes(y = retail_and_recreation)) + 
  ylab("Percentage Change in Visitors to\nRetail (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  facet_wrap(~sub_region_1, scales = "fixed") +
  scale_x_date(date_breaks = "2 month", date_labels =  "%b %Y") +
  theme(
    axis.text.x=element_text(angle=60, hjust=1),
    strip.text = element_text(size = 11)
    ) 
  
gg_mob_reg_retail

ggsave(here("figures", "mobility_regional_retail.tiff"),
       width = 8, height = 4.5, units = "in")

gg_mob_reg_retail +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_regional_retail.pdf"),
       width = 8, height = 4.5, units = "in")

gg_mob_reg_res <- ggplot(regional, aes(x = date)) + 
  geom_line(aes(y = residential)) + 
  ylab("Percentage Change in Time Spent at\nResidencies (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  facet_wrap(~sub_region_1, scales = "fixed") +
  scale_x_date(date_breaks = "2 month", date_labels =  "%b %Y") +
  theme(
    axis.text.x=element_text(angle=60, hjust=1),
    strip.text = element_text(size = 11)
    )

gg_mob_reg_res

ggsave(here("figures", "mobility_regional_residential.tiff"),
       width = 20, height = 15, units = "cm")

gg_mob_reg_res +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_regional_residential.pdf"),
       width = 20, height = 15, units = "cm")


gg_mobs_reg_work <- ggplot(regional, aes(x = date)) + 
  geom_line(aes(y = workplaces)) +
  ylab("Percentage Change in Visits to\nWorkplaces (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  facet_wrap(~sub_region_1, scales = "fixed") +
  scale_x_date(date_breaks = "2 month", date_labels =  "%b %Y") +
  theme(
    axis.text.x=element_text(angle=60, hjust=1),
    strip.text = element_text(size = 11)
    )

gg_mobs_reg_work

ggsave(here("figures", "mobility_regional_workplaces.tiff"),
       width = 20, height = 15, units = "cm")

gg_mobs_reg_work +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_regional_workplaces.pdf"),
       width = 20, height = 15, units = "cm")


gg_mob_reg_groc <- ggplot(regional, aes(x = date)) + 
  geom_line(aes(y = grocery_and_pharmacy)) +
  ylab("Percentage Change in Visits to\nGrocery and Pharmacies (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  facet_wrap(~sub_region_1, scales = "fixed") +
  scale_x_date(date_breaks = "2 month", date_labels =  "%b %Y") +
  theme(
    axis.text.x=element_text(angle=60, hjust=1),
    strip.text = element_text(size = 11)
    )

gg_mob_reg_groc

ggsave(here("figures", "mobility_regional_grocery.tiff"),
       width = 20, height = 15, units = "cm")

gg_mob_reg_groc +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_regional_grocery.pdf"),
       width = 20, height = 15, units = "cm")

gg_mob_reg_parks <- ggplot(regional, aes(x = date)) + 
  geom_line(aes(y = parks)) +
  ylab("Percentage Change in Visits to\nParks (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  facet_wrap(~sub_region_1, scales = "fixed") +
  scale_x_date(date_breaks = "2 month", date_labels =  "%b %Y") +
  theme(
    axis.text.x=element_text(angle=60, hjust=1),
    strip.text = element_text(size = 11)
    )

gg_mob_reg_parks

ggsave(here("figures", "mobility_regional_parks.tiff"),
       width = 20, height = 15, units = "cm")

gg_mob_reg_parks +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_regional_parks.pdf"),
       width = 20, height = 15, units = "cm")


gg_mob_reg_transit <- ggplot(regional, aes(x = date)) + 
  geom_line(aes(y = transit_stations)) +
  ylab("Percentage Change in Visits to\nTransit Stations (Base: 01/03-02/06, 2020)") +
  xlab("Date") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  facet_wrap(~sub_region_1, scales = "fixed") +
  scale_x_date(date_breaks = "2 month", date_labels =  "%b %Y") +
  theme(
    axis.text.x=element_text(angle=60, hjust=1),
    strip.text = element_text(size = 11)
    )

gg_mob_reg_transit

ggsave(here("figures", "mobility_regional_transit.tiff"),
       width = 20, height = 15, units = "cm")

gg_mob_reg_transit +
  labs(
    caption = "*Source:* Authors' analysis based on data from Google Mobility.<br>
    *Note:* Missing are due to no data provided for those dates. Shaded areas represent the survey dates."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "mobility_regional_transit.pdf"),
       width = 20, height = 15, units = "cm")




# Combine graphs ----


p_index <- ggplot(oxford, aes(x=date, y=index_4)) + 
  geom_line() + 
  ylab("Daily Stringency Index\n(restricted version)") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "1", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "2", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "3", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "4", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "5", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "6", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
                    ymin = 80, ymax = 100)) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  geom_fit_text(aes(label = "7", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
                    ymin = 80, ymax = 100)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 100)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank())


# p_mobility <- ggplot(national_level,aes(x = date)) + 
#   geom_line(aes(y = residential)) + 
#   # geom_line(aes(y = grocery_and_pharmacy)) + 
#   # geom_line(aes(y = transit_stations)) +
#   ylab("Time Spent at Residencies \n (Base: 01/03-02/06, 2020)") +
#   annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
#            ymin = -Inf, ymax = Inf, alpha = 0.4) +
#   annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
#            ymin = -Inf, ymax = Inf, alpha = 0.4) +
#   annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
#            ymin = -Inf, ymax = Inf, alpha = 0.4) +
#   annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
#            ymin = -Inf, ymax = Inf, alpha = 0.4) +
#   annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
#            ymin = -Inf, ymax = Inf, alpha = 0.4) +
#   annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
#            ymin = -Inf, ymax = Inf, alpha = 0.4) +
#   annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
#            ymin = -Inf, ymax = Inf, alpha = 0.4) +
#   scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
#                limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
#   theme(axis.title.x = element_blank(),
#         axis.text.x = element_blank())

p_mobility <- ggplot(national_level,aes(x = date)) + 
  geom_line(aes(y = retail_and_recreation)) + 
  ylab("Percentage Change in Visitors to\nRetail (Base: 01/03-02/06, 2020)") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank())


p_cases <- ggplot(our_world_data, aes(x=date, y=cases_smooth_per_100000)) + 
  geom_line() + 
  ylab("Daily New Cases Per\n100,000 (Smooth)") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank())

p_deaths <- ggplot(our_world_data, aes(x=date, y=deaths_smooth_per_100000)) + 
  geom_line() + 
  xlab("Date") +
  ylab("Daily New Deaths Per\n100,000 (Smooth)") +
  annotate("rect", xmin = survey_dates$first_date[1], xmax = survey_dates$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[2], xmax = survey_dates$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[3], xmax = survey_dates$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[4], xmax = survey_dates$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[5], xmax = survey_dates$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[6], xmax = survey_dates$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = survey_dates$first_date[7], xmax = survey_dates$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) 


gg_combined <- plot_grid(p_index, p_mobility, p_cases, p_deaths, ncol = 1, align = "v")

gg_combined

ggsave(here("figures", "combined.tiff"),
       width = 8, height = 10, units = "in")

gg_combined + 
  labs(
    caption = str_wrap("*Source:* Authors’ analysis based on data from: 
    the lockdown stringency index developed at the Blavatnik School of
    Government,<br> University of Oxford, for the  Daily Stringency Index,
    Google Mobility for the Percentage Change in Visitors to Retail, 
    Our World<br> in Data for the Daily New Cases and Daily New Deaths,
    and the Uganda High-Frequency Phone Survey.<br><br>
    *Note:* Survey dates are shaded in grey and shaded areas cover start 
    date to end date of each of the seven survey round.", width = 100)
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.2)
  )


ggsave(here("figures", "combined.pdf"),
       width = 8, height = 10, units = "in")


# National-level Food security and interview dates by round ----

national_level <- read_rds(here("data", "base.rds")) %>% 
  select(survey, interview_date, starts_with(c("food", "insecure"))) %>% 
  select(-insecure_sum) %>% 
  group_by(survey) %>% 
  summarise(
    first_date = min(interview_date),
    last_date = max(interview_date),
    # find average across all variables that begin with food
    across(starts_with(c("food", "insecure")), \(x) mean(x, na.rm = TRUE) * 100)
  )  %>% 
  # Pivot longer over all variables that begin with food
  pivot_longer(-c(survey, first_date, last_date), names_to = "type", values_to = "value") 


# Single type food insecurity
national_level %>% 
  filter(str_detect(type, "food_")) %>%
  # remove food_ from variable 
  mutate(type = str_remove(type, "food_")) %>% 
  # make type a factor and specify order
  mutate(
    type = factor(
      type, 
      levels = c("healthy_lack", "few_kinds", "insufficient_worry", "less_than_expected", "skipped_meal", "hungry", "ranout", "didnt_eat_all_day")
    )
  )%>%
  ggplot(aes(x = value, color = type)) +
  geom_linerange(aes(ymin = first_date, ymax = last_date), linewidth = 2) +
  coord_flip(xlim = c(0, 65), expand = FALSE) +
  scale_y_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) +
  scale_colour_manual(
    values = color_palette,
    labels = c(
      "Lack of Healthy food",
      "Few kinds of food",
      "Worry about food",
      "Less than expected",
      "Skipped meal",
      "Hungry",
      "Ran out of food",
      "Didn't eat all day")
  ) +
  labs(
    x = "Percent",
    y = "Survey dates",
    title = "Food insecurity by survey round"
  ) +
  guides(color = guide_legend(ncol = 2)) +
  theme(legend.position = c(0.5, 0.8)) 

ggsave(here("figures", "food_insecurity_by_survey_round_8_questions.pdf"), width = 8, height = 6, units = "in")


# Cumulative food insecurity outcomes 

lockdowns <- tribble(
  ~start, ~end,
  ymd("2020-03-30"), ymd("2020-05-25"),
  ymd("2021-06-18"), ymd("2021-08-02")
)


gg_national_level <- national_level %>% 
  filter(str_detect(type, "insecure_")) %>%
  # remove food_ from variable 
  mutate(type = str_remove(type, "insecure_")) %>% 
  # make type a factor and specify order
  mutate(
    type = factor(
      type, 
      levels = c("any", "moderate", "severe")
    )
  )%>%
  ggplot(
    aes(
      x = value, ymin = first_date, ymax = last_date, 
      color = type,
      shape = type
      )
    ) +
  geom_linerange(linewidth = 1.5) +
  geom_point(aes(y = first_date, shape = type), size = 2.5) +
  geom_point(aes(y = last_date, shape = type), size = 2.5) +
  scale_colour_manual(
    values = color_palette,
    labels = c(
      "Any food insecurity",
      "Moderate or severe food insecurity",
      "Severe food insecurity")
  ) +
  scale_shape_manual(
    values = c(16, 17, 15),
    labels = c(
      "Any food insecurity",
      "Moderate or severe food insecurity",
      "Severe food insecurity")
  ) + # Circle, triangle, square
  coord_flip(xlim = c(0, 100), expand = FALSE) +
  scale_y_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) +
  labs(
    x = "Percent",
    y = "Survey dates"
  ) +
  guides(color = guide_legend(nrow = 1), shape = guide_legend(nrow = 1)) +
  theme(
    legend.position = "top", 
    legend.direction = "horizontal",
    legend.text = element_text(size = 11)
    ) +
  # Grumble, grumble - have to specify this as it would be *before* the coord_flip!
  annotate("rect",
           ymin = lockdowns$start[1],
           ymax = lockdowns$end[1],
           xmin = -Inf, xmax = Inf, alpha = 0.4) +
  annotate("rect",
           ymin = lockdowns$start[2],
           ymax = lockdowns$end[2],
           xmin = -Inf, xmax = Inf, alpha = 0.4) 

gg_national_level

ggsave(here("figures", "food_insecurity_by_survey_round_3_levels.tiff"), width = 8, height = 7, units = "in")

gg_national_level +
  labs(
    caption = "*Source:* Authors’ analysis based on data from the Uganda High-Frequency Phone Survey, Rounds 1-7.<br>*Note:* Severe lockdowns shaded in grey. Lines cover start date to end date of each survey round."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "food_insecurity_by_survey_round_3_levels.pdf"), width = 8, height = 7, units = "in")


# Regional-level food security and interview dates by round ----

regional_level <- read_rds(here("data", "base.rds")) %>% 
  select(region, survey, interview_date, starts_with(c("food", "insecure"))) %>% 
  select(-insecure_sum) %>% 
  group_by(region, survey) %>% 
  summarise(
    first_date = min(interview_date),
    last_date = max(interview_date),
    # find average across all variables that begin with food
    across(starts_with(c("food", "insecure")), \(x) mean(x, na.rm = TRUE) * 100)
  )  %>% 
  # Pivot longer over all variables that begin with food
  pivot_longer(-c(region, survey, first_date, last_date), names_to = "type", values_to = "value") 

# Cumulative food insecurity outcomes 
gg_region_level <- regional_level %>% 
  filter(str_detect(type, "insecure_")) %>%
  # remove food_ from variable 
  mutate(type = str_remove(type, "insecure_")) %>% 
  # make type a factor and specify order
  mutate(
    type = factor(
      type, 
      levels = c("any", "moderate", "severe")
    )
  )%>%
  ggplot(
    aes(
      x = value, 
      color = type,
      shape = type
      )
    ) +
  geom_linerange(aes(ymin = first_date, ymax = last_date), linewidth = 1.5) +
  geom_point(aes(y = first_date, shape = type), size = 2.5) +
  geom_point(aes(y = last_date, shape = type), size = 2.5) +
  scale_colour_manual(
    values = color_palette,
    labels = c(
      "Any food insecurity",
      "Moderate or severe food insecurity",
      "Severe food insecurity")
  ) +
  scale_shape_manual(
    values = c(16, 17, 15),
    labels = c(
      "Any food insecurity",
      "Moderate or severe food insecurity",
      "Severe food insecurity")
  ) + # Circle, triangle, square
  coord_flip(xlim = c(0, 100), expand = FALSE) +
  scale_y_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) +
  labs(
    x = "Percent",
    y = "Survey dates"
  ) +
  guides(color = guide_legend(nrow = 1), shape = guide_legend(nrow = 1)) +
  theme(
    legend.position = "top", 
    legend.direction = "horizontal",
    legend.text = element_text(size = 11),
    strip.text = element_text(size = 11)
    ) +
  # Grumble, grumble - have to specify this as it would be *before* the coord_flip!
  annotate("rect",
           ymin = lockdowns$start[1],
           ymax = lockdowns$end[1],
           xmin = -Inf, xmax = Inf, alpha = 0.4) +
  annotate("rect",
           ymin = lockdowns$start[2],
           ymax = lockdowns$end[2],
           xmin = -Inf, xmax = Inf, alpha = 0.4) +
  facet_wrap(~region, scales = "fixed", ncol = 1)

gg_region_level

ggsave(here("figures", "food_insecurity_by_region_survey_round_3_levels.tiff"), width = 8, height = 7.5, units = "in")

gg_region_level +
  labs(
    caption = "*Source:* Authors’ analysis based on data from the Uganda High-Frequency Phone Survey, Rounds 1-7.<br>
    *Note:* Severe lockdowns shaded in grey. Lines cover start date to end date of each survey round."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "food_insecurity_by_region_survey_round_3_levels.pdf"), width = 8, height = 7.5, units = "in")


