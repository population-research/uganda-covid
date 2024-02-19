library(tidyverse)
library(here)
library(lubridate)
library(rio)
library(vtable)
library(janitor)


# Background information on the data

# The data is from the Uganda Bureau of Statistics (UBOS) and contains rainfall
# data for the period 1981 to now. The data is at the ADM2 level, which is the
# second administrative level in Uganda. 
# Download from: https://data.humdata.org/dataset/uga-rainfall-subnational

# This dataset contains dekadal rainfall indicators computed from Climate
# Hazards Group InfraRed Precipitation satellite imagery with insitu Station
# data (CHIRPS) version 2, aggregated by subnational administrative units.
#
# Included indicators are (for each dekad):
#
# 10 day rainfall [mm] (rfh) 
# rainfall 1-month rolling aggregation [mm] (r1h)
# rainfall 3-month rolling aggregation [mm] (r3h) 
# rainfall long term average [mm] (rfh_avg) 
# rainfall 1-month rolling aggregation long term average [mm] (r1h_avg) 
# rainfall 3-month rolling aggregation long term average [mm] (r3h_avg) 
# rainfall anomaly [%] (rfq) rainfall 1-month anomaly [%] (r1q)
# rainfall 3-month anomaly [%] (r3q) 
#
# The administrative units used for aggregation are based on WFP data and 
# contain a Pcode reference attributed to each unit.

# Uganda ADM2 P-CODE (ADM2_PCODE) - The P-CODE is a unique identifier for each
# location: https://en.wikipedia.org/wiki/ISO_3166-2:UG

# Load the data /Users/claus/Downloads/uga-rainfall-adm2-full.csv
rainfall <- import(here("raw_data", "external_data", "uga-rainfall-adm2-full.csv")) %>%
  mutate(date = ymd(date))


# plot rainfall 3-month anomaly [%] (r3q) per ADM2-PCODE
rainfall %>%
  filter(date >= "2020-03-01" & date <= "2021-12-01") %>%
  ggplot(aes(x = date, y = r3q, color = ADM2_PCODE)) +
  geom_line() +
  labs(title = "Rainfall 3-month anomaly [%] (r3q) per ADM2-PCODE",
       x = "Rainfall 3-month anomaly [%] (r3q)",
       y = "Count") +
  theme_minimal()

# Plot regional average rainfall 3-month anomaly [%] (r3q) where the first
# number in the ADM2_PCODE after "UG" is the region code
rainfall %>%
  filter(date >= "2020-03-01" & date <= "2021-12-01") %>%
  mutate(
    region = str_sub(ADM2_PCODE, 3, 3),
    region = case_when(
      region == "1" ~ "Central",
      region == "2" ~ "Eastern",
      region == "3" ~ "Northern",
      region == "4" ~ "Western",
      TRUE ~ "Unknown"
    )
  ) %>%
  group_by(date, region) %>%
  summarise(mean_r3q = mean(r3q, na.rm = TRUE)) %>%
  ggplot(aes(x = date, y = mean_r3q, color = region)) +
  geom_line() +
  labs(title = "Average Rainfall 3-month anomaly [%] (r3q) per region",
       x = "Date",
       y = "Average Rainfall 3-month anomaly [%] (r3q)") +
  theme_minimal()

# plot national average rainfall 3-month anomaly [%] (r3q) 
rainfall %>%
  filter(date >= "2020-03-01" & date <= "2021-12-01") %>%
  group_by(date) %>%
  summarise(mean_r3q = mean(r3q, na.rm = TRUE)) %>%
  ggplot(aes(x = date, y = mean_r3q)) +
  geom_line() +
  labs(title = "Average Rainfall 3-month anomaly [%] (r3q)",
       x = "Date",
       y = "Average Rainfall 3-month anomaly [%] (r3q)") +
  theme_minimal()
