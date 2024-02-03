# Compare fixed effects with OLS

library(tidyverse)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(plm)       # For fixed effects
library(tidymodels) # For extracting model coefficients
library(clubSandwich) # For robust standard errors


# Load data
base <- read_rds(here("data", "base.rds")) %>% 
  mutate(
    survey = factor(survey, levels = c("4", "1", "2", "3", "5", "6", "7")),
    lockdown_1 = survey %in% c("1"),
    lockdown_2 = survey %in% c("2"),
    lockdown_7 = survey %in% c("7")
  ) 

# extract all variable names from base that begins with "food"
food_vars <- base %>% select(starts_with("insecure")) %>% names()

# Random effects estimations with cluster-robust standard errors
re <- map(
  food_vars, 
  ~ plm(as.formula(paste0(.x, " ~ lockdown_1 + lockdown_2 + lockdown_7 + cases_smooth_per_100000")), 
        data = base, 
        index = c("hhid", "survey"), 
        model = "random",
        effect = "individual",
        # weighting using weight_final
        weights = weight_final
  ) %>% 
    vcovCR(type = "CR2") %>%
    tidy() %>% 
    select(term, estimate, std.error, p.value) %>% 
    mutate(variable = .x) %>% 
    select(variable, everything()) %>% 
    rename(re_estimate = estimate, re_std.error = std.error, re_p.value = p.value)
)


insecure_moderate <- plm(insecure_moderate ~ survey + cases_smooth_per_100000, 
                         data = base, 
                         index = c("hhid", "survey"), 
                         model = "random",
                         effect = "individual",
                         # weighting using weight_final
                         weights = weight_final
)

summary(insecure_moderate)

coef_test(insecure_moderate, vcov = "CR2")

insecure_moderate <- plm(insecure_moderate ~ survey + cases_smooth_per_100000, 
                         data = base, 
                         index = c("hhid", "survey"), 
                         model = "within",
                         effect = "individual",
                         # weighting using weight_final
                         weights = weight_final
)

summary(insecure_moderate)

# Plot the coefficients from the regression model insecure_moderate
insecure_moderate %>% 
  tidy(conf.int = TRUE) %>% 
  filter(term != "survey4") %>% 
  filter(term != "cases_smooth_per_100000") %>% 
  add_row(term = "survey4", estimate = 0, std.error = 0) %>% 
  arrange(term) %>%
  ggplot(aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
  geom_pointrange() +
  labs(
    title = "Insecure moderate",
    x = "Survey",
    y = "Coefficient"
  ) +
  theme_minimal()



