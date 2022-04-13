# Load data
library(tidyverse)
library(haven)
library(here)

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

## rename hhid to HHID in round1 sec1 data
round_1_sec1 <- round_1_sec1 %>%
  rename(HHID = hhid)

## merge round1 datasets
merged_r1 <- left_join(round_1_interview_result, round_1_cover, by = c("HHID")) %>% 
  left_join(round_1_sec4, by = c("HHID")) %>% 
  left_join(round_1_sec5, by = c("HHID")) %>% 
  left_join(round_1_sec5a, by = c("HHID")) %>% 
  left_join(round_1_sec7, by = c("HHID")) %>%
  left_join(round_1_sec8, by = c("HHID")) %>% 
  mutate(round = 1)


## rename round1 columns
renamed_merged_r1 <- merged_r1 %>% 
  rename(
    interviewer_main_resp = Rq09,
    interview_language = Rq10,
    interviewer_name = Sq01,
    interview_date = Sq02,
    
    base_weight = w1,
    
    soap_wash_hands = s4q01,
    soap_wash_hands_lack_reason = s4q02,
    soap_wash_hands_lack_reason_other = s4q02_Other,
    
    water_wash_hands = s4q03,
    water_wash_hands_lack_reason = s4q04,
    water_wash_hands_lack_reason_other = s4q04_Other,
    
    staple_food_main = s4q05,
    staple_food_lack = s4q06,
    staple_food_lack_reason = s4q07,
    staple_food_lack_specific_reason = s4q07_Other,
    
    sauce_main_consumed = s4q07a,
    sauce_buy_unable = s4q07b,
    sauce_buy_unable_reason = s4q07c,
    sauce_buy_unable_reason_other = s4q07c_Other,
    
    medicine_access = s4q08,
    medical_treatment_needed = s4q09,
    medical_access = s4q10,
    medical_access_lack_reason = s4q11,
    medical_access_lack_specific_reason = s4q11_Other,
    
    child_3_to_18 = s4q012,
    
    school_closed_covid = s4q013,
    school_closed_education_after = s4q014,
    
    children_education_engage_assignments_completed = s4q15__1,
    children_education_engage_mobile_learning =s4q15__2,
    children_education_engage_tv_programs = s4q15__3,
    children_education_engage_radio_programs =s4q15__4,
    children_education_engage_tutor = s4q15__5,
    children_education_engage_government_materials = s4q15__6,
    children_education_engage_other = s4q15__n96,
    
    teacher_contact = s4q16,
    teacher_contact_channel_sms = s4q17__1,
    teacher_contact_channel_online_applications = s4q17__2,
    teacher_contact_channel_email = s4q17__3,
    teacher_contact_channel_mail = s4q17__4,
    teacher_contact_channel_telephone = s4q17__5,
    teacher_contact_channel_whatsapp =s4q17__6,
    teacher_contact_channel_facebook = s4q17__7,
    teacher_contact_channel_physically = s4q17__8,
    teacher_contact_channel_others = s4q17__n96,
    
    financial_institution_access = s4q18,
    financial_institution_access_success = s4q19,
    financial_institution_access_reason = s4q20,
    financial_institution_access_reason_specific = s4q20_Other,
    
    education_level_highest = s5q01a,
    
    work_done_for_pay = s5q01,
    working_before_march = s5q02,
    work_stop_reason = s5q03,
    work_main_activity = s504,
    work_same_as_before = s5q04a,
    work_change_reason = s5q04b,
    work_before_main_activity = s504c,
    work_current_main_activity = s5q05,
    work_current_area = s5q06,
    work_as_usual = s5q07,
    work_unusually_but_payed = s5q08,
    work_unusually_reason = s5q08a,
    work_benefits_health_insurance = s5q08b__1,
    work_benefits_paid_sick_leave = s5q08b__2,
    work_benefits_pension = s5q08b__3,
    work_benefits_paid_annual_leave = s5q08b__4,
    work_written_contract = s5q08c,
    
    hh_not_able_work = s5q09,
    hh_not_able_work_roster0 = s5q10__0, ## from roster
    hh_not_able_work_roster1 = s5q10__1,
    hh_not_able_work_roster2 = s5q10__2,
    hh_not_able_work_roster3 = s5q10__3,
    hh_not_able_work_roster4 = s5q10__4,
    hh_not_able_work_roster5 = s5q10__5,
    hh_not_able_work_roster6 = s5q10__6,
    hh_not_able_work_roster7 = s5q10__7,
    hh_not_able_work_roster8 = s5q10__8,
    hh_not_able_work_roster9 = s5q10__9,
    
    non_farm_business_operation = s5q11,
    non_farm_business_sector = s5q12,
    non_farm_business_revenue_level= s5q13,
    non_farm_business_revenue_level_reason = s5q14,
    
    ag_worked_land_preparation = s5aq16,
    ag_plan_growing_crops = s5aq17,
    ag_crops_not_grown_reason_stay_home = s5qaq17_1,
    ag_crops_not_grown_reason__other = s5qaq17_1_Other,
    ag_crops_grown0 = s5aq18__0, ## crops codes
    ag_crops_grown1 = s5aq18__1,
    ag_crops_grown2 = s5aq18__2,
    ag_hh_farm_progress = s5aq19,
    
    crop_planting_change_abandoned = s5aq20__1,
    crop_planting_change_reduced_planting_area = s5aq20__2,
    crop_planting_change_increased_planting_area = s5aq20__3,
    crop_planting_change_fast_crops = s5aq20__4,
    crop_planting_change_less_variety = s5aq20__5,
    crop_planting_change_more_variety = s5aq20__6,
    crop_planting_change_delayed_planting = s5aq20__7,
    crop_planting_change_other = s5aq20__n96,
    
    covid_affect_planting_stayed_home = s5aq21__1,
    covid_affect_planting_reduced_labor = s5aq21__2,
    covid_affect_planting_travel_restrictions = s5aq21__3,
    covid_affect_planting_delayed_seeds = s5aq21__4,
    covid_affect_planting_delayed_fertilizer = s5aq21__5,
    covid_affect_planting_delayed_other_inputs = s5aq21__6,
    covid_affect_planting_delayed_sell_outputs = s5aq21__7,
    covid_affect_planting_care_family_member = s5aq21__8,
    covid_affect_planting_delayed_planting = s5aq21__9,
    covid_affect_planting_other = s5aq21__n96,
    
    seeds_unable_transport_shops_stock_ranout = s5aq22__1,
    seeds_unable_transport_markets_closed = s5aq22__2,
    seeds_unable_transport_limited_transport = s5aq22__3,
    seeds_unable_transport_travel_restrictions = s5aq22__4,
    seeds_unable_transport_price_increase = s5aq22__5,
    seeds_unable_transport_money_lack = s5aq22__6,
    seeds_unable_transport_other = s5aq22__n96,
    
    fertilizer_not_transported_reason = s5aq23,
    fertilizer_not_transported_reason_other = s5aq23_Other,
    
    transport_inability_ag_inputs_reason = s5aq24,
    transport_inability_ag_inputs_reason_other = s5aq24_Other,
    
    locust_lost_crops = s5aq25,
    
    livestock_raised_in_hh = s5aq26,
    
    hh_farm_progress = s5aq27,
    
    livestock_activities_change_treat_self = s5aq28__1,
    livestock_activities_change_couldnt_vaccinate = s5aq28__2,
    livestock_activities_change_couldnt_deworm = s5aq28__3,
    livestock_activities_change_postpone_insermination = s5aq28__4,
    livestock_activities_change_change_feed_ratio = s5aq28__5,
    livestock_activities_change_cant_sell_animal = s5aq28__6,
    livestock_activities_change_change_water_given = s5aq28__7,
    
    locust_grazing_lands = s5aq29,
    
    farm_products_needed_sell = s5aq30,
    farm_products_sell_ability = s5aq31,
    
    food_insufficient_worry = s7q01,
    food_healthy_lack = s7q02,
    food_few_kinds = s7q03,
    food_skipped_meal = s7q04,
    food_less_than_expected = s7q05,
    food_ranout = s7q06,
    food_lacked_hungry = s7q07,
    food_lack_didnt_eat_all_day = s7q08,

    concerns_covid_hh_serious_illness = s8q01,
    concerns_covid_threat_hh_finances = a8q02
      )

## round 2 ---- 
round_2_interview_result <- read_dta(here("raw_data", "round2", "interview_result.dta")) %>%
  select(c('HHID','Rq09','Rq10'))
round_2_cover  <- read_dta(here( "raw_data", "round2", "Cover.dta" )) 


round_2_sec1 <- read_dta(here( "raw_data", "round2", "SEC1.dta" )) 
round_2_sec4  <- read_dta(here( "raw_data", "round2", "SEC4.dta" )) 
round_2_sec5  <- read_dta(here( "raw_data", "round2", "SEC5.dta" )) 
round_2_sec5a  <- read_dta(here( "raw_data", "round2", "SEC5A.dta" )) 
round_2_sec6  <- read_dta(here( "raw_data", "round2", "SEC6.dta" )) 
# sec8 as 7
round_2_sec8  <- read_dta(here( "raw_data", "round2", "SEC8.dta" )) 
round_2_sec9  <- read_dta(here( "raw_data", "round2", "SEC9.dta" )) 

## merge round2 datasets
merged_r2 <- left_join(round_2_interview_result,round_2_cover, by = c("HHID")) %>% 
  left_join(round_2_sec4, by = c("HHID")) %>% 
  left_join(round_2_sec5, by = c("HHID")) %>% 
  left_join(round_2_sec5a, by = c("HHID")) %>% 
  left_join(round_2_sec8, by = c("HHID")) %>% 
  left_join(round_2_sec9, by = c("HHID")) %>% 
  mutate(round = 2)

##rename round2 columns
renamed_merged_r2 <- merged_r2 %>%
  rename(
    interviewer_main_resp = Rq09,
    interview_language = Rq10,
    interviewer_name = Sq01,
    interview_date = Sq02,
    
    water_drinking_insufficient = s4q01e,
    water_drinking_insufficient_reason = s4q01f,
    water_drinking_insufficient_reason_other = s4q01f_Other,
    
    soap_wash_hands = s4q01,
    soap_wash_hands_lack_reason = s4q02,
    soap_wash_hands_lack_reason_other = s4q02_Other,
    
    water_wash_hands = s4q03,
    water_wash_hands_lack_reason = s4q04,
    water_wash_hands_lack_reason_other = s4q04_Other,
    
    medicine_access = s4q08,
    medical_treatment_needed = s4q09,
    medical_access = s4q10,
    medical_access_lack_reason = s4q11,
    medical_access_lack_specific_reason = s4q11_Other,
    
    assets_hh_owned_radio1 = s4q12__1,
    assets_hh_owned_tv = s4q12__2,
    assets_hh_owned_grid_electricity = s4q12__3,
    assets_hh_owned_lar_system = s4q12__4,
    assets_hh_owned_solar_kit_lantern = s4q12__5,
    
    work_done_for_pay = s5q01,    
    work_secured_absent = s5q01a,
    work_secured_return = s5q01b,
    work_missed_previously_reason = s5q01c,
    work_stop_reason = s5q03,
    work_to_find_job = s5q03a,
    work_main_find_job = s5q03b,
    work_same_as_before_march = s5q04a_1,
    work_same_as_last_time = s5q04a_2,
    work_change_reason = s5q04b,
    work_main_activity = s5q05,
    work_main_area = s5q06,
    work_as_usual = s5q07,
    work_unusually_but_paid = s5q08,
    work_unusually_reason = s5q08a,
    work_hours =s5q08b,
    work_hours_change = s5q08c,
    work_benefits_health_insurance = s5q08d__1,
    work_benefits_paid_sick_leave = s5q08d__2,
    work_benefits_pension = s5q08d__3,
    work_benefits_paid_annual_leave = s5q08d__4,
    work_written_contract = s5q08e,
    
    hh_not_able_work = s5q09,
    hh_not_able_work_roster0 = s5q10__0, ## from roster
    hh_not_able_work_roster1 = s5q10__1,
    hh_not_able_work_roster2 = s5q10__2,
    hh_not_able_work_roster3 = s5q10__3,
    hh_not_able_work_roster4 = s5q10__4,
    hh_not_able_work_roster5 = s5q10__5,
    hh_operate_non_family_business = s5aq11,
    
    non_farm_business_closure_reason_covid = s5aq11b__1,
    non_farm_business_place_closure_other_reason = s5aq11b__2,
    non_farm_business_closure_reason_no_customers = s5aq11b__3,
    non_farm_business_closure_reason_no_inputs = s5aq11b__4,
    non_farm_business_closure_reason_travel_restrictions = s5aq11b__5,
    non_farm_business_closure_reason_ill_covid = s5aq11b__6,
    non_farm_business_closure_reason_ill_other_disease = s5aq11b__7,
    non_farm_business_closure_reason_care_family = s5aq11b__8,
    non_farm_business_closure_reason_seasonal = s5aq11b__9,
    non_farm_business_closure_reason_vacation = s5aq11b__10,
    non_farm_business_closure_reason_other = s5aq11b__n96,
    non_farm_business_sector = s5aq12,
    non_farm_business_revenue_level = s5aq13,
    non_farm_business_revenue_less_reason_covid = s5aq14_1,
    non_farm_business_revenue_less_closure_another_reason = s5aq14_2,
    
    challenges_due_to_covid_business_inputs = s5aq15__1,
    challenges_due_to_covid_business_operation_money = s5aq15__2,
    challenges_due_to_covid_business_loans = s5aq15__3,
    challenges_due_to_covid_rent = s5aq15__4,
    challenges_due_to_covid_paying_workers = s5aq15__5,
    challenges_due_to_covid_sales = s5aq15__6,
    challenges_due_to_covid_other = s5aq15__n96,
    
    change_business_conduct = s5aq15a,
    changes_to_be_made_in_business_wear_masks = s5aq15b__1,
    changes_to_be_made_in_business_distancing = s5aq15b__2,
    changes_to_be_made_in_business_few_customers_at_once = s5aq15b__3,
    changes_to_be_made_in_business_phone_media_market = s5aq15b__4,
    changes_to_be_made_in_business_deliveries_only = s5aq15b__5,
    changes_to_be_made_in_business_product_offering = s5aq15b__6,
    changes_to_be_made_in_business_other = s5aq15b__n96,
    
    non_farm_business_temporary_close_status = s5aq11a,
    
    food_insufficient_worry = s8q01,
    food_healthy_lack = s8q02,
    food_few_kinds = s8q03,
    food_skipped_meal = s8q04,
    food_less_than_expected = s8q05,
    food_ranout = s8q06,
    food_lacked_hungry = s8q07,
    food_lack_didnt_eat_all_day = s8q08,
    
    concerns_covid_hh_serious_illness = s9q01,
    concerns_covid_threat_hh_finances = s9q02,
    concerns_symptoms_cough = s9q03__1,
    concerns_symptoms_breath_shortness = s9q03__2,
    concerns_symptoms_fever = s9q03__3,
    concerns_symptoms_chills = s9q03__4,
    concerns_symptoms_muscle_pain = s9q03__5,
    concerns_symptoms_headache = s9q03__6,
    concerns_symptoms_sore_throat = s9q03__7,
    concerns_symptoms_taste_smell_loss = s9q03__8,
    concerns_hh_covid_diagnosis = s9q04,
    concerns_security_risk_covid = s9q05,
    concerns_covid_response_limit_freedom = s9q06,
    concerns_misuse_covid_funds = s9q07,
    concerns_government_corruption_lower_medical_quality = s9q08,
    concerns_measures_curb_covid_close_education_institutions = s9q09__1,
    concerns_measures_curb_covid_suspension_churches = s9q09__2,
    concerns_measures_curb_covid_suspension_gatherings = s9q09__3,
    concerns_measures_curb_covid_suspension_weddings = s9q09__4,
    concerns_measures_curb_covid_suspension_periodic_markets = s9q09__5
  )

## round 3 ---- 
round_3_interview_result <- read_dta(here("raw_data", "round3", "interview_result.dta")) %>%
  select(c('hhid','Rq09','Rq10'))
round_3_cover  <- read_dta(here( "raw_data", "round3", "cover.dta" )) 

round_3_sec1 <- read_dta(here( "raw_data", "round3", "SEC1.dta" )) 
round_3_sec4  <- read_dta(here( "raw_data", "round3", "sec4.dta" )) 
round_3_sec5  <- read_dta(here( "raw_data", "round3", "sec5.dta" )) 
round_3_sec5a  <- read_dta(here( "raw_data", "round3", "sec5a.dta" )) 
round_3_sec6  <- read_dta(here( "raw_data", "round3", "sec6.dta" )) 
# sec8 as 7
round_3_sec8  <- read_dta(here( "raw_data", "round3", "sec8.dta" )) 
round_3_sec9  <- read_dta(here( "raw_data", "round3", "sec9.dta" )) 

## merge round3 datasets
merged_r3 <- left_join(round_3_interview_result,round_3_cover, by = c("hhid")) %>% 
  left_join(round_3_sec4, by = c("hhid")) %>% 
  left_join(round_3_sec5, by = c("hhid")) %>% 
  left_join(round_3_sec5a, by = c("hhid")) %>% 
  left_join(round_3_sec8, by = c("hhid")) %>% 
  left_join(round_3_sec9, by = c("hhid")) %>% 
  mutate(round = 3)

##rename round3 columns
renamed_merged_r3 <- merged_r3 %>% 
  rename(
    interviewer_main_resp = Rq09,
    interview_language = Rq10,
    interviewer_name = Sq01,
    interview_date = Sq02,
    
    staple_food_main = s4q05,
    staple_food_lack = s4q06,
    staple_food_lack_reason = s4q07,
    
    medicine_access = s4q08,
    medical_treatment_needed = s4q09,
    medical_access = s4q10,
    medical_access_lack_reason = s4q11,
    medical_access_lack_specific_reason = s4q11_Other,
    
    masks_access_unable = s4q12,
    masks_access_unable_reason = s4q13,
    masks_access_unable_reason_other = s4q13_Other,
    mask_source_government = s4q14__1,
    mask_source_purchased = s4q14__2,
    mask_source_home_made = s4q14__3,
    mask_source_relatives = s4q14__4,
    mask_source_employer = s4q14__5,
    mask_source_other = s4q14__n96,
    
    work_done_for_pay = s5q01,
    work_secured_absent  = s5q01a,
    work_secured_return = s5q01b,
    work_missed_previously_reason = s5q01c,
    work_stop_reason = s5q03,
    work_to_find_job = s5q03a,
    work_main_find_job = s5q03b,
    work_same_as_last_time = s5q04a_1,
    work_change_reason = s5q04b,
    work_main_description = s5q05,
    work_area = s5q06,
    work_as_usual = s5q07,
    work_unusually_but_paid = s5q08,
    work_unusually_reason = s5q08a,
    work_hours = s5q08b,
    work_hours_change = s5q08c,
    
    safety_measures_by_employer_disinfectant = s5q08f__1,
    safety_measures_by_employer_hadn_sanitizer = s5q08f__2,
    safety_measures_by_employer_awareness = s5q08f__3,
    safety_measures_by_employer_masks = s5q08f__4,
    safety_measures_by_employer_gloves = s5q08f__5,
    safety_measures_by_employer_work_from_home = s5q08f__6,
    safety_measures_by_employer_office_closed = s5q08f__7,
    safety_measures_by_employer_none = s5q08f__8,
    safety_measures_by_employer_other = s5q08f__n96,
    
    measures_followed_by_collegues = s5q08g,
    measures_followed_by_collegues_percentage = s5q08g_1,
    
    hh_not_able_work = s5q09,
    hh_not_able_work_roster0 = s5q10__0, ## from roster
    hh_not_able_work_roster1 = s5q10__1,
    hh_not_able_work_roster2 = s5q10__2,
    hh_not_able_work_roster3 = s5q10__3,
    hh_not_able_work_roster4 = s5q10__4,
    
    non_farm_business_operation = s5aq11,
    non_farm_business_closure_reason = s5aq11b,
    non_farm_business_main_activity = s5a11c,
    non_farm_business_sector = s5aq12,
    
    revenue_sales_non_family_business_compared_feb = s5aq13,
    revenue_sales_non_family_business_covid = s5aq14_1,
    revenue_sales_non_family_business_other = s5aq14_2,
    
    non_farm_business_another = s5q15a, 
    non_farm_businesses_number = s5q15b,
    non_farm_business_temporary_close_status = s5aq11a,
    
    food_insufficient_worry = s8q01,
    food_healthy_lack = s8q02,
    food_few_kinds = s8q03,
    food_skipped_meal = s8q04,
    food_less_than_expected = s8q05,
    food_ranout = s8q06,
    food_lacked_hungry = s8q07,
    food_lack_didnt_eat_all_day = s8q08,
    
    concerns_covid_hh_serious_illness = s9q01,
    concerns_covid_threat_hh_finances = s9q02,
    concerns_symptoms_cough = s9q03__1,
    concerns_symptoms_breath_shortness = s9q03__2,
    concerns_symptoms_fever = s9q03__3,
    concerns_symptoms_chills = s9q03__4,
    concerns_symptoms_muscle_pain = s9q03__5,
    concerns_symptoms_headache = s9q03__6,
    concerns_symptoms_sore_throat = s9q03__7,
    concerns_symptoms_taste_smell_loss = s9q03__8,
    concerns_hh_covid_diagnosis = s9q04,
    concerns_security_risk_covid = s9q05,
    concerns_covid_response_limit_freedom = s9q06,
    concerns_misuse_covid_funds = s9q07,
    concerns_government_corruption_lower_medical_quality = s9q08,
    concerns_discomfort_in_house = s9q09
  )

## round 4 ---- 
round_4_interview_result <- read_dta(here("raw_data", "round4", "interview_result.dta")) %>%
  select(c('HHID','Rq09','Rq10'))
round_4_cover  <- read_dta(here( "raw_data", "round4", "Cover.dta" )) 

round_4_sec1 <- read_dta(here( "raw_data", "round4", "SEC1.dta" )) 
round_4_sec4  <- read_dta(here( "raw_data", "round4", "SEC4.dta" )) 
round_4_sec5  <- read_dta(here( "raw_data", "round4", "SEC5.dta" )) 
round_4_sec5a  <- read_dta(here( "raw_data", "round4", "SEC5A.dta" )) 
round_4_sec6  <- read_dta(here( "raw_data", "round4", "SEC6.dta" )) 
## sec7 found to be sec8 
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
  left_join(round_4_sec8, by = c("HHID")) %>% ##as sec 7
  left_join(round_4_sec9, by = c("HHID")) %>% 
  mutate(round = 4)

##rename round4 columns
renamed_merged_r4 <- merged_r4 %>% 
  rename(
    interviewer_main_respondent = Rq09,
    interviewer_language = Rq10,
    interview_date = Sq02,
    
    water_drinking_insufficient = s4q1e,
    water_drinking_insufficient_reason = s4q1f,
    water_drinking_source = s4q1g,
    
    soap_wash_hands = s4q01,
    soap_wash_hands_lack_reason = s4q02,
    
    water_wash_hands = s4q03,
    water_wash_hands_lack_reason = s4q04,
    
    medicine_access = s4q08,
    medical_treatment_needed = s4q09,
    medical_access = s4q10,
    medical_access_lack_reason = s4q11,
    medical_need_after_school_closure =  s4q11a,
    medical_access_after_school_closure = s4q11b,
    
    masks_access = s4q12,
    masks_lack_reason = s4q13,
    masks_source_government = s4q14__1,
    masks_source_purchased = s4q14__2,
    masks_source_homemade = s4q14__3,
    masks_source_friends_relatives = s4q14__4,
    masks_source_employer = s4q14__5,
    masks_source_other = s4q14__n96,
    
    covid_test_free_willingness = s4q15,
    covid_vaccine_free_willingness = s4q16,
    covid_vaccine_free_unwillingness_not_work = s4q17__1,
    covid_vaccine_free_unwillingness_unsafe = s4q17__2,
    covid_vaccine_free_unwillingness_side_effects = s4q17__3,
    covid_vaccine_free_unwillingness_low_risk = s4q17__4,
    covid_vaccine_free_unwillingness_against_vaccines = s4q17__5,
    covid_vaccine_free_unwillingness_religion = s4q17__6,
    covid_vaccine_free_unwillingness_other = s4q17__n96,
    
    vaccination_doubts_wont_work = s4q18__1,
    vaccination_doubts_unsafe = s4q18__2,
    vaccination_doubts_side_effects = s4q18__3,
    vaccination_doubts_low_risk = s4q18__4,
    vaccination_doubts_against_vaccines = s4q18__5,
    vaccination_doubts_against_religion = s4q18__6,
    vaccination_doubts_other = s4q18__n96,
    
    work_done_for_pay = s5q01,
    work_secured_absent = s5q01a,
    work_secured_return = s5q01b,
    work_to_find_job  = s5q01c,
    work_stop_reason = s5q03,
    work_main_find_job = s5q03a,
    work_search_main_activity = s5q03b,
    work_same_as_last_time = s5q04a,
    work_change_reason = s5q04b,
    work_main_primary_description = s5q05a,
    work_organization_main_activity = s5q05,
    work_area = s5q06,
    work_farming_products_intentions = s5q06a,
    work_as_usual = s5q07,
    work_unusually_but_paid = s5q08,
    work_unusually_reason = s5q08a,
    work_hours = s5q08b,
    work_hours_change = s5q08c,
    
    safety_measures_by_employer_disinfectants = s5q08f__1,
    safety_measures_by_employer_sanitizer = s5q08f__2,
    safety_measures_by_employer_preventative = s5q08f__3,
    safety_measures_by_employer_masks = s5q08f__4,
    safety_measures_by_employer_gloves = s5q08f__5,
    safety_measures_by_employer_work_home = s5q08f__6,
    safety_measures_by_employer_closed_office = s5q08f__7,
    safety_measures_by_employer_none = s5q08f__8,
    safety_measures_by_employer_others = s5q08f__n96,
    safety_measures_followed = s5q08g,
    safety_measures_followed_percentage = s5q08g_1,
    
    hh_not_able_work = s5q09,
    hh_not_able_work_roster0 = s5q10__0, # no options given hence numbers used
    hh_not_able_work_roster1 = s5q10__1,
    hh_not_able_work_roster2 = s5q10__2,
    hh_not_able_work_roster3 = s5q10__3,
    hh_not_able_work_roster4 = s5q10__4,
    
    non_farm_business_operation = s5aq11,
    non_farm_business_closure_reason = s5aq11b,
    non_farm_business_other_operating = s5aq11b_1,
    non_farm_business_other_main_activity = s5a11c_1,
    non_farm_business_other_sector = s5aq12_1,
    non_farm_business_existing_main_activity = s5a11c,
    non_farm_business_existing_sector = s5aq12,
    
    revenue_sales_non_family_business_compared_feb = s5aq13,
    revenue_sales_non_family_business_reason_covid = s5aq14_1,
    revenue_sales_non_family_business_reason_other = s5aq14_2,
    revenue_sales_non_family_business_compared_year = s5aq15,
    
    non_farm_business_temporary_close_status = s5aq11a,
    
    food_insufficient_worry = s8q01,
    food_healthy_lack = s8q02,
    food_few_kinds = s8q03,
    food_skipped_meal = s8q04,
    food_less_than_expected = s8q05,
    food_ranout = s8q06,
    food_lacked_hungry = s8q07,
    food_lack_didnt_eat_all_day = s8q08,
    
    concerns_covid_hh_serious_illness = s9q01,
    concerns_covid_threat_hh_finances = s9q02,
    concerns_symptoms_cough = s9q03__1,
    concerns_symptoms_breath_shortness = s9q03__2,
    concerns_symptoms_fever = s9q03__3,
    concerns_symptoms_chills = s9q03__4,
    concerns_symptoms_muscle_pain = s9q03__5,
    concerns_symptoms_headache = s9q03__6,
    concerns_symptoms_sore_throat = s9q03__7,
    concerns_symptoms_taste_smell_loss = s9q03__8,
    concerns_hh_covid_diagnosis = s9q04,
    concerns_security_risk_covid = s9q05,
    concerns_covid_response_limit_freedom = s9q06,
    concerns_misuse_covid_funds = s9q07,
    concerns_government_corruption_lower_medical_quality = s9q08,
    concerns_discomfort_in_house = s9q09
  )


## round 5 ---- 
round_5_interview_result <- read_dta(here("raw_data", "round5", "interview_result.dta")) %>%
  select(c('hhid','Rq09','Rq10'))
round_5_cover  <- read_dta(here( "raw_data", "round5", "cover.dta" )) 

round_5_sec1 <- read_dta(here( "raw_data", "round5", "SEC1.dta" )) 
round_5_sec4  <- read_dta(here( "raw_data", "round5", "sec4.dta" )) 
round_5_sec5  <- read_dta(here( "raw_data", "round5", "sec5.dta" )) 
round_5_sec5a  <- read_dta(here( "raw_data", "round5", "sec5a.dta" )) 
round_5_sec6  <- read_dta(here( "raw_data", "round5", "sec6.dta" )) 
# sec 7 as sec8
round_5_sec8 <- read_dta(here( "raw_data", "round5", "sec8.dta" )) 
round_5_sec9  <- read_dta(here( "raw_data", "round5", "sec9.dta" )) 

## merge round5 datasets
merged_r5 <- left_join(round_5_interview_result,round_5_cover, by = c("hhid")) %>% 
  left_join(round_5_sec4, by = c("hhid")) %>% 
  left_join(round_5_sec5, by = c("hhid")) %>% 
  left_join(round_5_sec5a, by = c("hhid")) %>%
  left_join(round_5_sec8, by = c("hhid")) %>% # as sec 7
  left_join(round_5_sec9, by = c("hhid")) %>%
  mutate(round = 5)

##rename round5 columns
renamed_merged_r5 <- merged_r5 %>% 
  rename(
    interviewer_main_respondent = Rq09,
    interviewer_language = Rq10,
    interview_date = Sq02,
    
    food_main_staple = s4q05,
    food_main_staple_lack =  s4q06,
    food_main_staple_lack_reason = s4q07,
    
    medicine_access = s4q08,
    medical_treatment_needed = s4q09,
    medical_access = s4q10,
    medical_access_lack_reason = s4q11,

    masks_access = s4q12,
    masks_lack_reason = s4q13,
    masks_source_government = s4q14__1,
    masks_source_purchased = s4q14__2,
    masks_source_homemade = s4q14__3,
    masks_source_friends_relatives = s4q14__4,
    masks_source_employer = s4q14__5,
    
    covid_pay_test_acceptance = s4q15,
    covid_pay_test_acceptance_price =  s4q15_1,
    covid_vaccine_acceptance = s4q16,
    covid_vaccine_refusal_wont_work =  s4q17__1,
    covid_vaccine_refusal_unsafe = s4q17__2,
    covid_vaccine_refusal_side_effects = s4q17__3,
    covid_vaccine_refusal_no_risk = s4q17__4,
    covid_vaccine_refusal_against_vaccines = s4q17__5,
    covid_vaccine_refusal_religion = s4q17__6,
    covid_vaccine_unsure_wont_work = s4q18__1,
    covid_vaccine_unsure_unsafe = s4q18__2,
    covid_vaccine_unsure_side_effects = s4q18__3,
    covid_vaccine_unsure_no_risk = s4q18__4,
    covid_vaccine_unsure_against_vaccines = s4q18__5,
    covid_vaccine_unsure_religion = s4q18__6,
    
    work_done_for_pay = s5q01,
    work_secured_absent = s5q01a,
    work_secured_return = s5q01b,   
    work_missed_previously_reason = s5q01c,
    work_stop_reason = s5q03,
    work_to_find_job = s5q03a,
    work_main_find_job = s5q03b,
    work_same_as_last_time  = s5q04a,
    work_change_reason = s5q04b,
    
    work_main_primary_description = s5q05a,
    work_main_activity = s5q05,
    work_area = s5q06,
    work_farm_products_intentions = s5q06a,
    
    non_farm_business_operation = s5aq11,
    non_farm_business_closure_reason = s5aq11b,
    non_farm_business_other_operating = s5aq11b_1,
    non_farm_business_other_main_activity = s5a11c_1,
    non_farm_business_other_sector = s5aq12_1,
    non_farm_business_existing_main_activity = s5a11c,
    non_farm_business_existing_sector = s5aq12,
    
    revenue_sales_non_family_business_compared_feb = s5aq13,
    revenue_sales_non_family_business_covid = s5aq14_1,
    revenue_sales_non_family_business_other = s5aq14_2,
    revenue_sales_non_family_business_compared_year = s5aq15,
    
    non_farm_business_temporary_close_status = s5aq11a,
    
    food_insufficient_worry = s8q01,
    food_healthy_lack = s8q02,
    food_few_kinds = s8q03,
    food_skipped_meal = s8q04,
    food_less_than_expected = s8q05,
    food_ranout = s8q06,
    food_lacked_hungry = s8q07,
    food_lack_didnt_eat_all_day = s8q08,
    
    concerns_covid_hh_serious_illness = s9q01,
    concerns_covid_threat_hh_finances = s9q02,
    concerns_symptoms_cough = s9q03__1,
    concerns_symptoms_breath_shortness = s9q03__2,
    concerns_symptoms_fever = s9q03__3,
    concerns_symptoms_chills = s9q03__4,
    concerns_symptoms_muscle_pain = s9q03__5,
    concerns_symptoms_headache = s9q03__6,
    concerns_symptoms_sore_throat = s9q03__7,
    concerns_symptoms_taste_smell_loss = s9q03__8,
    concerns_hh_covid_diagnosis = s9q04,
    concerns_security_risk_covid = s9q05,
    concerns_covid_response_limit_freedom = s9q06,
    concerns_misuse_covid_funds = s9q07,
    concerns_government_corruption_lower_medical_quality = s9q08,
    concerns_discomfort_in_house = s9q09,
    concerns_bothered_by_little_pleasure_in_enjoyments = s9q10_1,
    concerns_sad_down_depressed = s9q10_2,
    concerns_sleep_issues = s9q10_3,
    concerns_tired_burdened = s9q10_4,
    concerns_appetite_loss =s9q10_5,
    concerns_self_worth_loss = s9q10_6,
    concerns_concentrating_work = s9q10_7,
    concerns_motion_speaking_change = s9q10_8
  )


## round 6 ----
round_6_interview_result <- read_dta(here("raw_data", "round6", "interview_result.dta")) %>%
  select(c('hhid','Rq09','Rq10'))
round_6_cover  <- read_dta(here( "raw_data", "round6", "cover.dta" )) 

round_6_sec1 <- read_dta(here( "raw_data", "round6", "sec1.dta" )) 
round_6_sec4  <- read_dta(here( "raw_data", "round6", "sec4_1.dta" )) 
round_6_sec5a  <- read_dta(here( "raw_data", "round6", "sec5a.dta" )) 
#  sec5 as sec5resp and sec5other
round_6_sec5_resp <- read_dta(here( "raw_data", "round6", "sec5_resp.dta" ))
round_6_sec5_other <- read_dta(here( "raw_data", "round6", "sec5_other.dta" ))

round_6_sec5  <- read_dta(here( "raw_data", "round6", "sec6.dta" )) 
round_6_sec6  <- read_dta(here( "raw_data", "round6", "sec6.dta" )) 
#  sec7 as sec8
round_6_sec8  <- read_dta(here( "raw_data", "round6", "sec8.dta" )) 
round_6_sec9  <- read_dta(here( "raw_data", "round6", "sec9.dta" )) 

## merge round6 datasets
merged_r6 <- left_join(round_6_interview_result,round_6_cover, by = c("hhid")) %>% 
  left_join(round_6_sec4, by = c("hhid")) %>% 
  left_join(round_6_sec5_resp, by = c("hhid")) %>% 
  left_join(round_6_sec5_other, by = c("hhid")) %>% 
  left_join(round_5_sec5a, by = c("hhid")) %>% 
  left_join(round_5_sec8, by = c("hhid")) %>% 
  left_join(round_5_sec9, by = c("hhid")) %>% 
  mutate(round = 6)

## rename round6 columns
renamed_merged_r6 <- merged_r6 %>% 
  rename(  
    interviewer_main_respondent = Rq09,
    interviewer_language = Rq10,
    interview_date = Sq02,
    
    soap_wash_hands = s4q01,
    soap_wash_hands_lack_reason = s4q02,
    
    water_wash_hands = s4q03,
    water_wash_hands_lack_reason =  s4q04,
    
    food_purchased_maize_flour = s4q04_1__1,
    food_purchased_rice = s4q04_1__2,
    food_purchased_beans = s4q04_1__3,
    
    price_kg_maize = s4q04_2,
    price_kg_rice = s4q04_3,
    price_kg_fresh_beans = s4q04_4,
    price_kg_dry_beans = s4q04_5,
    
    masks_access = s4q12,
    masks_lack_reason = s4q13,
    masks_source_government = s4q14__1,
    masks_source_purchased = s4q14__2,
    masks_source_home_made = s4q14__3,
    masks_source_friends_relatives = s4q14__4,
    masks_source_employer = s4q14__5,
    
    medicine_access = s4q08,
    medical_services_need = s4q19,
    medical_services_need_family_planning = s4q20__1,
    medical_services_need_vaccination = s4q20__2,
    medical_services_need_maternal_health = s4q20__3,
    medical_services_need_chuld_health = s4q20__4,
    medical_services_need_adult_health = s4q20__5,
    medical_services_need_emergency_care = s4q20__6,
    medical_services_need_pharmacy = s4q20__7,
    
    work_done_for_pay = s5q01,
    work_secured_absent = s5q01a,
    work_secured_return = s5q01b,   
    work_missed_previously_reason = s5q01c,
    work_stop_reason = s5q03,
    work_to_find_job = s5q03a,
    work_main_find_job  = s5q03b,
    work_same_as_last_time = s5q04a,
    work_change_reason = s5q04b,
    work_main_primary_activities = s5q05a,
    work_main_activity = s5q05, 
    work_area = s5q06,
    
    family_products_intentions = s5q06a,
    
    work_hours_previous_week = s5q8b1,
    work_hours_by_member_week = s5q8c1,
    #s5Oq0b_1, not in the survey
    
    non_farm_business_operation = s5aq11,
    non_farm_business_closure_reason = s5aq11b,
    non_farm_business_another = s5aq11b_1,
    non_farm_new_business_main_activity = s5a11c_1,
    non_farm_new_business_sector = s5aq12_1,
    non_farm_existing_business_main_activity = s5a11c,
    non_farm_existing_business_sector = s5aq12,
    
    revenue_sales_non_family_business_compared_feb = s5aq13,
    revenue_sales_non_family_business_covid = s5aq14_1,
    revenue_sales_non_family_business_other = s5aq14_2,
    revenue_sales_non_family_business_compared_year = s5aq15,
    
    non_farm_business_temporary_close_status = s5aq11a,
    
    food_insufficient_worry = s8q01,
    food_healthy_lack = s8q02,
    food_few_kinds = s8q03,
    food_skipped_meal = s8q04,
    food_less_than_expected = s8q05,
    food_ranout = s8q06,
    food_lacked_hungry = s8q07,
    food_lack_didnt_eat_all_day = s8q08,
    
    concerns_covid_hh_serious_illness = s9q01,
    concerns_covid_threat_hh_finances = s9q02,
    concerns_relative_infected_covid = s9q03a,
    concerns_covid_infection_even_not_tested = s9q03b,
    concerns_symptoms_cough = s9q03__1,
    concerns_symptoms_breath_shortness = s9q03__2,
    concerns_symptoms_fever = s9q03__3,
    concerns_symptoms_chills = s9q03__4,
    concerns_symptoms_muscle_pain = s9q03__5,
    concerns_symptoms_headache = s9q03__6,
    concerns_symptoms_sore_throat = s9q03__7,
    concerns_symptoms_taste_smell_loss = s9q03__8,
    concerns_hh_covid_diagnosis = s9q04,
    concerns_security_risk_covid = s9q05,
    concerns_covid_response_limit_freedom = s9q06,
    concerns_misuse_covid_funds = s9q07,
    concerns_government_corruption_lower_medical_quality = s9q08,
    concerns_discomfort_in_house = s9q09,
    ## question 10 not in survey but data available hence questions considered as in earlier rounds
    concerns_bothered_by_little_pleasure_in_enjoyments = s9q10_1,
    concerns_sad_down_depressed = s9q10_2,
    concerns_sleep_issues = s9q10_3,
    concerns_tired_burdened = s9q10_4,
    concerns_appetite_loss =s9q10_5,
    concerns_self_worth_loss = s9q10_6,
    concerns_concentrating_work = s9q10_7,
    concerns_motion_speaking_change = s9q10_8
    )

## round 7 ---- 
round_7_interview_result <- read_dta(here("raw_data", "round7", "interview_result.dta")) %>%
  select(c('HHID','Rq09','Rq10'))
round_7_cover  <- read_dta(here( "raw_data", "round7", "Cover.dta" )) 

round_7_sec1 <- read_dta(here( "raw_data", "round7", "SEC1.dta" )) 
round_7_sec4  <- read_dta(here( "raw_data", "round7", "SEC4_1.dta" )) 
round_7_sec5a  <- read_dta(here( "raw_data", "round7", "SEC5A.dta" )) 
round_7_sec5 <- read_dta(here( "raw_data", "round7", "SEC5.dta" ))
round_7_sec6e1  <- read_dta(here( "raw_data", "round7", "SEC6E_1.dta" )) 
round_7_sec6e2  <- read_dta(here( "raw_data", "round7", "SEC6E_2.dta" )) 
round_7_sec8  <- read_dta(here( "raw_data", "round7", "SEC8.dta" )) 
round_7_sec9  <- read_dta(here( "raw_data", "round7", "SEC9.dta" )) 

## merge round7 datasets
merged_r7 <- left_join(round_7_interview_result,round_7_cover, by = c("HHID")) %>% 
  left_join(round_7_sec4, by = c("HHID")) %>% 
  left_join(round_7_sec5a, by = c("HHID")) %>% 
  left_join(round_7_sec5, by = c("HHID")) %>% 
  left_join(round_7_sec8, by = c("HHID")) %>% 
  left_join(round_7_sec9, by = c("HHID")) %>% 
  mutate(round = 7)

## renaming merged round7
renamed_merged_r7 <- merged_r7 %>% 
  rename(
    interviewer_main_respondent = Rq09,
    interviewer_language = Rq10,
    interview_date = Sq02,
    
    masks_access = s4q12,
    masks_lack_reason = s4q13,
    masks_source_government = s4q14__1,
    masks_source_purchased = s4q14__2,
    masks_source_home_made = s4q14__3,
    masks_source_friends_relatives = s4q14__4,
    masks_source_employer = s4q14__5,
    masks_source_other = s4q14__n96,
    
    medicine_buy_ability = s4q15,
    
    non_farm_business_operation = s5aq11,
    non_farm_business_status = s5aq11a,
    non_farm_business_closure_reason = s5aq11b,
    non_farm_business_another = s5aq11b_1,
    non_farm_new_business_main_activity = s5a11c_1,
    non_farm_new_business_sector = s5aq12_1,
    non_farm_existing_business_main_activity = s5aq11c,
    non_farm_existing_business_sector = s5aq12,
    
    revenue_sales_non_family_business_compared_apr = s5aq13,
    revenue_sales_non_family_business_reason = s5aq14_1,
    revenue_sales_non_family_business_reason_other = s5aq14_2,
    revenue_sales_non_family_business_compared_year = s5aq15,
    
    change_business_conduct = s5aq15a,
    changes_to_be_made_in_business_wear_masks = s5aq15b__1,
    changes_to_be_made_in_business_distancing = s5aq15b__2,
    changes_to_be_made_in_business_few_customers_at_once = s5aq15b__3,
    changes_to_be_made_in_business_phone_media_market = s5aq15b__4,
    changes_to_be_made_in_business_deliveries_only = s5aq15b__5,
    changes_to_be_made_in_business_product_offering = s5aq15b__6,
    changes_to_be_made_in_business_no_change = s5aq15b__7,
    changes_to_be_made_in_business_other = s5aq15b__n96,
    
    work_done_for_pay = s5q01,
    work_secured_absent = s5q01a,
    work_secured_return = s5q01b,   
    work_missed_previously_reason = s5q01c,
    work_stop_reason = s5q03,
    work_to_find_job = s5q03a,
    work_main_find_job  = s5q03b,
    work_same_as_last_time = s5q04a,
    work_change_reason = s5q04b,
    work_main_primary_activities = s5q05a,
    work_main_activity = s5q05, 
    work_area = s5q06,
    
    family_products_intentions = s5q06a,
    
    safety_measures_by_employer_disinfectants = s5q08f__1,
    safety_measures_by_employer_sanitizer = s5q08f__2,
    safety_measures_by_employer_preventative = s5q08f__3,
    safety_measures_by_employer_masks = s5q08f__4,
    safety_measures_by_employer_gloves = s5q08f__5,
    safety_measures_by_employer_work_home = s5q08f__6,
    safety_measures_by_employer_closed_office = s5q08f__7,
    safety_measures_by_employer_none = s5q08f__8,
    safety_measures_followed = s5q08g,
    safety_measures_followed_percentage = s5q08g_1,
    
    work_hours_primary_activity_previously =s5q8b1,
    work_hours_primary_activity_usually = s5q8c1,

    food_insufficient_worry = s8q01,
    food_healthy_lack = s8q02,
    food_few_kinds = s8q03,
    food_skipped_meal = s8q04,
    food_less_than_expected = s8q05,
    food_ranout = s8q06,
    food_lacked_hungry = s8q07,
    food_lack_didnt_eat_all_day = s8q08,
    
    concerns_relative_infected_covid = s9q03a,
    concerns_covid_infection_even_not_tested = s9q03b,
    concerns_hh_covid_diagnosis = s9q04,
    concerns_covid_drug_modern = s9q05__1,
    concerns_covid_drug_herbal_medicine = s9q05__2,
    concerns_covid_drug_local_herbs = s9q05__3,
    concerns_covid_drug_none = s9q05__4,
    concerns_covid_drug_other = s9q05__n98,
    concerns_covid_trusted_treatment = s9q06,
    concerns_covid_vaccine_availability_knowledge = s9q10,
    concerns_covid_vaccine_availability_info_source_poster = s9q10b__1,
    concerns_covid_vaccine_availability_info_source_radio = s9q10b__2,
    concerns_covid_vaccine_availability_info_source_tv = s9q10b__3,
    concerns_covid_vaccine_availability_info_source_sms = s9q10b__4,
    concerns_covid_vaccine_availability_info_source_phone = s9q10b__5,
    concerns_covid_vaccine_availability_info_source_newspaper = s9q10b__6,
    concerns_covid_vaccine_availability_info_source_social_media = s9q10b__7,
    concerns_covid_vaccine_availability_info_source_healthcare = s9q10b__8,
    concerns_covid_vaccine_availability_info_source_ngo = s9q10b__9,
    concerns_covid_vaccine_availability_info_source_other_outreach = s9q10b__10,
    concerns_covid_vaccine_availability_info_source_local_authority = s9q10b__11,
    concerns_covid_vaccine_availability_info_source_family_neighbors = s9q10b__12,
    concerns_covid_vaccine_availability_info_source_traditional_healer = s9q10b__13,
    concerns_covid_vaccine_availability_info_source_other = s9q10b__n96,
    concerns_covid_vaccine_priority_groups_knowledge = s9q10c,
    concerns_covid_vaccine_priority_group_individula_included = s9q10d,
    concerns_covid_vaccinated = s9q11,
    concerns_covid_no_second_vaccine_shot_reason = s9q11b,
    concerns_covid_vaccination_tried = s9q11c,
    concerns_covid_not_vaccinated_reason = s9q11d,
    concerns_covid_vaccine_received = s9q12,
    concerns_approved_free_covid_vaccination_accept = s9q13,
    concerns_covid_unvaccination_main_reason = s9q14,
    concerns_covid_vaccine_tyoe_wanted = s9q15
  )

# merging all rounds renamed datasets
all_rounds_df <- bind_rows(renamed_merged_r1,renamed_merged_r2,renamed_merged_r3,renamed_merged_r4,renamed_merged_r5,renamed_merged_r6,renamed_merged_r7)
