# Food security from UNPS 2019/2020

library(tidyverse)
library(haven)
library(here)
library(janitor) # For data checking
library(vtable) # For data checking
library(labelled) # For data checking
library(glue)
library(lubridate)
library(clock)

# Functions
rename_to_lower_snake <- function(df) {
  df %>%
    rename_with(~ gsub("([a-z])([A-Z])", "\\1_\\2", .x)) %>% # Adds _ to camel case var names
    rename_with(~ tolower(gsub("[ /-]+", "_", .x))) # Converts to lower and substitutes _ for spaces and /
}

months_in_order <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                     "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

# http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
color_palette <- c("black", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


# Load food security question

food_19 <- read_dta(here("raw_data", "panel_19_20", "HH", "gsec17_1.dta")) %>% 
  rename_to_lower_snake() %>% 
  select(starts_with("s17q10")) %>% 
  rename(
     Jan = s17q10a,
     Feb = s17q10b,
     Mar = s17q10c,
     Apr = s17q10d,
     May = s17q10e,
     Jun = s17q10f,
     Jul = s17q10g,
     Aug = s17q10h,
     Sep = s17q10i,
     Oct = s17q10j,
     Nov = s17q10k,
     Dec = s17q10l
  ) %>% pivot_longer(cols = Jan:Dec, names_to = "month", values_to = "value") %>% 
  group_by(month) %>%
  summarise(
    total_19 = sum(value, na.rm = TRUE),
    n_19 = n()
    ) %>% 
  # Reorder the month column in the data frame
  mutate(
    month = factor(month, levels = months_in_order)
  ) %>% 
  arrange(month)



# 2015-16 panel already in long format
count_15 <- read_dta(here("raw_data", "panel_15_16", "gsec17_1.dta")) %>% 
  n_distinct(.$hhid)

food_15 <- read_dta(here("raw_data", "panel_15_16", "gsec17_2.dta")) %>% 
  rename_to_lower_snake() %>% 
  rename(
    month = h17q10b
  ) %>% 
  mutate(
    value = case_when(
      h17q10a == 1 ~ 1,
      h17q10a == 2 ~ 0
    )
  ) %>% 
  select(month, value) %>% 
  group_by(month) %>%
  summarise(
    total_15 = sum(value, na.rm = TRUE),
    n_15 = count_15
  ) %>% 
  mutate(
    month = factor(month.abb[month], levels = months_in_order)
  )

# Combine and graph

food <- inner_join(food_15, food_19, by = join_by(month)) %>% 
  mutate(
    total = total_15 + total_19,
    n = n_15 + n_19,
    percent = total/n * 100
  ) 


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



# Try to plot the base data

base_ranout <- read_rds(here("data", "base.rds")) %>% 
  select(interview_date, starts_with("food")) %>% 
  mutate(
    month = month(interview_date),
    year = year(interview_date),
    value = case_when(
      food_ranout == 1 ~ 1,
      food_ranout == 2 ~ 0
    ),
    month = case_when(
      month == 11 & year == 2021 ~ 10,
      TRUE ~ month
    )
  ) %>% 
  group_by(month, year) %>% 
  summarise(
    total_base = sum(value, na.rm = TRUE),
    n_base = n()
  ) %>% 
  mutate(
    date = date_build(year, month),
    percent = total_base/n_base * 100,
    var = "UHFS - Ran out of food"
  ) %>% 
  select(date, percent, var)

base_hungry <- read_rds(here("data", "base.rds")) %>% 
  select(interview_date, starts_with("food")) %>% 
  mutate(
    month = month(interview_date),
    year = year(interview_date),
    value = case_when(
      food_hungry == 1 ~ 1,
      food_hungry == 2 ~ 0
    ),
    month = case_when(
      month == 11 & year == 2021 ~ 10,
      TRUE ~ month
    )
  ) %>% 
  group_by(month, year) %>% 
  summarise(
    total_base = sum(value, na.rm = TRUE),
    n_base = n()
  ) %>% 
  mutate(
    date = date_build(year, month),
    percent = total_base/n_base * 100,
    var = "UHFS - Went hungry"
  ) %>% 
  select(date, percent, var)


base_all_day <- read_rds(here("data", "base.rds")) %>% 
  select(interview_date, starts_with("food")) %>% 
  mutate(
    month = month(interview_date),
    year = year(interview_date),
    value = case_when(
      food_didnt_eat_all_day == 1 ~ 1,
      food_didnt_eat_all_day == 2 ~ 0
    ),
    month = case_when(
      month == 11 & year == 2021 ~ 10,
      TRUE ~ month
    )
  ) %>% 
  group_by(month, year) %>% 
  summarise(
    total_base = sum(value, na.rm = TRUE),
    n_base = n()
  ) %>% 
  mutate(
    date = date_build(year, month),
    percent = total_base/n_base * 100,
    var = "UHFS - Did not eat all day"
  ) %>% 
  select(date, percent, var)



combined <- food %>% 
  mutate(
    year = 2020
  ) %>% 
  bind_rows(food) %>% 
  mutate(
    year = case_when(
      !is.na(year) ~ year,
      TRUE ~ 2021
    ),
    date = date_build(year, as.numeric(month)),
    var = "UNPS - Not enough food (Pre-Covid)"
  ) %>% 
  select(date, percent, var) %>% 
  bind_rows(base_ranout) %>% 
  bind_rows(base_hungry) %>% 
  bind_rows(base_all_day)
  
  
ggplot(combined, aes(x = date)) +
  geom_point(aes(y = percent, color = fct_rev(factor(var))), size = 3) +
  coord_cartesian(ylim = c(0, 32), expand = FALSE) +
  theme(legend.position = c(0.5, 0.79)) +
  scale_colour_manual(values = color_palette) +
  ylab("Percent reported") +
  xlab("Month")

ggsave(here("figures", "seasonality.pdf"),
       width = 25, height = 19, units = "cm")







