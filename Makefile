### Makefile for Impact of Twin Lockdowns on Hunger, Labor Market Outcomes, and Household Coping Mechanisms: Evidence from Uganda       ###

PAPER = uganda_covid_wber_revisions
TEXT   = ./paper
REP    = ./response
FIG    = ./figures
TAB    = ./tables
CODE   = ./code
RAW    = ./raw_data
DAT    = ./data

### To run on Mac and Linux
### If you want to run this on Windows you will have to figure out how to call a pdf viewer
OS := $(shell uname)
ifeq ($(OS),Darwin)
PDFAPP := open -a Skim
else
PDFAPP := evince 
endif


###################################################################
### Data extraction                                             ###
###################################################################

.PHONY: create_base
create_base: $(DAT)/base.rds $(DAT)/base.dta

$(DAT)/base.rds $(DAT)/base.dta: $(CODE)/05_combine_data.R \
 $(DAT)/temp_hh_survey.rds $(DAT)/temp_roster_info.rds \
 $(DAT)/temp_pre_covid_hh_data.rds $(DAT)/temp_covid_cases_restrictions.rds
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1

$(DAT)/temp_hh_survey.rds: $(CODE)/01_load_hh_survey_data.R \
 $(RAW)/round1/* $(RAW)/round2/* \
 $(RAW)/round3/* $(RAW)/round4/* \
 $(RAW)/round5/* $(RAW)/round6/* \
 $(RAW)/round7/* 
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1

$(DAT)/temp_roster_info.rds: $(CODE)/02_load_roster_info.R \
 $(wildcard $(RAW)/round1/*) $(wildcard $(RAW)/round2/*) \
 $(wildcard $(RAW)/round3/*) $(wildcard $(RAW)/round4/*) \
 $(wildcard $(RAW)/round5/*) $(wildcard $(RAW)/round6/*) \
 $(wildcard $(RAW)/round7/*) \
 $(RAW)/panel_19_20/HH/gsec2.dta
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1

$(DAT)/temp_pre_covid_hh_data.rds: $(CODE)/03_load_pre_covid_hh_data.R \
 $(RAW)/round1/Cover.dta \
 $(RAW)/panel_19_20/pov2019_20.dta \
 $(RAW)/panel_19_20/Agric/agsec2a.dta \
 $(RAW)/panel_19_20/HH/gsec12_2.dta \
 $(RAW)/panel_19_20/HH/gsec14.dta
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1

$(DAT)/temp_covid_cases_restrictions.rds: $(CODE)/04_load_covid_cases_restrictions.R \
 $(RAW)/external_data/Global_Mobility_Report.csv
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1

###################################################################
### Graphing and Data Analysis                                  ###
###################################################################

# Descriptive Graphs
DESC_GRAPHS := \
 $(FIG)/combined.pdf \
 $(FIG)/mobility_national_retail.pdf \
 $(FIG)/mobility_national_residential.pdf \
 $(FIG)/mobility_national_workplaces.pdf \
 $(FIG)/mobility_national_grocery.pdf \
 $(FIG)/mobility_national_parks.pdf \
 $(FIG)/mobility_national_transit.pdf \
 $(FIG)/mobility_regional_retail.pdf \
 $(FIG)/mobility_regional_workplaces.pdf \
 $(FIG)/mobility_regional_residential.pdf \
 $(FIG)/mobility_regional_grocery.pdf \
 $(FIG)/mobility_regional_parks.pdf \
 $(FIG)/mobility_regional_transit.pdf \
 $(FIG)/food_insecurity_by_survey_round_3_levels.pdf \
 $(FIG)/food_insecurity_by_region_survey_round_3_levels.pdf 

$(DESC_GRAPHS): $(CODE)/06_descriptive_graphs.R \
 $(DAT)/base.rds
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1
	
$(FIG)/food_insecurity_survey.pdf $(FIG)/food_insecurity_region.pdf: $(CODE)/07_food_insecurity.R \
 $(DAT)/base.rds
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1	
	
SEASONALITY_GRAPHS := \
 $(FIG)/seasonality.pdf \
 $(FIG)/seasonality_comparison.pdf \
 $(FIG)/seasonality_urban.pdf
 
$(SEASONALITY_GRAPHS): $(CODE)/08_seasonality.R \
 $(DAT)/base.rds
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1
	
$(TAB)/survey_table.tex $(FIG)/food_insecurity_survey_attrition_combined.pdf: $(CODE)/09_attrition.R \
 $(DAT)/base.rds
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1 

# Response Graphs and table
RESPONSE := \
 $(FIG)/work_employment.pdf \
 $(FIG)/transition_absolute.pdf \
 $(TAB)/transition_table.tex \
 $(FIG)/income_sources.pdf \
 $(FIG)/income_assistance.pdf \
 $(FIG)/household_composition_and_urban_location.pdf \
 $(FIG)/agri_vs_non_agri.pdf
	
$(RESPONSE): $(CODE)/10_response.R \
 $(DAT)/base.rds
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1
	
	
$(FIG)/ag_plant_change.pdf $(TAB)/ag_change_table.tex: $(CODE)/11_agricultural_change.R \
 $(DAT)/base.rds
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1	

###################################################################
### Paper Production                                            ###
###################################################################

.PHONY: paper
paper: $(TEXT)/$(PAPER).pdf

$(TEXT)/$(PAPER).pdf: $(TEXT)/$(PAPER).md $(TEXT)/uganda_covid.bib \
 $(TEXT)/default.yaml \
 $(DESC_GRAPHS) \
 $(FIG)/food_insecurity_survey.pdf $(FIG)/food_insecurity_region.pdf \
 $(TAB)/survey_table.tex $(FIG)/food_insecurity_survey_attrition_combined.pdf \
 $(SEASONALITY_GRAPHS) \
 $(RESPONSE) \
 $(FIG)/ag_plant_change.pdf $(TAB)/ag_change_table.tex
	cd $(TEXT); pandoc default.yaml $(PAPER).md -o $(PAPER).pdf --pdf-engine=xelatex -N -s --filter pandoc-crossref --citeproc

.PHONY: word
word: $(TEXT)/$(PAPER).docx

$(TEXT)/$(PAPER).docx: $(TEXT)/$(PAPER).md $(TEXT)/uganda_covid.bib \
 $(TEXT)/default.yaml \
 $(DESC_GRAPHS) \
 $(FIG)/food_insecurity_survey.pdf $(FIG)/food_insecurity_region.pdf \
 $(TAB)/survey_table.tex $(FIG)/food_insecurity_survey_attrition_combined.pdf \
 $(SEASONALITY_GRAPHS) \
 $(RESPONSE) \
 $(FIG)/ag_plant_change.pdf $(TAB)/ag_change_table.tex
	cd $(TEXT); pandoc default.yaml $(PAPER).md -o $(PAPER).docx -N -s --filter pandoc-crossref --citeproc

.PHONY: view
view: $(TEXT)/$(PAPER).pdf
	$(PDFAPP) $(TEXT)/$(PAPER).pdf

.PHONY: response
response: $(REP)/wber_response.pdf

$(REP)/wber_response.pdf: $(REP)/wber_response.md $(TEXT)/uganda_covid.bib \
 $(REP)/default.yaml
	cd $(REP); pandoc default.yaml wber_response.md -o wber_response.pdf --pdf-engine=xelatex -N -s --filter pandoc-crossref --citeproc

.PHONY: response_word
response_word: $(REP)/wber_response.docx

$(REP)/wber_response.docx: $(REP)/wber_response.md $(TEXT)/uganda_covid.bib \
 $(REP)/default.yaml
	cd $(REP); pandoc default.yaml wber_response.md -o wber_response.docx -N -s --filter pandoc-crossref --citeproc


