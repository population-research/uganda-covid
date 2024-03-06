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
library(fixest) # For fixed effects
library(tidymodels) # For extracting model coefficients
library(patchwork) # For plotting


# Functions
rename_to_lower_snake <- function(df) {
  df %>%
    rename_with(~ gsub("([a-z])([A-Z])", "\\1_\\2", .x)) %>% # Adds _ to camel case var names
    rename_with(~ tolower(gsub("[ /-]+", "_", .x))) # Converts to lower and substitutes _ for spaces and /
}

months_in_order <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                     "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

# Graph theme changes ----
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


# http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
color_palette <- c("black", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# Load base data ----
base <- read_rds(here("data", "base.rds")) %>% 
  mutate(
    survey_num = survey,
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7")),
  ) 

# extract all variable names from base that begins with "food"
food_vars <- base %>% 
  select(starts_with("insecure")) %>%
  select(-ends_with("sum")) %>%
  names()


# Load food security question from UNPS ----

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


# Try to plot the base data

base_ranout <- base %>% 
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

base_hungry <- base %>% 
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


base_all_day <- base %>% 
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


# Appendix results - comparing lean seasons: R1, R2 vs R6 and R4 vs R7 ----

rounds_1_2_6 <- base %>% 
  filter(survey_num %in% c(1, 2, 6)) %>%
  mutate(
   survey = fct_relevel(survey, "6") 
  )

results_rounds_1_2_6 <- map(
  food_vars, 
  ~ feols(as.formula(paste0(.x, " ~ survey + cases_smooth_per_100000 | hhid")),
          data = rounds_1_2_6,
          cluster = ~ psu,
          weights = ~ weight_final
  ) %>% 
    tidy(conf.int = TRUE) %>% 
    # select(term, estimate, std.error, p.value) %>%
    filter(term != "cases_smooth_per_100000") %>% 
    add_row(term = "survey3", estimate = NA, conf.low = NA, conf.high = NA) %>%
    add_row(term = "survey4", estimate = NA, conf.low = NA, conf.high = NA) %>%
    add_row(term = "survey5", estimate = NA, conf.low = NA, conf.high = NA) %>%
    add_row(term = "survey7", estimate = NA, conf.low = NA, conf.high = NA) %>%
    add_row(term = "survey6", estimate = 0, conf.low = 0, conf.high = 0) %>% 
    arrange(term) %>% 
    mutate(variable = .x) %>% 
    select(variable, everything())
)

# Make into one data frame and combine graphs
plot_1_2_6 <- list_rbind(results_rounds_1_2_6) %>% 
  mutate(
    term = str_remove(term, "survey"),
    variable = str_to_title(str_remove(variable, "insecure_"))
  ) %>% 
  ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange() +
  labs(
    x = "Survey",
    y = "Coefficient"
  ) +
  coord_cartesian(ylim = c(-0.1, 0.3), expand = TRUE) +
  scale_y_continuous(breaks = c(0, 0.1, 0.2, 0.3)) +
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~variable, scales = "fixed", ncol = 1) 


rounds_4_7 <- base %>% 
  filter(survey_num %in% c(4, 7)) 

results_rounds_4_7 <- map(
  food_vars, 
  ~ feols(as.formula(paste0(.x, " ~ survey + cases_smooth_per_100000 | hhid")),
          data = rounds_4_7,
          cluster = ~ psu,
          weights = ~ weight_final
  ) %>% 
    tidy(conf.int = TRUE) %>% 
    # select(term, estimate, std.error, p.value) %>%
    filter(term != "cases_smooth_per_100000") %>% 
    add_row(term = "survey1", estimate = NA, conf.low = NA, conf.high = NA) %>%
    add_row(term = "survey2", estimate = NA, conf.low = NA, conf.high = NA) %>%
    add_row(term = "survey3", estimate = NA, conf.low = NA, conf.high = NA) %>%
    add_row(term = "survey5", estimate = NA, conf.low = NA, conf.high = NA) %>%
    add_row(term = "survey6", estimate = NA, conf.low = NA, conf.high = NA) %>%
    add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
    arrange(term) %>% 
    mutate(variable = .x) %>% 
    select(variable, everything())
)

# Make into one data frame and combine graphs
plot_4_7 <- list_rbind(results_rounds_4_7) %>% 
  mutate(
    term = str_remove(term, "survey"),
    variable = str_to_title(str_remove(variable, "insecure_"))
  ) %>% 
  ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange() +
  labs(
    x = "Survey",
    y = "Coefficient"
  ) +
  coord_cartesian(ylim = c(-0.1, 0.3), expand = TRUE) +
  scale_y_continuous(breaks = c(0, 0.1, 0.2, 0.3)) +
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~variable, scales = "fixed", ncol = 1) 

plot_1_2_6 / plot_4_7

ggsave(here("figures", "seasonality_comparison.pdf"),
       width = 8, height = 8, units = "in")



*************************************************************************************************************************************************************************
* Appendix tables - Food insecurity in urban areas
*************************************************************************************************************************************************************************
xtreg anyfood_insec lockdown lockdown_2 lockdown_3 `controls' `wt' if urban==1, fe 
outreg2 using "`output'\Est1.xml", e(N df_m F r2) excel replace dec(3) 

foreach i in food_insufficient_worry food_healthy_lack food_few_kinds food_skipped_meal food_less_than_expected food_ranout food_hungry food_didnt_eat_all_day {
	xtreg `i' lockdown lockdown_2 lockdown_3  `controls' `wt' if urban==1, fe    
	outreg2 using "`output'\Est1.xml", e(N df_m F r2) excel append dec(3)
}







