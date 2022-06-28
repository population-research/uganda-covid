# Load data
library(tidyverse)
library(haven)
library(here)
library(janitor)   # For data checking
library(vtable)    # For data checking
library(labelled)  # For data checking

# Functions
rename_to_lower_snake <- function(df) {
  df %>% 
    rename_with( ~gsub("([a-z])([A-Z])", "\\1_\\2", .x) ) %>%  # Adds _ to camel case var names
    rename_with( ~tolower(gsub("[ ]+", "_", .x)) )  # Converts to lower and substitutes _ for spaces
}

## round 1 ---- 

## roster data (interview info and results?) 
round_1_interview_result <- read_dta(here("raw_data", "round1", "interview_result.dta")) %>%
  select(c('HHID','Rq09','Rq10'))
round_1_cover  <- read_dta(here( "raw_data", "round1", "Cover.dta")) 


## import raw data
round_1_sec1 <- read_dta(here( "raw_data", "round1", "SEC1.dta" )) ## individual level
round_1_sec4  <- read_dta(here( "raw_data", "round1", "SEC4.dta" )) 
round_1_sec5  <- read_dta(here( "raw_data", "round1", "SEC5.dta" )) 
round_1_sec5a  <- read_dta(here( "raw_data", "round1", "SEC5A.dta" ))
round_1_sec6  <- read_dta(here( "raw_data", "round1", "SEC6.dta" )) ## individual level
round_1_sec7  <- read_dta(here( "raw_data", "round1", "SEC7.dta" )) 
round_1_sec8  <- read_dta(here( "raw_data", "round1", "SEC8.dta" )) ## individual level, sec8 as sec9 for concerns not coping strategies



## merge round1 datasets
merged_r1 <- left_join(round_1_interview_result, round_1_cover, by = c("HHID")) %>% 
  left_join(round_1_sec4, by = c("HHID")) %>% 
  left_join(round_1_sec5, by = c("HHID")) %>% 
  left_join(round_1_sec5a, by = c("HHID")) %>% 
  left_join(round_1_sec7, by = c("HHID")) %>%
  left_join(round_1_sec8, by = c("HHID")) %>% 
  mutate(survey = 1)

## rename round1 columns
renamed_merged_r1 <- merged_r1 %>%
  mutate(
    # For subsequent rounds there are two different weights reported, one the
    # original and the adjusted for that round
    weight_round_1 = w1 
  ) %>% 
  rename(
    # basic survey information
    interview_resp                  = Rq09,
    interview_language              = Rq10,
    interview_name                  = Sq01,
    interview_date                  = Sq02,
    weight_final                    = wfinal,
    
    # Section 4 - Access
    soap_wash                       = s4q01,
    soap_wash_lack_why              = s4q02,
    soap_wash_lack_why_other        = s4q02_Other,
    
    water_wash                      = s4q03,
    water_wash_lack_why             = s4q04,
    water_wash_lack_why_other       = s4q04_Other,
    
    staple_main                     = s4q05,
    staple_lack                     = s4q06,
    staple_lack_why                 = s4q07,
    staple_lack_specific_why        = s4q07_Other,
    
    sauce_main_consumed             = s4q07a,
    sauce_buy_unable                = s4q07b,
    sauce_buy_unable_why            = s4q07c,
    sauce_buy_unable_why_other      = s4q07c_Other,
    
    medicine_no_access              = s4q08,
    medical_treatment_need          = s4q09,
    medical_access                  = s4q10,
    medical_access_lack_why         = s4q11,
    medical_access_lack_why_spec    = s4q11_Other,
    
    educ_any_child_3_to_18          = s4q012,
    educ_attend_pre_covid           = s4q013,
    educ_engage_after               = s4q014,
    educ_engage_assigs_completed    = s4q15__1,
    educ_engage_mobile_learning     = s4q15__2,
    educ_engage_tv_programs         = s4q15__3,
    educ_engage_radio_programs      = s4q15__4,
    educ_engage_tutor               = s4q15__5,
    educ_engage_gov_materials       = s4q15__6,
    educ_engage_other               = s4q15__n96,
    ## s4q15_other not in survey
    educ_teacher_contact            = s4q16,
    educ_teacher_contact_sms        = s4q17__1,
    educ_teacher_contact_online     = s4q17__2,
    educ_teacher_contact_email      = s4q17__3,
    educ_teacher_contact_mail       = s4q17__4,
    educ_teacher_contact_phone      = s4q17__5,
    educ_teacher_contact_whatsapp   = s4q17__6,
    educ_teacher_contact_facebook   = s4q17__7,
    educ_teacher_contact_physically = s4q17__8,
    educ_teacher_contact_others     = s4q17__n96,
    
    financial_access                = s4q18,
    financial_access_success        = s4q19,
    financial_access_why            = s4q20,
    financial_access_why_spec       = s4q20_Other,
    
    # Section 5 
    
    work_for_pay = s5q01,
    work_before = s5q02,
    work_stop_why = s5q03,
    work_main_activity = s504,
    work_same_before = s5q04a,
    work_change_why = s5q04b,
    work_before_main_activity = s504c,
    work_main_business_area = s5q05,
    work_main_business_type = s5q06,
    work_as_usual = s5q07,
    
    work_unusually_but_paid = s5q08,
    work_unusually_why = s5q08a,
    work_benefits_health_insurance = s5q08b__1,
    work_benefits_paid_sick_leave = s5q08b__2,
    work_benefits_pension = s5q08b__3,
    work_benefits_paid_annual_leave = s5q08b__4,
    work_written_contract = s5q08c,

    work_hh_unable= s5q09,
    work_hh_unable_who = s5q10__0, ## from roster
    work_hh_unable_who_1 = s5q10__1,
    work_hh_unable_who_2 = s5q10__2,
    work_hh_unable_who_3 = s5q10__3,
    work_hh_unable_who_4 = s5q10__4,
    work_hh_unable_who_5 = s5q10__5,
    work_hh_unable_who_6 = s5q10__6,
    work_hh_unable_who_7 = s5q10__7,
    work_hh_unable_who_8 = s5q10__8,
    work_hh_unable_who_9 = s5q10__9,

    work_fam_biz = s5q11,
    work_fam_biz_sec = s5q12,
    work_fam_biz_rev_level= s5q13,
    work_fam_biz_rev_level_why = s5q14,

    
    # Section 5a - Agriculture 
    ag_crops_plant                  = s5aq16,
    ag_crops_plant_plan             = s5aq17,
    ag_no_grow_home                 = s5qaq17_1,
    # ag_no_grow_other              = s5qaq17_1_Other,
    
    ag_crops_grown_1                = s5aq18__0, ## crops codes
    ag_crops_grown_2                = s5aq18__1,
    ag_crops_grown_3                = s5aq18__2,

    ag_plant_change                 = s5aq19, # This is split in R2    
    ag_plant_what_abandoned         = s5aq20__1,
    ag_plant_what_area_reduce       = s5aq20__2,
    ag_plant_what_area_increase     = s5aq20__3,
    ag_plant_what_fast_crops        = s5aq20__4,
    ag_plant_what_less_variety      = s5aq20__5,
    ag_plant_what_more_variety      = s5aq20__6,
    ag_plant_what_delayed           = s5aq20__7,
    ag_plant_what_other             = s5aq20__n96,
    ##s5aq20_other not in survey
    
    ag_plant_how_stay_home          = s5aq21__1,
    ag_plant_how_reduced_labor      = s5aq21__2,
    ag_plant_how_travel_restrict    = s5aq21__3,
    ag_plant_how_delay_seeds        = s5aq21__4,
    ag_plant_how_delay_fertilizer   = s5aq21__5,
    ag_plant_how_delay_other_input  = s5aq21__6,
    ag_plant_how_delay_sell_output  = s5aq21__7,
    ag_plant_how_care_ill_family    = s5aq21__8,
    ag_plant_how_delayed_planting   = s5aq21__9,
    ag_plant_how_other              = s5aq21__n96,
    #s5aq21_other not is survey
    
    ag_seeds_why_shops_no_stock     = s5aq22__1,
    ag_seeds_why_markets_closed     = s5aq22__2,
    ag_seeds_why_limited_transport  = s5aq22__3,
    ag_seeds_why_travel_restrict    = s5aq22__4,
    ag_seeds_why_price_increase     = s5aq22__5,
    ag_seeds_why_money_lack         = s5aq22__6,
    ag_seeds_why_other              = s5aq22__n96,
    
    ag_fertil_no_trans_why          = s5aq23,
    ag_fertil_no_trans_why_other    = s5aq23_Other,
    
    ag_input_no_trans_why           = s5aq24,
    ag_input_no_trans_why_other     = s5aq24_Other,
    
    ag_locust_lost_crops            = s5aq25,
    
    ag_stock_raised                 = s5aq26,
    ag_stock_change                 = s5aq27,
    ag_stock_change_treat_self      = s5aq28__1,
    ag_stock_change_couldnt_vac     = s5aq28__2,
    ag_stock_change_couldnt_deworm  = s5aq28__3,
    ag_stock_change_postpone_inserm = s5aq28__4,
    ag_stock_change_feed_ratio      = s5aq28__5,
    ag_stock_change_cant_sell       = s5aq28__6,
    ag_stock_change_water_given     = s5aq28__7,
    ag_stock_land_locust            = s5aq29,
    
    ag_farm_products_sell_need      = s5aq30,
    ag_farm_products_sell_able      = s5aq31,

    # Section 8 - Food insecurity experience scale
    food_insufficient_worry         = s7q01,
    food_healthy_lack               = s7q02,
    food_few_kinds                  = s7q03,
    food_skipped_meal               = s7q04,
    food_less_than_expected         = s7q05,
    food_ranout                     = s7q06,
    food_hungry                     = s7q07,
    food_didnt_eat_all_day          = s7q08,
    
#     concerns_covid_hh_serious_illness = s8q01,
#     concerns_covid_threat_hh_finances = a8q02
  ) %>% 
  rename_to_lower_snake()

## income loss round 1
renamed_round1_sec_6 <- round_1_sec6 %>% 
  rename(
    hhid = HHID,
    inc_source = s6q01,
    inc_level = s6q02
  ) %>% 
  select(-s6q01_Other) %>% 
  filter(!income_loss__id == -96) %>% 
  pivot_wider(
    id_cols = hhid, 
    names_from = income_loss__id, 
    values_from = c(inc_source,inc_level), 
    names_sort = TRUE
  ) %>% 
  rename_with(~ gsub("_1$", "_farm", .x))%>% 
  rename_with(~ gsub("_2$", "_nfe", .x))%>% 
  rename_with(~ gsub("_3$", "_wage", .x))%>% 
  rename_with(~ gsub("_4$", "_benefits", .x))%>% 
  rename_with(~ gsub("_5$", "_remittance", .x))%>% 
  rename_with(~ gsub("_6$", "_family", .x))%>% 
  rename_with(~ gsub("_7$", "_non_family", .x))%>% 
  rename_with(~ gsub("_8$", "_assets", .x))%>% 
  rename_with(~ gsub("_9$", "_pension", .x))%>% 
  rename_with(~ gsub("_10$", "_govt", .x))%>% 
  rename_with(~ gsub("_11$", "_ngo", .x))

## merge section 6 to the rest
renamed_merged_r1 <- renamed_merged_r1 %>% 
  left_join(renamed_round1_sec_6, by = "hhid")



## round 2 ---- 

round_2_interview_result <- read_dta(here("raw_data", "round2", "interview_result.dta")) %>%
  select(c('HHID','Rq09','Rq10'))
round_2_cover  <- read_dta(here( "raw_data", "round2", "Cover.dta" )) 

round_2_sec1 <- read_dta(here( "raw_data", "round2", "SEC1.dta" )) 
round_2_sec4  <- read_dta(here( "raw_data", "round2", "SEC4.dta" )) 
round_2_sec5  <- read_dta(here( "raw_data", "round2", "SEC5.dta" )) 
round_2_sec5a  <- read_dta(here( "raw_data", "round2", "SEC5A.dta" )) 
round_2_sec5b  <- read_dta(here( "raw_data", "round2", "SEC5B.dta" )) 
# By product; processed at end of round code
round_2_sec5c_1  <- read_dta(here( "raw_data", "round2", "SEC5C_1.dta" )) 
round_2_sec5c  <- read_dta(here( "raw_data", "round2", "SEC5C.dta" ))
round_2_sec6  <- read_dta(here( "raw_data", "round2", "SEC6.dta" )) 
# sec8 as 7
round_2_sec8  <- read_dta(here( "raw_data", "round2", "SEC8.dta" )) 
round_2_sec9  <- read_dta(here( "raw_data", "round2", "SEC9.dta" )) 


## merge round2 datasets
merged_r2 <- left_join(round_2_interview_result,round_2_cover, by = c("HHID")) %>% 
  left_join(round_2_sec4, by = c("HHID")) %>% 
  left_join(round_2_sec5, by = c("HHID")) %>% 
  left_join(round_2_sec5a, by = c("HHID")) %>% 
  left_join(round_2_sec5b, by = c("HHID")) %>% 
  left_join(round_2_sec5c, by = c("HHID")) %>% 
  left_join(round_2_sec8, by = c("HHID")) %>% 
  left_join(round_2_sec9, by = c("HHID")) %>% 
  mutate(survey = 2)

##rename round2 columns
renamed_merged_r2 <- merged_r2 %>%
  rename(
    # basic survey information
    interview_resp                  = Rq09,
    interview_language              = Rq10,
    interview_name                  = Sq01,
    interview_date                  = Sq02,
    weight_round_1                  = Round1_hh_weight,
    weight_final                    = wfinal,
    
    # Section 4 - Access
    # Drinking water questions not in R1
    # Assets questions not in R1
    # Staples and sauce questions not in R2
    # Education questions not in R2
    # Financial access not in R2
    
    water_drink_insuf               = s4q01e,
    water_drink_insuf_why           = s4q01f,
    water_drink_insuf_why_other     = s4q01f_Other,
    
    soap_wash                       = s4q01,
    soap_wash_lack_why              = s4q02,
    soap_wash_lack_why_other        = s4q02_Other,
    
    water_wash                      = s4q03,
    water_wash_lack_why             = s4q04,
    water_wash_lack_why_other       = s4q04_Other,
    
    medicine_no_access              = s4q08,
    medical_treatment_need          = s4q09,
    medical_access                  = s4q10,
    medical_access_lack_why         = s4q11,
    medical_access_lack_why_spec    = s4q11_Other,
    
    assets_hh_radio1                = s4q12__1,
    assets_hh_tv                    = s4q12__2,
    assets_hh_grid_electricity      = s4q12__3,
    assets_hh_lar_system            = s4q12__4,
    assets_hh_solar_kit_lantern     = s4q12__5,
    
    #Section 5 
    
    work_for_pay = s5q01,
    work_return_expect = s5q01a,
    work_return_when = s5q01b,
    work_last_week_why_not = s5q01c,
    work_stop_why = s5q03,
    work_look = s5q03a,
    work_look_how = s5q03b,
    work_same_before_yes = s5q04a_1,
    work_same_before_no = s5q04a_2,
    work_change_why = s5q04b,
    work_main_business_area = s5q05,
    work_main_business_type = s5q06,
    work_as_usual = s5q07,
    
    work_unusually_but_paid = s5q08,
    work_unusually_why = s5q08a,
    work_hours = s5q08b,
    work_hours_change = s5q08c,
    
    work_benefits_health_insurance = s5q08d__1,
    work_benefits_paid_sick_leave = s5q08d__2,
    work_benefits_pension = s5q08d__3,
    work_benefits_paid_annual_leave = s5q08d__4,
    work_written_contract = s5q08e,
    work_hh_unable= s5q09,
    
    work_hh_unable_who = s5q10__0, ## from roster
    work_hh_unable_who_1 = s5q10__1,
    work_hh_unable_who_2 = s5q10__2,
    work_hh_unable_who_3 = s5q10__3,
    work_hh_unable_who_4 = s5q10__4,
    work_hh_unable_who_5 = s5q10__5,


#     non_farm_biz_operate = s5aq11,
#     non_farm_biz_closure_why_covid = s5aq11b__1,
#     non_farm_biz_place_closure_other_why = s5aq11b__2,
#     non_farm_biz_closure_why_no_customers = s5aq11b__3,
#     non_farm_biz_closure_why_no_inputs = s5aq11b__4,
#     non_farm_biz_closure_why_travel_restrictions = s5aq11b__5,
#     non_farm_biz_closure_why_ill_covid = s5aq11b__6,
#     non_farm_biz_closure_why_ill_other_disease = s5aq11b__7,
#     non_farm_biz_closure_why_care_family = s5aq11b__8,
#     non_farm_biz_closure_why_seasonal = s5aq11b__9,
#     non_farm_biz_closure_why_vacation = s5aq11b__10,
#     non_farm_biz_closure_why_other = s5aq11b__n96,
#     non_farm_biz_sector = s5aq12,
#     non_farm_biz_rev_level = s5aq13,
#     non_farm_biz_rev_less_why_covid = s5aq14_1,
#     non_farm_biz_rev_less_closure_another_why = s5aq14_2,
#     
#     challenges_due_to_covid_biz_inputs = s5aq15__1,
#     challenges_due_to_covid_biz_operation_money = s5aq15__2,
#     challenges_due_to_covid_biz_loans = s5aq15__3,
#     challenges_due_to_covid_rent = s5aq15__4,
#     challenges_due_to_covid_paying_workers = s5aq15__5,
#     challenges_due_to_covid_sales = s5aq15__6,
#     challenges_due_to_covid_other = s5aq15__n96,
#     
#     change_biz_conduct = s5aq15a,
#     changes_to_be_made_in_biz_wear_mask = s5aq15b__1,
#     changes_to_be_made_in_biz_distancing = s5aq15b__2,
#     changes_to_be_made_in_biz_few_customers_at_once = s5aq15b__3,
#     changes_to_be_made_in_biz_phone_media_market = s5aq15b__4,
#     changes_to_be_made_in_biz_deliveries_only = s5aq15b__5,
#     changes_to_be_made_in_biz_product_offering = s5aq15b__6,
#     changes_to_be_made_in_biz_other = s5aq15b__n96,
#     
#     non_farm_biz_temporary_close_status = s5aq11a,
    
    # Section 5b - Agriculture
    ag_crops_plant                  = s5bq01,
    ##crop grown by code no names indicated
    ag_crops_grown_1                = s5bq02_1,
    ag_crops_grown_2                = s5bq02_2,
    ag_crops_grown_3                = s5bq02_3,
    ag_crops_progress               = s5bq03,
    
    ag_plant_change                 = s5bq04,
    ag_plant_what_covid_measures    = s5bq05__1,
    ag_plant_what_no_workers_hired  = s5bq05__2,
    ag_plant_what_fewer_workers     = s5bq05__3,
    ag_plant_what_abandoned         = s5bq05__4,
    ag_plant_what_delayed           = s5bq05__5,
    ag_plant_what_other             = s5bq05__n96,
    
    ag_plant_safety_mask            = s5bq06__1,
    ag_plant_safety_no_hand_shakes  = s5bq06__2,
    ag_plant_safety_gloves          = s5bq06__3,
    ag_plant_safety_distance        = s5bq06__4,
    ag_plant_safety_others          = s5bq06__5,
    ag_plant_why_not_hire_workers   = s5bq07,
    
    ag_farm_products_sell_need      = s5bq08,
    ag_farm_products_sell_able      = s5bq09,
        
    ag_stock_raised                 = s5cq01, 
    ag_stock_type_ruminants_l_impr  = s5cq02__1,
    ag_stock_type_ruminants_l_indi  = s5cq02__2,
    ag_stock_type_ruminants_s_impr  = s5cq02__3,
    ag_stock_type_ruminants_s_indi  = s5cq02__4,
    ag_stock_type_poultry_impr      = s5cq02__5,
    ag_stock_type_poultry_indi      = s5cq02__6,
    ag_stock_type_pigs              = s5cq02__7,
    ag_stock_type_equines           = s5cq02__8,
    ag_stock_change                 = s5cq03,
    ag_stock_reduce_feed            = s5cq04__1,
    ag_stock_reduce_breed_access    = s5cq04__2,
    ag_stock_reduce_vet_access      = s5cq04__3,
    ag_stock_reduce_markets_access  = s5cq04__4,
    ag_stock_reduce_milk_eggs_prod  = s5cq04__5,
    ag_stock_compromised_storage    = s5cq04__6,
    ag_stock_reduced_processing     = s5cq04__7,
    
    ag_stock_sell_wanted            = s5cq08,
    ag_stock_sell_able              = s5cq09,
    ag_stock_sell_unable_transport  = s5cq11__2,
    ag_stock_sell_unable_travel     = s5cq11__3,
    ag_stock_sale_unable_prices     = s5cq11__4,
    ag_stock_sale_unable_other      = s5cq11__5, ## there is no five hence called it other 

    # Section 8 - Food insecurity experience scale
    food_insufficient_worry         = s8q01,
    food_healthy_lack               = s8q02,
    food_few_kinds                  = s8q03,
    food_skipped_meal               = s8q04,
    food_less_than_expected         = s8q05,
    food_ranout                     = s8q06,
    food_hungry                     = s8q07,
    food_didnt_eat_all_day          = s8q08,
    
    # Too long variables - need to shorten
    # concerns_covid_hh_serious_illness = s9q01,
    # concerns_covid_threat_hh_finances = s9q02,
    # concerns_symptoms_cough = s9q03__1,
    # concerns_symptoms_breath_shortness = s9q03__2,
    # concerns_symptoms_fever = s9q03__3,
    # concerns_symptoms_chills = s9q03__4,
    # concerns_symptoms_muscle_pain = s9q03__5,
    # concerns_symptoms_headache = s9q03__6,
    # concerns_symptoms_sore_throat = s9q03__7,
    # concerns_symptoms_taste_smell_loss = s9q03__8,
    # concerns_hh_covid_diagnosis = s9q04,
    # concerns_security_risk_covid = s9q05,
    # concerns_covid_response_limit_freedom = s9q06,
    # concerns_misuse_covid_funds = s9q07,
    # concerns_gov_corruption_lower_medical_quality = s9q08,
    # concerns_measures_curb_covid_close_educations = s9q09__1,
    # concerns_measures_curb_covid_suspension_churches = s9q09__2,
    # concerns_measures_curb_covid_suspension_gatherings = s9q09__3,
    # concerns_measures_curb_covid_suspension_weddings = s9q09__4,
    # concerns_measures_curb_covid_suspension_periodic_markets = s9q09__5
  ) %>% 
  mutate(
    work_same_before = case_when(
      is.na(work_same_before_yes) & is.na(work_same_before_no) ~ NA_real_,
      work_same_before_yes == 1 | work_same_before_no == 2 ~ 1,
      work_same_before_yes == 2 | work_same_before_no == 1 ~ 2, 
    )
  ) %>%
  rename_to_lower_snake()

# Livestock product by product - Section 5c
# The questionnaire lists only milk (1) and egg (2), but the data also includes
# 3 and 4. Given that the follow-up responses to 4 are all NAs, this is most
# likely the option "None", which is 3 in questionnaire. With all later surveys
# covering milk, egg, and meat, I treat 3 as meat.

round_2_sec5c_1 <- round_2_sec5c_1 %>% 
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


## income loss round 2
renamed_round2_sec_6 <- round_2_sec6 %>% 
  rename(
    hhid = HHID,
    inc_source = s6q01,
    inc_level = s6q02
  ) %>% 
  select(-s6q01_Other) %>% 
  filter(!income_loss__id == -96) %>% 
  pivot_wider(
    id_cols = hhid, 
    names_from = income_loss__id, 
    values_from = c(inc_source,inc_level), 
    names_sort = TRUE
  ) %>% 
  rename_with(~ gsub("_1$", "_farm", .x))%>% 
  rename_with(~ gsub("_2$", "_nfe", .x))%>% 
  rename_with(~ gsub("_3$", "_wage", .x))%>% 
  rename_with(~ gsub("_4$", "_benefits", .x))%>% 
  rename_with(~ gsub("_5$", "_remittance", .x))%>% 
  rename_with(~ gsub("_6$", "_family", .x))%>% 
  rename_with(~ gsub("_7$", "_non_family", .x))%>% 
  rename_with(~ gsub("_8$", "_assets", .x))%>% 
  rename_with(~ gsub("_9$", "_pension", .x))%>% 
  rename_with(~ gsub("_10$", "_govt", .x))%>% 
  rename_with(~ gsub("_11$", "_ngo", .x))
## inc_level_12 not in survey

renamed_merged_r2 <- renamed_merged_r2 %>% 
  left_join(renamed_round2_sec_6, by = "hhid") %>% 
  left_join(round_2_sec5c_1, by = "hhid")



## round 3 ---- 

round_3_interview_result <- read_dta(here("raw_data", "round3", "interview_result.dta")) %>%
  select(c('hhid','Rq09','Rq10'))
round_3_cover  <- read_dta(here( "raw_data", "round3", "cover.dta" )) 

round_3_sec1 <- read_dta(here( "raw_data", "round3", "SEC1.dta" )) 
round_3_sec4  <- read_dta(here( "raw_data", "round3", "sec4.dta" )) 
round_3_sec5  <- read_dta(here( "raw_data", "round3", "sec5.dta" )) 
round_3_sec5a  <- read_dta(here( "raw_data", "round3", "sec5a.dta" )) 
round_3_sec5b  <- read_dta(here( "raw_data", "round3", "sec5b.dta" )) 
# By product; processed at end of round code
round_3_sec5d  <- read_dta(here( "raw_data", "round3", "sec5d.dta" )) 
round_3_sec6  <- read_dta(here( "raw_data", "round3", "sec6.dta" )) 
# sec8 as 7
round_3_sec8  <- read_dta(here( "raw_data", "round3", "sec8.dta" )) 
round_3_sec9  <- read_dta(here( "raw_data", "round3", "sec9.dta" )) 


## merge round3 datasets
merged_r3 <- left_join(round_3_interview_result,round_3_cover, by = c("hhid")) %>% 
  left_join(round_3_sec4, by = c("hhid")) %>% 
  left_join(round_3_sec5, by = c("hhid")) %>% 
  left_join(round_3_sec5a, by = c("hhid")) %>% 
  left_join(round_3_sec5b, by = c("hhid")) %>% 
  left_join(round_3_sec8, by = c("hhid")) %>% 
  left_join(round_3_sec9, by = c("hhid")) %>% 
  mutate(survey = 3) %>% 
  mutate(
    # Somehow was coded as a string.
    # I keep getting a "NAs introduced by coercion" warning but it seems to be working as intended.
    s5bq21_5 = str_remove(s5bq21_5, ","),
    s5bq21_5 = case_when(
      s5bq21_5 == ""  ~ NA_real_,
      s5bq21_5 == " " ~ NA_real_,
      s5bq21_5 == "##N/A##" ~ NA_real_,
      s5bq21_5 == "98"  ~ NA_real_,
      s5bq21_5 == "-98" ~ NA_real_,
      TRUE          ~ as.numeric(s5bq21_5)
    )
  ) 


##rename round3 columns
renamed_merged_r3 <- merged_r3 %>% 
  rename(
    # basic survey information
    interview_resp           = Rq09,
    interview_language         = Rq10,
    interview_name           = Sq01,
    interview_date           = Sq02,
    weight_round_1           = Round1_hh_weight,
    weight_final             = wfinal,

    # Section 4 - Access
    # Soap questions not in R4
    # Drinking water questions not in R4
    # Hand-washing water questions not in R4
    # Sauce questions not in R4
    # Educ access questions not in R4
    # Financial access questions not in R4
    # mask questions not in R1 or R2
    staple_main                     = s4q05,
    staple_lack                     = s4q06,
    staple_lack_why                 = s4q07,
    
    medicine_no_access              = s4q08,
    medical_treatment_need          = s4q09,
    medical_access                  = s4q10,
    medical_access_lack_why         = s4q11,
    medical_access_lack_why_spec    = s4q11_Other,
    
    mask_no_access                  = s4q12,
    mask_no_access_why         = s4q13,
    mask_no_access_why_other     = s4q13_Other,
    mask_source_gov         = s4q14__1,
    mask_source_buy         = s4q14__2,
    mask_source_home_made       = s4q14__3,
    mask_source_friends_relatives   = s4q14__4,
    mask_source_employer       = s4q14__5,
    mask_source_other         = s4q14__n96,
    ## s4q14_other not in survey
    
    # Section 5 
    
    work_for_pay = s5q01,
    work_return_expect  = s5q01a,
    work_return_when = s5q01b,
    work_last_week_why_not = s5q01c,    
    work_stop_why = s5q03,
    work_look = s5q03a,
    work_look_how = s5q03b,
    work_same_before = s5q04a_1,
    work_change_why = s5q04b,
    work_main_business_area = s5q05,
    work_main_business_type = s5q06,
    work_as_usual = s5q07,
    
    work_unusually_but_paid = s5q08,
    work_unusually_why = s5q08a,
    work_hours = s5q08b,
    work_hours_change = s5q08c,
    
    work_safety_disinfectant = s5q08f__1,
    work_safety_sanitizer = s5q08f__2,
    work_safety_awareness = s5q08f__3,
    work_safety_mask = s5q08f__4,
    work_safety_gloves = s5q08f__5,
    work_safety_from_home = s5q08f__6,
    work_safety_office_closed = s5q08f__7,
    work_safety_none = s5q08f__8,
    work_safety_other = s5q08f__n96,
    work_safety_followed = s5q08g,
    work_safety_followed_percentage = s5q08g_1,
    
    
    work_hh_unable= s5q09,
    work_hh_unable_who = s5q10__0, ## from roster
    work_hh_unable_who_1 = s5q10__1,
    work_hh_unable_who_2 = s5q10__2,
    work_hh_unable_who_3 = s5q10__3,
    work_hh_unable_who_4 = s5q10__4,
    
#     
#     non_farm_biz_operation = s5aq11,
#     non_farm_biz_closure_why = s5aq11b,
#     non_farm_biz_main_activity = s5a11c,
#     non_farm_biz_sector = s5aq12,
#     non_farm_biz_rev_sales_compared_feb = s5aq13,
#     non_farm_biz_rev_sales_covid = s5aq14_1,
#     non_farm_biz_rev_sales_other = s5aq14_2,
#     non_farm_biz_another = s5q15a, 
#     non_farm_biz_number = s5q15b,
#     non_farm_biz_temporary_close_status = s5aq11a,
    
    # Section 5b - Agriculture
    ag_crops_plant                  = s5bq16,
    ## crop by code
    ag_crops_grown_1                = s5bq18_1,
    ag_crops_grown_2                = s5bq18_2,
    ag_crops_grown_3                = s5bq18_3,
    
    ag_expected_output              = s5bq19,
    ag_expected_harvest_quantity    = s5bq20,
    ag_expected_harvest_unit        = s5bq20b, ## double check 
    ag_expected_harvest_kg          = s5bq20c,
    
    ag_price_small_banana           = s5bq21_1,
    ag_price_medium_banana          = s5bq21_2,
    ag_price_large_banana           = s5bq21_3,
    ag_price_100kg_cassava_bag      = s5bq21_4,
    ag_price_basin_dry_casava_chips = s5bq21_5,
    ag_price_kg_dry_cassava_flour   = s5bq21_6,
    ag_price_kg_dry_beans           = s5bq21_7,
    ag_price_basin_fresh_beans      = s5bq21_9,
    ag_price_kg_maize_grains        = s5bq21_8,
    
    ag_farm_products_sell_normally  = s5bq23,
    ag_farm_products_revenue_size   = s5bq24,
    
    ag_farm_products_sell_need      = s5bq25,
    ag_farm_products_sell_able      = s5bq26,
    
    ag_farm_products_sale_farm      = s5bq27__1,
    ag_farm_products_sale_day_mrkt  = s5bq27__2,
    ag_farm_products_sale_week_mrkt = s5bq27__3,
    ag_farm_products_sale_other     = s5bq27__n96,

    # Section 8 - Food insecurity experience scale
    food_insufficient_worry         = s8q01,
    food_healthy_lack               = s8q02,
    food_few_kinds                  = s8q03,
    food_skipped_meal               = s8q04,
    food_less_than_expected         = s8q05,
    food_ranout                     = s8q06,
    food_hungry                     = s8q07,
    food_didnt_eat_all_day          = s8q08,
    
    # Too long variables - need to shorten
    # concerns_covid_hh_serious_illness = s9q01,
    # concerns_covid_threat_hh_finances = s9q02,
    # concerns_symptoms_cough = s9q03__1,
    # concerns_symptoms_breath_shortness = s9q03__2,
    # concerns_symptoms_fever = s9q03__3,
    # concerns_symptoms_chills = s9q03__4,
    # concerns_symptoms_muscle_pain = s9q03__5,
    # concerns_symptoms_headache = s9q03__6,
    # concerns_symptoms_sore_throat = s9q03__7,
    # concerns_symptoms_taste_smell_loss = s9q03__8,
    # concerns_hh_covid_diagnosis = s9q04,
    # concerns_security_risk_covid = s9q05,
    # concerns_covid_response_limit_freedom = s9q06,
    # concerns_misuse_covid_funds = s9q07,
    # concerns_gov_corruption_lower_medical_quality = s9q08,
    # concerns_discomfort_in_house = s9q09
  ) %>% 
  rename_to_lower_snake()

# Livestock product by product - Section 5d
round_3_sec5d  <- round_3_sec5d %>% 
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



## income loss round 3
renamed_round3_sec_6 <- round_3_sec6 %>% 
  rename(
    inc_source = s6q01,
    inc_level = s6q02
  ) %>% 
  filter(!income_loss__id == -96) %>% 
  pivot_wider(
    id_cols = hhid, 
    names_from = income_loss__id, 
    values_from = c(inc_source,inc_level), 
    names_sort = TRUE
  ) %>% 
  rename_with(~ gsub("_1$", "_farm", .x))%>% 
  rename_with(~ gsub("_2$", "_nfe", .x))%>% 
  rename_with(~ gsub("_3$", "_wage", .x))%>% 
  rename_with(~ gsub("_4$", "_benefits", .x))%>% 
  rename_with(~ gsub("_5$", "_remittance", .x))%>% 
  rename_with(~ gsub("_6$", "_family", .x))%>% 
  rename_with(~ gsub("_7$", "_non_family", .x))%>% 
  rename_with(~ gsub("_8$", "_assets", .x))%>% 
  rename_with(~ gsub("_9$", "_pension", .x))%>% 
  rename_with(~ gsub("_10$", "_govt", .x))%>% 
  rename_with(~ gsub("_11$", "_ngo", .x))
## inc_level_12 not in survey

renamed_merged_r3 <- renamed_merged_r3 %>% 
  left_join(renamed_round3_sec_6, by = "hhid") %>% 
  left_join(round_3_sec5d, by = "hhid")




## round 4 ---- 

round_4_interview_result <- read_dta(here("raw_data", "round4", "interview_result.dta")) %>%
  select(c('HHID','Rq09','Rq10'))
round_4_cover  <- read_dta(here( "raw_data", "round4", "Cover.dta" )) 

round_4_sec1 <- read_dta(here( "raw_data", "round4", "SEC1.dta" )) 
round_4_sec4  <- read_dta(here( "raw_data", "round4", "SEC4.dta" )) 
round_4_sec5  <- read_dta(here( "raw_data", "round4", "SEC5.dta" )) 
round_4_sec5a  <- read_dta(here( "raw_data", "round4", "SEC5A.dta" )) 
round_4_sec5b  <- read_dta(here( "raw_data", "round4", "SEC5B.dta" )) 
## sec7 found to be sec8 
round_4_sec6  <- read_dta(here( "raw_data", "round4", "SEC6.dta" )) 
round_4_sec8  <- read_dta(here( "raw_data", "round4", "SEC8.dta" )) 
round_4_sec9  <- read_dta(here( "raw_data", "round4", "SEC9.dta" )) 

## rename hhid to HHID in round4 sec1 data
round_4_sec1 <- round_4_sec1 %>%
  rename(HHID = hhid)

## merge round4 datasets
merged_r4 <- left_join(round_4_interview_result,round_4_cover, by = c("HHID")) %>% 
  left_join(round_4_sec4, by = c("HHID")) %>% 
  left_join(round_4_sec5, by = c("HHID")) %>% 
  left_join(round_4_sec5a, by = c("HHID")) %>%
  left_join(round_4_sec5b, by = c("HHID")) %>%
  left_join(round_4_sec8, by = c("HHID")) %>% ##as sec 7
  left_join(round_4_sec9, by = c("HHID")) %>% 
  mutate(survey = 4)


##rename round4 columns
renamed_merged_r4 <- merged_r4 %>% 
  rename(
    # basic survey information  
    interview_resp           = Rq09,
    interview_language         = Rq10,
    interview_date           = Sq02,
    weight_final           = wfinal, # R4 does not have R1 weight

    # Section 4 - Access
    # Drinking water also in R2
    # Covid test questions not in R1, R2, R3
    # vac questions not in R1, R2, R3
    water_drink_insuf         = s4q1e,
    water_drink_insuf_why       = s4q1f,
    water_drink_source         = s4q1g,
    
    soap_wash             = s4q01,
    soap_wash_lack_why         = s4q02,
    
    water_wash             = s4q03,
    water_wash_lack_why       = s4q04,
    
    medicine_no_access         = s4q08,
    medical_treatment_need       = s4q09,
    medical_access           = s4q10,
    medical_access_lack_why     = s4q11,
    medical_need_2019_04_2020_04   =  s4q11a,
    medical_access__2019_04_2020_04 = s4q11b,
    
    mask_no_access           = s4q12,
    mask_no_access_why         = s4q13,
    mask_source_gov         = s4q14__1,
    mask_source_buy         = s4q14__2,
    mask_source_home_made       = s4q14__3,
    mask_source_friends_relatives   = s4q14__4,
    mask_source_employer       = s4q14__5,
    mask_source_other         = s4q14__n96,
    
    covid_test_free_accept       = s4q15,
    covid_vac_willing         = s4q16,
    covid_vac_refuse_not_work     = s4q17__1,
    covid_vac_refuse_unsafe     = s4q17__2,
    covid_vac_refuse_side_effects   = s4q17__3,
    covid_vac_refuse_low_risk     = s4q17__4,
    covid_vac_refuse_against_vacs  = s4q17__5,
    covid_vac_refuse_religion     = s4q17__6,
    covid_vac_refuse_other       = s4q17__n96,
    covid_vac_doubts_wont_work     = s4q18__1,
    covid_vac_doubt_unsafe       = s4q18__2,
    covid_vac_doubt_side_effects   = s4q18__3,
    covid_vac_doubt_low_risk     = s4q18__4,
    covid_vac_doubt_against_vacs   = s4q18__5,
    covid_vac_doubt_against_relig   = s4q18__6,
    covid_vac_doubt_other       = s4q18__n96,
    
    # Section 5 
    
    work_for_pay = s5q01,
    work_return_expect  = s5q01a,
    work_return_when = s5q01b,
    work_last_week_why_not = s5q01c,    
    work_stop_why = s5q03,
    work_look = s5q03a,
    work_look_how = s5q03b,
    work_same_before = s5q04a,
    work_change_why = s5q04b,   
    work_main_business_area = s5q05,
    work_main_business_type = s5q06,
    work_fam_prod_intentions = s5q06a,
    work_as_usual = s5q07,
    
    work_unusually_but_paid = s5q08,
    work_unusually_why = s5q08a,
    work_hours = s5q08b,
    work_hours_change = s5q08c,
    
    work_safety_disinfectant = s5q08f__1,
    work_safety_sanitizer = s5q08f__2,
    work_safety_awareness = s5q08f__3,
    work_safety_mask = s5q08f__4,
    work_safety_gloves = s5q08f__5,
    work_safety_from_home = s5q08f__6,
    work_safety_office_closed = s5q08f__7,
    work_safety_none = s5q08f__8,
    work_safety_other = s5q08f__n96,
    work_safety_followed = s5q08g,
    work_safety_followed_percentage = s5q08g_1,
    
    
    work_hh_unable= s5q09,
    work_hh_unable_who = s5q10__0, ## from roster
    work_hh_unable_who_1 = s5q10__1,
    work_hh_unable_who_2 = s5q10__2,
    work_hh_unable_who_3 = s5q10__3,
    work_hh_unable_who_4 = s5q10__4,
    

#     
#     non_farm_biz_operation = s5aq11,
#     non_farm_biz_closure_why = s5aq11b,
#     non_farm_biz_other_operating = s5aq11b_1,
#     non_farm_biz_other_main_activity = s5a11c_1,
#     non_farm_biz_other_sector = s5aq12_1,
#     non_farm_biz_existing_main_activity = s5a11c,
#     non_farm_biz_existing_sector = s5aq12,
#     
#     non_farm_biz_rev_sales_compared_feb = s5aq13,
#     non_farm_biz_rev_sales_why_covid = s5aq14_1,
#     non_farm_biz_rev_sales_why_other = s5aq14_2,
#     non_farm_biz_rev_sales_compared_year = s5aq15,
#     
#     non_farm_biz_temporary_close_status = s5aq11a,
    
    ag_crops_plant                  = s5bq16,
    ag_crops_plant_plan             = s5bq17,
    ag_no_grow_home                 = s5bq17_1__1,
    ag_no_grow_less_labor           = s5bq17_1__2,
    ag_no_grow_restrict             = s5bq17_1__3,
    ag_no_grow_no_seeds             = s5bq17_1__4,
    ag_no_grow_no_fertilizer        = s5bq17_1__5,
    ag_no_grow_no_other             = s5bq17_1__6,
    ag_no_grow_no_outputs           = s5bq17_1__7,
    ag_no_grow_family_ill           = s5bq17_1__8,
    # ag_no_grow_other         = s5bq17_1__n96,
    
    # crop codes used in q18
    ag_crops_grown_1                = s5bq18_1,
    ag_crops_grown_2                = s5bq18_2,
    ag_crops_grown_3                = s5bq18_3,
    
    ag_plant_change                 = s5bq19,
    ag_plant_what_abandoned         = s5bq20__1,
    ag_plant_what_area_reduce       = s5bq20__2,
    ag_plant_what_area_increased    = s5bq20__3,
    ag_plant_what_fast_crops        = s5bq20__4,
    ag_plant_what_less_variety      = s5bq20__5,
    ag_plant_what_more_variety      = s5bq20__6,
    ag_plant_what_delayed           = s5bq20__7,
    ag_plant_what_other             = s5bq20__n96,
    
    ag_plant_how_stay_home          = s5bq21__1,
    ag_plant_how_travel_restrict    = s5bq21__3,
    ag_plant_how_delay_seeds        = s5bq21__4,
    ag_plant_how_delay_fertilizer   = s5bq21__5,
    ag_plant_how_delay_other_input  = s5bq21__6,
    ag_plant_how_delay_sell_outputs = s5bq21__7,
    ag_plant_how_care_ill_fammily   = s5bq21__8,
    ag_plant_how_delayed_planting   = s5bq21__9,
    ag_plant_how_other              = s5bq21__n96,
    
    ag_price_small_banana           = s5bq21a,
    ag_price_medium_banana          = s5bq21b,
    ag_price_large_banana           = s5bq21c,
    ag_price_100kg_cassava_bag      = s5bq21d,
    ag_price_basin_dry_casava_chips = s5bq21e,
    ag_price_kg_dry_cassava_flour   = s5bq21f,
    ag_price_kg_dry_beans           = s5bq21g,
    ag_price_basin_fresh_beans      = s5bq21h,
    ag_price_kg_maize_grains        = s5bq21i,
    
    ag_farm_products_sell_normally  = s5bq23,
    ag_farm_products_revenue_size   = s5bq24,
    
    ag_farm_products_sell_need      = s5bq25,
    ag_farm_products_sell_able      = s5bq26,
    
    ag_farm_products_sale_farm      = s5bq27__1,
    ag_farm_products_sale_day_mrkt  = s5bq27__2,
    ag_farm_products_sale_week_mrkt = s5bq27__3,
    ag_farm_products_sale_other     = s5bq27__n96,

    # Section 8 - Food insecurity experience scale
    food_insufficient_worry         = s8q01,
    food_healthy_lack               = s8q02,
    food_few_kinds                  = s8q03,
    food_skipped_meal               = s8q04,
    food_less_than_expected         = s8q05,
    food_ranout                     = s8q06,
    food_hungry                     = s8q07,
    food_didnt_eat_all_day          = s8q08,
    
#     concerns_covid_hh_serious_illness = s9q01,
#     concerns_covid_threat_hh_finances = s9q02,
#     concerns_symptoms_cough = s9q03__1,
#     concerns_symptoms_breath_shortness = s9q03__2,
#     concerns_symptoms_fever = s9q03__3,
#     concerns_symptoms_chills = s9q03__4,
#     concerns_symptoms_muscle_pain = s9q03__5,
#     concerns_symptoms_headache = s9q03__6,
#     concerns_symptoms_sore_throat = s9q03__7,
#     concerns_symptoms_taste_smell_loss = s9q03__8,
#     concerns_hh_covid_diagnosis = s9q04,
#     concerns_security_risk_covid = s9q05,
#     concerns_covid_response_limit_freedom = s9q06,
#     concerns_misuse_covid_funds = s9q07,
#     concerns_gov_corruption_lower_medical_quality = s9q08,
#     concerns_discomfort_in_house = s9q09
  ) %>% 
  rename_to_lower_snake()

## income loss round 4
renamed_round4_sec_6 <- round_4_sec6 %>% 
  rename(
    hhid = HHID,
    inc_source = s6q01,
    inc_level = s6q02
  ) %>% 
  filter(!income_loss__id == -96) %>% 
  pivot_wider(
    id_cols = hhid, 
    names_from = income_loss__id, 
    values_from = c(inc_source,inc_level), 
    names_sort = TRUE
  ) %>% 
  rename_with(~ gsub("_1$", "_farm", .x))%>% 
  rename_with(~ gsub("_2$", "_nfe", .x))%>% 
  rename_with(~ gsub("_3$", "_wage", .x))%>% 
  rename_with(~ gsub("_4$", "_benefits", .x))%>% 
  rename_with(~ gsub("_5$", "_remittance", .x))%>% 
  rename_with(~ gsub("_6$", "_family", .x))%>% 
  rename_with(~ gsub("_7$", "_non_family", .x))%>% 
  rename_with(~ gsub("_8$", "_assets", .x))%>% 
  rename_with(~ gsub("_9$", "_pension", .x))%>% 
  rename_with(~ gsub("_10$", "_govt", .x))%>% 
  rename_with(~ gsub("_11$", "_ngo", .x))
## inc_level_12 not in survey

renamed_merged_r4 <- renamed_merged_r4 %>% 
  left_join(renamed_round4_sec_6, by = "hhid")

## round 5 ---- 

round_5_interview_result <- read_dta(here("raw_data", "round5", "interview_result.dta")) %>%
  select(c('hhid','Rq09','Rq10'))
round_5_cover  <- read_dta(here( "raw_data", "round5", "cover.dta" )) 

round_5_sec1 <- read_dta(here( "raw_data", "round5", "SEC1.dta" )) 
round_5_sec4  <- read_dta(here( "raw_data", "round5", "sec4.dta" )) 
round_5_sec5  <- read_dta(here( "raw_data", "round5", "sec5.dta" )) 
round_5_sec5a  <- read_dta(here( "raw_data", "round5", "sec5a.dta" )) 
round_5_sec5b  <- read_dta(here( "raw_data", "round5", "sec5b.dta" )) 
# By product; processed at end of round code
round_5_sec5d  <- read_dta(here( "raw_data", "round5", "sec5d.dta" )) 
round_5_sec6  <- read_dta(here( "raw_data", "round5", "sec6.dta" )) 
# sec 7 as sec8
round_5_sec8 <- read_dta(here( "raw_data", "round5", "sec8.dta" )) 
round_5_sec9  <- read_dta(here( "raw_data", "round5", "sec9.dta" )) 


## merge round 5 datasets
merged_r5 <- left_join(round_5_interview_result,round_5_cover, by = c("hhid"))%>% 
  left_join(round_5_sec4, by = c("hhid")) %>% 
  left_join(round_5_sec5, by = c("hhid")) %>% 
  left_join(round_5_sec5a, by = c("hhid")) %>%
  left_join(round_5_sec5b, by = c("hhid")) %>%
  left_join(round_5_sec8, by = c("hhid")) %>% # as sec 7
  left_join(round_5_sec9, by = c("hhid")) %>%
  mutate(survey = 5)

## rename round 5 columns
renamed_merged_r5 <- merged_r5 %>% 
  rename(
    # basic survey information  
    interview_resp           = Rq09,
    interview_language         = Rq10,
    interview_date           = Sq02,
    weight_final           = wfinal, # R5 does not have R1 weight

    # Section 4 - Access
    # Soap questions not in R5
    # Water wash questions not in R5
    # Water drinking questions not in R5
    staple_main           = s4q05,
    staple_lack           = s4q06,
    staple_lack_why         = s4q07,
    
    medicine_no_access         = s4q08,
    medical_treatment_need       = s4q09,
    medical_access           = s4q10,
    medical_access_lack_why     = s4q11,
    
    mask_no_access           = s4q12,
    mask_no_access_why         = s4q13,
    mask_source_gov         = s4q14__1,
    mask_source_buy         = s4q14__2,
    mask_source_home_made       = s4q14__3,
    mask_source_friends_relatives   = s4q14__4,
    mask_source_employer       = s4q14__5,
    
    covid_test_pay_accept       = s4q15,
    covid_test_pay_accept_price   = s4q15_1,
    covid_vac_willing         = s4q16,
    covid_vac_refuse_not_work     = s4q17__1,
    covid_vac_refuse_unsafe     = s4q17__2,
    covid_vac_refuse_side_effects   = s4q17__3,
    covid_vac_refuse_low_risk     = s4q17__4,
    covid_vac_refuse_against_vacs   = s4q17__5,
    covid_vac_refuse_religion     = s4q17__6,
    covid_vac_doubt_wont_work     = s4q18__1,
    covid_vac_doubt_unsafe       = s4q18__2,
    covid_vac_doubt_side_effects   = s4q18__3,
    covid_vac_doubt_no_risk     = s4q18__4,
    covid_vac_doubt_against_vacs   = s4q18__5,
    covid_vac_doubt_religion     = s4q18__6,
    
    # section 5
    
    work_for_pay = s5q01,
    work_return_expect = s5q01a,
    work_return_when = s5q01b,
    work_last_week_why_not = s5q01c,
    work_stop_why = s5q03,
    work_look = s5q03a,
    work_look_how = s5q03b,
    work_same_before = s5q04a,
    work_change_why = s5q04b,
    work_main_prim_descr = s5q05a,
    work_main_business_area = s5q05,
    work_main_business_type = s5q06,
    work_fam_prod_intentions = s5q06a,


#     non_farm_biz_operation = s5aq11,
#     non_farm_biz_closure_why = s5aq11b,
#     non_farm_biz_other_operating = s5aq11b_1,
#     non_farm_biz_other_main_activity = s5a11c_1,
#     non_farm_biz_other_sector = s5aq12_1,
#     non_farm_biz_existing_main_activity = s5a11c,
#     non_farm_biz_existing_sector = s5aq12,
#     
#     non_farm_biz_rev_sales_compared_feb = s5aq13,
#     non_farm_biz_rev_sales_covid = s5aq14_1,
#     non_farm_biz_rev_sales_other = s5aq14_2,
#     non_farm_biz_rev_sales_compared_year = s5aq15,
#     
#     non_farm_biz_temporary_close_status = s5aq11a,
    
    # Section 5b - Agriculture
    ag_case_filter                  = agic_case_filter,
    ag_crops_plant                  = s5bq16,
    ## crop by code
    ag_crops_grown_1                = s5bq18_1,
    ag_crops_grown_2                = s5bq18_2,
    ag_crops_grown_3                = s5bq18_3,
    
    ag_plant_change                 = s5bq19,
    ag_plant_what_abandoned         = s5bq20__1,
    ag_plant_what_area_reduced      = s5bq20__2,
    ag_plant_what_area_increased    = s5bq20__3,
    ag_plant_what_fast_crops        = s5bq20__4,
    ag_plant_what_less_variety      = s5bq20__5,
    ag_plant_what_more_variety      = s5bq20__6,
    ag_plant_what_delayed           = s5bq20__7,
    
    ag_plant_how_stay_home          = s5bq21__1,
    ag_plant_how_travel_restrict    = s5bq21__3,
    ag_plant_how_delay_seeds        = s5bq21__4,
    ag_plant_how_delay_fertilizer   = s5bq21__5,
    ag_plant_how_delay_other_input  = s5bq21__6,
    ag_plant_how_delay_sell_outputs = s5bq21__7,
    ag_plant_how_care_ill_fammily   = s5bq21__8,
    ag_plant_how_delayed_planting   = s5bq21__9,
    
    ag_main_crop                    = s5bq21a,
    ag_main_crop_completed_plant    = s5bq21b,
    ag_main_crop_area_acres         = s5bq21c,
    ag_main_crop_expect_output      = s5bq21d,
    
    ag_farm_products_sell_normally  = s5bq23,
    ag_farm_products_revenue_size   = s5bq24,
    
    ag_farm_products_sell_need      = s5bq25,
    ag_farm_products_sell_able      = s5bq26,
    
    ag_farm_products_sale_farm      = s5bq27__1,
    ag_farm_products_sale_day_mrkt  = s5bq27__2,
    ag_farm_products_sale_week_mrkt = s5bq27__3,
    
    # Section 8 - Food insecurity experience scale
    food_insufficient_worry         = s8q01,
    food_healthy_lack               = s8q02,
    food_few_kinds                  = s8q03,
    food_skipped_meal               = s8q04,
    food_less_than_expected         = s8q05,
    food_ranout                     = s8q06,
    food_hungry                     = s8q07,
    food_didnt_eat_all_day          = s8q08,
    
#     concerns_covid_hh_serious_illness = s9q01,
#     concerns_covid_threat_hh_finances = s9q02,
#     concerns_relative_infected_covid = s9q03a,
#     concerns_covid_infection_even_not_tested = s9q03b,
#     concerns_symptoms_cough = s9q03__1,
#     concerns_symptoms_breath_shortness = s9q03__2,
#     concerns_symptoms_fever = s9q03__3,
#     concerns_symptoms_chills = s9q03__4,
#     concerns_symptoms_muscle_pain = s9q03__5,
#     concerns_symptoms_headache = s9q03__6,
#     concerns_symptoms_sore_throat = s9q03__7,
#     concerns_symptoms_taste_smell_loss = s9q03__8,
#     concerns_hh_covid_diagnosis = s9q04,
#     concerns_security_risk_covid = s9q05,
#     concerns_covid_response_limit_freedom = s9q06,
#     concerns_misuse_covid_funds = s9q07,
#     concerns_gov_corruption_lower_medical_quality = s9q08,
#     concerns_discomfort_in_house = s9q09,
#     concerns_bothered_by_little_pleasure_in_enjoyments = s9q10_1,
#     concerns_sad_down_depressed = s9q10_2,
#     concerns_sleep_issues = s9q10_3,
#     concerns_tired_burdened = s9q10_4,
#     concerns_appetite_loss =s9q10_5,
#     concerns_self_worth_loss = s9q10_6,
#     concerns_concentrating_work = s9q10_7,
#     concerns_motion_speaking_change = s9q10_8
   ) %>% 
   rename_to_lower_snake()

# Livestock product by product - Section 5d
round_5_sec5d  <- round_5_sec5d %>% 
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


## income loss round 5
renamed_round5_sec_6 <- round_5_sec6 %>% 
  rename(
    inc_source = s6q01,
    inc_level = s6q02
  ) %>% 
  filter(!income_loss__id == -96) %>% 
  pivot_wider(
    id_cols = hhid, 
    names_from = income_loss__id, 
    values_from = c(inc_source,inc_level), 
    names_sort = TRUE
  ) %>% 
  rename_with(~ gsub("_1$", "_farm", .x))%>% 
  rename_with(~ gsub("_2$", "_nfe", .x))%>% 
  rename_with(~ gsub("_3$", "_wage", .x))%>% 
  rename_with(~ gsub("_4$", "_benefits", .x))%>% 
  rename_with(~ gsub("_5$", "_remittance", .x))%>% 
  rename_with(~ gsub("_6$", "_family", .x))%>% 
  rename_with(~ gsub("_7$", "_non_family", .x))%>% 
  rename_with(~ gsub("_8$", "_assets", .x))%>% 
  rename_with(~ gsub("_9$", "_pension", .x))%>% 
  rename_with(~ gsub("_10$", "_govt", .x))%>% 
  rename_with(~ gsub("_11$", "_ngo", .x))
## inc_level_12 not in survey

renamed_merged_r5 <- renamed_merged_r5 %>% 
  left_join(renamed_round5_sec_6, by = "hhid") %>% 
  left_join(round_5_sec5d, by = "hhid")



## round 6 ----

round_6_interview_result <- read_dta(here("raw_data", "round6", "interview_result.dta")) %>%
  select(c('hhid','Rq09','Rq10'))
round_6_cover  <- read_dta(here( "raw_data", "round6", "cover.dta" )) 

round_6_sec1 <- read_dta(here( "raw_data", "round6", "sec1.dta" )) 
round_6_sec4_1 <- read_dta(here( "raw_data", "round6", "sec4_1.dta" )) 
round_6_sec4_2 <- read_dta(here( "raw_data", "round6", "sec4_2.dta" )) 
round_6_sec5a  <- read_dta(here( "raw_data", "round6", "sec5a.dta" )) 
round_6_sec5b  <- read_dta(here( "raw_data", "round6", "sec5b.dta" )) 
# By product; processed at end of round code
round_6_sec5d  <- read_dta(here( "raw_data", "round6", "sec5d.dta" )) 
# Next two are work-related questions for respondent and one random household
# member; the random household member data are not incorporated
round_6_sec5_resp <- read_dta(here( "raw_data", "round6", "sec5_resp.dta" ))
round_6_sec5_other <- read_dta(here( "raw_data", "round6", "sec5_other.dta" ))
round_6_sec6  <- read_dta(here( "raw_data", "round6", "sec6.dta" )) 
#  sec7 as sec8
round_6_sec8  <- read_dta(here( "raw_data", "round6", "sec8.dta" )) 
round_6_sec9  <- read_dta(here( "raw_data", "round6", "sec9.dta" )) 


## merge round6 datasets
merged_r6 <- left_join(round_6_interview_result,round_6_cover, by = c("hhid")) %>% 
  left_join(round_6_sec4_1, by = c("hhid")) %>% 
  left_join(round_6_sec4_2, by = c("hhid")) %>% 
  left_join(round_6_sec5_resp, by = c("hhid"))%>% 
  left_join(round_6_sec5_other, by = c("hhid")) %>% 
  left_join(round_6_sec5a, by = c("hhid")) %>% 
  left_join(round_6_sec5b, by = c("hhid")) %>% 
  left_join(round_6_sec8, by = c("hhid")) %>% 
  left_join(round_6_sec9, by = c("hhid")) %>% 
  mutate(survey = 6)

## rename round6 columns
renamed_merged_r6 <- merged_r6 %>% 
  rename( 
    # basic survey information   
    interview_resp           = Rq09,
    interview_language         = Rq10,
    interview_date           = Sq02,
    weight_final           = wfinal, # R6 does not have R1 weight

    # Section 4 - Access
    # Medical access questions are slightly different. 
    # R6 asks about treatment *and* consultations
    # Also, the access questions are by type of treatment/consult needed
    # These need to be combined for analyses if needed
    soap_wash             = s4q01,
    soap_wash_lack_why         = s4q02,
    
    water_wash             = s4q03,
    water_wash_lack_why       = s4q04,
    
    buy_maize_flour         = s4q04_1__1,
    buy_rice             = s4q04_1__2,
    buy_beans             = s4q04_1__3,
    
    price_kg_maize           = s4q04_2,
    price_kg_rice           = s4q04_3,
    price_kg_beans_fresh       = s4q04_4,
    price_kg_beans_dra         = s4q04_5,

    medicine_no_access         = s4q08,
    medical_treatment_need       = s4q19,
    medical_need_fp         = s4q20__1,
    medical_need_vac         = s4q20__2,
    medical_need_maternal       = s4q20__3,
    medical_need_child_health     = s4q20__4,
    medical_need_adult_health     = s4q20__5,
    medical_need_emergency_care   = s4q20__6,
    medical_need_pharmacy       = s4q20__7,
    medical_type_1                = medical_access__id_1,
    medical_access_1              = s4q21_1,
    medical_access_lack_why_1     = s4q22_1,
    medical_type_2                = medical_access__id_2,
    medical_access_2              = s4q21_2,
    medical_access_lack_why_2     = s4q22_2,
    medical_type_3                = medical_access__id_3,
    medical_access_3              = s4q21_3,
    medical_access_lack_why_3     = s4q22_3,
    
    mask_no_access           = s4q12,
    mask_no_access_why         = s4q13,
    mask_source_gov         = s4q14__1,
    mask_source_buy         = s4q14__2,
    mask_source_home_made       = s4q14__3,
    mask_source_friends_relatives   = s4q14__4,
    mask_source_employer       = s4q14__5,

    # section 5
    
    work_for_pay = s5q01,
    work_return_expect = s5q01a,
    work_return_when = s5q01b,
    work_last_week_why_not = s5q01c,
    work_stop_why = s5q03,
    work_look = s5q03a,
    work_look_how = s5q03b,
    work_same_before = s5q04a,
    work_change_why = s5q04b,
    work_main_prim_descr = s5q05a,
    work_main_business_area = s5q05,
    work_main_business_type = s5q06,
    
    work_fam_prod_intentions = s5q06a,
    work_hours = s5q8b1,
    work_hours_usually = s5q8c1,
    
    
#     #s5oq0b_1 not is survey,
#     work_individual_available_respond = s5Oq0b,
#     work_individual_responding = s5Oq0c,
#     work_done_for_pay = s5Oq01,
#     work_return_expect = s5Oq01a,
#     work_secured_return = s5Oq01b,
#     work_missed_previously_why = s5Oq01c,
#     work_secured_return_type = s5Oq01d,
#     work_to_find_job = s5Oq03a,
#     work_look_how = s5Oq03b,
#     work_done_previously_type = s5Oq06,
#     work_farm_products_intentions = s5Oq06a,
#     work_main_primary_description = s5Oq05a,
#     work_sector = s5Oq05,
#     work_hours = s5Oq8b1,
#     work_hours_usual = s5Oq8c1,
#     
#     non_farm_biz_operation = s5aq11,
#     non_farm_biz_closure_why = s5aq11b,
#     non_farm_biz_another = s5aq11b_1,
#     non_farm_new_biz_main_activity = s5a11c_1,
#     non_farm_new_biz_sector = s5aq12_1,
#     non_farm_existing_biz_main_activity = s5a11c,
#     non_farm_existing_biz_sector = s5aq12,
#     
#     non_farm_biz_rev_sales_compared_feb = s5aq13,
#     non_farm_biz_rev_sales_covid = s5aq14_1,
#     non_farm_biz_rev_sales_other = s5aq14_2,
#     non_farm_biz_rev_sales_compared_year = s5aq15,
#     
#     non_farm_biz_temporary_close_status = s5aq11a,
    
    # Section 5B - Agriculture
    ag_crops_plant                  = t0_s5bq16_R4,
    ag_crops_grown_1                = t0_s5bq18_1,
    ag_crops_grown_2                = t0_s5bq18_2,
    ag_crops_grown_3                = t0_s5bq18_3,
    
    ag_price_small_banana           = s5bq21_1,
    ag_price_medium_banana          = s5bq21_2,
    ag_price_large_banana           = s5bq21_3,
    ag_price_kg_dry_beans           = s5bq21_7,
    ag_price_basin_fresh_beans      = s5bq21_9,
    ag_price_kg_maize_grains        = s5bq21_8,
    
    ag_farm_products_sell_normally  = s5bq23,
    ag_farm_products_revenue_size   = s5bq24,
    
    ag_farm_products_sell_need      = s5bq25,
    ag_farm_products_sell_able      = s5bq26,
    
    ag_farm_products_sale_farm      = s5bq27__1,
    ag_farm_products_sale_day_mrkt  = s5bq27__2,
    ag_farm_products_sale_week_mrkt = s5bq27__3,
    
    # Section 8 - Food insecurity experience scale
    food_insufficient_worry         = s8q01,
    food_healthy_lack               = s8q02,
    food_few_kinds                  = s8q03,
    food_skipped_meal               = s8q04,
    food_less_than_expected         = s8q05,
    food_ranout                     = s8q06,
    food_hungry                     = s8q07,
    food_didnt_eat_all_day          = s8q08,
    
#     concerns_covid_hh_serious_illness = s9q01,
#     concerns_covid_threat_hh_finances = s9q02,
#     concerns_relative_infected_covid = s9q03a,
#     concerns_covid_infection_even_not_tested = s9q03b,
#     concerns_symptoms_cough = s9q03__1,
#     concerns_symptoms_breath_shortness = s9q03__2,
#     concerns_symptoms_fever = s9q03__3,
#     concerns_symptoms_chills = s9q03__4,
#     concerns_symptoms_muscle_pain = s9q03__5,
#     concerns_symptoms_headache = s9q03__6,
#     concerns_symptoms_sore_throat = s9q03__7,
#     concerns_symptoms_taste_smell_loss = s9q03__8,
#     concerns_hh_covid_diagnosis = s9q04,
#     concerns_security_risk_covid = s9q05,
#     concerns_covid_response_limit_freedom = s9q06,
#     concerns_misuse_covid_funds = s9q07,
#     concerns_gov_corruption_lower_medical_quality = s9q08,
#     concerns_discomfort_in_house = s9q09,
#     ## question 10 not in survey but data available hence questions considered as in earlier rounds
#     concerns_bothered_by_little_pleasure_in_enjoyments = s9q10_1,
#     concerns_sad_down_depressed = s9q10_2,
#     concerns_sleep_issues = s9q10_3,
#     concerns_tired_burdened = s9q10_4,
#     concerns_appetite_loss =s9q10_5,
#     concerns_self_worth_loss = s9q10_6,
#     concerns_concentrating_work = s9q10_7,
#     concerns_motion_speaking_change = s9q10_8
   ) %>% 
   rename_to_lower_snake()

# Livestock product by product - Section 5d
round_6_sec5d  <- round_6_sec5d %>%
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


## income loss round 6
renamed_round6_sec_6 <- round_6_sec6 %>% 
  rename(
    inc_source = s6q01,
    inc_level = s6q02
  ) %>% 
  filter(!income_loss__id == -96) %>% 
  pivot_wider(
    id_cols = hhid, 
    names_from = income_loss__id, 
    values_from = c(inc_source,inc_level), 
    names_sort = TRUE
  ) %>% 
  rename_with(~ gsub("_1$", "_farm", .x))%>% 
  rename_with(~ gsub("_2$", "_nfe", .x))%>% 
  rename_with(~ gsub("_3$", "_wage", .x))%>% 
  rename_with(~ gsub("_4$", "_benefits", .x))%>% 
  rename_with(~ gsub("_5$", "_remittance", .x))%>% 
  rename_with(~ gsub("_6$", "_family", .x))%>% 
  rename_with(~ gsub("_7$", "_non_family", .x))%>% 
  rename_with(~ gsub("_8$", "_assets", .x))%>% 
  rename_with(~ gsub("_9$", "_pension", .x))%>% 
  rename_with(~ gsub("_10$", "_govt", .x))%>% 
  rename_with(~ gsub("_11$", "_ngo", .x))
## inc_level_12 not in survey

renamed_merged_r6 <- renamed_merged_r6 %>% 
  left_join(renamed_round6_sec_6, by = "hhid") %>% 
  left_join(round_6_sec5d, by = "hhid")



## round 7 ---- 

round_7_interview_result <- read_dta(here("raw_data", "round7", "interview_result.dta")) %>%
  select(c('HHID','Rq09','Rq10'))
round_7_cover  <- read_dta(here( "raw_data", "round7", "Cover.dta" )) 

round_7_sec1    <- read_dta(here( "raw_data", "round7", "SEC1.dta" )) 
round_7_sec4    <- read_dta(here( "raw_data", "round7", "SEC4_1.dta" )) 
round_7_sec5a   <- read_dta(here( "raw_data", "round7", "SEC5A.dta" )) 
round_7_sec5    <- read_dta(here( "raw_data", "round7", "SEC5.dta" )) #3 respondent
round_7_sec6e1  <- read_dta(here( "raw_data", "round7", "SEC6E_1.dta" )) 
round_7_sec6e2  <- read_dta(here( "raw_data", "round7", "SEC6E_2.dta" )) # crop level; see below for pivot/merge
round_7_sec8    <- read_dta(here( "raw_data", "round7", "SEC8.dta" )) 
round_7_sec9    <- read_dta(here( "raw_data", "round7", "SEC9.dta" )) 


## merge round 7 datasets
merged_r7 <- left_join(round_7_interview_result,round_7_cover, by = c("HHID")) %>% 
  left_join(round_7_sec4, by = c("HHID")) %>% 
  left_join(round_7_sec5, by = c("HHID")) %>% 
  left_join(round_7_sec5a, by = c("HHID")) %>% 
  left_join(round_7_sec6e1, by = c("HHID")) %>%
  left_join(round_7_sec8, by = c("HHID")) %>% 
  left_join(round_7_sec9, by = c("HHID")) %>% 
  mutate(survey = 7)


## renaming merged round 7
renamed_merged_r7 <- merged_r7 %>% 
  mutate(s4q15 = recode(
    # Medicine question went from unable to able in R7, so swap yes/no
    s4q15, "1" = 2, "2" = 1 
  )) %>% 
  rename(
    # basic survey information  
    interview_resp           = Rq09,
    interview_language         = Rq10,
    interview_date           = Sq02,
    weight_final           = wfinal, # R7 does not have R1 weight
    
    # Section 4 - Access
    # Medical treatment needs to be pivoted before adding (after adding SEC4_2.dta to data loading)
    mask_no_access           = s4q12,
    mask_no_access_why         = s4q13,
    mask_source_gov         = s4q14__1,
    mask_source_buy         = s4q14__2,
    mask_source_home_made       = s4q14__3,
    mask_source_friends_relatives   = s4q14__4,
    mask_source_employer       = s4q14__5,
    mask_source_other         = s4q14__n96,
    
    medicine_no_access         = s4q15,
    
    # section 5
    
    work_for_pay = s5q01,
    work_return_expect = s5q01a,
    work_return_when = s5q01b,
    work_last_week_why_not = s5q01c,
    work_stop_why = s5q03,
    work_look = s5q03a,
    work_look_how = s5q03b,
    work_same_before = s5q04a,
    work_change_why = s5q04b,
    work_main_prim_descr = s5q05a,
    work_main_business_area = s5q05,
    work_main_business_type = s5q06,
    work_fam_prod_intentions = s5q06a,
    
    work_safety_disinfectant = s5q08f__1,
    work_safety_sanitizer = s5q08f__2,
    work_safety_awareness = s5q08f__3,
    work_safety_mask = s5q08f__4,
    work_safety_gloves = s5q08f__5,
    work_safety_from_home = s5q08f__6,
    work_safety_office_closed = s5q08f__7,
    work_safety_none = s5q08f__8,
    work_safety_other = s5q08f__96,
    work_safety_followed_resp = s5q08g, ## should i make it the same as in round 3 where they were asking if collegues follow ?
    work_safety_followed_percentage = s5q08g_1,
    
    work_hours = s5q8b1,
    work_hours_usually = s5q8c1,    
    
#     non_farm_biz_operation = s5aq11,
#     non_farm_biz_status = s5aq11a,
#     non_farm_biz_closure_why = s5aq11b,
#     non_farm_biz_another = s5aq11b_1,
#     non_farm_new_biz_main_activity = s5a11c_1,
#     non_farm_new_biz_sector = s5aq12_1,
#     non_farm_existing_biz_main_activity = s5aq11c,
#     non_farm_existing_biz_sector = s5aq12,
#     non_farm_biz_rev_sales_compared_apr = s5aq13,
#     non_farm_biz_rev_sales_why = s5aq14_1,
#     non_farm_biz_rev_sales_why_other = s5aq14_2,
#     non_farm_biz_rev_sales_compared_year = s5aq15,
#     
#     change_biz_conduct = s5aq15a,
#     changes_to_be_made_in_biz_wear_mask = s5aq15b__1,
#     changes_to_be_made_in_biz_distancing = s5aq15b__2,
#     changes_to_be_made_in_biz_few_customers_at_once = s5aq15b__3,
#     changes_to_be_made_in_biz_phone_media_market = s5aq15b__4,
#     changes_to_be_made_in_biz_deliveries_only = s5aq15b__5,
#     changes_to_be_made_in_biz_product_offering = s5aq15b__6,
#     changes_to_be_made_in_biz_no_change = s5aq15b__7,
#     changes_to_be_made_in_biz_other = s5aq15b__n96,
#     
#     work_done_for_pay_resp = s5q01,
#     work_return_expect_resp = s5q01a,
#     work_return_when = s5q01b,   
#     work_last_week_why_not = s5q01c,
#     work_stop_why_resp = s5q03,
#     work_to_find_job_resp = s5q03a,
#     work_look_how_resp  = s5q03b,
#     work_same_as_last_time_resp = s5q04a,
#     work_change_why_resp = s5q04b,
#     work_main_primary_activities_resp = s5q05a,
#     work_main_business_area = s5q05, 
#     work_main_business_type = s5q06,
#     
#     family_products_intentions_resp = s5q06a,
#     
#     safety_measures_by_employer_disinfectants = s5q08f__1,
#     safety_measures_by_employer_sanitizer = s5q08f__2,
#     safety_measures_by_employer_preventative = s5q08f__3,
#     safety_measures_by_employer_mask = s5q08f__4,
#     safety_measures_by_employer_gloves = s5q08f__5,
#     safety_measures_by_employer_work_home = s5q08f__6,
#     safety_measures_by_employer_closed_office = s5q08f__7,
#     safety_measures_by_employer_none = s5q08f__8,
#     safety_measures_by_employer_other = s5q08f__96,
#     safety_measures_followed = s5q08g,
#     safety_measures_followed_percentage = s5q08g_1,
#     
#     work_hours_primary_activity_previously_resp =s5q8b1,
#     work_hours_primary_activity_usually_resp = s5q8c1,

  # Section 6E - Agriculture - section 1
    ag_crops_plant                  = s6eq16,
    
    ag_crops_grown_1                = s5bq18__0, ## crops codes
    ag_crops_grown_2                = s5bq18__1,
    ag_crops_grown_3                = s5bq18__0,
    
    ag_plant_change                 = s6eq19,
    ag_plant_what_abandoned         = s6eq20__1,
    ag_plant_what_area_reduce       = s6eq20__2,
    ag_plant_what_area_increase     = s6eq20__3,
    ag_plant_what_fast_crops        = s6eq20__4,
    ag_plant_what_less_variety      = s6eq20__5,
    ag_plant_what_more_variety      = s6eq20__6,
    ag_plant_what_delayed           = s6eq20__7,
    ag_plant_what_other             = s6eq20__n96,

    ag_plant_how_stay_home          = s6eq21__1,
    ag_plant_how_reduced_labor      = s6eq21__2,
    ag_plant_how_travel_restrict    = s6eq21__3,
    ag_plant_how_delay_seeds        = s6eq21__4,
    ag_plant_how_delay_fertilizer   = s6eq21__5,
    ag_plant_how_delay_other_input  = s6eq21__6,
    ag_plant_how_delay_sell_output  = s6eq21__7,
    ag_plant_how_care_ill_family    = s6eq21__8,
    ag_plant_how_delayed_planting   = s6eq21__9,
    ag_plant_how_other              = s6eq21__n96,
  
    ag_no_grow_home                 = s6eq21a__1,
    ag_no_grow_less_labor           = s6eq21a__2,
    ag_no_grow_restrict             = s6eq21a__3,
    ag_no_grow_no_seeds             = s6eq21a__4,
    ag_no_grow_no_other             = s6eq21a__5,
    ag_no_grow_no_outputs           = s6eq21a__6,
    ag_no_grow_family_ill           = s6eq21a__7,
    ag_no_grow_delay_planting       = s6eq21a__8,
    ag_no_grow_not_farmer           = s6eq21a__9,
    ag_no_grow_other                = s6eq21a__n96,
    
    ag_plots_how_many               = s6eq21c,
  
    ag_farm_products_sell_normally  = s6eq23,
    ag_farm_products_revenue_size   = s6eq24,
    ag_farm_products_sell_need      = s6eq25,
    ag_farm_products_sell_able      = s6eq26,
    
    ag_farm_products_sale_farm      = s6eq27__1,
    ag_farm_products_sale_day_mrkt  = s6eq27__2,
    ag_farm_products_sale_week_mrkt = s6eq27__3,
    ag_farm_products_sale_other     = s6eq27__n96,

    # Section 6E - Agriculture - section 2 
    # crop level; see below for pivot/merge
    
    # Section 8 - Food insecurity experience scale
    food_insufficient_worry         = s8q01,
    food_healthy_lack               = s8q02,
    food_few_kinds                  = s8q03,
    food_skipped_meal               = s8q04,
    food_less_than_expected         = s8q05,
    food_ranout                     = s8q06,
    food_hungry                     = s8q07,
    food_didnt_eat_all_day          = s8q08,
    
#     concerns_relative_infected_covid = s9q03a,
#     concerns_covid_infection_even_not_tested = s9q03b,
#     concerns_hh_covid_diagnosis = s9q04,
#     concerns_covid_drug_modern = s9q05__1,
#     concerns_covid_drug_herbal_medicine = s9q05__2,
#     concerns_covid_drug_local_herbs = s9q05__3,
#     concerns_covid_drug_none = s9q05__4,
#     concerns_covid_drug_other = s9q05__n98,
#     concerns_covid_trusted_treatment = s9q06,
#     concerns_covid_vac_availability_knowledge = s9q10,
#     concerns_covid_vac_availability_info_source_poster = s9q10b__1,
#     concerns_covid_vac_availability_info_source_radio = s9q10b__2,
#     concerns_covid_vac_availability_info_source_tv = s9q10b__3,
#     concerns_covid_vac_availability_info_source_sms = s9q10b__4,
#     concerns_covid_vac_availability_info_source_phone = s9q10b__5,
#     concerns_covid_vac_availability_info_source_newspaper = s9q10b__6,
#     concerns_covid_vac_availability_info_source_social_media = s9q10b__7,
#     concerns_covid_vac_availability_info_source_healthcare = s9q10b__8,
#     concerns_covid_vac_availability_info_source_ngo = s9q10b__9,
#     concerns_covid_vac_availability_info_source_other_outreach = s9q10b__10,
#     concerns_covid_vac_availability_info_source_local_authority = s9q10b__11,
#     concerns_covid_vac_availability_info_source_family_neighbors = s9q10b__12,
#     concerns_covid_vac_availability_info_source_traditional_healer = s9q10b__13,
#     concerns_covid_vac_availability_info_source_other = s9q10b__n96,
#     concerns_covid_vac_priority_groups_knowledge = s9q10c,
#     concerns_covid_vac_priority_group_individual_included = s9q10d,
#     concerns_covid_vaccinated = s9q11,
#     concerns_covid_no_second_vac_shot_why = s9q11b,
#     concerns_covid_vac_tried = s9q11c,
#     concerns_covid_not_vaccinated_why = s9q11d,
#     concerns_covid_vac_received = s9q12,
#     concerns_approved_free_covid_vac_accept = s9q13,
#     concerns_covid_unvac_main_why = s9q14,
#     concerns_covid_vac_type_wanted = s9q15
   ) %>% 
   rename_to_lower_snake()

# Agricultural section 6e_2 is at crop level
round_7_sec6e2  <- round_7_sec6e2 %>% 
  select(-interview__id) %>% 
  group_by(HHID) %>% 
  mutate(
    crop_number = row_number()
  ) %>% 
  relocate(
    crop_number, .after = HHID
  ) %>% 
  rename(
    hhid                    = HHID,
    id                      = crop__id,
    area                    = s6eq21d,
    expect_output           = s6eq21e,
    expect_why_better       =  s6eq21f,
    expect_why_less         =  s6eq21g
  ) %>% 
  pivot_wider(
    id_cols = hhid,
    names_from = crop_number,
    names_glue = "ag_crop_{crop_number}_{.value}",
    values_from = c("id", area, starts_with("expect"))
  )

renamed_merged_r7 <- renamed_merged_r7 %>% 
  left_join(round_7_sec6e2, by = "hhid")


# merging all and saving ----
all_rounds_df <- bind_rows(
  renamed_merged_r1,
  renamed_merged_r2,
  renamed_merged_r3,
  renamed_merged_r4,
  renamed_merged_r5,
  renamed_merged_r6,
  renamed_merged_r7) %>%
  select(
    -starts_with("BSEQ", ignore.case = TRUE),
    -interview_name,
    -weight_round_1,
    -ends_with("code2"), -ends_with("name2") # only a few in R3
    ) %>% 
  mutate(
    hh_size = hhsize
  ) %>% 
  relocate(
    hhid, survey,
    starts_with("interview"),
    starts_with("weight"),
    region, urban, starts_with("district"), starts_with("county"), 
    hh_size, # currently only in R1!
    starts_with("food"), # Food insecurity experience scale
    starts_with("soap"),
    starts_with("water"),
    starts_with("staple"),
    starts_with("medi"),
    starts_with("staple"),
    starts_with("ag_"),
    starts_with("work_")
  ) %>% 
  arrange(
    hhid, survey
  )

all_rounds_df %>% 
  write_rds(here("data", "base.rds"))

all_rounds_df %>% 
  write_dta(
    here("data", "base.dta"),
    version = 14,
    )


