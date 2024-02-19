---
title: 'Impact of Twin Lockdowns on Hunger, Labor Market Outcomes, and
		Household Coping Mechanisms: Evidence from Uganda'
date: February 2024
author:
- Claus C. Pörtner^[Associate Professor, 
	Albers School of Business and Economics, 
	Seattle University, Seattle, WA, and Center for Studies
	in Demography and Ecology, University of Washington, Seattle, WA. 
	\href{mailto:cportner@seattleu.edu}{\texttt{cportner@seattleu.edu}},
    \href{http://www.clausportner.com}{\texttt{www.clausportner.com}}]
- Shamma Adeeb Alam^[Associate Professor, Department of International
	Studies, Dickinson College, Carlisle, PA.
	\href{mailto:alams@dickinson.edu}{\texttt{alams@dickinson.edu}}]
- Ishraq Ahmed^[Senior Economist, 
    Policy Development, Office of Tax Policy,
    Virginia Department of Taxation, Richmond, VA.
    \href{mailto:Ishraq.Ahmed@tax.virginia.gov}{texttt{Ishraq.Ahmed@tax.virginia.gov}}]
thanks: |
  We would like to thank seminar participants at Howard University, Alex
  Henke, and four anonymous referees for their helpful comments and suggestions. 
  We would also like to thank Pascal Ntaganda for his research assistance.
  Partial support for this research came from a Eunice Kennedy Shriver National
  Institute of Child Health and Human Development research infrastructure grant,
  5R24HD042828, to the Center for Studies in Demography and Ecology at the
  University of Washington.
  
abstract: |
  \noindent We examine the short- and medium-run impacts of two of the strictest
  Covid-19 lockdowns in the developing world, employing longitudinal
  data from Uganda. 
  We find significant, immediate increases in food insecurity after the first
  lockdown and a continued negative impact three months after its
  lifting. 
  The second lockdown's medium-term impact was even worse, likely because 
  of a compounding effect of a concurrent drier-than-normal period. 
  The rising food insecurity was partly the result of the lockdown-related
  reductions in the availability of paid work. Agricultural households
  were more likely to continue working and consequently saw smaller
  increases in food insecurity. Furthermore, the likelihood of engaging
  in agricultural work increased after the first lockdown, suggesting a
  switch to agriculture as a coping mechanism. The other coping
  mechanisms that households typically rely on for idiosyncratic shocks
  failed in the face of a worldwide shock, contributing to the sizeable
  increase in food insecurity.
bibliography: uganda_covid.bib
csl: the-quarterly-journal-of-economics.csl
link-citations: true

---

\newpage

# Introduction

Uganda had two of the strictest Covid-19 lockdowns in Sub-Saharan Africa, 
with the most severe parts of these lockdowns covering April through June 2020 
and July through August 2021 [@BBC2020;@Birner2021;@Mahmud2021].
As [@fig:raw-insecurity] shows, Uganda also experienced substantially higher food
insecurity during or immediately following these lockdowns than at any other time
during the pandemic.[^definition]
Using longitudinal household data, we aim to understand the extent to which
these changes arose from the twin lockdowns in Uganda by examining food insecurity, 
labor market outcomes, and how households attempted to cope with the lockdowns.

[^definition]: The definitions of the three levels of food insecurity are described 
in detail below [@FAO2015].

![Food Insecurity by Survey Round of the Uganda High-Frequency Phone Survey on 
Covid-19](../figures/food_insecurity_by_survey_round_3_levels.pdf){#fig:raw-insecurity}




Early assessments of the impact of the pandemic in developing countries
generally find a negative effect of lockdowns on food insecurity,
income, employment, and agricultural production.[^1] 
However, these studies have limitations, such as using only cross-sectional type data
or having a narrow geographical focus covering only one or two villages
or states in a country. 
These studies also suggest that households try
to cope with the lockdowns through behavior changes, such as reducing
non-food expenditure, drawing down savings, leaving savings and loan
groups, increasing borrowing, and selling assets 
[@Ceballos2021;@Headey2020;@Kansiime2021;@Mahmud2023;@Ronkko2022;@Ruszczyk2021]. 
In addition, there is evidence that remittances declined, and there was insufficient 
government support to help households cope with the shock 
[@Ceballos2021;@Curi-Quinto2021].

[^1]: One set of studies examines the impact of Covid-19 lockdowns on
    food insecurity [@Agamile2022; @Ceballos2020; @Ceballos2021;
    @Dasgupta2021; @Egger2022; @Gaitan-Rossi2021; @Giacoman2021; 
    @Hamadani2020; @Harris2020; @Headey2020; @Jaacks2021; @Kansiime2021; 
    @Kesar2021; @Kundu2021; @Lee2022; @Nguyen2021]. 
    Another part of the literature examine
    the impact on income, employment, or agricultural production 
    [@Balde2020; @Deshpande2020; @Egger2022; @Harris2020; @Headey2020; 
    @Jaacks2021; @Kang2021; @Kesar2021; @Komin2021; @Ronkko2022;
    @Ruszczyk2021; @Wild2021].


Only four studies we could identify used longitudinal data to examine the
effects of lockdowns on food insecurity.[^2] 
Contrary to the cross-sectional studies, three of
these studies found no effect of lockdowns on food consumption across
Liberia, Malawi, Kenya, and Ethiopia 
[@Aggarwal2022;@Hirvonen2021;@Janssens2021]. 
Only the Nigerian lockdown appeared to increase food insecurity [@Amare2021].

[^2]: Two studies examine the impact on income and employment using
    panel data. Results for Ghana show that lockdowns significantly
    decreased employment and earnings [@Schotte2021]. 
    In rural Uganda, household income declined sharply during the initial
    lockdown. However, a year later, those without a business mostly
    recovered, while business-owning households still had significantly
    lower incomes [@Mahmud2023].



These studies do, however, also have limitations. The Liberia survey had
completion rates as low as 49% and evidence of a non-random attrition
[@Aggarwal2022]. 
The Kenya study focused only on households with
pregnant women or mothers with children below age four in one county
[@Janssens2021]. 
Ethiopia never went into a complete lockdown,
and the study covers only Addis Ababa 
[@Hirvonen2021]. 
Finally, the Nigeria study only examined the immediate effect of the lockdown on
a limited set of food insecurity questions 
[@Amare2021].

Our study contributes to two strands of the literature. First, we
contribute to the literature on understanding the impacts of the
lockdowns. Given the mixed findings and the limitations in data and
estimation methods in the prior literature, our study contributes to the
literature on the effects of lockdowns in three ways. First, we use
country-wide panel data with household fixed-effects models---which
allows us to control for unobservable household characteristics---to
compare household food insecurity across almost one-and-a-half years of
varying Covid-19 restriction levels. Second, we estimate short- and
medium-run effects of lockdowns to understand the persistence of the
impact of lockdowns in the months following their lifting. Moreover, the
second lockdown coincided with a prolonged dry spell, which allows us to
investigate whether a weather shock compounds the effect of the lockdown
[@Atamanov2022]. 
Finally, rather than relying solely on reported
lockdowns like in prior studies, we use additional data on the
stringency of lockdowns and Google mobility data to conduct robustness
checks of our analysis.

Second, we contribute to the small but growing body of research on the
effects of aggregate shocks and how households cope with these shocks.
There is a long-standing literature on how households in developing
countries smooth consumption in response to idiosyncratic shocks through
self-insurance approaches 
[@Case1995]. 
However, we know less about how these coping mechanisms fare when households 
are exposed to aggregate shocks. 
Most of the research on aggregate shocks has focused on
financial shocks and natural disasters and has found varying degrees of
ability to smooth consumption, although wealthier households are
generally better able to deal with the shock 
[@Del-Ninno2003; @Fallon2002;@Glewwe1998;@Hallegatte2020;@McKenzie2003;@Skoufias2003;@Thomas2007].

We contribute to the literature on coping with aggregate shocks in two
ways. First, we examine a repeated systemic shock, which was almost
entirely unanticipated, especially the first instance. Second, we use
panel data to directly analyze four broad categories of coping
mechanisms that households may use to mitigate the effects of these
shocks. The categories are changes in labor market participation,
diversification of income sources, transfers and remittances, and
changes in household structure through migration 
[@Foster2002; @Jayachandran2006; @Kochar1999; @McKenzie2003; @Morduch1995;
@Townsend1994; @Yang2007]. 
Our paper complements recent work showing that rural households in Uganda---especially 
non-farm business owners---experienced significant asset decline and increased 
likelihood of net borrowing, presumably as a coping mechanism after the first
lockdown [@Mahmud2023].

Using the Food and Agriculture Organization's (FAO) eight-question food
insecurity experience scale to measure food insecurity, we find that
food insecurity significantly increased during the lockdowns. The point
estimates are significant, with an increase of 25 percentage points for
any food insecurity during the first lockdown compared to the period
with no lockdowns. Even more concerningly, the two worst forms of food
insecurity, skipping meals and going without eating the whole day,
doubled and tripled in size relative to non-lockdown periods.

We also find that lockdowns have a substantial medium-term impact, with
food insecurity 12 percentage points higher two to three months after
the first lockdown was lifted. The medium-term impact was even higher
following the second lockdown, with a 22 percentage points increase in
any form of food insecurity three months after the second lockdown had
been lifted. The difference in the medium-run impact between the two
lockdowns suggests that the lower than normal rainfall during July 
through  October of 2021 compounded the negative effect of
the lockdown.

To understand the mechanisms behind the significant impact on food
insecurity, we examine the effect on labor market outcomes and find
substantial decreases in paid work during the lockdowns and decreases
across all income types, such as wage income, agricultural income,
non-farm business income, and income from assets owned. However,
households in the agricultural sector were significantly more likely to
continue work during and after the first lockdown than non-agricultural
households. Thus, their food security was less affected.

Furthermore, households attempted to cope with the lockdown by switching
to agricultural work, as shown by a significant increase in the
likelihood of working in agriculture after the first lockdown. However,
that increase dissipated by the second lockdown, likely because the
concurrent rainfall shortfall made agriculture less attractive as a coping
mechanism.

Traditional sources of support, such as remittance from abroad or
assistance from family members within the country, non-family
individuals, and development organizations, decreased during the
lockdowns. This suggests that the worldwide macroeconomic shock from
Covid-19 affected everyone's ability to transfer resources to needy
relatives or friends. This failure of the standard coping mechanisms
likely is a significant factor in explaining lockdowns' substantial
effect on food insecurity. Finally, we find evidence of a net increase
in household members, suggesting that lockdowns forced individuals
living elsewhere to join/rejoin the household.

[identification of effects based on comparing periods with 
varying degrees of lockdowns before Covid becomes an issue; 
important!]


# Data

Household and individual data come from the *Uganda High-Frequency 
Phone Survey on Covid-19* (UHFS), conducted by the Uganda Bureau of Statistics in
collaboration with the World Bank. 
The survey was conducted in seven waves, with four waves in 2020 
(June, August, September, and October) and three in 2021 (February, 
March, and October). 
The goal was to understand the economic and social impacts of the Covid-19 
pandemic by collecting high-frequency data on individuals and households 
[@Uganda-Bureau-of-Statistics2022]. 
To this end, the survey asked detailed
questions on food insecurity, employment, income, outside assistance,
and agricultural practices.

The UHFS sample is a subset of the 3,098 households interviewed in the
8th wave of the Uganda National Panel Survey in 2019/20 (UNPS 2019/20). 
In UNPS 2019/20, respondents were asked to provide a phone
number where they could be reached, either their own or that of a friend
or neighbor. Originally, the goal was to ensure households could be
reached in case they moved, but with the Covid lockdowns, the phone
numbers became the basis for surveying households. Of the 2,386
households that provided a phone number, 2,225 were successfully
interviewed for round 1 of the UHFS. The head of the household was
typically the respondent. If the household head was not present, another
member of the household over the age of 15 could respond to the survey.

A concern with phone surveys is that households with access to phones
are fundamentally different from households without access to phones. 
It is, for example, possible that phone surveys have a higher likelihood of
reaching wealthier households, who typically have better access to
phones, than poorer households. 
This would bias our results. 
To avoid any biases to the extent possible, we use the UHFS-provided survey
weights to ensure that the data is nationally representative 
[@Uganda-Bureau-of-Statistics2022].

Over the seven rounds, the cumulative attrition rate was 15.8 percent
of the originally surveyed households from round 1,
with 1,873 households from the baseline interviewed in round 7 (October 2021). 
However, replacement households were added to the sample
following the first round. 
This brings our total sample size to 2,334 households. 
The number of original households that remained in each
round together with the number of new households added in the follow-up
rounds and the total number of households per round are 
presented in Appendix Table \ref{tab:surveys}.

## Food Insecurity Measurement

The survey measured food insecurity based on the Food Insecurity
Experience Scale (FIES) developed by the FAO [@FAO2016]. 
FIES uses eight questions with dichotomous (yes/no) responses to capture
different aspects of food insecurity. 
The questions are whether, during the last 30 days, there was a time 
when any adult in the household experienced the following because of 
lack of money or other resources: 
(i) were worried about not having enough food to eat; 
(ii) were unable to eat healthy and nutritious/preferred foods; 
(iii) ate only a few kinds of foods; 
(iv) had to skip a meal; 
(v) ate less than you thought you should; 
(vi) ran out of food; 
(vii) were hungry, but did not eat; 
and (viii) went without eating for a whole day. 

We follow the prior literature and calculate three food insecurity measure 
based on the sum of the eight food insecurity questions:
any, moderate or severe, and severe food insecurity 
[@Kansiime2021;@Wambogo2018;@FAO2016].
"Any" corresponds to having answered yes to any of the questions, 
"moderate or severe" to having answered yes to four or more, 
and "severe" if answered yes to seven or eight questions 
[@FAO2015;@FAO2016].[^individual_questions]

[^individual_questions]: Results for the estimations below using
each individual question as the dependent variables are available 
upon request.

Although the sample for the UHFS is based on the UNPS, there is, unfortunately, 
no direct way to compare food insecurity across the surveys.
First, the only food security-related question in UNPS 2019/20 asked whether 
there has been a situation in the last 12 months when there was not enough food 
to feed the household, with a follow-up question about which months this happened in
and an open-ended question about why it happened.
These do not match up with any of the individual FIES questions or the cumulative
food insecurity measures that we use.
Second, the UNPS questions have a broader scope, which includes situations 
such as insecurity in reaching the market, the absence of food in the market, 
and floods, rather the lack of money or other resources in the FIES questions.
Finally, the UHFS questionnaire asks about the respondent and other adults 
in the household, rather than the entire household as in UNPS. 
As long as children are kept fed even in times of food insecurity, this does
not in itself prevent comparison, but it is possible that food goes to the 
most productive members of the household in order to preserve his or her 
productivity [@Pitt1990].[^months]

[^months]: A minor point of difference is that the UNPS asks about 
individual months, whereas the UHFS asks about the last 30 days before 
the interview, which, depending on when the survey took place, does not line up 
with the month-centric question of the UNPS.



# Lockdown Context and Enforcement

On March 18, 2020, the Ugandan government began imposing restrictions,
including travel restrictions and cancellation of public gatherings,
such as religious services, weddings, and music events 
[@Uganda-Bureau-of-Statistics2022]. 
A total lockdown was imposed on March 30 with a
nationwide curfew from 7 pm to 6:30 am, banning of public
transportation, strict regulations on the movement of vehicles, and
closure of all non-essential businesses, which extended till the end of May 
[@Alfonsi2021; @Margini2020].

Lockdowns were eased at the beginning of June 2020 with the resumption
of public transportation and the opening of businesses 
[@Guloba2021; @Monitor2020; @Schwartz2021; @Wagner2022]. 
Most small and medium businesses were back open by July-August 2020 
[@Alfonsi2021]. 
International travel restrictions remained until the end
of September, when land borders reopened, and international flights
resumed [@Guloba2021].

In response to the increasing number of Covid-19 infections in 2021, the
government of Uganda imposed a second severe lockdown from June 2021 
[@Atamanov2022; @Athumani2021]. 
This second lockdown was partly eased by the end of July 2021 [@Biryabarema2021].

To show the strictness of the lockdowns imposed, we employ a modified version
of the lockdown stringency index developed at the Blavatnik School of
Government, University of Oxford (Hale et al., 2021). 
The original index is a daily composite measure of how strict the lockdowns 
were based on nine indicators, including school closures, workplace closures, and
travel bans, rescaled to a value from 0 to 100, where 100 is the
strictest response. 
As some of the restrictions in the original index, such as school closure 
and international entry restrictions, are likely to have minimal immediate 
impacts on food insecurity, we recalculate the index using workplace 
closings, limits on public transport, stay-at-home requirements, 
and any restrictions on internal movement. 

The stringency index cannot capture the extent to which the lockdown 
policies were enforced or adhered to, and we, therefore, also use Google 
Mobility data on the percentage change in the number of 
visitors to retail and recreation locations relative to the pre-Covid 
behavior [@Google2022].
We use this measure because it captures the closures of shops and has 
better regional coverage than most other mobility measures.[^other_mobility]
Each day of the week is scaled relative to a "baseline day," which
is the median value from the five weeks, January 3 -- February 6, 2020. 

[^other_mobility]: Mobility information for two other types of locations, 
    the percentage change in the number of visitors to workplaces and the
    percentage change in the time spent at residential locations are 
    shown in Appendix Figures @fig:mobility_national_workplaces and
    @fig:mobility_national_residential.
    The visits to workplaces measure also has good regional coverage
    but it is unclear how relevant this is given that the majority of 
    people in Uganda work in agriculture.
    
![Revised Stringency Index, Visits to Retail and Recreation Locations, Daily New Covid Cases per 100,000 persons and New Deaths per 100,000,
and Data Collection Window for Each UHFS Survey Round](../figures/combined.pdf){#fig:combined}

[@fig:combined] shows the daily stringency index, the daily Google Mobility measure,
the 7-day average number of new Covid-19 cases and deaths per 100,000 persons, 
and the data collection window for each of the UHFS rounds in shaded grey. 
The number of Covid cases and deaths comes from "Our World in Data."[^4]

[^4]: The advantage of using "Our World in Data" is that it collects
    available Covid-19 data from many sources. The data are available
    at <https://covid.ourworldindata.org/data/owid-covid-data.csv>, and
    a complete listing of underlying sources is
    at <https://github.com/owid/covid-19-data/tree/master/public/data/owid-covid-codebook.csv>.


The strictest restrictions are just before round 1, where there is an almost
complete lockdown. 
According to the stringency measure, the second lockdown was nearly as strict 
as the first. 
Furthermore, the four months after each lockdown show similar stringency 
levels, with stringency only dropping in September 2020.

That the most severe lockdown policies were enforced is evident from the 
substantial decreases in visits to retail from April through June 2020 
and June through August 2021, with close to 75% and 50% decreases, respectively.
Despite the remaining restrictions during the second and third rounds,
the number of visits to retail locations slowly improved, stabilizing at around
25% below "normal" during the 4th through 6th survey rounds.
Only around May/June 2021 had retail visits returned to almost the baseline level.

Outside of the severe lockdown periods, the time spent at home remained
relatively stable with three notable exceptions.
The two most innocuous are the closures around the Christmas and New Year's celebrations.
The third is the 2021 general election, which took place on 14 January.
All shops were closed on the day of the election, and nobody appeared to have 
gone to any retail location immediately following the election.
Although the election was preceded by widespread violence and internet shutdowns 
immediately around the time of the election, the reduction in visits to retail 
and recreation locations appeared to have been relatively short-lived.

The number of confirmed infections and deaths from Covid remained low in
Uganda until halfway through 2021. 
For context, even with the spike in cases in 2021, Uganda's cumulative 
number of cases per 100,000 at the end of 2021 was only 306.9 compared 
with 16,294.5 in the US.
Furthermore, as in many other developing countries, the number of Covid deaths was low.
Even with the increase in cases and deaths by the end of 2021, Uganda 
had only 7.2 deaths per 100,000 persons, while, for
comparison, the US had 245.1 deaths per 100,000 persons.

On top of lockdowns and Covid, the later part of 2021 saw a below-normal
rainfall across the country.
The three-month 3-month rainfall was 75% of normal when averaged across 
all measurement stations, and all stations showed a below-normal three-month 
rainfall in August 2021.[^subnational_rainfall]
This below-normal rainfall coincided with the rainy season in the 
north part of Uganda and the second rainy season everywhere else.

[^subnational_rainfall]: Calculations based on data available at
\href{https://data.humdata.org/dataset/uga-rainfall-subnational}{https://data.humdata.org/dataset/uga-rainfall-subnational}.



# Estimation Strategy

To examine the effects of Covid-19 lockdowns, we use household
fixed-effects models on a nationally representative longitudinal
household data set, relying on the changes over time in
government-imposed lockdowns to identify the effect.

Our main specification regresses outcomes, $Y$, on a
set of variables using a linear fixed-effects model:[^3]

$$
Y_{i,t} =  \sum_{t=1}^7 \beta_t 1[Round = t]  + \gamma Cases_{i,t} 
+ \omega_i + \epsilon_{i,t}, 
$$

where $i$ denote household and $t$ survey rounds. 

[^3]: A linear model has two advantages over non-linear models, such as
    conditional logit, and has often been used in recent studies 
    [@Alam2020; @Alam2018; @Charles2008]. 
    First, coefficients are easier to interpret. 
    Second, a linear model allows a more straightforward comparison of 
    coefficients across regression where some dependent variables 
    are binary and some non-binary.
    Robustness checks, available upon request, show that
    conditional logit models lead to similar results.


We use survey indicator variables to capture the variation over time.
The first survey round took place between 9 and 27 days after the
end of the first severe lockdown and, therefore, can be thought of
as capturing the short-run effect of the first lockdown.
The second survey took place 63 to 86 days after the first lockdown ended
and the seventh survey took place 74 to 105 days (with the majority before
within 87 days) after the second lockdown ended.
These we refer to as medium-term.
The third, fourth, fifth, and sixth survey rounds took place
112--130, 155--176, 253--272, and 281--322 days after the
first severe lockdown.
We use the fourth survey round as the excluded round because it is
the survey round furthest from both lockdowns and before any substantial
number of Covid cases, and before the election begins in earnest.

In addition to government-imposed lockdowns, individuals may be ill,
decide to self-isolate, or take other steps to avoid contact with others
if they perceive a high risk of contracting Covid-19, which may increase
food insecurity. To capture the severity of the Covid situation, the
$Cases$ variable measures the number of new Covid-19 cases per 100,000
persons in the 30 days before the household's survey date. 

Although we do not include any household-level variables in the 
model, there are still three advantages to using a fixed effects model.
First, the household fixed-effects, $\omega_i$, allows us to easily control 
for time-invariant characteristics associated with the individual/household, 
such as gender, race and religion, constant preferences, household 
characteristics, and area characteristics.
Second, the fixed effects estimates are more conservative than pooled OLS in the 
sense that fixed effects models have a lower likelihood of type I errors and
potential attenuation bias toward zero with classical measurement error.
Finally, fixed effects models are more robust to measurement errors that vary 
systematically across individuals than pooled OLS.
For certain food insecurity questions, such as, for example, those that refer to 
healthy food, the diversity of foods available, and eating less than desired, 
there may be individual-specific threshold levels.
The within-household fixed effects model reduces the potential bias from 
this type of measurement error because it relies only on within-household 
variation. 
For some estimations, we use individual-level dependent variables, like
employment. In these cases, the models are individual fixed-effects
models, as the same individual from the household is followed over the
rounds.

In summary, we identify the impact of Uganda's lockdowns by comparing
periods with more or less severe lockdowns, while the individual
survey round indicators capture the other potential factors that might impact 
food insecurity, such as the unrest in connection with the 2021 elections.
Especially the first lockdown is of interest because it came at a 
time when there were close to no Covid cases, and, in fact, there
was no substantial spread of Covid until well after the first 
severe lockdown ended.
Hence, we can identify the effect of the lockdown as opposed to 
the aggregate effect of the lockdowns and the spread of the disease
combined.

To ensure that we are not capturing other changes, we also 
examine the potential role of seasonality in the results. 
Finally, although there were no official variations in lockdown policies
or enforcement across different areas, and we, therefore, 
cannot rely on spatial variation for identification, we do
examine differences in mobility patterns and food insecurity
across regions.


# Did Lockdowns Increase Food Insecurity?

![Estimated Changes in Food Insecurity with 95% Confidence Intervals by Survey Round Relative to Survey 4, 
Controlling for Number of Covid Cases and Household Fixed Effects](../figures/food_insecurity_survey.pdf){#fig:food_insecurity_survey}

[@fig:food_insecurity_survey] shows the estimated changes in the
three food insecurity measures by survey round, relative to 
survey round 4, together with the 95% confidence intervals for 
a linear model with household fixed effects.[^base_results]
Overall, Covid-19 lockdowns appear to be associated with substantial 
increases in all levels of food insecurity.

[^base_results]: The full tables for this and all following
results presented as tables are available upon request.

Approximately a month after the end of the first severe lockdown, 
the proportion of households that report any or moderate to severe food 
insecurity is more than 20 percentage points higher than in round 4,
an effect that is very statistically significant. 
Severe food insecurity in round 1 is just below 10 percentage points 
higher than in round 4 and also statistically significantly different 
from round 4.

About three months after the end of the first severe lockdown, 
any and moderate to severe food insecurity levels are still statistically 
significantly higher than in round 4 at approximately 10 percentage points.
Severe food insecurity is also increased but not statistically significantly
so.

Between six and eleven months (rounds 3 through 6), there is little 
discernable difference in the levels of food insecurity, and we cannot 
reject that they all have the same levels. 

The final round, round 7, took place 2.5 to 3.5 months after the end
of the second major lockdown, but in relation to round 4, the levels of
food insecurity are closer to those of round 1.
Any and moderate to severe food insecurity are both more than 20 percentage 
points higher than in round 4, while severe food insecurity is more than 10
percentage points higher; all three are strongly statistically significant.

[summary; drought and round 7; anything else that can explain this?]

## The Role of Seasonality

Uganda has two lean seasons, one in April and May and another
in November and December [@FAO2022]. 
Hence, with the first survey round
fielded in June 2020, it is possible that part of what we capture with
the round 1 indicator variable is the effect of the April/May lean
season on food security. To examine the role of seasonal variation, we
compare the changes in food insecurity measures with the closest
comparable from previous rounds of UNPS and estimate our main model on
alternative samples to show that seasonal variation is unlikely to
explain our results.


To examine whether seasonality in food security might be behind our
results, we first compare pre-Covid information on food insecurity with
a subset of our measures. 
The UNPS 2015/16 and the UNPS 2019/20 both asked if the households had been 
faced with a situation when they did not have enough food to feed the 
household in the last 12 months. 
If yes, they were asked to list all months when this occurred. 
Although this question does not directly correspond to any of the food insecurity
questions asked in the UHFS and the recall period is one year rather
than the 30 days for the UHFS, it is close to three of our questions:
ran out of food because of lack of money, went hungry but did not eat,
and went without eating for a whole day.

For the UNPS question, we combined all observations by month and
calculate the percentage who reported not having enough food to feed the
household. For the UHFS questions, we calculate the percentages food
insecure by interview month. 
[@fig:seasonality] shows the food insecurity
percentages with the UNPS question shown in black for comparison.
Despite FAO listing April/May and November/December as the lean periods,
the UNPS data show that April, May, and June were the three months with
the highest proportion of food insecurity, while November and December
were the months with the lowest proportion.[^13]

![Projected Seasonality in Food Insecurity from UNPS and
Observed Food Insecurity for Three UHFS 
Outcomes](../figures/seasonality.pdf){#fig:seasonality}

All three UHFS questions follow the same general pattern as the UNPS
question outside the lockdown periods, September 2020 through April 2021. 
For the initial lockdown, both the short- and medium-run effects
show clearly in the UHFS questions. Although it is possible that these
high values were the result of seasonal variation, we consider it
unlikely for two reasons. First, there is no evidence of the same
elevation for April 2021, which is also in the lean season but nine
months after the lockdown. Second, the medium-term effects of the second
lockdown show even worse medium-term food insecurity outcomes despite
being in a non-lean period.

Our second approach is to re-estimate our main models on three subsets
of the data. First, we make use of the fact that round 6 took place
during the April/May lean season but was the round least affected by
lockdowns and estimate our main model using only information from rounds
1, 2, and 6. The results are shown in Appendix Table A4. Compared to the
main model, the short-run effects are slightly smaller and the medium
effect larger. Second, the only two rounds collected during almost the
same calendar month were rounds 4 and 7, and Appendix Table A5 shows the
results when we restrict to those two rounds. The medium-run effect of
the second lockdown for this sample is smaller but still statistically
significant in most cases. Complicating this comparison is that the
number of new Covid cases was close to constant within each round and
smaller during round 7 than round 4, resulting in potential
multicollinearity and statistically significant *negative* effects of
new cases on food insecurity for some outcomes. 
Finally, we expect urban households to be less affected by seasonality, 
and Appendix Table A6, therefore, shows the results using only urban 
households across all rounds. 
The short- and medium-run effects of the lockdowns are either
the same or larger when we restrict the sample to urban households.
Hence, our results are qualitatively the same, no matter how we account
for seasonality.



## Regional Variation 

All of the results above are national-level, which may obscure critical
regional variations in Covid exposure and the degree and effects of lockdowns.
This section, therefore, examines differences in the Google Mobility measure and 
in food insecurity across the survey rounds for each of the four regions in Uganda.

Uganda is divided into four regions, Central, Eastern, Northern, 
and Western, which, although without direct administrative roles, are
used as units for statistical and planning purposes.
The regions have approximately the same population size, except for the Northern
region, which had 20% of the population in the 2014 census.

The Central region is home to Kampala and the most urbanized,
with the four most populous urban centers in Uganda 
[@Uganda-Bureau-of-Statistics2016].
Combined, these four urban centers are home to one-third of the
entire urban population of Uganda, with almost 2.5 million people.[^small_urban]
The region has a higher concentration of service and industrial employment 
than the other regions and the lowest poverty rates [@Ssewanyana2012]. 

[^small_urban]:
For comparison, the fifth-largest urban center, the Western region's Mbarara, 
had fewer than 200,000 people in 2014.

In contrast, employment in the other regions is predominantly agricultural. 
The Eastern region is characterized by mixed farming, including both crop 
cultivation and livestock, with a focus on cash crops like coffee and tea. 
The Western region, rich in fertile soils and rainfall, supports intensive 
agriculture, particularly dairy farming and tea cultivation. 
The Northern region, historically affected by conflict, has a more 
subsistence-oriented agricultural system, with lower levels of productivity 
and a slower pace of urbanization, and consistently has the highest poverty levels.  


![Regional Distribution of Percentage Changes in the Number of Visits to Retail and Recreation Locations](../figures/mobility_regional_retail.pdf){#fig:retail_regional}

[@fig:retail_regional] shows the changes in percentage visits to retail and
recreation locations by region, together with the survey rounds.[^appendix_regional]
In all regions, there is clear evidence of the scale of the first severe lockdown,
although the percentage change is larger in the Central region at about 75%,
compared with just over 50% in the other three regions.

[^appendix_regional]: Appendix @fig:mobility_regional_workplaces
and Appendix @fig:mobility_regional_residential show the percentage change in visitors
to workplaces and the percentage change in time spent at residential locations.
Although the workplace mobility data appear to have broader coverage we 
prefer the retail measure because of the predominately agricultural nature
of work in the Eastern, Northern, and Western regions.

During the second severe lockdown, there is a smaller reduction in the visits to
retail locations than the first, but otherwise, it followed close to the same regional 
pattern as the first lockdown.
The Central region showed the largest reduction at around 50%.
The Western and Eastern regions both saw approximately 40% reductions when 
compared to the period immediately preceding the second main lockdown.
The data for the Northern region is spottier, but there is some evidence
for a reduction in visits compared to the period immediately before the
second lockdown.

These changes in visits to retail locations are consistent with more heavily 
enforced lockdowns in urban than in rural areas.
However, even in the three more agricultural-focused regions, there are substantial 
changes in mobility consistent with enforced lockdowns. 
For the second lockdown, it is possible that part of the change
in behavior comes from self-isolation associated with the increasing number 
of Covid cases, although, unfortunately, no regional data is available to
investigate this possibility.[^regional_covid]

[^regional_covid]: While we normally think of cities as having a higher communicable disease load 
than rural areas, this might not hold in the case of Covid. 
Rather, larger rural households may allow more people to be exposed to 
Covid infections, especially if lockdowns are enforced in rural areas.
Furthermore, people may be moving from urban to rural areas to "escape" 
increasing levels of Covid infections, bringing Covid with them to rural areas.

[@fig:food_insecurity_region] shows the results by level of food insecurity
and regions, where each combination is from a separate regression.
The regional raw levels of food insecurity by round are shown in 
Appendix [@fig:region_descriptive].
Because we do not have information on regional Covid-19
cases, all models are estimated without this national-level variable.

![Estimated Changes in Food Insecurity With 95% Confidence Intervals for Each Region by Survey Round Relative to Survey 4, Controlling for Household Fixed Effects](../figures/food_insecurity_region.pdf){#fig:food_insecurity_region}

Both the Central and Eastern regions follow a pattern very closely 
aligned with the national-level results.
All three levels of food insecurity are statistically significantly
higher in the immediate aftermath of the first lockdown compared to 
round 4, and food insecurity gradually decrease for the next two 
survey rounds.
The levels remain approximately constant until after the second
lockdown, where food insecurity levels in round 7 are all statistically 
significantly higher than in round 4.

For the Northern region, severe food insecurity follows the national level pattern.
However, for moderate/severe food insecurity, only round 5 is not
statistically significantly different from round 4, and levels in 
rounds 1 and 7 are more than 40 and 30 percentage points higher,
respectively, than round 4.
Furthermore, although the changes in any food insecurity are closer 
to the national-level changes, they are generally smaller.

The Western region is the region that stands out most compared to the
other regions. 
First, there is little to no change in severe food insecurity, except
for the last survey round, which is just below 10 percentage points
higher than round 4.
Similarly, although rounds 1 and 2 for moderate food insecurity are 
statistically significantly higher than round 4, the effects are smaller than 
elsewhere.
For any food insecurity, the round 7 level is substantially larger
than any of the others, despite round 7 further away from the end
of the lockdowns than rounds 1 and 2.

What do these regional results tell us about the relative effects of the 
lockdowns?
There are likely two conflicting dynamics at play here.
On one hand, urbanized areas can more effectively enforce lockdowns, as 
shown by the mobility measure for the Central region.
On the other hand, proximity to the poverty line greatly increases 
vulnerability to food insecurity. 
This latter point is crucial, as even minimal enforcement measures in 
poorer regions like the Eastern region can precipitate significant 
shifts into food insecurity, due to the already precarious economic 
standing of these households. 
This is mirrored in the Northern region, where, in addition, the high 
baseline poverty levels mean that the observed changes in food insecurity 
are less pronounced over time---the level of any food insecurity never got 
below nearly 70% of the population at its best.

Finally, the Western region contributed  significantly to the high 
national-level round 7 results.
Part of this is likely the effect of an even more prolonged period of 
below-normal rainfall than the other regions.
Using the round 2 results as the basis, it appears that about half
of the increase in round 7 food insecurity is due to the below-normal
rainfall, and the other half is due to the second severe lockdown,
likely combined with the cumulative impact of sustained lower-level
lockdowns in between the most severe lockdowns. 

## The Role of Attrition 

As discussed above, almost 16% of the original households 
surveyed in round 1 failed to respond by round 7.
Although new households are added, a concern is whether the
attrition of households is non-random and might bias the result.
To examine how sensitive our results are to attrition, we 
perform a bounding exercise, where we either assume that all
households that fail to respond would have been food insecure
or that they would not have been food insecure.[^thank_eric]

[^thank_eric]: We would like to thank the Editor for this 
suggestion.

![Attrition](../figures/food_insecurity_survey_attrition_combined.pdf){#fig:attrition}

[@fig:attrition] shows the results for the nation-wide bounding estimations
together with the original results.
For the any and moderate or severe food insecurity outcomes, whether we assume 
that attrited households would have been food insecure or food secure, 
those results that were statistically significant in the main model remain 
statistically significant for the bounding exercise.
The main potential change in the results is for severe food insecurity in round 1, 
where the first round is no longer statistically significantly different from
round 4, if we assume that attrition households would have been severely food insecure,
although we cannot reject that the round 1 coefficients are the same across the
original and the two bounding assumptions.
Furthermore, if we assume severe food insecurity for missing households 
the round 7 estimate is statistically significantly larger than both the original 
estimate and the estimate if we assumed that attrited households were not 
severely food insecure.


# How Households Responded

[Explain the analysis]

To understand how the government lockdowns affected food insecurity and
how households responded to the lockdowns, we examine three broad
categories: labor market outcomes, changes in income across sources, and
whether households received assistance from outside sources.

### Labor Market Outcomes

Lockdowns may affect the availability of employment, both because
workplaces close and because of the overall reduction in economic
activity likely to follow lockdowns. Respondents were asked whether they
did "any work for pay, any kind of business, farming or other activity
to generate income" in the last week. If yes, they were asked whether
this was the same job as the previous round and the broad industry in
which they worked in the current survey round. For round 1, respondents
were also asked whether they did the same work as before the pandemic
started and if it was a different job, which industry it was in. We
create two indicator variables to capture the likelihood of working:
doing any market work and working in the same job as the prior round.

The UHFS also asked whether any household member had operated a non-farm
family business since the preceding round, so we also created an
indicator variable where 1 represents operating a business and 0
otherwise. However, round 1 only asks whether the family has operated a
business since the beginning of 2020 and does not ask about operations
since the start of the lockdown. This means we are unable to use round 1
information to examine the impact of the lockdown on operating a family
business.

The closing of workplaces to enforce social distancing was one of the
primary channels through which market work was affected. However, people
may have been able to continue some types of work more easily than
others. For example, in agriculture, workers can more easily socially
distance themselves while working, and, in many cases, the workers are
from the same household removing the need to socially distance.
Furthermore, lockdowns are more challenging to enforce on farms in rural
areas.

Thus, there are two implications of this differential lockdown effect on
workplace closings. First, the impacts of lockdowns likely differ
between households whose main sector is in agriculture, which we will
refer to as agricultural households, and non-agricultural households.
Agricultural households include any household that reported that their
main activity was related to agriculture. This includes both farmers,
casual farm labor, and those employed in any type of processing, sale,
or transport of agricultural goods. These households can be either urban
or rural.

Second, it is essential to understand how lockdowns affected the
movement between unemployment, agricultural work, and non-agricultural
work. We create a categorical variable where 0 represents
non-agricultural work, 1 represents agricultural work, and 2 represents
unemployment. As we know the industry before the first lockdown, we can
utilize that data as a pre-lockdown round (i.e., round 0), so we have
eight rounds of data for this estimation.

With three potential outcomes, we use a conditional fixed-effects
multinomial logit model to estimate the movements between unemployment,
agricultural work, and non-agricultural work. There are two potential
issues with this method. First, as with any multinomial model, the
coefficient sign does not necessarily indicate the direction of the
relationship between the explanatory variable and the outcome. Second,
standard marginal analyses are not meaningful because the fixed-effects
estimator cannot make predictions that account for the panel-level fixed
effects, which are not estimated explicitly. We, therefore, present two
relative risk ratios, one the likelihood of working in the agricultural
sector against working in the non-agricultural sector, and the other the
likelihood of not working against working in the non-agricultural
sector.

Finally, the survey asked agricultural households whether they changed
planting activities because of Covid-19. If yes, they are asked how they
changed their activities. This allows us to examine whether households
changed their agricultural strategy in response to the lockdowns.

### Income

Households were asked questions related to income in rounds 1 through 6.
Instead of the monetary value of their income, households were asked
whether their income from different sources increased, remained the
same, decreased, or was completely lost since the prior round (for round
1, the questions were asked relative to the start date of the lockdown).
The income questions covered five sources: (i) family farming,
livestock, or fishing, (ii) non-farm family business, (iii) wage
employment, (iv) income from assets (properties, investments, or
savings), and (v) pension. As the income question was ordinal, we
created variables for each income source where 1 represents an increase
in income, 0 represents income remaining unchanged, and -1 represents a
decrease in income or a complete loss.

Given that we use ordinal variables to represent changes in household
income, we use a conditional fixed-effects ordered logistic model. The
typical conditional logit model works by applying a fixed-effects logit
model for households that see a change in the dependent variable over
time. For the conditional *ordered* logit model, the actual values of
the dependent variable are irrelevant. Instead, greater values
correspond to higher-value outcomes [@Baetschmann2015]. 
Hence, for our regressions, a positive coefficient for lockdowns represents an
increase in household income, a negative coefficient represents a
decrease, and a coefficient near 0 indicates that income remained
stable.

### Outside Assistance

In rounds 1 through 6, the UHFS asked households whether they received
assistance from the following sources: (i) remittance from abroad, (ii)
assistance from family members within the country, (iii) assistance from
other non-family individuals, (iv) assistance from NGOs, and (v)
assistance from the government.[^7] The questions were asked the same
way as the income questions, where households can either report income
increase, remaining the same, decrease, or complete loss relative to the
prior round. Therefore, like the income estimations, we create ordinal
variables where 1,0 and -1 represent an increase, same, and
decrease/complete loss, respectively, and estimate the effect of
lockdowns using the same conditional fixed-effects ordered logistic
model.

Using the household rosters from UHFS and the UNPS 2019/20, we have data
on the number of household members, adults, and children. To understand
the impact on household structure, we calculate the change in the number
of household members by subtracting the number in the prior round from
the current round's number.




## Impact on Work

One way lockdowns can affect food insecurity is by lowering people's
ability to work. Table 3, column 1, shows that the likelihood of any
market work decreased by a significant 18.6 percentage points during the
first lockdown. These employment effects were driven mainly by lockdowns
rather than being ill from Covid-19. As shown in [@fig:combined], there were
almost no cases during the first lockdown. Furthermore, UHSF asked
individuals the reason for not working, and the top three reasons
reported are that the place of work is closed (62%), being ill from any
illness or quarantined (10%), and being laid off from the job (8%).

In the medium run, the likelihood of market work is 2.5 percentage
points lower than in non-lockdown periods. This suggests that the labor
market was approaching but not yet fully recovered. 
The medium-run impact of the second lockdown combined with the 
lower than normal rainfall is large, with
the likelihood of market work decreasing by 13 percentage points. This
large impact on market work may explain the large impact on food
insecurity in the medium run following the second lockdown.

While we do not have data for round 1 and cannot estimate the short-run
effect, the likelihood of operating a non-farm family business in the
medium run decreased by seven percentage points after the first lockdown
(column 2). However, the second lockdown did not impact family business
in the medium run, even though this coincided with the drier spell.

Given the overall decrease in market work, it is useful to understand
whether individuals, who were able to continue work during the
lockdowns, did so in the same jobs. The first lockdown significantly
decreased the likelihood of working at the same job as the prior round
by about 8.6 percentage points (column 3). Thus, we find both a decrease
in market work and an increased likelihood of moving jobs. The impact in
the medium run is small, indicating that people remained in their new
jobs after the end of the lockdown. We do not have direct information on
wages, but these new jobs likely paid less than the pre-lockdown job,
suggesting continued labor market difficulties in the medium run, which
would also affect food insecurity. There is a small effect in the medium
run following the second lockdown. However, we cannot establish whether
this is because the second lockdown follows the same pattern as the
first or because there is less movement compared to the first lockdown.

With workplace closures during lockdowns, we expect significant movement
between sectors, and from employment to unemployment. Layoffs are likely
in both the agricultural and non-agricultural sectors. To complicate the
picture, some may resort to agricultural production, even if there is a
lower return than their original job. Table 3, columns 4 and 5 show the
relative risk of being in the agricultural sector and being unemployed,
respectively, versus working in the non-agricultural sector. Not
surprisingly, the short-run effect of the first lockdown is to
significantly increase unemployment relative to being employed in the
non-agricultural sector, with the relative risk of unemployment
increasing by 11.6 relative to working in the non-agricultural sector.
However, there was also a significant shift to agriculture after the
first lockdown: the relative risk of working in agriculture is 3.9 times
higher compared to working in the non-agricultural sector. The results
suggest that while more people were becoming unemployed, there is also a
significant switch to agricultural work to cope with the effects of the
first lockdown.[^9] While the magnitude of the relative risk for
unemployment declined to 2.8 times, the strong effect on working in
agriculture persisted in the medium run, suggesting that people did not
immediately shift back to non-agricultural work after the end of the
first lockdown.

However, we do not find a higher likelihood of agricultural work in the
medium run following the second lockdown compared to the non-lockdown
periods, likely because the concurrent dry spell negatively affected the
agricultural labor market. The lack of opportunities in the agricultural
sector may also explain why individuals were likely to remain at the
same job after the second lockdown (results from column 3). Overall,
these results suggest that while some joined the agricultural sector to
cope with the effects of the first lockdown, the negative impact of the
lower than normal rainfall during the later half of 2021 on agriculture 
meant that this was a less attractive coping
mechanism during the second lockdown.

## Impact on Income

As shown in Panel B of Table 3, the first lockdown significantly
decreased farm income, non-farm family business income, wage income, and
income from assets, and the effects persisted in the medium run. These
income effects are likely a major reason for the significant increase in
food insecurity from the lockdowns. As a placebo, since pensions are
typically not dependent on the state of the economy and remain steady
over time, we also examine the impact on pension income. Not
surprisingly, we do not find any changes in pension income during the
lockdowns.[^10]

## Coping Mechanisms 

Given the reductions in household income with the lockdowns, we examine
potential coping mechanisms in Table 4 (Morduch, 1995; Townsend, 1994).
Two possibilities are assistance from family members outside the
household or from institutions. There were significant reductions in
assistance from the family within the country, assistance from
non-family individuals, and assistance from NGOs after the first
lockdown. Remittances also decreased but not statistically
significantly. The only increase came in government assistance, although
the effect is statistically insignificant. These results suggest that
households\' standard coping mechanisms were unavailable during the
lockdowns. This is in line with the substantial decline in remittances
across the world in the second quarter of 2020, as lockdowns worldwide
led to the closure of workplaces and limited people's movements 
[@Cardozo-Silva2022; @Guha2021; @Kpodar2021; @Shimizutani2021; @Zhang2021]. 
The failure of these coping
mechanisms in the face of reductions in income likely contributed
substantially to the large effects of lockdowns on food insecurity.

As households faced greater food insecurity during lockdowns, it is
possible that, on the one hand, some household members left to look for
better opportunities. On the other hand, as lockdowns led to reduced
income and lower availability of work, migrants might return to their
families. Panel B of Table 4 shows the impact of lockdowns on the change
in the number of household members. We find an increase in household
members during the first lockdown (column 1). Furthermore, this effect
holds for adults (column 2) and children (column 3). The positive effect
continued in the medium run for total members, although statistically
insignificant, and the number of children, but there was a slight
reduction in the number of adults. In contrast to the effects from the
first lockdown, there were larger effects in the medium run following
the second lockdown.

The increase in the number of household members raises the question of
whether the lockdowns caused an urban-to-rural migration. However, we
find no such evidence of lockdown-induced migration in column 4, which
shows the likelihood of living in an urban area.

Lastly, given the shift to agricultural work, we examine whether
agricultural households change their agricultural strategy to cope with
the lockdowns. We find suggestive evidence that agricultural households
changed their farming strategy during the lockdowns, such as changing
the farming area and changes in the variety of crops produced. The
details of these results are in Appendix Section A1.

Overall, our results from the coping mechanisms suggest that the
households, on average, could not take advantage of outside help,
whether it was assistance from family members living outside of the
household or assistance from institutions. We find evidence of net
migration into the households and a switch to agricultural work,
suggesting that some household members return to the family for farm
work.

## Agricultural vs. Non-agricultural households

Given the increase in agricultural work with the first lockdown, Table 5
examines whether agricultural households fared better than
non-agricultural households. Note, as we previously treated households'
work in agriculture as a choice variable, these estimations are
exploratory rather than causal. As lockdowns affected the likelihood of
working in agriculture, we interact lockdown variables with whether the
household was engaged in agricultural production in the prior
round.[^11] As shown in column 1 of Table 5, agricultural households
were 31 percentage points more likely to work during the first lockdown
than non-agricultural households. However, this difference disappears in
the medium run suggesting an improvement in employment conditions.

Agricultural households appeared to be more food secure than
non-agricultural households during the first lockdown. Their likelihood
of suffering "any food insecurity" during lockdowns was about 20
percentage points lower than non-agricultural households. Furthermore,
all individual food security questions show that agricultural households
do better than non-agricultural households. However, for "Had to skip a
meal" and "Went hungry but did not eat," the effects are not
statistically significant. Like the employment results, the difference
disappears in the medium run. Overall, these results suggest that
agricultural households were better able to keep working and did better
in terms of food security. There is no difference in employment or food
insecurity for the second lockdown between the two types of households.
This is likely because of the concurrent lower than normal rainfall 
during and after the
second lockdown in Uganda that affected the agricultural households\'
employment and food production.



# Conclusion

Using country-wide panel data with a household fixed-effects model, we
examine the impact of two Covid-19 lockdowns in Uganda on food
insecurity. Food insecurity increased substantially during the first
lockdown, with the relative effects largest for the worst types of food
insecurity. The first lockdown also had a significant medium-run impact
on food insecurity. The medium-run impact was even higher following the
second lockdown, as a lower-than-normal rainfall across Uganda 
compounded the negative effect of the
lockdown.

There were significant decreases in paid work and earned income.
However, agricultural households were better able to continue working
during the first lockdown than non-agricultural households.
Consequently, their food security outcomes were better as well.

We find evidence that households attempted to cope with the first
lockdown by temporarily switching to agricultural work. However,
traditional sources of coping mechanisms, such as remittance from
abroad, assistance from family members within the country, assistance
from non-family individuals, and assistance from development
organizations, all decreased during the lockdowns. The lack of
assistance may explain lockdowns' substantial effect on food insecurity.
Lastly, to make matters more challenging for households, there was a net
increase in the number of household members, suggesting that lockdowns
forced individuals living elsewhere to join/rejoin the household.

Three broader conclusions emerge from our results. First, on average,
agriculture is likely less productive than non-farm work but better than
unemployment. With a slow rate of switching back from agriculture, the
lockdowns can potentially have severe long-term adverse effects on
Uganda's development. Second, the results show the limit of
self-insurance and mutual insurance when faced with a systemic shock.
Most of the literature has focused on the smaller and more frequent risk
of idiosyncratic shocks and how households respond to these. However, a
better understanding of systemic shocks and how households respond is
still lacking. Finally, the case of Uganda illustrates well the issues
with the wholesale lockdown of economies in response to Covid-19 in
situations with low state capacity. Uganda has been hailed as a leading
example of curbing Covid-19 [@Adams2021]. 
However, the
mitigation efforts failed to reach those most affected by the lockdown.
With the low mortality rate in Sub-Saharan Africa, including Uganda, the
potential long-term cost of the lockdowns potentially significantly
outweighs the benefits. Quantifying these costs and identifying possible
avenues of mitigation are critical future areas of research.



  -----------------------------------------------------------------------------------------------------------
  Table 3: Impact of                                                                                       
  lockdowns on labor                                                                                       
  market outcomes                                                                                          
  ---------------------- -------------- -------------- -------------- ------------------ ----------------- --
                                                                                                           

                                                                                                           

  Panel A: Impact on                                                                                       
  work and employment                                                                                      
  outcomes                                                                                                 

                         Linear model                                 Multinomial logit                    

                         \(1\)          \(2\)          \(3\)          \(4\)              \(5\)             

  Outcome variables:     Likelihood of  Likelihood of  Working in     Comparing          Comparing         
                         market work    operating a    same job as    agriculture (1) vs unemployed (2) vs 
                                        non-farm       before         non-agriculture    non-agriculture   
                                        family                        (0)                (0)               
                                        business                                                           

  First lockdown: short  -0.186\*\*\*                  -0.083\*\*\*   3.78\*\*\*         11.24\*\*\*       
  run                                                                                                      

                         (0.016)                       (0.014)        (0.607)            (1.753)           

  First lockdown: medium -0.022\*       -0.066\*\*\*   -0.009         3.66\*\*\*         2.61\*\*\*        
  run                                                                                                      

                         (0.012)        (0.015)        (0.012)        (0.541)            (0.436)           

  Second lockdown:       -0.132\*\*\*   -0.007         -0.016\*       0.994              3.48\*\*\*        
  medium run                                                                                               

                         (0.015)        (0.015)        (0.010)        (0.191)            (0.632)           

  Covid-19 cases/100,000 -0.001         -0.003\*\*     0.002          1.13\*\*\*         1.08\*\*\*        

                         (0.001)        (0.001)        (0.001)        (0.021)            (0.019)           

                                                                                                           

  No of observations     14,811         12,593         10,521         10,676             10,676            

  Number of households   2,300          2,282          2,174          1,407              1,407             

  Mean of outcome at     87.8%          40.7%          96.9%          Agri.: 57.2%,                        
  non-lockdown period                                                 Unemployed:12.2%                     

                                                                                                           

  Panel B: Impact on                                                                                       
  different types of                                                                                       
  income                                                                                                   

                         \(6\)          \(7\)          \(8\)          \(9\)              \(10\)            

  Outcome variables:     Farm income    Nonfarm income Wage income    Income from assets Pension           

  First lockdown: short  -1.109\*\*\*   -1.957\*\*\*   -1.577\*\*\*   -2.026\*\*\*       -1.544            
  run                                                                                                      

                         (0.105)        (0.126)        (0.138)        (0.363)            (1.438)           

  First lockdown: medium -0.217\*\*     -0.863\*\*\*   -1.015\*\*\*   -1.473\*\*\*       -1.711            
  run                                                                                                      

                         (0.109)        (0.129)        (0.153)        (0.393)            (1.605)           

  Covid-19 cases/100,000 0.040\*\*\*    -0.031\*\*     -0.051\*\*\*   -0.059             -0.312            

                         (0.010)        (0.013)        (0.016)        (0.043)            (0.385)           

                                                                                                           

  No of observations     10398          7238           5195           738                18                

  Number of households   1809           1258           911            128                3                 

  Mean of outcome at     -0.06          -0.05          -0.04          -0.003             0                 
  non-lockdown period                                                                                      

  Note: Columns 1 to 3                                                                                     
  of Panel A represent                                                                                     
  coefficients from                                                                                        
  linear model with                                                                                        
  household fixed                                                                                          
  effects. Dependent                                                                                       
  variables in columns 1                                                                                   
  to 3 are dummy                                                                                           
  variables. Columns 4                                                                                     
  and 5 represent                                                                                          
  relative risk ratios                                                                                     
  from fixed effects                                                                                       
  multinomial logit                                                                                        
  model, where 0                                                                                           
  represents                                                                                               
  non-agricultural work,                                                                                   
  1 represents                                                                                             
  agricultural work, and                                                                                   
  2 represents                                                                                             
  unemployment. Panel B                                                                                    
  represents                                                                                               
  coefficients from                                                                                        
  fixed effects ordered                                                                                    
  logit model, so for                                                                                      
  dependent variables in                                                                                   
  columns 6 to 10, 0                                                                                       
  represents no change,                                                                                    
  1 represents an                                                                                          
  increase, and -1                                                                                         
  represents a decrease.                                                                                   
  For all columns,                                                                                         
  standard errors are in                                                                                   
  parentheses. \*\*\*                                                                                      
  indicates significance                                                                                   
  at 1% level; \*\* at                                                                                     
  5%; \* at 10%.                                                                                           

                                                                                                           

                                                                                                           

                                                                                                           
  -----------------------------------------------------------------------------------------------------------

  ------------------------------------------------------------------------------------------------
  Table 4: Impact of                                                                            
  lockdowns on                                                                                  
  different kinds of                                                                            
  coping mechanisms                                                                             
  --------------------- ------------- -------------- -------------- -------------- ------------ --
                                                                                                

                                                                                                

  Panel A: Impact on                                                                            
  outside assistance                                                                            

                        \(1\)         \(2\)          \(3\)          \(4\)          \(5\)        

  Outcome variables:    Remittance    Assistance     Assistance     Assistance     Assistance   
                                      from family    from           from NGOs      from         
                                      within country non-family                    government   
                                                     individuals                                

  First lockdown: short -0.814        -0.406\*\*\*   -1.541\*\*\*   -2.604\*\*\*   1.123        
  run                                                                                           

                        (0.563)       (0.157)        (0.378)        (0.932)        (0.901)      

  First lockdown:       -0.438        -0.217         -1.316\*\*\*   -0.481         0.235        
  medium run                                                                                    

                        (0.678)       (0.155)        (0.353)        (0.718)        (0.645)      

  Covid-19              -0.027        0.026          -0.029         0.005          -0.030       
  cases/100,000                                                                                 

                        (0.049)       (0.020)        (0.035)        (0.149)        (0.071)      

                                                                                                

  No of observations    363           4155           732            87             156          

  Number of households  63            724            129            15             26           

                                                                                                

  Panel B: Impact on                                                                            
  changes in number of                                                                          
  household members and                                                                         
  movement to urban                                                                             
  area                                                                                          

                        \(6\)         \(7\)          \(8\)          \(9\)                       

                        Change in no. Change in no.  Change in no.  Likelihood of               
                        of household  of adult       of children    living in                   
                        members       members        members        urban area                  

  First lockdown: short 0.126\*\*\*   0.043\*\*\*    0.083\*\*\*    -0.002                      
  run                                                                                           

                        (0.028)       (0.015)        (0.025)        (0.002)                     

  First lockdown:       0.021         -0.023\*\*     0.044\*\*      -0.001                      
  medium run                                                                                    

                        (0.021)       (0.010)        (0.018)        (0.002)                     

  Second lockdown:      0.244\*\*\*   0.103\*\*\*    0.140\*\*\*    -0.008\*\*                  
  medium run                                                                                    

                        (0.039)       (0.021)        (0.027)        (0.004)                     

  Covid-19              0.006\*\*\*   0.003\*\*      0.003\*\*      -0.000                      
  cases/100,000                                                                                 

                        (0.002)       (0.001)        (0.001)        (0.000)                     

                                                                                                

  No of observations    14,463        14,463         14,463         14,818                      

  Number of households  2,282         2,282          2,282          2,302                       

  Note: Panel A                                                                                 
  represents                                                                                    
  coefficients from                                                                             
  fixed effects ordered                                                                         
  logit model, so for                                                                           
  the dependent                                                                                 
  variables, 0                                                                                  
  represents no change,                                                                         
  1 represents an                                                                               
  increase, and -1                                                                              
  represents a                                                                                  
  decrease. Panel B                                                                             
  represent                                                                                     
  coefficients from                                                                             
  linear model with                                                                             
  household fixed                                                                               
  effects where                                                                                 
  dependent variables                                                                           
  are continuous                                                                                
  variables. Standard                                                                           
  errors are in                                                                                 
  parentheses. \*\*\*                                                                           
  indicates                                                                                     
  significance at 1%                                                                            
  level; \*\* at 5%; \*                                                                         
  at 10%.                                                                                       

                                                                                                

                                                                                                

                                                                                                
  ------------------------------------------------------------------------------------------------

  -----------------------------------------------------------------------------------------------
  Table 5: Comparing                                                               
  the differences in                                                               
  effects of lockdowns                                                             
  between agricultural                                                             
  and non-agricultural                                                             
  households on market                                                             
  work and food                                                                    
  insecurity                                                                       
  -------------------- -------------- -------------- -------------- -------------- --------------
                                                                                    

                                                                                   

                       \(1\)          \(2\)          \(3\)          \(4\)          \(5\)

  Outcome variables:   Market work    Any food       Worry about    Unable to eat  Had to eat
                                      insecurity     not having     healthy and    only a few
                                                     enough food to nutritious     kinds of food
                                                     eat            food           

  First lockdown:      -0.311\*\*\*   0.339\*\*\*    0.391\*\*\*    0.282\*\*\*    0.260\*\*\*
  short run                                                                        

                       (0.022)        (0.022)        (0.022)        (0.022)        (0.022)

  First lockdown:      -0.023         0.146\*\*\*    0.160\*\*\*    0.135\*\*\*    0.106\*\*\*
  medium run                                                                       

                       (0.017)        (0.021)        (0.022)        (0.022)        (0.021)

  Second lockdown:     -0.115\*\*\*   0.231\*\*\*    0.237\*\*\*    0.237\*\*\*    0.218\*\*\*
  medium run                                                                       

                       (0.022)        (0.025)        (0.025)        (0.025)        (0.025)

  Ag household         0.063\*\*\*    0.030          -0.034         0.041\*        0.023

                       (0.018)        (0.021)        (0.022)        (0.021)        (0.022)

  Ag household x First 0.308\*\*\*    -0.204\*\*\*   -0.187\*\*\*   -0.140\*\*\*   -0.130\*\*\*
  lockdown: short run                                                              

                       (0.026)        (0.030)        (0.032)        (0.031)        (0.031)

  Ag household x First 0.010          -0.054\*       -0.017         -0.029         -0.084\*\*\*
  lockdown: medium run                                                             

                       (0.019)        (0.028)        (0.028)        (0.029)        (0.028)

  Ag household x       -0.034         -0.030         0.027          -0.026         -0.007
  Second lockdown:                                                                 
  medium run                                                                       

                       (0.030)        (0.035)        (0.035)        (0.035)        (0.037)

                                                                                   

  No of observations   14,811         14,818         14,818         14,818         14,817

  Number of households 2,300          2,302          2,302          2,302          2,302

                                                                                   

                       \(6\)          \(7\)          \(8\)          \(9\)          \(10\)

  Outcome variables:   Had to skip a  Ate less than  Ran out of     Went hungry    Went without
                       meal           they thought   food           but did not    eating for a
                                      they should                   eat            whole day

  First lockdown:      0.203\*\*\*    0.242\*\*\*    0.176\*\*\*    0.169\*\*\*    0.077\*\*\*
  short run                                                                        

                       (0.018)        (0.020)        (0.017)        (0.018)        (0.012)

  First lockdown:      0.100\*\*\*    0.107\*\*\*    0.070\*\*\*    0.077\*\*\*    0.019\*
  medium run                                                                       

                       (0.017)        (0.020)        (0.015)        (0.015)        (0.010)

  Second lockdown:     0.198\*\*\*    0.255\*\*\*    0.132\*\*\*    0.196\*\*\*    0.109\*\*\*
  medium run                                                                       

                       (0.022)        (0.026)        (0.021)        (0.022)        (0.016)

  Ag household         -0.008         0.001          -0.002         -0.010         -0.012

                       (0.018)        (0.020)        (0.017)        (0.016)        (0.012)

  Ag household x First -0.022         -0.071\*\*     -0.074\*\*\*   -0.037         -0.036\*\*
  lockdown: short run                                                              

                       (0.027)        (0.029)        (0.023)        (0.025)        (0.017)

  Ag household x First 0.007          -0.015         -0.008         0.017          0.016
  lockdown: medium run                                                             

                       (0.025)        (0.027)        (0.020)        (0.022)        (0.016)

  Ag household x       0.012          0.019          0.003          -0.034         -0.014
  Second lockdown:                                                                 
  medium run                                                                       

                       (0.032)        (0.036)        (0.029)        (0.030)        (0.022)

                                                                                   

  No of observations   14,818         14,818         14,818         14,818         14,818

  Number of households 2,302          2,302          2,302          2,302          2,302

  Note: Linear Model                                                               
  with household fixed                                                             
  effects. All                                                                     
  dependent variables                                                              
  are dummy variables.                                                             
  Standard errors are                                                              
  in parentheses.                                                                  
  \*\*\* indicates                                                                 
  significance at 1%                                                               
  level; \*\* at 5%;                                                               
  \* at 10%.                                                                       
  -----------------------------------------------------------------------------------------------



*Section A1:*

In this section, we examine whether agricultural households change their
agricultural strategy to better cope with the effects of the lockdowns.
The survey asked in rounds 1, 4, and 7 to households engaged in planting
activities whether they changed their "planting activities in the
current agricultural season because of changes in the country or
community due to coronavirus?". 22.6 percent of agricultural households
during the first lockdown and 19.1 percent during the second lockdown
reported changing their planting activities because of the pandemic.
This is as opposed to 5 percent for the non-lockdown period of round 4.
We create an indicator variable where 1 represents a change in planting
activities, and 0 represents no change. We present the estimates of the
impact of lockdowns on changes in planting activities in Panel A of
Table A3. The estimates show that the first lockdown led to a 52
percentage point increase in the likelihood of changing crop planting
activities and the second lockdown led to a 26 percentage points
increase compared to round 4.

For households with a change in activities, the survey also asked them
how they changed their activities. This allows us to shed more light on
how agricultural households attempted to change their farming strategy
to cope with the effect of the shock. Panel B shows that the biggest
change was a change in the use of farm areas, where 8.6 percent reported
a reduction and 8.7 percent reported an increase in the use of farm
areas after the first lockdown. It is followed by changes in the number
of varieties of crops produced, where both an increase (4%) and a
decrease (2.4%) in variety are mentioned after the first lockdown. Only
a small fraction of farmers delayed planting (1.2%) or abandoned crop
farming (1.5%) altogether for that season after the first lockdown.

**\
**

  -------------------------------------------------------------------------
  Table A3: Impact of                                         
  lockdowns on agricultural                                  
  strategies                                                 
  ---------------------------- -------------- -------------- --------------
                                                              

                                                              

  Panel A: Impact of lockdowns                                
  on crop planting activities                                

  Outcome variables:           Changed crop                  
                               planting                      
                               activities                    
                               because of                    
                               Covid                         

  First lockdown: short run    0.581\*\*\*                   

                               (0.139)                       

  Second lockdown: medium run  0.275\*\*\*                   

                               (0.048)                       

  Covid-19 cases/100,000       0.051\*\*\*                   

                               (0.017)                       

                                                             

  No of observations           5,230                         

  Number of households         2,071                          

                                                             

  Panel B: Means of changes in                               
  agricultural strategy                                      
  because of Covid-19 (in                                    
  percentages)                                               

                               First Lockdown Second         No lockdown
                                              Lockdown       (round 4)

  Changed planting acitivities 22.6%          18.8%          5.1%
  because of COVID-19                                        

  Strategies:                                                

  Reduced farm area            8.6%           10.2%          2.1%

  Increased farm area          8.6%           3.8%           0.0%

  Planted less variety/number  4.0%           6.4%           1.5%
  of crops                                                   

  Planted more variety/number  2.4%           1.6%           1.1%
  of crops                                                   

  Delayed planting             1.2%           2.9%           0.3%

  Planted crops that mature    1.0%           1.6%           0.0%
  quickly                                                    

  Abandoned crop farming       1.5%           0.5%           0.0%
  -------------------------------------------------------------------------

Note: Questions on crop planting activities are only asked in rounds 1,
4, and 7. Panel A represents linear model with household fixed effects
where the dependent variable is a dummy variable. Standard errors are in
parentheses. \*\*\* indicates significance at 1% level; \*\* at 5%; \*
at 10%.

  -------------------------------------------------------------------------------------------
  Table A4: Impact                                                                         
  of lockdowns on                                                                          
  food insecurity                                                                          
  only using the                                                                           
  rounds in lean                                                                           
  seasons - rounds                                                                         
  1, 2, and 6                                                                              
  ------------------ ------------- ------------- ------------- ------------- ------------- --
                                                                                           

                                                                                           

                     \(1\)         \(2\)         \(3\)         \(4\)         \(5\)         

  Outcome variables: Any food      Worry about   Unable to eat Had to eat    Had to skip a 
                     insecurity    not having    healthy and   only a few    meal          
                                   enough food   nutritious    kinds of food               
                                   to eat        food                                      

  First lockdown:    0.258\*\*\*   0.305\*\*\*   0.220\*\*\*   0.195\*\*\*   0.186\*\*\*   
  short run                                                                                

                     (0.019)       (0.020)       (0.020)       (0.020)       (0.016)       

  First lockdown:    0.109\*\*     0.230\*\*\*   0.159\*\*\*   0.140\*\*     0.179\*\*\*   
  medium run                                                                               

                     (0.051)       (0.055)       (0.054)       (0.054)       (0.043)       

  Covid-19           -0.030        0.153         0.075         0.144         0.148\*       
  cases/100,000                                                                            

                     (0.099)       (0.105)       (0.104)       (0.107)       (0.084)       

                                                                                           

  No of observations 6,506         6,506         6,506         6,506         6,506         

  Number of          2,286         2,286         2,286         2,286         2,286         
  households                                                                               

                                                                                           

                     \(6\)         \(7\)         \(8\)         \(9\)                       

  Outcome variables: Ate less than Ran out of    Went hungry   Went without                
                     they thought  food          but did not   eating for a                
                     they should                 eat           whole day                   

  First lockdown:    0.195\*\*\*   0.147\*\*\*   0.149\*\*\*   0.055\*\*\*                 
  short run                                                                                

                     (0.017)       (0.014)       (0.015)       (0.010)                     

  First lockdown:    0.209\*\*\*   0.105\*\*\*   0.148\*\*\*   0.107\*\*\*                 
  medium run                                                                               

                     (0.048)       (0.037)       (0.038)       (0.026)                     

  Covid-19           0.223\*\*     0.066         0.122\*       0.154\*\*\*                 
  cases/100,000                                                                            

                     (0.090)       (0.069)       (0.073)       (0.049)                     

                                                                                           

  No of observations 6,506         6,506         6,506         6,506                       

  Number of          2,286         2,286         2,286         2,286                       
  households                                                                               

  Note: Linear Model                                                                       
  with household                                                                           
  fixed effects. All                                                                       
  dependent                                                                                
  variables are                                                                            
  dummy variables.                                                                         
  Standard errors                                                                          
  are in                                                                                   
  parentheses.                                                                             
  \*\*\* indicates                                                                         
  significance at 1%                                                                       
  level; \*\* at 5%;                                                                       
  \* at 10%.                                                                               

                                                                                           
  -------------------------------------------------------------------------------------------

  ---------------------------------------------------------------------------------------
  Table A5: Comparing                                                                  
  the effect of                                                                        
  lockdown during                                                                      
  round 7 to round 4,                                                                  
  both of which                                                                        
  occurred during the                                                                  
  same calendar month                                                                  
  -------------------- ------------ ------------ ------------ ------------ ----------- --
                                                                                       

                                                                                       

                       \(1\)        \(2\)        \(3\)        \(4\)        \(5\)       

  Outcome variables:   Any food     Worry about  Unable to    Had to eat   Had to skip 
                       insecurity   not having   eat healthy  only a few   a meal      
                                    enough food  and          kinds of                 
                                    to eat       nutritious   food                     
                                                 food                                  

  Second lockdown:     0.139\*      0.176\*\*    0.171\*\*    0.066        0.129\*\*   
  medium run                                                                           

                       (0.073)      (0.069)      (0.074)      (0.078)      (0.064)     

  Covid-19             -0.031       -0.031       -0.021       -0.057\*     -0.034      
  cases/100,000                                                                        

                       (0.028)      (0.026)      (0.029)      (0.030)      (0.024)     

                                                                                       

  No of observations   4,059        4,059        4,059        4,059        4,059       

  Number of households 2,220        2,220        2,220        2,220        2,220       

                                                                                       

                       \(6\)        \(7\)        \(8\)        \(9\)                    

  Outcome variables:   Ate less     Ran out of   Went hungry  Went without             
                       than they    food         but did not  eating for a             
                       thought they              eat          whole day                
                       should                                                          

  Second lockdown:     0.166\*\*    0.021        0.156\*\*    -0.024                   
  medium run                                                                           

                       (0.071)      (0.062)      (0.065)      (0.054)                  

  Covid-19             -0.040       -0.046\*\*   -0.009       -0.051\*\*               
  cases/100,000                                                                        

                       (0.026)      (0.023)      (0.024)      (0.021)                  

                                                                                       

  No of observations   4,059        4,059        4,059        4,059                    

  Number of households 2,220        2,220        2,220        2,220                    

  Note: Linear Model                                                                   
  with household fixed                                                                 
  effects. All                                                                         
  dependent variables                                                                  
  are dummy variables.                                                                 
  Standard errors are                                                                  
  in parentheses.                                                                      
  \*\*\* indicates                                                                     
  significance at 1%                                                                   
  level; \*\* at 5%;                                                                   
  \* at 10%.                                                                           

                                                                                       
  ---------------------------------------------------------------------------------------

  ---------------------------------------------------------------------------------------------
  Table A6: Impact of                                                                        
  lockdowns on food                                                                          
  insecurity in urban                                                                        
  areas                                                                                      
  -------------------- ------------- ------------- ------------- ------------- ------------- --
                                                                                             

                                                                                             

                       \(1\)         \(2\)         \(3\)         \(4\)         \(5\)         

  Outcome variables:   Any food      Worry about   Unable to eat Had to eat    Had to skip a 
                       insecurity    not having    healthy and   only a few    meal          
                                     enough food   nutritious    kinds of food               
                                     to eat        food                                      

  First lockdown:      0.390\*\*\*   0.407\*\*\*   0.308\*\*\*   0.295\*\*\*   0.245\*\*\*   
  short run                                                                                  

                       (0.032)       (0.032)       (0.033)       (0.032)       (0.027)       

  First lockdown:      0.194\*\*\*   0.206\*\*\*   0.155\*\*\*   0.131\*\*\*   0.136\*\*\*   
  medium run                                                                                 

                       (0.028)       (0.028)       (0.029)       (0.027)       (0.023)       

  Second lockdown:     0.257\*\*\*   0.241\*\*\*   0.246\*\*\*   0.227\*\*\*   0.208\*\*\*   
  medium run                                                                                 

                       (0.034)       (0.034)       (0.033)       (0.035)       (0.029)       

  Covid-19             0.003         0.007\*\*\*   0.004         0.001         0.001         
  cases/100,000                                                                              

                       (0.003)       (0.003)       (0.003)       (0.003)       (0.002)       

                                                                                             

  No of observations   3,804         3,804         3,804         3,804         3,804         

  Number of households 619           619           619           619           619           

                                                                                             

                       \(6\)         \(7\)         \(8\)         \(9\)                       

  Outcome variables:   Ate less than Ran out of    Went hungry   Went without                
                       they thought  food          but did not   eating for a                
                       they should                 eat           whole day                   

  First lockdown:      0.271\*\*\*   0.199\*\*\*   0.194\*\*\*   0.076\*\*\*                 
  short run                                                                                  

                       (0.028)       (0.024)       (0.023)       (0.015)                     

  First lockdown:      0.130\*\*\*   0.073\*\*\*   0.085\*\*\*   0.029\*\*                   
  medium run                                                                                 

                       (0.027)       (0.018)       (0.017)       (0.011)                     

  Second lockdown:     0.240\*\*\*   0.149\*\*\*   0.181\*\*\*   0.120\*\*\*                 
  medium run                                                                                 

                       (0.035)       (0.025)       (0.028)       (0.020)                     

  Covid-19             -0.001        0.003         0.003\*\*     0.001                       
  cases/100,000                                                                              

                       (0.002)       (0.002)       (0.002)       (0.001)                     

                                                                                             

  No of observations   3,804         3,804         3,804         3,804                       

  Number of households 619           619           619           619                         

  Note: Linear Model                                                                         
  with household fixed                                                                       
  effects. All                                                                               
  dependent variables                                                                        
  are dummy variables.                                                                       
  Standard errors are                                                                        
  in parentheses.                                                                            
  \*\*\* indicates                                                                           
  significance at 1%                                                                         
  level; \*\* at 5%;                                                                         
  \* at 10%.                                                                                 

                                                                                             
  ---------------------------------------------------------------------------------------------




[^7]: Households were also asked whether they received unemployment
    benefits, but there was only one observation representing a change,
    so we do not have any variation to conduct a conditional ordered
    logit estimation.

[^9]: While not focusing on lockdowns, one prior study 
	finds evidence that the pandemic itself led to a switch in
    occupations, particularly among salaried and business persons, with
    agriculture seeing the biggest inflow of labor compared to other
    industries [@Gupta2021].

[^10]: We do not have income data for round 7 and thus cannot examine
    the medium-term impact of the second lockdown.

[^11]: For round 1, the survey asks about the employment industry before
    the lockdown, which allows us to identify whether individuals were
    employed in agriculture before the round 1 lockdown.

[^13]: This pattern holds for both UNPS 2015/16 and UNPS 2019/20. The
    results for the individual surveys are available upon request. UNPS
    2018/19 shows the same questions in the questionnaire, but the
    responses are not available in the data.
    
    
    
# References {.unnumbered}

<div id="refs"></div>



# Appendix {.unnumbered}

\appendix

\renewcommand{\thefigure}{A\arabic{figure}}
\setcounter{figure}{0}

\renewcommand{\thetable}{A\arabic{table}}
\setcounter{table}{0}


\input{../tables/survey_table.tex}



# Alternative Google Mobility Measures


![workplaces](../figures/mobility_national_workplaces.pdf){#fig:mobility_national_workplaces}

![Residential](../figures/mobility_national_residential.pdf){#fig:mobility_national_residential}




# [Region]

![Food Insecurity by Region and Survey Round of the Uganda High-Frequency Phone Survey on 
Covid-19](../figures/food_insecurity_by_region_survey_round_3_levels.pdf){#fig:region_descriptive}


![workplaces](../figures/mobility_regional_workplaces.pdf){#fig:mobility_regional_workplaces}

![Residential](../figures/mobility_regional_residential.pdf){#fig:mobility_regional_residential}




