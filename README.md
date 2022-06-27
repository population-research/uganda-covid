# Effects of Uganda's Covid Lockdown

**Purpose:**

Two main research question: 
1) How did lockdown affect food insecurity and health access insecurity (access to med treatment, medicine, water) in Uganda?
2) How did they cope with the lockdown? Did they change their agricultural strategy? Did they receive more remittance? Did they receive more govt. assistance? Was there more migration? [There is data on all of these factors]

Sub-questions:
i) Who mostly suffered the insecurity, agricultural households or non-ag households?
ii) Was the increased insecurity caused by a reduction in income? Or reduced production of food by agricultural households?
iii) How specifically was income affected? In other words, was it because of unemployment, or reduction in self-employment income or changes in agriculture?
iv) how were agricultural practices affected? Did they not grow crop because of covid? How did covid pose specific challenge to their ag production? How did they change crop planting strategies? ag revenue higher or lower?
v) How did shocks, in the presence of covid, affect behavior? 


## Directory structure

You need the following directories for the code to run:

- raw_data: original data files.
- code: data cleaning, variables, and analysis
- data: derived data files and results
- figures: generated figures and other figures for paper
- tables: generated tables

In addition, the following directories has writing in them:

- paper: the paper itself, together with snippets and notes
- presentations: various presentations, each its own tex file

## Data 

Data are from the Uganda High-Frequency Phone Survey on COVID-19 2020-2021

All data are freely available from the World Bank's micro-data website:
[https://microdata.worldbank.org/index.php/catalog/3765/](https://microdata.worldbank.org/index.php/catalog/3765/).
Notice, this requires registration with a brief description of the
intended use of the data.

For the code to run, download the data in Stata format from
[https://microdata.worldbank.org/index.php/catalog/3765/get-microdata](https://microdata.worldbank.org/index.php/catalog/3765/get-microdata).
Each round should be a separate directory:

```
./raw_data
|-- round1
|-- round2
|-- round3
|-- round4
|-- round5
|-- round6
|-- round7
```

The documentation for the individual rounds is available at:
[https://microdata.worldbank.org/index.php/catalog/3765/related-materials](https://microdata.worldbank.org/index.php/catalog/3765/related-materials)



##  Generating files

All data wrangling is done in R and analyses in a combination of R
and Stata.

All figures, tables, and pdfs are generated by running `make`.
If you want only a specific file use `make <fileName>`.
See the "Makefile" in the base directory for more information 
on what files are included.


