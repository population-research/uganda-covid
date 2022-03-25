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
    interviewer_name = Sq01,
    interv_date = Sq02,
    base_weight = w1,
    soap_wash_hands = s4q01,
    soap_reason_no_access = s4q02,
    soap_specific_no_access = s4q02_Other,
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
    not_eaten_all_day = s7q08
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
  mutate(round = 2)

renamed_merged_r2 <- merged_r2 %>%
  rename(
    interv_main_resp = Rq09,
    interv_language = Rq10,
    interviewer_name = Sq01,
    interv_date = Sq02,
    insuff_drinking_water = s4q01e,
    why_insufficient_water = s4q01f,
    why_insufficient_water_other = s4q01f_Other,
    soap_wash_hands = s4q01,
    why_not_access_soap = s4q02,
    why_not_access_soap_other = s4q02_Other,
    water_wash_hands = s4q03,
    why_no_water_access = s4q04,
    why_no_water_access_other = s4q04_Other,
    unable_buy_medicine = s4q08,
    hh_needed_mdeical = s4q09,
    able_access_treatment = s4q10,
    why_not_access_treatment = s4q11,
    why_not_access_treatment_other = s4q11_Other,
    hh_own_assets1 = s4q12__1,
    hh_own_assets2 = s4q12__2,
    hh_own_assets3 = s4q12__3,
    hh_own_assets4 = s4q12__4,
    hh_own_assets5 = s4q12__5,
    work_for_pay = s5q01,
    employment_status = s5q01a,
    return_to_employment = s5q01b,
    why_didnt_work = s5q01c,
    why_stop_working = s5q03,
    find_job_start_business = s5q03a,
    main_act_to_find_employment = s5q03b,
    same_job_as_before1 = s5q04a_1,
    same_job_as_before2 = s5q04a_2,
    why_change_jobs = s5q04b,
    activity_in_main_job = s5q05,
    nature_of_current_work = s5q06,
    work_as_usual = s5q07,
    paid_not_work_as_usual = s5q08,
    why_not_work_as_usual = s5q08a,
    hours_worked_previous_week =s5q08b,
    if_hours_worked_changed = s5q08c,
    employer_benefits1 = s5q08d__1,
    employer_benefits2 = s5q08d__2,
    employer_benefits3 = s5q08d__3,
    employer_benefits4 = s5q08d__4,
    written_work_contract = s5q08e,
    hh_unable_to_work = s5q09,
    which_hh_memebers = s5q10__0,
    which_hh_memebers1 = s5q10__1,
    which_hh_memebers2 = s5q10__2,
    which_hh_memebers3 = s5q10__3,
    which_hh_memebers4 = s5q10__4,
    which_hh_memebers5 = s5q10__5,
    hh_operate_non_family_business = s5aq11,
    why_family_business_closed1 = s5aq11b__1,
    why_family_business_closed2 = s5aq11b__2,
    why_family_business_closed3 = s5aq11b__3,
    why_family_business_closed4 = s5aq11b__4,
    why_family_business_closed5 = s5aq11b__5,
    why_family_business_closed6 = s5aq11b__6,
    why_family_business_closed7 = s5aq11b__7,
    why_family_business_closed8 = s5aq11b__8,
    why_family_business_closed9 = s5aq11b__9,
    why_family_business_closed10 = s5aq11b__10,
    why_family_business_closed96 = s5aq11b__n96,
    sector_family_business = s5aq12,
    if_revenue_from_family_business = s5aq13,
    less_revenue_from_sales1 = s5aq14_1,
    less_revenue_from_sales2 = s5aq14_2,
    challenges_due_to_covid1 = s5aq15__1,
    challenges_due_to_covid2 = s5aq15__2,
    challenges_due_to_covid3 = s5aq15__3,
    challenges_due_to_covid4 = s5aq15__4,
    challenges_due_to_covid5 = s5aq15__5,
    challenges_due_to_covid6 = s5aq15__6,
    challenges_due_to_covid96 = s5aq15__n96,
    change_business_conduct = s5aq15a,
    changes_to_be_made_in_business1 = s5aq15b__1,
    changes_to_be_made_in_business2 = s5aq15b__2,
    changes_to_be_made_in_business3 = s5aq15b__3,
    changes_to_be_made_in_business4 = s5aq15b__4,
    changes_to_be_made_in_business5 = s5aq15b__5,
    changes_to_be_made_in_business6 = s5aq15b__6,
    changes_to_be_made_in_business96 = s5aq15b__n96,
    status_family_business = s5aq11a,
    no_enough_food = s8q01,
    unable_eat_healthy = s8q02,
    ate_few_food_kinds = s8q03,
    skip_a_meal = s8q04,
    ate_less_food = s8q05,
    food_ran_out = s8q06,
    hungy_and_didnt_eat = s8q07,
    not_eaten_all_day = s8q08
  )
View(renamed_merged_r2)

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

renamed_merged_r3 <- merged_r3 %>% 
  rename(
    interviewer_main_respondend = Rq09,
    interv_language = Rq10,
    interviewer_name = Sq01,
    interv_date = Sq02,
    main_staple_food = s4q05,
    hh_unable_buy_staple = s4q06,
    why_unable_buy_staple = s4q07,
    hh_unable_buy_medicine = s4q08,
    hh_needed_medical_treatment = s4q09,
    hh_access_medical = s4q10,
    why_hh_unable_access_medical = s4q11,
    why_hh_unable_access_medical_other =s4q11_Other,
    hh_unable_access_masks = s4q12,
    why_unable_access_masks = s4q13,
    why_unable_access_masks_other = s4q13_Other,
    hh_mask_source1 = s4q14__1,
    hh_mask_source2 = s4q14__2,
    hh_mask_source3 = s4q14__3,
    hh_mask_source4 = s4q14__4,
    hh_mask_source5 = s4q14__5,
    hh_mask_source96 = s4q14__n96,
    hh_mask_source_other = s4q14_Other,
    work_for_pay = s5q01,
    employment_to_return  = s5q01a,
    when_return_employment = s5q01b,
    why_not_work_previously = s5q01c,
    why_stop_working = s5q03,
    anything_done_obtain_employment = s5q03a,
    what_done_obtain_employment = s5q03b,
    same_job_as_previously = s5q04a_1,
    why_change_jobs = s5q04b,
    main_activity_of_job = s5q05,
    worked_where = s5q06,
    able_work_normally = s5q07,
    paid_even_unable_to_work_as_usual = s5q08,
    why_unable_work_as_usual = s5q08a,
    hours_worked_previous_week = s5q08b,
    how_working_hours_changed = s5q08c,
    safety_measures_by_employer1 = s5q08f__1,
    safety_measures_by_employer2 = s5q08f__2,
    safety_measures_by_employer3 = s5q08f__3,
    safety_measures_by_employer4 = s5q08f__4,
    safety_measures_by_employer5 = s5q08f__5,
    safety_measures_by_employer6 = s5q08f__6,
    safety_measures_by_employer7 = s5q08f__7,
    safety_measures_by_employer8 = s5q08f__8,
    safety_measures_by_employer96 = s5q08f__n96,
    safety_measures_by_employer_other = s5q08f_Other,
    collegues_follow_measures = s5q08g,
    percentage_collegues_follow_measures = s5q08g_1,
    hh_unable_perform_job = s5q09,
    which_hh_unable_perform_job = s5q10__0,
    which_hh_unable_perform_job1 = s5q10__1,
    which_hh_unable_perform_job2 = s5q10__2,
    which_hh_unable_perform_job3 = s5q10__3,
    which_hh_unable_perform_job4 = s5q10__4,
    hh_operate_non_family_business = s5aq11,
    why_family_business_closed = s5aq11b,
    family_business_main_activity = s5a11c,
    sector_family_business = s5aq12,
    sales_revenue_from_non_family_business = s5aq13,
    why_no_less_revenue_sales1 = s5aq14_1,
    why_no_less_revenue_sales2 = s5aq14_2,
    hh_other_non_farm_business = s5q15a,
    number_family_businesses = s5q15b,
    business_status_that_was_temporarily_closed = s5aq11a,
    worried_no_food =s8q01,
    unable_eat_healthy = s8q02,
    ate_few_food_kinds = s8q03,
    skipped_a_meal = s8q04,
    ate_less_than_expected = s8q05,
    food_ran_out = s8q06,
    hungry_but_didnt_eat = s8q07,
    not_eaten_all_day = s8q08
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
  mutate(round = 4)
\renamed_merged_r4 <- merged_r4 %>% 
  rename(
    interviewer_main_respondent = Rq09,
    interviewer_language = Rq10,
    interview_date = Sq02,
    drinking_water_sufficient = s4q1e,
    drinking_water_insufficient_reason = s4q1f,
    drinking_water_source = s4q1g,
    soap_sufficient_hands = s4q01,
    soap_hands_lack_reason = s4q02,
    water_wash_hands = s4q03,
    water_wash_hands_lack_reason = s4q04,
    medicine_inability = s4q08,
    medical_treatment_need = s4q09,
    medical_treatment_access = s4q10,
    medical_treatment_inability_reason = s4q11,
    medical_treatment_need_school_closure =  s4q11a,
    medical_treatment_access_school_closure = s4q11b,
    masks_access = s4q12,
    masks_lack_reason = s4q13,
    masks_source_govt = s4q14__1,
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
    work_for_pay = s5q01,
    work_secured_absent = s5q01a,
    work_secured_return = s5q01b,
    work_missed_previously_reason = s5q01c,
    work_stop_reason = s5q03,
    work_search_start_business = s5q03a,
    work_search_main_activity = s5q03b,
    work_same_as_last_time = s5q04a,
    work_change_reason = s5q04b,
    work_main_description = s5q05a,
    work_organization_main_activity = s5q05,
    work_area = s5q06,
    work_farming_products_intentions = s5q06a,
    work_as_usual = s5q07,
    work_unusual_payment = s5q08,
    work_unusual_reason = s5q08a,
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
    work_inability_hh = s5q09,
    work_inability_hh_who = s5q10__0, # no options given hence numbers used
    work_inability_hh_who1 = s5q10__1,
    work_inability_hh_who2 = s5q10__2,
    work_inability_hh_who3 = s5q10__3,
    work_inability_hh_who4 = s5q10__4,
    non_farm_business_operation = s5aq11,
    non_farm_business_closure_reason = s5aq11b,
    non_farm_business_other_operating = s5aq11b_1,
    non_farm_business_other_main_activity = s5a11c_1,
    non_farm_business_other_sector = s5aq12_1,
    non_farm_business_existing_main_activity = s5a11c,
    non_farm_business_existing_sector = s5aq12,
    non_farm_business_sales_level = s5aq13,
    non_farm_business_sales_reason_covid = s5aq14_1,
    non_farm_business_sales_reason_other = s5aq14_2,
    non_farm_business_sales_compared_previous = s5aq15,
    non_farm_business_status = s5aq11a,
    food_insufficient_worry = s8q01,
    food_healthy_lack = s8q02,
    food_few_kinds = s8q03,
    food_skipped_meal = s8q04,
    food_less_than_expected = s8q05,
    food_ranout = s8q06,
    food_lacked_hungry = s8q07,
    food_lack_didnt_eat_all_day = s8q08
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
  mutate(round = 5)


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

