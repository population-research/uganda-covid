# Load data
library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(labelled)  # For data checking
library(lubridate)

''' Data source: https://covid19.who.int/data ,
   Institution: World Health Organization
   
   Case and death count data

From the 31 December 2019 to the 21 March 2020, WHO collected the numbers of confirmed COVID-19 cases and deaths through official communications under the International Health Regulations (IHR, 2005), complemented by monitoring the official ministries of health websites and social media accounts. Since 22 March 2020, global data are compiled through WHO region-specific dashboards (see links below), and/or aggregate count data reported to WHO headquarters daily.

Counts primarily reflect laboratory-confirmed cases and deaths, based upon WHO case definitions; although some departures may exist due to local adaptations. Counts include both domestic and repatriated cases. Case detection, definitions, testing strategies, reporting practice, and lag times (e.g. time to case notification, and time to reporting of deaths) differ between countries, territories and areas. These factors, amongst others, influence the counts presented with variable under or overestimation of true case and death counts, and variable delays to reflecting these data at a global level.

All data represent date of reporting as opposed to date of symptom onset. All data are subject to continuous verification and may change based on retrospective updates to accurately reflect trends, changes in country case definitions and/or reporting practices. Significant data errors detected or reported to WHO may be corrected at more frequent intervals.

New case and death counts: Counts of new cases and deaths are calculated by subtracting previous cumulative total counts from the current count. These counts are updated incrementally throughout the day as more information becomes available. Daily new case and death counts are complete by 23:59 CET/CEST each day. Due to differences in reporting methods, cut-off times, retrospective data consolidation and reporting delays, the number of new cases may not always reflect daily totals published by individual countries, territories or areas. Due to the recent trend of countries conducting data reconciliation exercises which remove large numbers of cases or deaths from their total counts, such data may reflect as negative numbers in the new cases / new deaths counts as appropriate. This will aid users in identifying when such adjustments occur. When additional details become available that allow the subtractions to be suitably apportioned to previous days, data will be updated accordingly.

Current day counts, global epidemic curves and trends: Due to the incremental updates to the dashboard, global case and death counts visualised for the current day may reflect partial data until counts have been fully updated for all regions that day. This must be taken into consideration when interpreting global epidemic curves and trends.

Time stamps and updates: Time/date stamps reflect when the data was last updated by WHO. Due to the time required to process and validate the incoming data, there is a delay between reporting to WHO and the update of the dashboard. To account for different time zones across WHO Regions and data transmission methods, and improve the timeliness of data availability, updates to the global dashboard are applied three times per day.

Counts and corrections made after these times will be carried forward to the next reporting cycle for that specific region. Delayed reporting for any specific country, territory or area may result in pooled counts for multiple days being presented, with a retrospective update to counts on previous days to accurately reflect trends. Significant data errors detected or reported to WHO may be corrected at more frequent intervals.

Other: cases and deaths reported from international conveyances, included in global totals but not reflected in epidemiological curves as not associated with a country or region.

Rates: <0.001 per 100,000 population may be rounded to 0.


   
'''

## load data --- dataset that gives cases by month
data <- read.csv(here("data","WHO-COVID-19-global-data.csv"))


## seperate dates into year, month and day in new df
n_data <- data %>%
  mutate(Year = year(Date_reported), Month = month(Date_reported), Day = day(Date_reported))

## Uganda data from global dataset
uganda_data <- n_data[n_data$Country == 'Uganda',]

## covid cases by month
uganda_data %>% 
  group_by(Month) %>%
  summarize(total_cases = sum(Cumulative_cases))

## covid cases per 100,000


## load another dataset with more calcilations
data2 <- read.csv(here("data","WHO-COVID-19-global-table-data.csv"))

## Uganda data
# data2_uganda <- data2[data2$Name == 'Uganda',]
# View(data2)

