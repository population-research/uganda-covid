# Graph results on lockdowns and food insecurity

library(tidyverse)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(plm)       # For fixed effects
library(tidymodels) # For extracting model coefficients


# Load data
base <- read_rds(here("data", "base.rds")) %>% 
  mutate(
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7"))
  ) 

# extract all variable names from base that begins with "food"
food_vars <- base %>% 
  select(starts_with("insecure")) %>%
  select(-ends_with("sum")) %>%
  names()
  
# Run fixed effects model for each food insecurity variable
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
  #   # select(term, estimate, std.error, p.value) %>% 
  mutate(variable = .x) %>% 
  select(variable, everything())
)

# Plot the coefficients from fx
walk(fx, ~ {
  y_variable <- .x$variable[1]
  
  .x %>% 
    filter(term != "cases_smooth_per_100000") %>% 
    add_row(term = "survey4", estimate = 0, conf.low = 0, conf.high = 0) %>% 
    arrange(term) %>% 
    ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
    geom_pointrange() +
    labs(
      title = y_variable,
      x = "Survey",
      y = "Coefficient"
    ) +
    theme_minimal()
  
  ggsave(here("figures", paste0(y_variable, ".pdf")), width = 8, height = 6, units = "in")
}
)

# Estimate models using index_4 as the stringency measure
fx_index_4 <- map(
  food_vars, 
  ~ plm(as.formula(paste0(.x, " ~ index_4 + cases_smooth_per_100000")), 
        data = base, 
        index = c("hhid", "survey"), 
        model = "within",
        effect = "individual",
        # weighting using weight_final
        weights = weight_final
  ) %>% 
    tidy(conf.int = TRUE) %>% 
  #   # select(term, estimate, std.error, p.value) %>% 
  mutate(variable = .x) %>% 
  select(variable, everything())
)

test <- plm(insecure_moderate ~ index_4 + cases_smooth_per_100000, 
    data = base, 
    index = c("hhid", "survey"), 
    model = "within",
    effect = "individual",
    # weighting using weight_final
    weights = weight_final
)

test_data <- base %>% 
  select(insecure_moderate, index_4, cases_smooth_per_100000, survey) %>%
  group_by(survey) %>% 
  summarise(across(everything(), mean))

predicted <- test_data %>% 
  mutate(
   prediction = predict(test, newdata = test_data, interval = "confidence")
  )

# Estimate models using residential mobility measure
res_test <- plm(insecure_moderate ~ residential_pre_01_30 + cases_smooth_per_100000, 
    data = base, 
    index = c("hhid", "survey"), 
    model = "within",
    effect = "individual",
    # weighting using weight_final
    weights = weight_final
)
summary(res_test)

res_test_data <- base %>% 
  select(insecure_moderate, residential_pre_01_30, cases_smooth_per_100000, survey) %>%
  group_by(survey) %>% 
  summarise(across(everything(), mean))

res_predicted <- res_test_data %>%
  mutate(
    prediction = predict(res_test, newdata = res_test_data, interval = "confidence")
  )
