# Agricultural household response to lockdowns

library(tidyverse)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(fixest)    # For fixed effects
library(tidymodels) # For extracting model coefficients
library(patchwork) # For plotting
library(haven)     # For zapping labels
library(xtable)    # For table output

# Graph theme set-up ----
theme_uft <- theme_classic() +
  theme(
    axis.text = element_text(
      colour = "black"
    ),
    legend.title = element_blank(),
    legend.key.width = unit(1, "cm"),
    strip.background = element_blank(),
    panel.grid.major.y = element_line(
      color = "lightgray",
      linewidth = 0.5
    )
  )

theme_set(theme_uft)

# http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
color_palette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")



# Load data ----
base <- read_rds(here("data", "base.rds")) %>% 
  zap_labels() %>% 
  mutate(
    survey_num = survey
  ) %>%   
  mutate(
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7")),
  ) 


# Correcting agricultural variables ----

base <- base %>%
  mutate(ag_crops_plant = case_when(
    ag_crops_plant %in% c(2, 3) ~ 0, # Both 2 and 3 represent no
    survey %in% c(2, 4, 5, 6) ~ NA_real_,  # For R2 R4 R6, numbers from prior round preloaded, and the number of yes goes down by 9 or 10
    TRUE ~ ag_crops_plant
  ))

#  Planting question asked in R1,4,7. For R5, prior rnd resp used. Harvesting question in R2. No question in R3 and 6
base <- base %>%
  mutate(ag_plant_change = case_when(
    survey %in% c(2, 5) ~ NA_real_,
    ag_plant_change %in% c(2, 3) ~ 0, # Both 2 and 3 represent no
    TRUE ~ ag_plant_change
  ))

variables <- c("ag_plant_what_abandoned", "ag_plant_what_area_reduce", 
               "ag_plant_what_area_increase", "ag_plant_what_fast_crops", 
               "ag_plant_what_less_variety", "ag_plant_what_more_variety", 
               "ag_plant_what_delayed")

base <- base %>%
  mutate(across(all_of(variables), ~case_when(
    survey %in% c(2, 3, 5, 6) ~ NA_real_, # These questions were not asked for these rounds
    !is.na(ag_plant_change) & is.na(.) ~ 0, # If there is a change in ag planting, but missing value for the specific strategy, then the dummy should be 0
    TRUE ~ .
  )))

variables_2 <- c("ag_farm_products_sell_need", "ag_farm_products_sell_able", "work_for_pay")

base <- base %>%
  mutate(across(all_of(variables_2), ~case_when(
    . %in% c(2) ~ 0, # 2 rep No
    TRUE ~ .
  )))

# Estimations ----

feols(ag_plant_change ~ survey + cases_smooth_per_100000 | hhid,
          data = base,
          cluster = ~ psu,
          weights = ~ weight_final
  ) %>% 
  tidy(conf.int = TRUE) %>% 
  # select(term, estimate, std.error, p.value) %>%
  filter(term != "cases_smooth_per_100000") %>% 
  add_row(term = "survey2", estimate = NA, conf.low = NA, conf.high = NA) %>%
  add_row(term = "survey3", estimate = NA, conf.low = NA, conf.high = NA) %>%
  add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
  add_row(term = "survey5", estimate = NA, conf.low = NA, conf.high = NA) %>%
  add_row(term = "survey6", estimate = NA, conf.low = NA, conf.high = NA) %>% 
  arrange(term) %>% 
  mutate(
    term = str_remove(term, "survey"),
  ) %>% 
  ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  # Make 0 line more prominent
  geom_hline(yintercept = 0, color = color_palette[1]) +
  geom_pointrange() +
  labs(
    x = "Survey",
    y = "Coefficient"
  )

ggsave(here("figures", "ag_plant_change.pdf"),
       width = 8, height = 2, units = "in")


# Generate tables of means by survey ----

ag_changes <- base %>%
  filter(survey %in% c(1, 4, 7)) %>%
  mutate(
    survey = fct_relevel(survey, "4", after = 1)
  ) %>% 
  select(survey, 
         weight_final,
         ag_plant_change, 
         ag_plant_what_area_reduce, 
         ag_plant_what_area_increase,  
         ag_plant_what_less_variety, 
         ag_plant_what_more_variety,
         ag_plant_what_delayed,
         ag_plant_what_fast_crops,
         ag_plant_what_abandoned) %>% 
  pivot_longer(cols = -c(survey, weight_final), names_to = "variable", values_to = "value") %>%
  # Manually set the order
  mutate(variable = factor(variable, levels = c(
    "ag_plant_change", 
    "ag_plant_what_area_reduce", 
    "ag_plant_what_area_increase",  
    "ag_plant_what_less_variety", 
    "ag_plant_what_more_variety",
    "ag_plant_what_delayed",
    "ag_plant_what_fast_crops",
    "ag_plant_what_abandoned"))) %>% 
  group_by(survey, variable) %>%
  summarize(average = weighted.mean(value, weight_final, na.rm = TRUE)*100, .groups = 'drop') %>%
  # summarize(average = mean(value, na.rm = TRUE)*100, .groups = 'drop') %>%
  pivot_wider(names_from = survey, values_from = average) %>% 
  arrange(variable) %>% 
  # Fix NA values
  mutate(across(c(2:4), ~ifelse(is.na(.), 0, .))) %>%
  # Prettier labels
  mutate(variable = fct_recode(
    variable,
    "Change planting because of COVID-19" = "ag_plant_change",
    "Reduced farm area" = "ag_plant_what_area_reduce",
    "Increased farm area" = "ag_plant_what_area_increase",
    "Planted less variety/number of crops" = "ag_plant_what_less_variety",
    "Planted more variety/number of crops" = "ag_plant_what_more_variety",
    "Delayed planting" = "ag_plant_what_delayed",
    "Planted crops that mature quickly" = "ag_plant_what_fast_crops",
    "Abandoned crop farming" = "ag_plant_what_abandoned"
  )) 
  

# Turn into a latex table with variables as rows and surveys as columns

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
    "\\caption{Average changes in                               
  agricultural strategy                                      
  because of COVID-19 (in                                    
  percentages)}\n",
    "\\label{tab:ag_changes}\n",
    "\\begin{tabular}{@{} l rrr @{}}\n",
    "\\toprule \n",
    "        & \\multicolumn{3}{c}{Survey Round} \\\\ \\cmidrule(lr){2-4} \n",
    "        & \\multicolumn{1}{c}{1} & \\multicolumn{1}{c}{4}  & \\multicolumn{1}{c}{7} \\\\ \n",
    "\\midrule \n"
  ),
  file = here("tables", "ag_change_table.tex")
)

ag_changes %>%
  mutate(across(c("1", "4", "7"), ~sprintf("%.1f\\%%", .))) %>% 
  xtable() %>%
  print(
    file = here("tables", "ag_change_table.tex"), append = TRUE,
    only.contents = TRUE, comment = FALSE,
    include.rownames = FALSE, include.colnames = FALSE,
    hline.after = NULL,
    # Show one digit after the decimal point
    format.args = list(big.mark = ","),
    sanitize.text.function = identity # necessary to prevent xtable from messing up LaTeX code
  )

# Table end
cat(
  c(
    "\\bottomrule\n",
    "\\end{tabular}\n",
    "\\begin{tablenotes}\n",
    "\\item \\hspace*{-0.5em} \\textbf{Note:} \n",
    "Questions on crop planting activities are only asked in rounds 1, 4, and 7.",
    "\\end{tablenotes}\n",
    "\\end{threeparttable}\n",
    "\\end{small}\n",
    "\\end{center}\n",
    "\\end{table}"
  ),
  file = here("tables", "ag_change_table.tex"),
  append = TRUE
)


  
  

