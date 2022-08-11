### Makefile for [Project Title]       ###

PAPER = [file_name for md/LaTeX file]
TEXT   = ./paper
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

.PHONY: create_base_dhs
create_base_dhs: $(DAT)/base.rds $(DAT)/base.dta

$(DAT)/base.rds $(DAT)/base.dta: $(CODE)/04_load_covid_cases_restrictions.R \
 $(DAT)/load_3.rds
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1

$(DAT)/load_3.rds: $(CODE)/03_load_pre_covid_hh_data.R \
 $(DAT)/load_2.rds
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1

$(DAT)/load_2.rds: $(CODE)/02_load_roster_info.R \
 $(DAT)/load_1.rds
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1

$(DAT)/load_1.rds: $(CODE)/01_load_hh_survey_data.R \
 $(wildcard $(RAW)/round1/*) $(wildcard $(RAW)/round2/*) \
 $(wildcard $(RAW)/round3/*) $(wildcard $(RAW)/round4/*) \
 $(wildcard $(RAW)/round5/*) $(wildcard $(RAW)/round6/*) \
 $(wildcard $(RAW)/round7/*) \
 $(wildcard $(RAW)/panel_19_20/Agric/*) $(wildcard $(RAW)/panel_19_20/HH/*) \
 $(RAW)/panel_19_20/pov2019_20.dta
	Rscript --verbose $(CODE)/$(<F) > $(CODE)/$(basename $(<F)).ROut 2>&1



