# Attrition bounding exercise

library(tidyverse)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(plm)       # For fixed effects
library(tidymodels) # For extracting model coefficients
library(cowplot)
library(xtable)

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


# Load data ----
base <- read_rds(here("data", "base.rds")) %>% 
  select(-ends_with("sum"))
# Hold off on transforming survey to factor to make it easier to generate the
# last_survey variable

# extract all variable names from base that begins with "insecure"
food_vars <- base %>% 
  select(starts_with("insecure")) %>%
  select(-ends_with("sum")) %>%
  names()


# By round, show the number of households for whom that is the last round
# observed
base %>% 
  arrange(hhid, survey) %>% 
  group_by(hhid) %>% 
  mutate(
    last_survey = max(survey)
  ) %>%
  # keep one row per household
  slice_head() %>%
  ungroup() %>% 
  tabyl(last_survey)

# Table of attrition

attrition <- base %>% 
  arrange(hhid, survey) %>% 
  # For each household, first find the first survey the household is observed in
  # and then the last survey the household is observed in.
  group_by(hhid) %>%
  mutate(
    first_survey = min(survey),
    last_survey = max(survey)
  ) %>%
  ungroup() %>% 
  mutate(
    surviving_hh = if_else(first_survey == 1, 1, 0),
    new_hh = if_else(first_survey == survey & first_survey != 1, 1, 0)
  ) %>% 
  group_by(survey) %>%
  summarise(
    n_surviving_hh = sum(surviving_hh),
    n_new_hh = sum(new_hh),
    total_hh = n()
  )
  
# Turn attrition into a latex table with variables as rows and surveys as columns

# Make LaTeX table - I am picky about how they look,
# so use my own preamble rather than xtable's.
# xtable does not allow 'align' other than a small
# set of options, so no @{} or D{.}{.}{3.2} for example
cat(
  c(
    "\\begin{table}[hbtp!]\n",
    "\\begin{center}\n",
    "\\begin{small}\n",
    "\\begin{threeparttable}\n",
    "\\caption{Number of Original and New Households by Survey Round}\n",
    "\\label{tab:surveys}\n",
    "\\begin{tabular}{@{} l rrrrrrr @{}}\n",
    "\\toprule \n",
    "        & \\multicolumn{7}{c}{Survey Round} \\\\ \\cmidrule(lr){2-8} \n",
    "        & 1 & 2 & 3 & 4 & 5 & 6 & 7 \\\\ \n",
    "\\midrule \n"
  ),
  file = here("tables", "survey_table.tex")
)

attrition %>% 
  pivot_longer(cols = c(n_surviving_hh, n_new_hh, total_hh)) %>% 
  pivot_wider(names_from = survey, values_from = value) %>% 
  mutate(across(where(is.numeric), ~ as.integer(round(.x)))) %>% 
  mutate(
    name = case_when(
      name == "n_surviving_hh" ~ "Original Households",
      name == "n_new_hh" ~ "New Households in Round",
      name == "total_hh" ~ "Total Households Surveyed"
    ),
    `1` = if_else(name == "New Households", NA, `1`)
  ) %>%
  xtable() %>%
  print(
    file = here("tables", "survey_table.tex"), append = TRUE,
    only.contents = TRUE, comment = FALSE,
    include.rownames = FALSE, include.colnames = FALSE,
    hline.after = NULL,
    format.args = list(big.mark = ","),
    sanitize.text.function = identity # necessary to prevent xtable from messing up LaTeX code
  )
  
# Table end
cat(
  c(
    "\\bottomrule\n",
    "\\end{tabular}\n",
    "\\end{threeparttable}\n",
    "\\end{small}\n",
    "\\end{center}\n",
    "\\end{table}"
  ),
  file = here("tables", "survey_table.tex"),
  append = TRUE
)


# Data transformations ----

# Goal: Create a data frame with all households observed in each survey round from the
# first round their are observed up to survey 7

base <- base %>% 
  arrange(hhid, survey) %>% 
  # For each household, first find the first survey the household is observed in
  # and then the last survey the household is observed in.
  group_by(hhid) %>%
  mutate(
    first_survey = min(survey),
    last_survey = max(survey)
  ) %>%
  ungroup() %>%
  # Add missing rows for 1-7 survey rounds for each household
  complete(hhid, survey) %>% 
  # Drop rows for surveys before the household is first observed; fill did not
  # work as intended, so use the originally observed values for first and last
  # survey
  group_by(hhid) %>%
  mutate(
    first_survey = min(first_survey, na.rm = TRUE),
    last_survey = max(last_survey, na.rm = TRUE)
  ) %>% 
  filter(survey >= first_survey) %>%
  # Create factor for surveys, lockdown dummies, and household not observed
  mutate(
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7"))
  ) 

# Things to address:
# - There are no survey dates for missing households
# - The missing COVID-19 cases data is not included; use average within rounds since no survey date is available
# - There are no weights for missing households; use average within survey round
base <- base %>% 
  # Calculate average weights and COVID-19 cases per 100,000 people within each survey round
  group_by(survey) %>% 
  mutate(
    avg_cases_smooth_per_100000 = mean(cases_smooth_per_100000, na.rm = TRUE),
    avg_weights = mean(weight_final, na.rm = TRUE)
  ) %>% 
  ungroup() %>%
  # Substitute in average weights and COVID-19 cases per 100,000 people within each survey round if missing
  mutate(
    cases_smooth_per_100000 = if_else(is.na(cases_smooth_per_100000), avg_cases_smooth_per_100000, cases_smooth_per_100000),
    weight_final = if_else(is.na(weight_final), avg_weights, weight_final)
  ) 

# Estimations ----

# Check that we get same results when not filling in missing insecure variables
fx <- map(
  food_vars, 
  ~ plm(as.formula(paste0(.x, " ~ survey + cases_smooth_per_100000")), 
        data = base, 
        index = c("hhid", "survey"), 
        model = "within",
        effect = "individual",
        # weighting using weight_final
        weights = weight_final
  ) %>% 
    tidy(conf.int = TRUE) %>% 
    # select(term, estimate, std.error, p.value) %>%
    filter(term != "cases_smooth_per_100000") %>% 
    add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
    arrange(term) %>% 
    mutate(variable = .x) %>% 
    select(variable, everything())
)

# Make fx into one data frame and combine graphs
list_rbind(fx) %>% 
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
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~variable, scales = "fixed", ncol = 1) 

# ggsave(here("figures", "test_food_insecurity_survey.pdf"), width = 8, height = 6, units = "in")


# Change all missing food variables to zero; Missing households are *NOT* food insecure ----
base_0 <- base %>% 
  mutate(
    across(starts_with("insecure"), ~ if_else(is.na(.x), 0, .x))
  ) 

fx_0 <- map(
  food_vars, 
  ~ plm(as.formula(paste0(.x, " ~ survey + cases_smooth_per_100000")), 
        data = base_0, 
        index = c("hhid", "survey"), 
        model = "within",
        effect = "individual",
        # weighting using weight_final
        weights = weight_final
  ) %>% 
    tidy(conf.int = TRUE) %>% 
    # select(term, estimate, std.error, p.value) %>%
    filter(term != "cases_smooth_per_100000") %>% 
    add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
    arrange(term) %>% 
    mutate(variable = .x) %>% 
    select(variable, everything())
)

# Make fx into one data frame and combine graphs
list_rbind(fx_0) %>% 
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
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~variable, scales = "fixed", ncol = 1) 

ggsave(here("figures", "food_insecurity_survey_attrition_0.pdf"), width = 8, height = 6, units = "in")


# Change all missing food variables to one; missing households *ARE* food insecure ----
base_1 <- base %>% 
  mutate(
    across(starts_with("insecure"), ~ if_else(is.na(.x), 1, .x))
  ) 

fx_1 <- map(
  food_vars, 
  ~ plm(as.formula(paste0(.x, " ~ survey + cases_smooth_per_100000")), 
        data = base_1, 
        index = c("hhid", "survey"), 
        model = "within",
        effect = "individual",
        # weighting using weight_final
        weights = weight_final
  ) %>% 
    tidy(conf.int = TRUE) %>% 
    # select(term, estimate, std.error, p.value) %>%
    filter(term != "cases_smooth_per_100000") %>% 
    add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
    arrange(term) %>% 
    mutate(variable = .x) %>% 
    select(variable, everything())
)

# Make fx into one data frame and combine graphs
list_rbind(fx_1) %>% 
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
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~variable, scales = "fixed", ncol = 1) 

ggsave(here("figures", "food_insecurity_survey_attrition_1.pdf"), width = 8, height = 6, units = "in")

# Combine fx_0 and fx_1 into one data frame

org_fx <- list_rbind(fx) %>% 
  mutate(
    term = str_remove(term, "survey"),
    variable = str_to_title(str_remove(variable, "insecure_")),
    attrition = "Original"
  )

new_fx_0 <- list_rbind(fx_0) %>% 
  mutate(
    term = str_remove(term, "survey"),
    variable = str_to_title(str_remove(variable, "insecure_")),
    attrition = "Assume attrited food secure"
  )

new_fx_1 <- list_rbind(fx_1) %>% 
  mutate(
    term = str_remove(term, "survey"),
    variable = str_to_title(str_remove(variable, "insecure_")),
    attrition = "Assume attrited food insecure"
  )

org_fx %>%
  bind_rows(new_fx_0) %>%
  bind_rows(new_fx_1) %>% 
  mutate(
    attrition = factor(attrition, levels = c("Original", "Assume attrited food secure", "Assume attrited food insecure"))
  ) %>% 
  ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high, color = factor(attrition))) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange(position = position_dodge(width = 0.30)) +
  labs(
    x = "Survey",
    y = "Coefficient"
  ) +
  scale_color_manual(values = c("black", color_palette[2], color_palette[3]) ) +
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~variable, scales = "fixed", ncol = 1) +
  theme(legend.position = c(0.5, 0.92)) 

ggsave(here("figures", "food_insecurity_survey_attrition_combined.pdf"), width = 8, height = 6, units = "in")


