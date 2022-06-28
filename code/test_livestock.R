# test code for livestock variables

library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(labelled)  # For data checking


# Round 2

# By household

round_2_sec5c  <- read_dta(here( "raw_data", "round2", "SEC5C.dta" ))

# By product
round_2_sec5c_1  <- read_dta(here( "raw_data", "round2", "SEC5C_1.dta" )) %>% 
  select(-BSEQNO) %>% 
  rename(
    hhid            = HHID,
    change          = s5cq13,
    decl_local_mrkt = s5cq14_1__1,
    decl_hotel_clsd = s5cq14_1__2,
    decl_transport  = s5cq14_1__3,
    decl_restrict   = s5cq14_1__4,
    decl_prices     = s5cq14_1__5,
    decl_home_prdct = s5cq14_1__6,
    no_local_mrkt   = s5cq14_2__1,
    no_hotel_clsd   = s5cq14_2__2,
    no_transport    = s5cq14_2__3,
    no_restrict     = s5cq14_2__4,
    no_prices       = s5cq14_2__5,
    no_home_prdct   = s5cq14_2__6,
    price_change    = s5cq15
  ) %>% 
  filter(
    livestock_products__id %in% c(1:3)
  )

# The questionnaire lists only milk (1) and egg (2), but the data also includes
# 3 and 4. Given that the follow-up responses to 4 are all NAs, this is most
# likely the option "None", which is 3 in questionnaire. With all later surveys
# covering milk, egg, and meat, I treat 3 as meat.

test <- round_2_sec5c_1 %>% 
  pivot_wider(
    id_cols = hhid,
    names_from = livestock_products__id,
    names_glue = "ag_stock_{livestock_products__id}_{.value}",
    values_from = c(change, starts_with("decl_"), starts_with("no_"), price_change)
  )


# Round 3 ----

round_3_sec5d  <- read_dta(here( "raw_data", "round3", "sec5d.dta" )) %>% 
  rename(
    change          = s5cq13,
    decl_local_mrkt = s5cq14__1,
    decl_hotel_clsd = s5cq14__2,
    decl_transport  = s5cq14__3,
    decl_restrict   = s5cq14__4,
    decl_prices     = s5cq14__5,
    decl_home_prdct = s5cq14__6,
    no_local_mrkt   = s5cq14a__1,
    no_hotel_clsd   = s5cq14a__2,
    no_transport    = s5cq14a__3,
    no_restrict     = s5cq14a__4,
    no_prices       = s5cq14a__5,
    no_home_prdct   = s5cq14a__6,
    price_change    = s5cq15
  ) %>% 
  mutate(
    stock_name = case_when(
      livestock_products__id == 1 ~ "milk",
      livestock_products__id == 2 ~ "egg",
      livestock_products__id == 3 ~ "meat",
      TRUE ~ NA_character_
    )
  ) %>% 
  pivot_wider(
    id_cols = hhid,
    names_from = stock_name,
    names_glue = "ag_stock_{stock_name}_{.value}",
    values_from = c(change, starts_with("decl_"), starts_with("no_"), price_change)
  )



# Round 5 ----

round_5_sec5d  <- read_dta(here( "raw_data", "round5", "sec5d.dta" )) %>% 
  rename(
    produce_any     = s5dq12,
    change          = s5dq13,
    decl_local_mrkt = s5dq14__1,
    decl_hotel_clsd = s5dq14__2,
    decl_transport  = s5dq14__3,
    decl_restrict   = s5dq14__4,
    decl_prices     = s5dq14__5,
    no_local_mrkt   = s5dq14_1__1,
    no_hotel_clsd   = s5dq14_1__2,
    no_transport    = s5dq14_1__3,
    no_restrict     = s5dq14_1__4,
    no_prices       = s5dq14_1__5,
    no_home_prdct   = s5dq14_1__6,
    price_change    = s5dq15
  ) %>% 
  mutate(
    stock_name = case_when(
      livestock_products__id == 1 ~ "milk",
      livestock_products__id == 2 ~ "egg",
      livestock_products__id == 3 ~ "meat",
      TRUE ~ NA_character_
    )
  ) %>% 
  pivot_wider(
    id_cols = hhid,
    names_from = stock_name,
    names_glue = "ag_stock_{stock_name}_{.value}",
    values_from = c(change, starts_with("decl_"), starts_with("no_"), price_change)
  )


# Round 6 ----

round_6_sec5d  <- read_dta(here( "raw_data", "round6", "sec5d.dta" )) %>%
  # No usable/comparable responses for following variables
  select(-s5dq14__n96, -s5dq14_Other, -s5dq14a__n96, -s5dq14a_Other) %>% 
  rename(
    produce_any     = s5dq12,
    change          = s5dq13,
    decl_local_mrkt = s5dq14__1,
    decl_hotel_clsd = s5dq14__2,
    decl_transport  = s5dq14__3,
    decl_restrict   = s5dq14__4,
    decl_prices     = s5dq14__5,
    no_local_mrkt   = s5dq14a__1,
    no_hotel_clsd   = s5dq14a__2,
    no_transport    = s5dq14a__3,
    no_restrict     = s5dq14a__4,
    no_prices       = s5dq14a__5,
    no_home_prdct   = s5dq14a__6,
    price_change    = s5dq15
  ) %>% 
  mutate(
    stock_name = case_when(
      livestock_products__id == 1 ~ "milk",
      livestock_products__id == 2 ~ "egg",
      livestock_products__id == 3 ~ "meat",
      TRUE ~ NA_character_
    )
  ) %>% 
  pivot_wider(
    id_cols = hhid,
    names_from = stock_name,
    names_glue = "ag_stock_{stock_name}_{.value}",
    values_from = c(change, starts_with("decl_"), starts_with("no_"), price_change)
  )
