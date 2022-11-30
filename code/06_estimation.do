local input = "C:\Users\alams\OneDrive - Dickinson College\Documents\Research\Uganda HF\Tables"

use "C:\Users\alams\Dropbox\Uganda\stata\base.dta", clear

drop medical_access_lack_why_spec medical_need_2019_04_2020_04 medical_access__2019_04_2020_04 medical_need_fp medical_need_vac medical_need_maternal medical_need_child_health medical_need_adult_health medical_need_emergency_care medical_need_pharmacy medical_type_1 medical_access_1 medical_access_lack_why_1 medical_type_2 medical_access_2 medical_access_lack_why_2 medical_type_3 medical_access_3 medical_access_lack_why_3     	ag_crops_plant_plan ag_no_grow_home     ag_seeds_why_shops_no_stock ag_seeds_why_markets_closed ag_seeds_why_limited_transport ag_seeds_why_travel_restrict ag_seeds_why_price_increase ag_seeds_why_money_lack ag_seeds_why_other ag_fertil_no_trans_why ag_fertil_no_trans_why_other ag_input_no_trans_why ag_input_no_trans_why_other    ag_crops_progress ag_plant_what_covid_measures ag_plant_what_no_workers_hired ag_plant_what_fewer_workers ag_plant_safety_mask ag_plant_safety_no_hand_shakes ag_plant_safety_gloves ag_plant_safety_distance ag_plant_safety_others ag_plant_why_not_hire_workers ag_expected_output ag_expected_harvest_quantity ag_expected_harvest_unit ag_expected_harvest_kg     ag_price_small_banana ag_price_medium_banana ag_price_large_banana ag_price_100kg_cassava_bag ag_price_basin_dry_casava_chips ag_price_kg_dry_cassava_flour ag_price_kg_dry_beans ag_price_basin_fresh_beans ag_price_kg_maize_grains    ag_no_grow_less_labor ag_no_grow_restrict ag_no_grow_no_seeds ag_no_grow_no_fertilizer ag_no_grow_no_other ag_no_grow_no_outputs ag_no_grow_family_ill ag_plant_what_area_increased ag_plant_how_delay_sell_outputs ag_plant_how_care_ill_fammily ag_plant_what_area_reduced ag_main_crop ag_main_crop_completed_plant ag_main_crop_area_acres ag_main_crop_expect_output         educ_any_child_3_to_18 educ_attend_pre_covid educ_engage_after educ_engage_assigs_completed educ_engage_mobile_learning educ_engage_tv_programs educ_engage_radio_programs educ_engage_tutor educ_engage_gov_materials educ_engage_other s4q15_other educ_teacher_contact educ_teacher_contact_sms educ_teacher_contact_online educ_teacher_contact_email educ_teacher_contact_mail educ_teacher_contact_phone educ_teacher_contact_whatsapp educ_teacher_contact_facebook educ_teacher_contact_physically educ_teacher_contact_others s4q17_other financial_access financial_access_success financial_access_why financial_access_why_spec      nfe_place_closure_other_why nfe_closure_why_no_customers nfe_closure_why_no_inputs nfe_closure_why_travel_restrict nfe_closure_why_ill_cvd nfe_closure_why_ill_other nfe_closure_why_care_family nfe_closure_why_seasonal nfe_closure_why_vacation nfe_closure_why_other nfe_cvd_challenges_inputs nfe_cvd_challenges_op_money nfe_cvd_challenges_loans nfe_cvd_challenges_rent nfe_cvd_challenges_pay_workers nfe_cvd_challenges_sales nfe_cvd_challenges_other


tsset hhid survey

gen     lockdown=0
replace lockdown=1 if survey==1 

gen lockdown_2=0
replace lockdown_2=1 if survey==2 

gen lockdown_3=0
replace lockdown_3=1 if survey==7


*************************************************************************************************************************************************************************
* Creating dummy dependent variables
*************************************************************************************************************************************************************************
gen anyfood_insec=0

foreach i in food_insufficient_worry food_healthy_lack food_few_kinds food_skipped_meal food_less_than_expected food_ranout food_hungry food_didnt_eat_all_day {
	replace `i'=0 if `i'==2 | `i'==.        // 2 represents no for facing food insecurity problems
	replace anyfood_insec=1 if `i'==1       // Creating a dummy rep any type of food insec
}


*************************************************************************************************************************************************************************
* Correcting agricultural variables
*************************************************************************************************************************************************************************
replace ag_crops_plant=0   if ag_crops_plant==2  | ag_crops_plant==3            // Both 2 and 3 represent no
replace ag_crops_plant=.   if survey==2 | survey==4 | survey==5 | survey==6     // For R2 R4 R6, numbers from prior round preloaded, and the number of yes goes down by 9 or 10

***Planting question asked in R1,4,7. For R5, prior rnd resp used. Harvesting question in R2. No question in R3 and 6
replace ag_plant_change=.  if survey==2  | survey==5   
replace ag_plant_change=0  if ag_plant_change==2 | ag_plant_change==3    // Both 2 and 3 represent no

foreach i in ag_plant_what_abandoned ag_plant_what_area_reduce ag_plant_what_area_increase ag_plant_what_fast_crops ag_plant_what_less_variety ag_plant_what_more_variety ag_plant_what_delayed {
	replace `i'=. if survey==2 | survey==3 | survey==5 | survey==6  // These questions were not asked for these rounds
	replace `i'=0 if ag_plant_change~=. & `i'==.   //If there is a change in ag planting, but missing value for the specific strategy, then the dummy should be 0
}	

foreach i in ag_farm_products_sell_need ag_farm_products_sell_able work_for_pay  {
	replace `i'=0 if `i'==2    // 2 rep No
}


*************************************************************************************************************************************************************************
* Creating NFE variables
*************************************************************************************************************************************************************************
gen     nfe=0 if survey>=2 & survey<=7                                   // Dummy to represent work in non-farm business, info not present for R1
replace nfe=1 if nfe_operate==1                                          // Rep s5aq11, where 1 meant yes operated a business
replace nfe=1 if survey>=2 & survey<=7 & nfe_temporary_close_status==1   // s5aq11a asks about current status of business, where 1 represents "Open"


*************************************************************************************************************************************************************************
* Correcting income data
*************************************************************************************************************************************************************************
foreach i in inc_level_farm inc_level_nfe inc_level_wage  inc_level_assets inc_level_pension inc_level_remittance inc_level_family inc_level_non_family inc_level_ngo inc_level_govt {
	replace `i'=0  if `i'==2             // 1 rep increase, 2 rep stayed the same
	replace `i'=-1 if `i'>=3 & `i'<=4    // 3 and 4 rep decrease or complete loss
	replace `i'=0  if `i'==. & survey~=7
}


*************************************************************************************************************************************************************************
* Correcting complicated employment related variables
*************************************************************************************************************************************************************************
replace work_same_before=work_same_before_no if survey==2             
replace work_same_before=0                   if work_same_before==2   // 2 rep No
// work_same_before is whether doing the same work as prior round for R3-7 and whether doing the same work as prior to covid for R1, 
// work_same_before_no  is only for R2 which asks whether doing the same work as prior round (R1), so correcting for this in round 2 

sort hhid survey
gen work_area=work_main_business_area  // Creating the work area variable so that we can update where they are working in later rounds

bysort hhid: gen lag_work_main_business_area = work_main_business_area[_n-1]
bysort hhid: gen lag_work_main_activity      = work_main_activity[_n-1]   
replace work_area=lag_work_main_activity      if survey==2 & work_same_before_yes==1 & work_area==.  
// work_main_activity asks in R1 for people who were not working, where they were working before Covid
// work_same_before_yes is R2 Q, where it asks whether it is the same job as the one before covid. Only asked for people who were working before covid but not at baseline. 

replace work_area=lag_work_main_business_area if survey==2 & work_same_before_no==1  
// work_main_business_area is the main place of current work. work_same_before_no is R2 Q, where asked whether it is the same job as baseline, if they worked at baseline

// Updating each round after R2 with the industry that they are working on by using data from prior round
foreach i in 3 4 5 6 7 {
    bysort hhid: gen lag_work_area = work_area[_n-1]
	replace work_area=lag_work_area if work_area==. & lag_work_area~=. & work_same_before==1 & survey==`i'  // If no work area present, prior round data used
	drop lag_work_area
}
// Imp to note, even when people not working last week, they may be expecting to return to a certain work, which shows up in work_same_before

bysort hhid: gen lag_work_area    = work_area[_n-1]
bysort hhid: gen lag_work_for_pay = work_for_pay[_n-1]    // Whether employed last round

gen    ag_switch=0
gen nonag_switch=0

replace ag_switch=1 if survey==1 & work_area==11111 & work_before_main_activity~=11111 & work_before_main_activity~=. & work_for_pay==1   // 11111 represents ag work
replace ag_switch=1 if survey~=1 & work_area==11111 & lag_work_area~=11111 & lag_work_area~=. & lag_work_for_pay==1 & work_for_pay==1
// work_before_main_activity asks people who were working in R1, what job they were working on before Covid if they did change jobs since then 
// work_main_activity asks in R1 for people who were not working, where they were working before Covid

replace nonag_switch=1 if survey==1 & work_area~=11111 & work_area~=. & work_before_main_activity==11111 & work_for_pay==1   // 11111 represents ag work
replace nonag_switch=1 if survey~=1 & work_area~=11111 & work_area~=. & lag_work_area==11111 & lag_work_for_pay==1 & work_for_pay==1

gen     ag=1 if lag_work_area==11111 & lag_work_for_pay==1 & survey>=2 & survey<=7     // Creating a dummy that represents ag hh based on prior round. 
replace ag=1 if survey==1 & (work_main_activity==11111 | work_before_main_activity==11111 | work_main_business_area==11111 & work_same_before==1)
replace ag=0 if ag==.

replace work_same_before=. if work_same_before~=1 & work_same_before~=0 & work_same_before~=.  // work_same_before has 4 obs with weird value of .a, correcting that here   
replace work_same_before=. if work_for_pay==0 & survey>=2 & survey<=7 | lag_work_for_pay==0 & survey>=2 & survey<=7 | work_for_pay==0 & survey==1   // Correcting for estimations


*************************************************************************************************************************************************************************
* Migration related variables
*************************************************************************************************************************************************************************
gen hh_adults = hh_adult_males + hh_adult_females
gen hh_child  = hh_total_members - hh_adults 
gen hh_adults_prior = hh_adult_males_prior + hh_adult_females_prior
gen hh_child_prior  = hh_total_members_prior - hh_adults_prior

gen hhmem_change  = hh_total_members - hh_total_members_prior
gen adult_change  = hh_adults        - hh_adults_prior 
gen child_change  = hh_child - hh_child_prior

replace urban=0 if urban==3  // 3 rep rural
replace urban=1 if urban==2  // 2 rep other urban

foreach i in 1 2 3 4 5 {
bysort hhid: gen lockdown`i' = lockdown[_n-`i']      // Creating lagged lockdown vars
}

bysort hhid: egen wt = mean(weight_final)
local       wt = "[pw=wt]"  
local controls = "cases_smooth_per_100000 hh_total_members_prior"   
svyset  [pweight = wt]

keep if hh_total_members_prior~=.



exit








*************************************************************************************************************************************************************************
* Estimations on food insecurity
*************************************************************************************************************************************************************************
xtreg anyfood_insec lockdown lockdown_2 lockdown_3 `controls' `wt', fe 
outreg2 using "`input'\Est1.xml", e(N df_m F r2) excel replace dec(3) 

foreach i in food_insufficient_worry food_healthy_lack food_few_kinds food_skipped_meal food_less_than_expected food_ranout food_hungry food_didnt_eat_all_day {
	xtreg `i' lockdown lockdown_2 lockdown_3  `controls' `wt', fe    
	outreg2 using "`input'\Est1.xml", e(N df_m F r2) excel append dec(3)
}


*************************************************************************************************************************************************************************
* Estimations on income
*************************************************************************************************************************************************************************
feologit  inc_level_farm   lockdown lockdown_2  `controls' `wt'
outreg2 using "`input'\Est3.xml", e(N df_m F r2) excel replace dec(3) 

foreach i in inc_level_farm inc_level_nfe inc_level_wage  inc_level_assets inc_level_pension inc_level_remittance inc_level_family inc_level_non_family inc_level_ngo inc_level_govt {
	sum `i' 
	feologit  `i'   lockdown lockdown_2  `controls' `wt'
	outreg2 using "`input'\Est3.xml", e(N df_m F r2) excel append dec(3) 
}
exit

*************************************************************************************************************************************************************************
* Estimations on Migration
*************************************************************************************************************************************************************************
xtreg  hhmem_change lockdown lockdown_2 lockdown_3 cases_smooth_per_100000 `wt', fe    
outreg2 using "`input'\Est4.xml", e(N df_m F r2) excel replace dec(3)

sum hhmem_change 

foreach i in adult_change child_change urban {
	xtreg `i' lockdown lockdown_2 lockdown_3 cases_smooth_per_100000 `wt', fe    
	outreg2 using "`input'\Est4.xml", e(N df_m F r2) excel append dec(3)
	sum `i'
}


*************************************************************************************************************************************************************************
* Differences in effects by agricultural household
*************************************************************************************************************************************************************************
xtreg work_for_pay c.lockdown c.lockdown_2 c.lockdown_3 ag c.lockdown#c.ag c.lockdown_2#c.ag c.lockdown_3#c.ag `controls' `wt', fe    
	outreg2 using "`input'\Est5.xml", e(N df_m F r2) excel replace dec(3)

foreach i in anyfood_insec food_insufficient_worry food_healthy_lack food_few_kinds food_skipped_meal food_less_than_expected food_ranout food_hungry food_didnt_eat_all_day {
	xtreg `i' c.lockdown c.lockdown_2 c.lockdown_3 ag c.lockdown#c.ag c.lockdown_2#c.ag c.lockdown_3#c.ag `controls' `wt', fe    
	outreg2 using "`input'\Est5.xml", e(N df_m F r2) excel append dec(3)
}


exit


*************************************************************************************************************************************************************************
* Estimations on employment
*************************************************************************************************************************************************************************
xtreg work_for_pay lockdown lockdown_2 lockdown_3  `controls' `wt', fe     
outreg2 using "`input'\Est2.xml", e(N df_m F r2) excel replace dec(3) 

tab work_stop_why if lockdown==1

foreach i in work_same_before nfe {
	xtreg work_same_before lockdown lockdown_2 lockdown_3 `controls' `wt', fe 
	outreg2 using "`input'\Est2.xml", e(N df_m F r2) excel append dec(3) 
}

tab survey concerns_cvd_srs_ill if hh_total_members_prior~=. , row

/*
append using "C:\Users\alams\OneDrive - Dickinson College\Documents\Research\Uganda HF\Data\Ag hh.dta"

tsset, clear
tsset hhid survey
bysort hhid: egen wt2 = mean(weight_final)

replace cases_smooth_per_100000=0 if survey==0
replace lockdown=0                if survey==0
replace lockdown_2=0 if survey==0
replace lockdown_3=0 if survey==0
replace agri=0 if work_area~=11111 & work_for_pay==1 & survey>=1 & survey<=7
replace agri=1 if work_area==11111 & work_for_pay==1 & survey>=1 & survey<=7
replace agri=2 if                    work_for_pay==0 & survey>=1 & survey<=7

xtmlogit agri i.lockdown lockdown_2 lockdown_3 cases_smooth_per_100000 [pw=wt2], fe rrr baseoutcome(0)    
outreg2 using "`input'\Est2.xml", e(N df_m F r2) excel append dec(3) 
exit
drop if survey==0
*/


*************************************************************************************************************************************************************************
* Estimations on agriculture
*************************************************************************************************************************************************************************
xtreg ag_crops_plant lockdown lockdown_2 lockdown_3 `controls' `wt', fe     
outreg2 using "`input'\Est6.xml", e(N df_m F r2) excel replace dec(3) 

foreach i in  ag_plant_change ag_farm_products_sell_able {
	xtreg `i' lockdown lockdown_2 lockdown_3  `controls' `wt', fe     
	outreg2 using "`input'\Est6.xml", e(N df_m F r2) excel append dec(3) 
}	

foreach i in ag_plant_change  ag_plant_what_area_reduce ag_plant_what_area_increase  ag_plant_what_less_variety ag_plant_what_more_variety ag_plant_what_delayed ag_plant_what_fast_crops ag_plant_what_abandoned {
	svy: tab survey `i'
}	


*************************************************************************************************************************************************************************
* Appendix tables - conditional logit
*************************************************************************************************************************************************************************
xtlogit anyfood_insec lockdown lockdown_2 lockdown_3 `controls', fe 
outreg2 using "`input'\A1.xml", e(N df_m F r2) excel replace dec(3) 

foreach i in food_insufficient_worry food_healthy_lack food_few_kinds food_skipped_meal food_less_than_expected food_ranout food_hungry food_didnt_eat_all_day {
	xtlogit `i' lockdown lockdown_2 lockdown_3 `controls', fe    
	outreg2 using "`input'\A1.xml", e(N df_m F r2) excel append dec(3)
}


*************************************************************************************************************************************************************************
* Lockdown index and mobility measures
*************************************************************************************************************************************************************************
xtreg anyfood_insec index_4 `controls', fe 
outreg2 using "`input'\Est1.xml", e(N df_m F r2) excel replace dec(3) 

foreach j in index_4 residential_pre_01_30 {
foreach i in anyfood_insec food_insufficient_worry food_healthy_lack food_few_kinds food_skipped_meal food_less_than_expected food_ranout food_hungry food_didnt_eat_all_day {
	xtreg `i' `j'  `controls' `wt', fe    
	outreg2 using "`input'\Est1.xml", e(N df_m F r2) excel append dec(3)
}
}

*/


*************************************************************************************************************************************************************************
* Summary estimations
*************************************************************************************************************************************************************************
gen survey2=survey
replace survey2=8 if survey==3 | survey==4 | survey==5 | survey==6 

gen     agri2=0 if work_area~=11111 & work_for_pay==1 & survey>=1 & survey<=7
replace agri2=1 if work_area==11111 & work_for_pay==1 & survey>=1 & survey<=7

mean anyfood_insec [pw=wt], over(survey2)
outreg2 using "`input'\Est11.xml", e(N) excel replace noaster nose dec(3)

foreach i in  anyfood_insec food_insufficient_worry food_healthy_lack food_few_kinds food_skipped_meal food_less_than_expected food_ranout food_hungry food_didnt_eat_all_day  work_for_pay nfe work_same_before agri2 inc_level_farm inc_level_nfe inc_level_wage  inc_level_assets inc_level_pension inc_level_remittance inc_level_family inc_level_non_family inc_level_ngo inc_level_govt hh_total_members hh_adults hh_child urban {
	mean `i' [pw=wt], over(survey2)
	outreg2 using "`input'\Est11.xml", e(N) excel append noaster nose dec(3)
}

foreach i in  anyfood_insec food_insufficient_worry food_healthy_lack food_few_kinds food_skipped_meal food_less_than_expected food_ranout food_hungry food_didnt_eat_all_day  work_for_pay nfe work_same_before agri2 inc_level_farm inc_level_nfe inc_level_wage  inc_level_assets inc_level_pension inc_level_remittance inc_level_family inc_level_non_family inc_level_ngo inc_level_govt hh_total_members hh_adults hh_child urban {
	mean `i' [pw=wt]
	outreg2 using "`input'\Est11.xml", e(N) excel append noaster nose dec(3)
}


*************************************************************************************************************************************************************************
* Summary stats without weights
*************************************************************************************************************************************************************************
estpost sum anyfood_insec food_* work_for_pay nfe ag hh_total_members hh_adults hh_child urban
	esttab ., cells ("mean count") noobs 
estpost sum anyfood_insec food_* work_for_pay nfe ag hh_total_members hh_adults hh_child urban if lockdown==1
	esttab ., cells ("mean count") noobs 
estpost sum anyfood_insec food_* work_for_pay nfe ag hh_total_members hh_adults hh_child urban if lockdown==0
	esttab ., cells ("mean count") noobs 

estpost sum ag_switch nonag_switch work_same_before if work_for_pay==1 & lag_work_for_pay==1 & survey>=2 & survey<=7 | work_for_pay==1 & survey==1
	esttab ., cells ("mean count") noobs 
estpost sum ag_switch nonag_switch work_same_before if work_for_pay==1 & lag_work_for_pay==1 & survey>=2 & survey<=7 & lockdown==1 | work_for_pay==1 & survey==1 & lockdown==1 
	esttab ., cells ("mean count") noobs  
estpost sum ag_switch nonag_switch work_same_before if work_for_pay==1 & lag_work_for_pay==1 & survey>=2 & survey<=7 & lockdown==0 | work_for_pay==1 & survey==1 & lockdown==0 
	esttab ., cells ("mean count") noobs 

foreach i in anyfood_insec food_insufficient_worry food_healthy_lack food_few_kinds food_skipped_meal food_less_than_expected food_ranout food_hungry food_didnt_eat_all_day work_for_pay nfe ag hh_total_members hh_adults hh_child urban {
	ttest `i', by(lockdown)
}

gen x=0 
replace x=1 if work_for_pay==1 & lag_work_for_pay==1 & survey>=2 & survey<=7 | work_for_pay==1 & survey==1
gen lockdown_1=lockdown if x==1
drop x

foreach i in ag_switch nonag_switch work_same_before {
	ttest `i', by(lockdown_1) 
}
exit





*Marginal estimations: do not think it works: https://www.statalist.org/forums/forum/general-stata-discussion/general/1534414-margins-after-xtlogit-fe
*xtlogit work_for_pay lockdown hh_total_members_prior i.survey, fe     
*margins, dydx(*) 

*https://github.com/OxCGRT/covid-policy-tracker/blob/master/documentation/codebook.md#containment-and-closure-policies
*https://www.bsg.ox.ac.uk/research/research-projects/covid-19-government-response-tracker