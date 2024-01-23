# Plot food insecurity outcomes by survey round

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

# http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
color_palette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

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
                                      linewidth = 0.5)
  )

theme_set(theme_uft)

# Interview dates by round ----

base <- read_rds(here("data", "base.rds")) %>% 
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


# Plot ----

# Individual food insecurity outcomes
base %>% 
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


# Cumulative food insecurity outcomes
base %>% 
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
  ggplot(aes(x = value, color = type)) +
  geom_linerange(aes(ymin = first_date, ymax = last_date), linewidth = 2) +
  coord_flip(xlim = c(0, 100), expand = FALSE) +
  scale_y_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) +
  scale_colour_manual(
    values = color_palette,
    labels = c(
      "Any food insecurity",
      "Moderate or severe food insecurity",
      "Severe food insecurity")
  ) +
  labs(
    x = "Percent",
    y = "Survey dates",
    title = "Food insecurity by survey round"
  ) +
  guides(color = guide_legend(ncol = 2)) +
  theme(legend.position = c(0.5, 0.8)) 


  
  
  
  


