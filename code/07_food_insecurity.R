# food insecurity estimations

library(tidyverse)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(fixest)       # For fixed effects
library(tidymodels) # For extracting model coefficients
library(ggtext)


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
  ~ feols(as.formula(paste0(.x, " ~ survey + cases_smooth_per_100000 | hhid")),
          data = base,
          cluster = ~ psu,
          weights = ~ weight_final
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
gg_food_insecurity <- list_rbind(fx) %>% 
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
  scale_y_continuous(breaks = c(0, 0.1, 0.2, 0.3)) +
  # Combining the graphs from food_insecurity_graphs
  facet_wrap(~variable, scales = "fixed", ncol = 1) +  
  theme(
    strip.text = element_text(size = 11) # Make labels slightly bigger
  )


gg_food_insecurity

ggsave(here("figures", "food_insecurity_survey.tiff"), width = 8, height = 6, units = "in")


gg_food_insecurity +
  labs(
    caption = "*Source:* Authors’ analysis based on data from the Uganda High-Frequency Phone Survey, Rounds 1-7.<br>
    *Note:* Household fixed effects estimates relative to Round 4."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )

ggsave(here("figures", "food_insecurity_survey.pdf"), width = 8, height = 6, units = "in")


# Regional variation in food insecurity ----

# Run on each region separately
fx_regions <- base %>% 
  nest(.by = region) %>%
  mutate(
    regional_result = map(data, function(df) { 
      map(
        food_vars, 
        ~ feols(as.formula(paste0(.x, " ~ survey | hhid ")), 
              data = df, 
              cluster = ~ psu,
              weights = ~ weight_final
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
gg_fx_regions <- fx_regions %>% 
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
  scale_y_continuous(breaks = c(0, 0.1, 0.2, 0.3, 0.4)) +
  facet_grid(vars(variable), vars(region), scales = "fixed") +
  theme(
    strip.text = element_text(size = 11) # Make labels slightly bigger
  )

gg_fx_regions

ggsave(here("figures", "food_insecurity_region.tiff"), width = 8, height = 8, units = "in")

gg_fx_regions +
  labs(
    caption = "*Source:* Authors’ analysis based on data from the Uganda High-Frequency Phone Survey, Rounds 1-7.<br>
    *Note:* Household fixed effects estimates relative to Round 4 with each region treated as a separate sample."
  ) +
  theme(
    plot.caption = element_markdown(hjust = 0, size = 10, lineheight = 1.5)
  )


ggsave(here("figures", "food_insecurity_region.pdf"), width = 8, height = 8, units = "in")      
