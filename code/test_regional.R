# Check of Google mobility data across files

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
                                      size = 0.5)
  )

theme_set(theme_uft)

# Interview dates by round ----

base <- read_rds(here("data", "base.rds")) %>% 
  select(survey, interview_date) %>% 
  group_by(survey) %>% 
  summarise(
    first_date = min(interview_date),
    last_date = max(interview_date)
  )

# Load Google data ----

google_global <- read_csv(here("raw_data", "external_data", "Global_Mobility_Report.csv")) %>% 
  rename_to_lower_snake() %>%
  filter(country_region_code == "UG") %>% # Uses only the 2 letter code
  select(date, sub_region_1, sub_region_2, iso_3166_2_code, ends_with("from_baseline")) %>% 
  filter(date < ymd("2021-12-01")) %>% 
  rename_with(
    ~ str_replace(., "_percent_change_from_baseline", "")
  )

google_uganda_2020 <- read_csv(here("raw_data", "external_data", "2020_UG_Region_Mobility_Report.csv")) %>% 
  rename_to_lower_snake() 

google_uganda_2021 <- read_csv(here("raw_data", "external_data", "2021_UG_Region_Mobility_Report.csv")) %>% 
  rename_to_lower_snake() %>% 
  filter(date < ymd("2021-12-01")) 

google_uganda <- bind_rows(google_uganda_2020, google_uganda_2021) %>% 
  select(date, sub_region_1, sub_region_2, iso_3166_2_code, ends_with("from_baseline")) %>% 
  rename_with(
    ~ str_replace(., "_percent_change_from_baseline", "")
  )

all_equal(google_uganda, google_global) # TRUE


# Separate out nationwide and regional data ----

national <- google_global %>% 
  filter(is.na(sub_region_1)) %>% 
  select(-c("sub_region_1", "sub_region_2", "iso_3166_2_code"))

regional <- google_global %>%
  filter(!is.na(sub_region_1) & is.na(sub_region_2)) %>% 
  rename(
    region = sub_region_1
  ) %>%
  select(-c("sub_region_2", "iso_3166_2_code"))  

# Plot each outcome nationally and regionally ----

walk(names(national[, -1]) , ~ {
  y_var <- sym(.x)

  ggplot(national, aes(x = date)) + 
    geom_line(aes(y = {{y_var}})) + 
    xlab("Date") +
    annotate("rect", xmin = base$first_date[1], xmax = base$last_date[1],
             ymin = -Inf, ymax = Inf, alpha = 0.4) +
    annotate("rect", xmin = base$first_date[2], xmax = base$last_date[2],
             ymin = -Inf, ymax = Inf, alpha = 0.4) +
    annotate("rect", xmin = base$first_date[3], xmax = base$last_date[3],
             ymin = -Inf, ymax = Inf, alpha = 0.4) +
    annotate("rect", xmin = base$first_date[4], xmax = base$last_date[4],
             ymin = -Inf, ymax = Inf, alpha = 0.4) +
    annotate("rect", xmin = base$first_date[5], xmax = base$last_date[5],
             ymin = -Inf, ymax = Inf, alpha = 0.4) +
    annotate("rect", xmin = base$first_date[6], xmax = base$last_date[6],
             ymin = -Inf, ymax = Inf, alpha = 0.4) +
    annotate("rect", xmin = base$first_date[7], xmax = base$last_date[7],
             ymin = -Inf, ymax = Inf, alpha = 0.4) +
    scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
                 limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
    theme(axis.text.x=element_text(angle=60, hjust=1)) 

  ggsave(here("figures", paste0("national_", .x, ".pdf")), 
         width = 20, height = 15, 
         units = "cm")  

ggplot(regional, aes(x = date)) + 
  geom_line(aes(y = {{y_var}})) + 
  xlab("Date") +
  annotate("rect", xmin = base$first_date[1], xmax = base$last_date[1],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[2], xmax = base$last_date[2],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[3], xmax = base$last_date[3],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[4], xmax = base$last_date[4],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[5], xmax = base$last_date[5],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[6], xmax = base$last_date[6],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  annotate("rect", xmin = base$first_date[7], xmax = base$last_date[7],
           ymin = -Inf, ymax = Inf, alpha = 0.4) +
  scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y",
               limits = c(ymd("2020-03-01"), ymd("2021-11-30"))) +
  theme(axis.text.x=element_text(angle=60, hjust=1)) +
  facet_wrap(~ region, ncol = 2)

ggsave(here("figures", paste0("regional_", .x , ".pdf")),
       width = 20, height = 15, units = "cm")

}   
)



