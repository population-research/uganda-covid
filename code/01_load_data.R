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
round_1_sec9  <- read_dta(here( "raw_data", "round1", "SEC9.dta" )) ## individual level


## rename hhid to HHID in round1 sec1 data
round_1_sec1 <- round_1_sec1 %>%
  rename(HHID = hhid)

## merge round1 datasets

merged_r1 <- left_join(round_1_interview_result, round_1_cover, by = c("HHID")) %>% 
  left_join(round_1_sec4, by = c("HHID")) %>% 
  left_join(round_1_sec5, by = c("HHID")) %>% 
  left_join(round_1_sec5a, by = c("HHID")) %>% 
  left_join(round_1_sec7, by = c("HHID")) %>% 
  mutate(round = 1)

renamed_merged_r1 <- merged_r1 %>% 
  rename(
    interv_main_resp = Rq09,
    interv_language = Rq10,
    intervier_name = Sq01,
    interv_date = Sq02,
    base_weight = w1,
    soap_wash_hands = s4q01,
    reason_no_access_soap = s4q02,
    specific_no_access_soap = s4q02_Other,
    suff_water_hands = s4q03,
    why_no_water_access = s4q04,
    specific_no_water = s4q04_Other,
    main_staple_food = s4q05,
    lack_staple_food = s4q06,
    why_no_staple_food = s4q07,
    specific_no_staple = s4q07_Other,
    access_medicine = s4q08,
    needed_medical_treat = s4q09,
    access_medical = s4q10,
    why_no_access_medical = s4q11,
    specific_no_medical = s4q11_Other,
    child_3_to_18 = s4q012,
    school_closed_covid = s4q013,
    education_since_closed_school = s4q014,
    children_education_engage1 = s4q15__1,
    children_education_engage2 =s4q15__2,
    children_education_engage3 = s4q15__3,
    children_education_engage4 =s4q15__4,
    children_education_engage5 = s4q15__5,
    children_education_engage6 = s4q15__6,
    children_education_engage7 = s4q15__n96,
    children_education_engage_other = s4q15_Other,
    contact_teacher = s4q16,
    how_contact_teachers1 = s4q17__1,
    how_contact_teachers2 = s4q17__2,
    how_contact_teachers3 = s4q17__3,
    how_contact_teachers4 = s4q17__4,
    how_contact_teachers5 = s4q17__5,
    how_contact_teachers6 =s4q17__6,
    how_contact_teachers7 = s4q17__7,
    how_contact_teachers8 = s4q17__8,
    how_contact_teachers196 = s4q17__n96,
    how_contact_teachers_other = s4q17_Other,
    access_to_financial_inst = s4q18,
    success_access_f_inst = s4q19,
    why_able_access_f_inst = s4q20,
    specify_able_access_f_insts = s4q20_Other,
    work_to_return = s5q01a,
    available_work = s5q01,
    working_before = s5q02,
    why_stop_working = s5q03,
    work_main_activity = s504,
    job_as_before = s5q04a,
    why_change_job = s5q04b,
    main_acitivity_job_before = s504c,
    main_activity_job_now = s5q05,
    where_now_job = s5q06,
    able_work_usual = s5q07,
    paid_usual_work = s5q08,
    why_not_usual_work = s5q08a,
    work_benefits1 = s5q08b__1,
    work_benefits2 = s5q08b__2,
    work_benefits3 = s5q08b__3,
    work_benefits4 = s5q08b__4,
    written_work_contract = s5q08c,
    hh_not_able_work = s5q09,
    hh_not_able_work0 = s5q10__0,
    hh_not_able_work1 = s5q10__1,
    hh_not_able_work2 = s5q10__2,
    hh_not_able_work3 = s5q10__3,
    hh_not_able_work4 = s5q10__4,
    hh_not_able_work5 = s5q10__5,
    hh_not_able_work6 = s5q10__6,
    hh_not_able_work7 = s5q10__7,
    hh_not_able_work8 = s5q10__8,
    hh_not_able_work9 = s5q10__9,
    operate_a_business = s5q11,
    business_sector = s5q12,
    business_revenue_level = s5q13,
    why_less_brevenue = s5q14,
    hh_worked_land_preparation = s5aq16,
    plan_growing_crops = s5aq17,
    plan_growing_crops1 = s5qaq17_1,
    plan_growing_crops_other = s5qaq17_1_Other,
    hh_main_crops0 = s5aq18__0,
    hh_main_crops1 = s5aq18__1,
    hh_main_crops2 = s5aq18__2,
    hh_farm_progress = s5aq19,
    how_crop_planting_change1 = s5aq20__1,
    how_crop_planting_change2 = s5aq20__2,
    how_crop_planting_change3 = s5aq20__3,
    how_crop_planting_change4 = s5aq20__4,
    how_crop_planting_change5 = s5aq20__5,
    how_crop_planting_change6 = s5aq20__6,
    how_crop_planting_change7 = s5aq20__7,
    how_crop_planting_change96 = s5aq20__n96,
    how_crop_planting_change_other = s5aq20_Other,
    covid_affect_planting1 = s5aq21__1,
    covid_affect_planting2 = s5aq21__2,
    covid_affect_planting3 = s5aq21__3,
    covid_affect_planting4 = s5aq21__4,
    covid_affect_planting5 = s5aq21__5,
    covid_affect_planting6 = s5aq21__6,
    covid_affect_planting7 = s5aq21__7,
    covid_affect_planting8 = s5aq21__8,
    covid_affect_planting9 = s5aq21__9,
    covid_affect_planting96 = s5aq21__n96,
    covid_affect_planting_other = s5aq21_Other,
    not_transport_seeds1 = s5aq22__1,
    not_transport_seeds2 = s5aq22__2,
    not_transport_seeds3 = s5aq22__3,
    not_transport_seeds4 = s5aq22__4,
    not_transport_seeds5 = s5aq22__5,
    not_transport_seeds6 = s5aq22__6,
    not_transport_seeds96 = s5aq22__n96,
    not_transport_seeds_other = s5aq22_Other,
    not_transport_fertilizer = s5aq23,
    not_transport_fertilizer_other = s5aq23_Other,
    not_transport_ag_inputs = s5aq24,
    not_transport_ag_inputs_other = s5aq24_Other,
    locust_lost_crops = s5aq25,
    hh_raising_livestock = s5aq26,
    progress_hh_farm = s5aq27,
    change_livestock_activities1 = s5aq28__1,
    change_livestock_activities2 = s5aq28__2,
    change_livestock_activities3 = s5aq28__3,
    change_livestock_activities4 = s5aq28__4,
    change_livestock_activities5 = s5aq28__5,
    change_livestock_activities6 = s5aq28__6,
    change_livestock_activities7 = s5aq28__7,
    locust_grazing_lands = s5aq29,
    farm_products_needed_sell = s5aq30,
    able_sell_products = s5aq31,
    worried_no_food = s7q01,
    unable_eat_healthy = s7q02,
    ate_few_food_kinds = s7q03,
    skip_meal = s7q04,
    ate_less_expected = s7q05,
    food_ranout = s7q06,
    hungry_not_ate = s7q07,
    not_ate_all_day = s7q08
      )

View(renamed_merged_r1)

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
  mutate(round = 2)
View(merged_r2)



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
  mutate(round = 3)
View(merged_r3)



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
  mutate(round = 4)
View(merged_r4)


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
  mutate(round = 5)
View(merged_r5)



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
  mutate(round = 6)
View(merged_r6)

