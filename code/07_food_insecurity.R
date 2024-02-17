# food insecurity estimations

library(tidyverse)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(plm)       # For fixed effects
library(tidymodels) # For extracting model coefficients


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
  mutate(
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7")),
  ) 

# extract all variable names from base that begins with "food"
food_vars <- base %>% 
  select(starts_with("insecure")) %>%
  select(-ends_with("sum")) %>%
  names()

# Basic fixed effects model for each food insecurity variable ----
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

# # Plot the coefficients from fx
# walk(fx, ~ {
#   y_variable <- .x$variable[1]
#   
#   .x %>% 
#     ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
#     geom_pointrange() +
#     labs(
#       title = y_variable,
#       x = "Survey",
#       y = "Coefficient"
#     ) +
#     scale_y_continuous(limits = c(-0.1, 0.3))
#   
#   ggsave(here("figures", paste0(y_variable, ".pdf")), width = 8, height = 6, units = "in")
# }
# )

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

ggsave(here("figures", "food_insecurity_survey.pdf"), width = 8, height = 6, units = "in")


# Regional variation in food insecurity ----

# Run on each region separately
fx_regions <- base %>% 
  nest(.by = region) %>%
  mutate(
    regional_result = map(data, function(df) { 
      map(
        food_vars, 
        ~ plm(as.formula(paste0(.x, " ~ survey ")), 
              data = df, 
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
      ) %>% 
        list_rbind()
    })
  ) %>% 
  select(region, regional_result) %>% 
  unnest(cols = regional_result)

# Produce graphs
fx_regions %>% 
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
  facet_grid(vars(region), vars(variable), scales = "fixed")

ggsave(here("figures", "food_insecurity_region.pdf"), width = 8, height = 10, units = "in")      
