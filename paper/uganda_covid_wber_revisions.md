---
title: 'Impact of Twin Lockdowns on Hunger, Labor Market Outcomes, and
		Household Coping Mechanisms: Evidence from Uganda'
date: November 2023
author:
- Shamma Adeeb Alam^[Associate Professor, Department of International
	Studies, Dickinson College, Carlisle, PA.
	\href{mailto:alams@dickinson.edu}{\texttt{alams@dickinson.edu}}]
- Claus C. Pörtner^[Associate Professor, 
	Albers School of Business and Economics, 
	Seattle University, Seattle, WA, and Center for Studies
	in Demography and Ecology, University of Washington, Seattle, WA. 
	\href{mailto:cportner@seattleu.edu}{\texttt{cportner@seattleu.edu}},
    \href{http://www.clausportner.com}{\texttt{www.clausportner.com}}]
- Ishraq Ahmed^[Economist, Public Utility Commission, State of
	Oregon, Salem, Oregon]
thanks: |
  We would like to thank seminar participants at Howard University, Alex
  Henke, and two anonymous referees for their helpful comments and
  suggestions on an earlier version of this paper. We would also like to
  thank Pascal Ntaganda for his research assistance.
  
  Partial support for this research came from a Eunice Kennedy Shriver National
  Institute of Child Health and Human Development research infrastructure grant,
  5R24HD042828, to the Center for Studies in Demography and Ecology at the
  University of Washington.
  
abstract: |
  \noindent We examine the short- and medium-run impacts of two of the strictest
  Covid-19 lockdowns in the developing world, employing longitudinal
  data from Uganda. Household fixed-effects estimations show
  significant, immediate increases in food insecurity after the first
  lockdown and a continued negative impact three months after its
  lifting. The second lockdown's medium-term impact was even worse,
  likely because of a compounding effect of a concurrent drought. The
  rising food insecurity was partly the result of the lockdown-related
  reductions in the availability of paid work. Agricultural households
  were more likely to continue working and consequently saw smaller
  increases in food insecurity. Furthermore, the likelihood of engaging
  in agricultural work increased after the first lockdown, suggesting a
  switch to agriculture as a coping mechanism. The other coping
  mechanisms that households typically rely on for idiosyncratic shocks
  failed in the face of a worldwide shock, contributing to the sizeable
  increase in food insecurity.
bibliography: uganda_covid.bib
csl: journal-of-development-economics.csl
link-citations: true
---

# Introduction

Uganda had some of the strictest Covid-19 lockdowns in Sub-Saharan
Africa, one in 2020 and another in 2021 (BBC, 2020; Birner et al., 2021;
Mahmud & Riley, 2021). Using longitudinal data and household fixed
effects, we examine the impact of the twin lockdowns in Uganda on food
insecurity, labor market outcomes, and how households attempted to cope
with the lockdowns.

Early assessments of the impact of the pandemic in developing countries
generally find a negative effect of lockdowns on food insecurity,
income, employment, and agricultural production.[^1] However, these
studies have limitations, such as using only cross-sectional type data
or having a narrow geographical focus covering only one or two villages
or states in a country. These studies also suggest that households try
to cope with the lockdowns through behavior changes, such as reducing
non-food expenditure, drawing down savings, leaving savings and loan
groups, increasing borrowing, and selling assets (Ceballos et al., 2021;
Headey et al., 2020; Kansiime et al., 2021; Mahmud & Riley, 2023; Rönkkö
et al., 2022; Ruszczyk et al., 2021). In addition, there is evidence
that remittances declined, and there was insufficient government support
to help households cope with the shock (Ceballos et al., 2021;
Curi-Quinto et al., 2021).

Only four studies we could identify used household fixed-effects models
to control for household-specific time-invariant factors when examining
food insecurity.[^2] Contrary to the cross-sectional studies, three of
these studies found no effect of lockdowns on food consumption across
Liberia, Malawi, Kenya, and Ethiopia (Aggarwal et al., 2022; Hirvonen et
al., 2021; Janssens et al., 2021). Only the Nigerian lockdown appeared
to increase food insecurity (Amare et al., 2021).

These studies do, however, also have limitations. The Liberia survey had
completion rates as low as 49% and evidence of a non-random attrition
(Aggarwal et al., 2022). The Kenya study focused only on households with
pregnant women or mothers with children below age four in one county
(Janssens et al., 2021). Ethiopia never went into a complete lockdown,
and the study covers only Addis Ababa (Hirvonen et al., 2021). Finally,
the Nigeria study only examined the immediate effect of the lockdown on
a limited set of food insecurity questions (Amare et al., 2021).

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
(Atamanov et al., 2022). Finally, rather than relying solely on reported
lockdowns like in prior studies, we use additional data on the
stringency of lockdowns and Google mobility data to conduct robustness
checks of our analysis.

Second, we contribute to the small but growing body of research on the
effects of aggregate shocks and how households cope with these shocks.
There is a long-standing literature on how households in developing
countries smooth consumption in response to idiosyncratic shocks through
self-insurance approaches (Case, 1995). However, we know less about how
these coping mechanisms fare when households are exposed to aggregate
shocks. Most of the research on aggregate shocks has focused on
financial shocks and natural disasters and has found varying degrees of
ability to smooth consumption, although wealthier households are
generally better able to deal with the shock (Del Ninno et al., 2003;
Fallon & Lucas, 2002; Glewwe & Hall, 1998; Hallegatte et al., 2020;
McKenzie, 2003; Skoufias, 2003; Thomas & Frankenberg, 2007).

We contribute to the literature on coping with aggregate shocks in two
ways. First, we examine a repeated systemic shock, which was almost
entirely unanticipated, especially the first instance. Second, we use
panel data to directly analyze four broad categories of coping
mechanisms that households may use to mitigate the effects of these
shocks. The categories are changes in labor market participation,
diversification of income sources, transfers and remittances, and
changes in household structure through migration (Foster & Rosenzweig,
2002; Jayachandran, 2006; Kochar, 1999; McKenzie, 2003; Morduch, 1995;
Townsend, 1994; Yang & Choi, 2007). Our paper complements recent work
showing that rural households in Uganda, especially non-farm business
owners, experienced significant asset decline and increased likelihood
of net borrowing, presumably as a coping mechanism after the first
lockdown (Mahmud & Riley, 2023).

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
lockdowns suggests that the drought compounded the negative effect of
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
concurrent drought made agriculture less attractive as a coping
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

# Lockdown Context

On March 18, 2020, the Ugandan government started imposing restrictions,
including travel restrictions and cancellation of public gatherings,
such as religious services, weddings, and music events (Uganda Bureau of
Statistics, 2022). A total lockdown was imposed on March 30 with a
nationwide curfew from 7 pm to 6:30 am, banning of public
transportation, strict regulations on the movement of vehicles, and
closure of all non-essential businesses, which extended till the end of
May (Alfonsi et al., 2021; Margini et al., 2020).

Lockdowns were eased at the beginning of June 2020 with the resumption
of public transportation and the opening of businesses (Guloba et al.,
2021; Monitor, 2020; Schwartz et al., 2021; Wagner et al., 2022). Most
small and medium businesses were back open by July-August 2020 (Alfonsi
et al., 2021). International travel restrictions remained until the end
of September, when land borders reopened, and international flights
resumed (Guloba et al., 2021).

In response to the resurgence of Covid-19 infections in 2021, the
government of Uganda imposed a second lockdown from June 2021 (Atamanov
et al., 2022; Athumani, 2021). This second lockdown was partly eased by
the end of July 2021 (Biryabarema, 2021).

# Estimation Strategy and Data

To establish the causal effects of Covid-19 lockdowns, we use household
fixed-effects models on a nationally representative longitudinal
household data set, relying on the changes over time in
government-imposed lockdowns to identify the effect.

Household data come from the *Uganda High-Frequency Phone Survey on
Covid-19* (UHFS), conducted by the Uganda Bureau of Statistics in
collaboration with the World Bank. The survey was conducted in seven
waves, with four waves in 2020 (June, August, September, and October)
and three in 2021 (February, March, and October). The goal was to
understand the economic and social impacts of the Covid-19 pandemic by
collecting high-frequency data on individuals and households (Uganda
Bureau of Statistics, 2022). To this end, the survey asked detailed
questions on food insecurity, employment, income, outside assistance,
and agricultural practices.

The UHFS sample is a subset of the 3,098 households interviewed in the
8^th^ wave of the Uganda National Panel Survey in 2019/20 (UNPS
2019/20). In UNPS 2019/20, respondents were asked to provide a phone
number where they could be reached, either their own or that of a friend
or neighbor. Originally, the goal was to ensure households could be
reached in case they moved, but with the Covid lockdowns, the phone
numbers became the basis for surveying households. Of the 2,386
households that provided a phone number, 2,225 were successfully
interviewed for round 1 of the UHFS. The head of the household was
typically the respondent. If the household head was not present, another
member of the household over the age of 15 could respond to the survey.

A concern with phone surveys is that households with access to phones
are fundamentally different from households without access to phones. It
is, for example, possible that phone surveys have a higher likelihood of
reaching wealthier households, who typically have better access to
phones, than poorer households. This would bias our results. To avoid
any biases to the extent possible, we use the UHFS-provided survey
weights to ensure that the data is nationally representative (Uganda
Bureau of Statistics, 2022).

Over the seven rounds, the cumulative attrition rate was 15.7 percent,
with 1,875 households from the baseline interviewed in round 7 (October
2021). However, replacement households were added to the sample
following the first round. This brings our total sample size to 2,302
households. The number of original households that remained in each
round and the cumulative number of new households in the follow-up
rounds are presented in Appendix Table A1.

## Empirical Specification

Our main specification regresses outcomes, *Y,* discussed below, on a
set of variables using a linear fixed-effects model:[^3]

*Y~i,\ t~ = β~0~ +* *β~1~ L~1~ + β~2~ L~2~ + β~3~ L~7~ + β~4~
Cases~i,t~ + β~5~ X~1\ i,t-1~ + δ~i~ + ε~i,t\ ~*, (1)

where *i* denote household and *t* survey rounds. We use three indicator
variables, *L~1~*, *L~2~*, and *L~7~*, to represent lockdown-related
periods, with 1 for a lockdown-related period and 0 otherwise. L~1~
represents the first survey round in June 2020, which was towards the
end of the first lockdown, and thus captures the immediate/short-run
effect of that lockdown. L~2~ represents the second survey round in
August 2020 and captures the medium-run impact of the first lockdown.
*L~7~* represents the seventh round in October 2021, which was two to
three months after the lifting of the second lockdown end-July 2021.
Thus, *L~7~* captures the medium-term impact of the second lockdown. In
our estimations, we compare the periods during or soon-after lockdowns
to the other periods with no lockdowns in rounds 3, 4, 5, and 6.

In addition to government-imposed lockdowns, individuals may be ill,
decide to self-isolate, or take other steps to avoid contact with others
if they perceive a high risk of contracting Covid-19, which may increase
food insecurity. To capture the severity of the Covid situation*,* the
*Cases* variable measures the number of new Covid-19 cases per 100,000
persons in the 30 days before the household's survey date. The number of
Covid cases comes from "Our World in Data."[^4]

The household fixed-effects, *δ~i~*~,~ control for unobserved
household-level time-invariant factors that may bias the results. This
approach allows us to control for time-invariant characteristics
associated with the individual/household, such as gender, race and
religion, constant preferences, household characteristics, area
characteristics, and other time-invariant factors.[^5] For some
estimations, we use individual-level dependent variables, like
employment. In these cases, the models are individual fixed-effects
models, as the same individual from the household is followed over the
rounds.

## Robustness Checks

Using indicator variables to capture the impact of lockdowns has the
advantage of straightforward interpretation. Still, the binary approach
of comparing periods with lockdowns to periods with no lockdowns might
miss potentially important nuances in government and individual behavior
over time. As consistency checks on our use of indicator variables to
capture the impact of lockdowns, we, therefore, also employ two
alternative measures of lockdowns: stringency of the lockdowns and
changes in mobility over time.

To capture the stringency of the lockdowns, we employ a modified version
of the lockdown stringency index developed at the Blavatnik School of
Government, University of Oxford (Hale et al., 2021). The original index
is a daily composite measure of how strict the lockdowns were based on
nine indicators, including school closures, workplace closures, and
travel bans, rescaled to a value from 0 to 100, where 100 is the
strictest response. As some of the restrictions in the original index,
such as school closure and international entry restrictions, are likely
to have minimal immediate impacts on food insecurity, we recalculate the
index using workplace closings, limits on public transport, stay-at-home
requirements, and any restrictions on internal movement. We use the
variation in the average of this revised index over the 30 days before
the households were surveyed to capture the impact of the lockdowns.

Neither the lockdown indicator variables nor the stringency index
captures the extent to which the lockdown policies were enforced or
adhered to. We, therefore, also use Google Mobility data on the percent
change in time spent at residential locations relative to the pre-Covid
behavior (Google, 2022).[^6] Our measure is the average of this percent
change over the 30 days before each household's survey date.

A final concern is that seasonal agricultural patterns may bias our
results. Uganda has two lean seasons, one in April and May and another
in November and December (FAO, 2022). Hence, with the first survey round
fielded in June 2020, it is possible that part of what we capture with
the round 1 indicator variable is the effect of the April/May lean
season on food security. To examine the role of seasonal variation, we
compare the changes in food insecurity measures with the closest
comparable from previous rounds of UNPS and estimate our main model on
alternative samples to show that seasonal variation is unlikely to
explain our results.

## Main Outcomes: Food Insecurity

The survey measures food insecurity based on the Food Insecurity
Experience Scale (FIES) developed by the FAO (FAO, 2016). FIES uses
eight questions with dichotomous (yes/no) responses to understand the
different challenges related to food insecurity. This measure has been
empirically validated for cross-cultural use (Ballard et al., 2013;
Kansiime et al., 2021). FIES asks whether, during the last 30 days,
there was any time when any adult in the household experienced the
following because of lack of money or other resources: (i) were worried
about not having enough food to eat; (ii) were unable to eat healthy and
nutritious/preferred foods; (iii) ate only a few kinds of foods; (iv)
skipped a meal; (v) ate less than you thought you should; (vi) ran out
of food; (vii) went hungry, but did not eat; and (viii) went without
eating for a whole day. We create an indicator variable for each
question where 1 represents "yes," and 0 represents "no." Additionally,
we create another variable to capture whether a household experienced
any food insecurity, with 1 for answering "Yes" to at least one of the
eight FIES questions and 0 otherwise.

## Mechanisms that Affect Food Insecurity

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
correspond to higher-value outcomes (Baetschmann et al., 2015). Hence,
for our regressions, a positive coefficient for lockdowns represents an
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

## Summary Statistics

Figure 1 shows the daily stringency index, the daily Google Mobility
measure of time spent at residential locations, the 7-day average number
of new Covid-19 cases and deaths per 100,000 persons, and the data
collection window for each of the UHFS rounds in shaded grey. The
strictest restrictions are just before round 1, where there is an almost
complete lockdown. Although, according to the stringency measure, the
second lockdown was nearly as strict as the first. Furthermore, the four
months after each lockdown show similar stringency levels, with
stringency only dropping in September 2020.

That the lockdown policies were enforced is shown by the substantial
increases in the amount of time spent at residential locations during
the April through June 2020 and the June through August 2021 periods.
Despite some remaining restrictions during the second and third rounds,
the time spent at residential locations had returned to almost the
baseline by the end of the second round's data collection in mid-August
2020, which is why we did not include the third round as a lockdown
round. Through the non-lockdown periods, the time spent at home remained
relatively stable except for the Christmas and New Year's celebrations.

The number of confirmed infections and deaths from Covid remained low in
Uganda until halfway through 2021. For context, even with the spike in
cases in 2021, Uganda's cumulative number of cases per 100,000 at the
end of 2021 was only 306.9 compared with 16,294.5 in the US.
Furthermore, as in many other developing countries, the number of Covid
deaths was low. Even with the increase in cases and deaths by the end of
2021, Uganda had only 7.2 deaths per 100,000 persons, while, for
comparison, the US had 245.1 deaths per 100,000 persons.

We present the summary statistics of key variables in Table 1. Column 1
shows the overall sample mean, and columns 2, 3, and 4 show the
respective sample means in round 1 (short-run effect of the first
lockdown), round 2 (medium-run effect of the first lockdown), and round
7 (medium run effect of the second lockdown). Column 5 presents the mean
for the non-lockdown-related rounds. Overall, the average food
insecurity across all rounds is relatively high, with 55.4% reporting at
least one type of food insecurity. However, the differences between the
lockdown and non-lockdown periods are large. For example, 71.8 percent
of households reported any food insecurity during the first lockdown
(round 1) as opposed to 47.2 percent for the non-lockdown period, a
difference of 24.6 percent.

# Results

## Food Insecurity

Table 2 shows the impact of the Covid-19 lockdowns in Uganda on the
likelihood of food insecurity using a linear model with household fixed
effects.[^8] Overall, lockdowns caused a substantial increase in all
types of food insecurity in both the short and medium run.

As shown in column 1, the first lockdown led to a substantial and
statistically significant short-run increase in the likelihood of having
any food insecurity by 25.2 percentage points. Furthermore, the
lockdowns led to a significant increase in all eight food insecurity
measures, where most of the point estimates are sizeable, with
magnitudes of over 20 percentage points. Even more concerning, the worst
forms of food insecurity ("had to skip a meal" and "went hungry but did
not eat") more than doubled, and "went without eating for a whole day"
almost tripled.

The effects of the first lockdown persisted in the medium run, with
significant increases in food insecurity about three months after the
lockdowns were lifted. Any food insecurity was still 11.9 percentage
points higher than in non-lockdown periods, and five of the nine
measures had a point estimate of at least nine percentage points.

Moreover, the medium-run impact of the second lockdown is similar to the
short-run effect of the first lockdown. The point estimates of the
second lockdown are over 20 percentage points for six of the nine food
insecurity measures. This suggests that the second lockdown, combined
with a drought, had a worse impact on food insecurity than the first
lockdown, at least in the medium run.

## Impact on Work

One way lockdowns can affect food insecurity is by lowering people's
ability to work. Table 3, column 1, shows that the likelihood of any
market work decreased by a significant 18.6 percentage points during the
first lockdown. These employment effects were driven mainly by lockdowns
rather than being ill from Covid-19. As shown in Figure 1, there were
almost no cases during the first lockdown. Furthermore, UHSF asked
individuals the reason for not working, and the top three reasons
reported are that the place of work is closed (62%), being ill from any
illness or quarantined (10%), and being laid off from the job (8%).

In the medium run, the likelihood of market work is 2.5 percentage
points lower than in non-lockdown periods. This suggests that the labor
market was approaching but not yet fully recovered. The medium-run
impact of the second lockdown combined with the drought is large, with
the likelihood of market work decreasing by 13 percentage points. This
large impact on market work may explain the large impact on food
insecurity in the medium run following the second lockdown.

While we do not have data for round 1 and cannot estimate the short-run
effect, the likelihood of operating a non-farm family business in the
medium run decreased by seven percentage points after the first lockdown
(column 2). However, the second lockdown did not impact family business
in the medium run, even though this coincided with the drought.

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
periods, likely because the concurrent drought negatively affected the
agricultural labor market. The lack of opportunities in the agricultural
sector may also explain why individuals were likely to remain at the
same job after the second lockdown (results from column 3). Overall,
these results suggest that while some joined the agricultural sector to
cope with the effects of the first lockdown, the negative impact of the
drought on agriculture meant that this was a less attractive coping
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
led to the closure of workplaces and limited people's movements (Cardozo
Silva et al., 2022; Guha et al., 2021; Kpodar et al., 2021; Shimizutani
& Yamada, 2021; Zhang et al., 2021). The failure of these coping
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
This is likely because of the concurrent drought during and after the
second lockdown in Uganda that affected the agricultural households\'
employment and food production.

# Robustness Checks

As a consistency check on our use of indicator variables to capture
lockdowns, we use the average of the revised daily lockdown stringency
measure for the 30 days before the interview in our main specifications.
The results are presented in Table 6. More stringent restrictions lead
to significant increases in all food insecurity variables. During the
first round, the average measure of the stringency index is 77, while
the index in the non-lockdown rounds (rounds 3 through 6) is 47.
Therefore, the point estimates imply that "any food insecurity"
increased by 15 percentage points when comparing the first lockdown to
the periods with no lockdown.

One downside of the stringency measure is that it does not capture the
extent to which the policies were enforced. Therefore, we also use
Google mobility data on the amount of time individuals spent at their
residences. The results are presented in Table 7. The mobility measure
also shows significant increases in food insecurity due to the
lockdowns. For example, the difference between the non-lockdown and the
first lockdown in time spent at residences implies a 30 percentage
points increase in any food insecurity due to the first lockdown.[^12]

To examine whether seasonality in food security might be behind our
results, we first compare pre-Covid information on food insecurity with
a subset of our measures. The UNPS 2015/16 and the UNPS 2019/20 both
asked if the households had been faced with a situation when they did
not have enough food to feed the household in the last 12 months. If
yes, they were asked to list all months when this occurred. Although
this question does not directly correspond to any of the food insecurity
questions asked in the UHFS and the recall period is one year rather
than the 30 days for the UHFS, it is close to three of our questions:
ran out of food because of lack of money, went hungry but did not eat,
and went without eating for a whole day.

For the UNPS question, we combined all observations by month and
calculate the percentage who reported not having enough food to feed the
household. For the UHFS questions, we calculate the percentages food
insecure by interview month. Figure 2 shows the food insecurity
percentages with the UNPS question shown in black for comparison.
Despite FAO listing April/May and November/December as the lean periods,
the UNPS data show that April, May, and June were the three months with
the highest proportion of food insecurity, while November and December
were the months with the lowest proportion.[^13]

All three UHFS questions follow the same general pattern as the UNPS
question outside the lockdown periods, September 2020 through April
2021. For the initial lockdown, both the short- and medium-run effects
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
new cases on food insecurity for some outcomes. Finally, we expect urban
households to be less affected by seasonality, and Appendix Table A6,
therefore, shows the results using only urban households across all
rounds. The short- and medium-run effects of the lockdowns are either
the same or larger when we restrict the sample to urban households.
Hence, our results are qualitatively the same, no matter how we account
for seasonality.

# Conclusion

Using country-wide panel data with a household fixed-effects model, we
examine the impact of two Covid-19 lockdowns in Uganda on food
insecurity. Food insecurity increased substantially during the first
lockdown, with the relative effects largest for the worst types of food
insecurity. The first lockdown also had a significant medium-run impact
on food insecurity. The medium-run impact was even higher following the
second lockdown, as a drought compounded the negative effect of the
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
example of curbing Covid-19 (Adams et al., 2021). However, the
mitigation efforts failed to reach those most affected by the lockdown.
With the low mortality rate in Sub-Saharan Africa, including Uganda, the
potential long-term cost of the lockdowns potentially significantly
outweighs the benefits. Quantifying these costs and identifying possible
avenues of mitigation are critical future areas of research.



**References:**

Adams, J., MacKenzie, M. J., Amegah, A. K., Ezeh, A., Gadanya, M. A.,
Omigbodun, A., Sarki, A. M., Thistle, P., Ziraba, A. K., Stranges, S., &
Silverman, M. (2021). The Conundrum of Low COVID-19 Mortality Burden in
sub-Saharan Africa: Myth or Reality? *Global Health: Science and
Practice*, *9*(3), 433--443. https://doi.org/10.9745/GHSP-D-21-00172

Agamile, P. (2022). *COVID-19 Lockdown and Exposure of Households to
Food Insecurity in Uganda: Insights from a National High Frequency Phone
Survey*. https://link.springer.com/article/10.1057/s41287-022-00510-8

Aggarwal, S., Jeong, D., Kumar, N., Park, D. S., Robinson, J., &
Spearot, A. (2022). COVID-19 market disruptions and food security:
Evidence from households in rural Liberia and Malawi. *PloS One*,
*17*(8), e0271488. https://doi.org/10.1371/journal.pone.0271488

Alam, S. A., & Bose, B. (2020). Did the Great Recession Affect
Fertility? Examining the Impact of Job Displacements on the Timing of
Births in the United States. *Southern Economic Journal*, *86*(3),
873--909. https://doi.org/10.1002/soej.12408

Alam, S. A., & Pörtner, C. C. (2018). Income shocks, contraceptive use,
and timing of fertility. *Journal of Development Economics*, *131*,
96--103. https://doi.org/10.1016/j.jdeveco.2017.10.007

Alfonsi, L., Bandiera, O., Bassi, V., Burgess, R., Rasul, I., Veroux,
O., & Vitali, A. (2021). COVID-19 and Ugandan SMEs: Impacts and Speed of
Recovery. *Centre for Economic Policy Research*, 7.

Amare, M., Abay, K. A., Tiberti, L., & Chamberlin, J. (2021). COVID-19
and food security: Panel data evidence from Nigeria. *Food Policy*,
*101*, 102099. https://doi.org/10.1016/j.foodpol.2021.102099

Atamanov, A., Cochinard, F., Ilukor, J., Kilic, T., & Ponzini, G. (2022,
March 15). *Economic impact of a second lockdown in Uganda: Results from
the seventh round of the High-Frequency Phone Survey*.
https://blogs.worldbank.org/opendata/economic-impact-second-lockdown-uganda-results-seventh-round-high-frequency-phone-survey

Athumani, H. (2021). *Uganda Lifts Some COVID-19 Restrictions*. VOA
News.
https://www.voanews.com/a/covid-19-pandemic_uganda-lifts-some-covid-19-restrictions/6208989.html

Baetschmann, G., Staub, K. E., & Winkelmann, R. (2015). Consistent
estimation of the fixed effects ordered logit model. *Journal of the
Royal Statistical Society. Series A (Statistics in Society)*, *178*(3),
685--703.

Balde, R., Boly, M., & Avenyo, E. (2020). Labour market effects of
COVID-19 in sub-Saharan Africa: An informality lens from Burkina Faso,
Mali and Senegal. In *MERIT Working Papers* (No. 2020--022; MERIT
Working Papers). United Nations University - Maastricht Economic and
Social Research Institute on Innovation and Technology (MERIT).
https://ideas.repec.org/p/unm/unumer/2020022.html

Ballard, T. J., Kepple, A. W., Cafiero, C., & Statistics Division.
(2013). *The Food insecurity experience scale: Development of a global
standard for monitoring hunger worldwide*. FAO.
https://www.fao.org/publications/card/fr/c/1f25bb40-7c4e-49e0-b79b-4d8b5e6354b5/

BBC. (2020, July 23). *Uganda---Where security forces may be more deadly
than coronavirus*. BBC News.
https://www.bbc.com/news/world-africa-53450850

Birner, R., Blaschke, N., Bosch, C., Daum, T., Graf, S., Güttler, D.,
Heni, J., Kariuki, J., Katusiime, R., Seidel, A., Senon, Z. N., & Woode,
G. (2021). 'We would rather die from Covid-19 than from
hunger'---Exploring lockdown stringencies in five African countries.
*Global Food Security*, *31*, 100571.
https://doi.org/10.1016/j.gfs.2021.100571

Biryabarema, E. (2021, July 31). Uganda partially eases COVID-19
containment measures. *Reuters*.
https://www.reuters.com/world/africa/uganda-partially-eases-covid-19-containment-measures-2021-07-30/

Cardozo Silva, A. R., Diaz Pavez, L. R., Martínez‐Zarzoso, I., &
Nowak‐Lehmann, F. (2022). The impact of COVID‐19 government responses on
remittances in Latin American countries. *Journal of International
Development*, *34*(4), 803--822. https://doi.org/10.1002/jid.3606

Case, A. (1995). Symposium on Consumption Smoothing in Developing
Countries. *Journal of Economic Perspectives*, *9*(3), 81--82.
https://doi.org/10.1257/jep.9.3.81

Ceballos, F., Hernandez, M. A., & Paz, C. (2021). Short‐term impacts of
COVID‐19 on food security and nutrition in rural Guatemala: Phone‐based
farm household survey evidence. *Agricultural Economics*, *52*(3),
Article 3. https://doi.org/10.1111/agec.12629

Ceballos, F., Kannan, S., & Kramer, B. (2020). Impacts of a national
lockdown on smallholder farmers' income and food security: Empirical
evidence from two states in India. *World Development*, *136*, 105069.
https://doi.org/10.1016/j.worlddev.2020.105069

Charles, K. K., & DeCicca, P. (2008). Local labor market fluctuations
and health: Is there a connection and for whom? *Journal of Health
Economics*, *27*(6), 1532--1550.
https://doi.org/10.1016/j.jhealeco.2008.06.004

Curi-Quinto, K., Sánchez, A., Lago-Berrocal, N., Penny, M. E., Murray,
C., Nunes, R., Favara, M., Wijeyesekera, A., Lovegrove, J. A.,
Soto-Cáceres, V., & Vimaleswaran, K. S. (2021). Role of Government
Financial Support and Vulnerability Characteristics Associated with Food
Insecurity during the COVID-19 Pandemic among Young Peruvians.
*Nutrients*, *13*(10), Article 10. https://doi.org/10.3390/nu13103546

Dasgupta, S., & Robinson, E. J. Z. (2021). Food Insecurity, Safety Nets,
and Coping Strategies during the COVID-19 Pandemic: Multi-Country
Evidence from Sub-Saharan Africa. *International Journal of
Environmental Research and Public Health*, *18*(19), Article 19.
https://doi.org/10.3390/ijerph18199997

Del Ninno, C., Dorosh, P. A., & Smith, L. C. (2003). Public Policy,
Markets and Household Coping Strategies in Bangladesh: Avoiding a Food
Security Crisis Following the 1998 Floods. *Economic Crises, Natural
Disasters, and Poverty*, *31*(7), 1221--1238.
https://doi.org/10.1016/S0305-750X(03)00071-8

Deshpande, A. (2020). The Covid-19 Pandemic and Lockdown: First Order
Effects on Gender Gaps in Employment and Domestic Time Use in India. In
*GLO Discussion Paper Series* (No. 607; GLO Discussion Paper Series,
Issue 607). Global Labor Organization (GLO).
https://ideas.repec.org/p/zbw/glodps/607.html

Egger, D., Miguel, E., Warren, S. S., Shenoy, A., Collins, E., Karlan,
D., Parkerson, D., Mobarak, A. M., Fink, G., Udry, C., Walker, M.,
Haushofer, J., Larreboure, M., Athey, S., Lopez-Pena, P., Benhachmi, S.,
Humphreys, M., Lowe, L., Meriggi, N. F., ... Vernot, C. (2022). Falling
living standards during the COVID-19 crisis: Quantitative evidence from
nine developing countries. *Science Advances*, *7*(6), Article 6.
https://doi.org/10.1126/sciadv.abe0997

Fallon, P. R., & Lucas, R. E. B. (2002). The Impact of Financial Crises
on Labor Markets, Household Incomes, and Poverty: A Review of Evidence.
*The World Bank Research Observer*, *17*(1), 21--45.
https://doi.org/10.1093/wbro/17.1.21

FAO. (2016). *Global Food Insecurity Experience Scale Survey Modules*.

FAO. (2022). *GIEWS Country Brief---Uganda*. Food and Agricultural
Organization of the United Nations.
https://www.fao.org/giews/countrybrief/country/UGA/pdf/UGA.pdf

Foster, A. D., & Rosenzweig, M. R. (2002). Household Division and Rural
Economic Growth. *The Review of Economic Studies*, *69*(4), 839--869.
https://doi.org/10.1111/1467-937X.00228

Gaitán-Rossi, P., Vilar-Compte, M., Teruel, G., & Pérez-Escamilla, R.
(2021). Food insecurity measurement and prevalence estimates during the
COVID-19 pandemic in a repeated cross-sectional survey in Mexico.
*Public Health Nutrition*, *24*(3), Article 3.
https://doi.org/10.1017/S1368980020004000

Giacoman, C., Herrera, M. S., & Ayala Arancibia, P. (2021). Household
food insecurity before and during the COVID-19 pandemic in Chile.
*Public Health*, *198*, 332--339.
https://doi.org/10.1016/j.puhe.2021.07.032

Glewwe, P., & Hall, G. (1998). Are some groups more vulnerable to
macroeconomic shocks than others? Hypothesis tests based on panel data
from Peru. *Journal of Development Economics*, *56*(1), 181--206.
https://doi.org/10.1016/S0304-3878(98)00058-3

Google. (2022). *COVID-19 Community Mobility Report*. COVID-19 Community
Mobility Report. https://www.google.com/covid19/mobility?hl=en

Guha, P., Islam, B., & Hussain, M. A. (2021). COVID-19 lockdown and
penalty of joblessness on income and remittances: A study of inter-state
migrant labourers from Assam, India. *Journal of Public Affairs*,
*21*(4), e2470. https://doi.org/10.1002/pa.2470

Guloba, M. M., Kakuru, M., & Ssewanyana, S. N. (2021). *The impact of
COVID-19 on industries without smokestacks in Uganda*. Africa Growth
Initiative at Brookings.
https://www.brookings.edu/research/the-impact-of-covid-19-on-industries-without-smokestacks-in-uganda/

Gupta, A., Malani, A., & Woda, B. (2021). *Explaining the Income and
Consumption Effects of COVID in India* (Working Paper No. 28935; Working
Paper Series, Issue 28935). National Bureau of Economic Research.
https://doi.org/10.3386/w28935

Hale, T., Angrist, N., Goldszmidt, R., Kira, B., Petherick, A.,
Phillips, T., Webster, S., Cameron-Blake, E., Hallas, L., Majumdar, S.,
& Tatlow, H. (2021). A global panel database of pandemic policies
(Oxford COVID-19 Government Response Tracker). *Nature Human Behaviour*,
*5*(4), 529--538. https://doi.org/10.1038/s41562-021-01079-8

Hallegatte, S., Vogt-Schilb, A., Rozenberg, J., Bangalore, M., &
Beaudet, C. (2020). From Poverty to Disaster and Back: A Review of the
Literature. *Economics of Disasters and Climate Change*, *4*(1),
223--247. https://doi.org/10.1007/s41885-020-00060-5

Hamadani, J. D., Hasan, M. I., Baldi, A. J., Hossain, S. J., Shiraji,
S., Bhuiyan, M. S. A., Mehrin, S. F., Fisher, J., Tofail, F., Tipu, S.
M. M. U., Grantham-McGregor, S., Biggs, B.-A., Braat, S., & Pasricha,
S.-R. (2020). Immediate impact of stay-at-home orders to control
COVID-19 transmission on socioeconomic conditions, food insecurity,
mental health, and intimate partner violence in Bangladeshi women and
their families: An interrupted time series. *The Lancet. Global Health*,
*8*(11), Article 11. https://doi.org/10.1016/S2214-109X(20)30366-1

Harris, J., Depenbusch, L., Pal, A. A., Nair, R. M., & Ramasamy, S.
(2020). Food system disruption: Initial livelihood and dietary effects
of COVID-19 on vegetable producers in India. *Food Security*, *12*(4),
Article 4. https://doi.org/10.1007/s12571-020-01064-5

Headey, D. D., Goudet, S., Lambrecht, I., Oo, T. Z., Maffioli, E. M., &
Toth, R. (2020). *Poverty and food insecurity during COVID-19: Telephone
survey evidence from mothers in rural and urban Myanmar* (0 ed.).
International Food Policy Research Institute.
https://doi.org/10.2499/p15738coll2.134036

Hirvonen, K., de Brauw, A., & Abate, G. T. (2021). Food Consumption and
Food Security during the COVID-19 Pandemic in Addis Ababa. *American
Journal of Agricultural Economics*, *103*(3), Article 3.
https://doi.org/10.1111/ajae.12206

Jaacks, L. M., Veluguri, D., Serupally, R., Roy, A., Prabhakaran, P., &
Ramanjaneyulu, G. (2021). Impact of the COVID-19 pandemic on
agricultural production, livelihoods, and food security in India:
Baseline results of a phone survey. *Food Security*, *13*(5), Article 5.
https://doi.org/10.1007/s12571-021-01164-w

Janssens, W., Pradhan, M., de Groot, R., Sidze, E., Donfouet, H. P. P.,
& Abajobir, A. (2021). The short-term economic effects of COVID-19 on
low-income households in rural Kenya: An analysis using weekly financial
household data. *World Development*, *138*, 105280.
https://doi.org/10.1016/j.worlddev.2020.105280

Jayachandran, S. (2006). Selling Labor Low: Wage Responses to
Productivity Shocks in Developing Countries. *Journal of Political
Economy*, *114*(3), 538\--575.

Kang, Y., Baidya, A., Aaron, A., Wang, J., Chan, C., & Wetzler, E.
(2021). Differences in the early impact of COVID-19 on food security and
livelihoods in rural and urban areas in the Asia Pacific Region. *Global
Food Security*, *31*, 100580. https://doi.org/10.1016/j.gfs.2021.100580

Kansiime, M. K., Tambo, J. A., Mugambi, I., Bundi, M., Kara, A., &
Owuor, C. (2021). COVID-19 implications on household income and food
security in Kenya and Uganda: Findings from a rapid assessment. *World
Development*, *137*, 105199.
https://doi.org/10.1016/j.worlddev.2020.105199

Kesar, S., Abraham, R., Lahoti, R., Nath, P., & Basole, A. (2021).
Pandemic, informality, and vulnerability: Impact of COVID-19 on
livelihoods in India. *Canadian Journal of Development Studies / Revue
Canadienne d'études Du Développement*, *42*(1--2), Article 1--2.
https://doi.org/10.1080/02255189.2021.1890003

Kochar, A. (1999). Smoothing Consumption by Smoothing Income:
Hours-of-Work Responses to Idiosyncratic Agricultural Shocks in Rural
India. *The Review of Economics and Statistics*, *81*(1), 50--61.
https://doi.org/10.1162/003465399767923818

Komin, W., Thepparp, R., Subsing, B., & Engstrom, D. (2021). Covid-19
and its impact on informal sector workers: A case study of Thailand.
*Asia Pacific Journal of Social Work and Development*, *31*(1--2),
Article 1--2. https://doi.org/10.1080/02185385.2020.1832564

Kpodar, K., Mlachila, M., Quayyum, S., & Gammadigbe, V. (2021). *Defying
the Odds: Remittances During the COVID-19 Pandemic*. International
Monetary Fund.
https://www.imf.org/en/Publications/WP/Issues/2021/07/16/Defying-the-Odds-Remittances-During-the-COVID-19-Pandemic-461321

Kundu, S., Banna, M. H. A., Sayeed, A., Sultana, M. S., Brazendale, K.,
Harris, J., Mandal, M., Jahan, I., Abid, M. T., & Khan, M. S. I. (2021).
Determinants of household food security and dietary diversity during the
COVID-19 pandemic in Bangladesh. *Public Health Nutrition*, *24*(5),
Article 5. https://doi.org/10.1017/S1368980020005042

Lee, Kenneth, Sahai, H., Baylis, P., & Greenstone, Michael. (2022, April
9). Job Loss and Behavioral Change: The Unprecedented Effects of the
India Lockdown in Delhi. *BFI*.
https://bfi.uchicago.edu/working-paper/job-loss-and-behavioral-change-the-unprecedented-effects-of-the-india-lockdown-in-delhi/

Mahmud, M., & Riley, E. (2021). Household response to an extreme shock:
Evidence on the immediate impact of the Covid-19 lockdown on economic
outcomes and well-being in rural Uganda. *World Development*, *140*,
105318. https://doi.org/10.1016/j.worlddev.2020.105318

Mahmud, M., & Riley, E. (2023). Adapting to an aggregate shock: The
impact of the Covid-19 crisis on rural households. *Review of Economics
of the Household*, *21*(1), 19--36.
https://doi.org/10.1007/s11150-022-09625-7

Margini, F., Pattnaik, A., Jordanwood, T., Nakyanzi, A., & Byakika, S.
(2020). *Case study: The Initial COVID-19 response in Uganda*. ThinkWell
and Ministry of Health Uganda.

McKenzie, D. J. (2003). How do Households Cope with Aggregate Shocks?
Evidence from the Mexican Peso Crisis. *Economic Crises, Natural
Disasters, and Poverty*, *31*(7), 1179--1199.
https://doi.org/10.1016/S0305-750X(03)00064-0

Monitor. (2020, July 19). *Gulu District lockdown to be lifted on
Monday*.
https://www.monitor.co.ug/uganda/news/national/gulu-district-lockdown-to-be-lifted-on-monday-1896922

Morduch, J. (1995). Income Smoothing and Consumption Smoothing. *Journal
of Economic Perspectives*, *9*(3), 103--114.

Nguyen, P. H., Kachwaha, S., Pant, A., Tran, L. M., Ghosh, S., Sharma,
P. K., Shastri, V. D., Escobar-Alegria, J., Avula, R., & Menon, P.
(2021). Impact of COVID-19 on household food insecurity and
interlinkages with child feeding practices and coping strategies in
Uttar Pradesh, India: A longitudinal community-based study. *BMJ Open*,
*11*(4), Article 4. https://doi.org/10.1136/bmjopen-2021-048738

Rönkkö, R., Rutherford, S., & Sen, K. (2022). The impact of the COVID-19
pandemic on the poor: Insights from the Hrishipara diaries. *World
Development*, *149*, 105689.
https://doi.org/10.1016/j.worlddev.2021.105689

Ruszczyk, H. A., Rahman, M. F., Bracken, L. J., & Sudha, S. (2021).
Contextualizing the COVID-19 pandemic's impact on food security in two
small cities in Bangladesh. *Environment and Urbanization*, *33*(1),
Article 1. https://doi.org/10.1177/0956247820965156

Schotte, S., Danquah, M., Osei, R. D., & Sen, K. (2021). *The Labour
Market Impact of COVID-19 Lockdowns: Evidence from Ghana* (SSRN
Scholarly Paper No. 3917307; Issue 3917307). Social Science Research
Network. https://doi.org/10.2139/ssrn.3917307

Schwartz, J. I., Muddu, M., Kimera, I., Mbuliro, M., Ssennyonjo, R.,
Ssinabulya, I., & Semitala, F. C. (2021). Impact of a COVID-19 National
Lockdown on Integrated Care for Hypertension and HIV. *Global Heart*,
*16*(1), 9. https://doi.org/10.5334/gh.928

Shimizutani, S., & Yamada, E. (2021). Resilience against the pandemic:
The impact of COVID-19 on migration and household welfare in Tajikistan.
*PLOS ONE*, *16*(9 September).
https://doi.org/10.1371/journal.pone.0257469

Skoufias, E. (2003). Economic Crises and Natural Disasters: Coping
Strategies and Policy Implications. *Economic Crises, Natural Disasters,
and Poverty*, *31*(7), 1087--1102.
https://doi.org/10.1016/S0305-750X(03)00069-X

Thomas, D., & Frankenberg, E. (2007). Household Responses to the
Financial Crisis in Indonesia: Longitudinal Evidence on Poverty,
Resources, and Well-Being. In *Globalization and Poverty* (pp.
517--560). University of Chicago Press.
http://www.nber.org/chapters/c0116

Townsend, R. M. (1994). Risk and Insurance in Village India.
*Econometrica*, *62*(3), 539--591.

Uganda Bureau of Statistics. (2022). *Uganda High-Frequency Phone Survey
on COVID-19 -- Basic Information Document*.
https://microdata.worldbank.org/index.php/catalog/3765/related-materials

Wagner, G. J., Wagner, Z., Gizaw, M., Saya, U., MacCarthy, S., Mukasa,
B., Wabukala, P., & Linnemayr, S. (2022). Increased Depression during
COVID-19 Lockdown Associated with Food Insecurity and Antiretroviral
Non-Adherence among People Living with HIV in Uganda. *AIDS and
Behavior*, *26*(7), 2182--2190.
https://doi.org/10.1007/s10461-021-03371-0

Wild, I., Gedge, A., Burridge, J., & Burford, J. (2021). The Impact of
COVID-19 on the Working Equid Community: Responses from 1530 Individuals
Accessing NGO Support in 14 Low- and Middle-Income Countries. *Animals :
An Open Access Journal from MDPI*, *11*(5), Article 5.
https://doi.org/10.3390/ani11051363

Yang, D., & Choi, H. (2007). Are Remittances Insurance? Evidence from
Rainfall Shocks in the Philippines. *World Bank Economic Review*,
*21*(2), 219\--248.

Zhang, Y., Zhan, Y., Diao, X., Chen, K. Z., & Robinson, S. (2021). The
Impacts of COVID-19 on Migrants, Remittances, and Poverty in China: A
Microsimulation Analysis. *China and World Economy*, *29*(6), 4--33.
https://doi.org/10.1111/cwe.12392

![](media/image1.emf){width="6.23in" height="8.19in"}

Figure 1: Revised Stringency Index, Time Spent at Residential Locations,
Daily New Covid Cases per 100,000 persons and New Deaths per 100,000,
and Data Collection Window for Each UHFS Survey Round.

![](media/image2.emf){width="6.5in" height="4.939583333333333in"}

Figure 2: Projected Seasonality in Food Insecurity from UNPS and
Observed Food Insecurity for Three UHFS Outcomes

  -------------------------------------------------------------------------------------------
  Table 1: Summary statistics of                                               
  key variables                                                                
  ------------------------------ --------- ----------- ----------- ----------- --------------
                                                                               

                                 \(1\)     \(2\)       \(3\)       \(4\)       \(5\)

                                 Overall   Mean at     Mean at     Mean at     Mean in
                                 sample    round 1     round 2     round 7     non-lockdown
                                 mean      (first      (medium run (medium run rounds (Rounds
                                           lockdown)   of first    of second   3, 4, 5, and
                                                       lockdown)   lockdown)   6)

  **Food Insecurity:**                                                         

  Any food insecurity            55.6%     71.8%       58.7%       69.2%       47.5%

  Worry about not having enough  37.8%     58.0%       42.0%       53.5%       27.8%
  food to eat                                                                  

  Unable to eat healthy and      45.0%     58.6%       48.6%       59.8%       37.2%
  nutritious food                                                              

  Had to eat only a few kinds of 44.2%     58.0%       44.3%       58.8%       37.4%
  food                                                                         

  Had to skip a meal             21.0%     34.2%       25.4%       34.4%       13.4%

  Ate less than they thought     28.4%     42.3%       31.3%       46.6%       19.9%
  they should                                                                  

  Ran out of food                14.4%     23.9%       16.5%       23.2%       9.3%

  Went hungry but did not eat    15.3%     24.8%       18.1%       27.8%       9.2%

  Went without eating for a      6.0%      9.7%        6.4%        14.3%       3.1%
  whole day                                                                    

  **Employment and household                                                   
  variables:**                                                                 

  Likelihood of market work      83.2%     69.9%       86.3%       74.5%       87.8%

  Likelihood of op. a non-farm   39.7%                 35.5%       39.6%       40.7%
  family business                                                              

  Likelihood of working in same  95.2%     87.6%       95.7%       95.1%       96.9%
  job as before                                                                

  Agricultural household         57.9%     61.4%       60.5%       54.3%       57.2%

  Total household members        5.02      5.0         5.0         5.2         5.0

  Total number of adults in      2.36      2.4         2.3         2.4         2.3
  household                                                                    

  Total number of children in    2.66      2.6         2.7         2.8         2.6
  household                                                                    

  Likelihood of living in urban  32.1%     32.8%       31.7%       31.9%       32.1%
  area                                                                         

  *Fraction of households                                                      
  reporting changes in income                                                  
  and assistance ('+' indicates                                                
  increase, '-' indicates                                                      
  decrease, 0 indicates no                                                     
  change):*                                                                    

  Farm income                    -13.2%    -38.0%      -16.8%                  -5.8%

  Nonfarm income                 -12.3%    -36.6%      -17.8%                  -4.5%

  Wage income                    -8.7%     -20.9%      -13.2%                  -4.3%

  Income from assets             -0.9%     -2.4%       -1.5%                   -0.3%

  Pension                        0.0%      0.0%        0.0%                    0.0%

  Remittance                     -0.6%     -1.0%       -0.8%                   -0.5%

  Assistance from family within  -8.5%     -11.8%      -10.3%                  -7.1%
  country                                                                      

  Assistance from non-family     -1.0%     -2.2%       -1.7%                   -0.5%
  individuals                                                                  

  Assistance from NGOs           -0.1%     -0.5%       -0.1%                   0.0%

  Assistance from government     0.0%      0.1%        0.0%                    -0.1%

  Number of observations         14,818    2,225       2,189       1,930       8,474
  -------------------------------------------------------------------------------------------

  --------------------------------------------------------------------------------------------
  Table 2: Impact of                                                                        
  lockdowns on food                                                                         
  insecurity                                                                                
  ------------------- ------------- ------------- ------------- ------------- ------------- --
                                                                                            

                                                                                            

                      \(1\)         \(2\)         \(3\)         \(4\)         \(5\)         

  Outcome variables:  Any food      Worry about   Unable to eat Had to eat    Had to skip a 
                      insecurity    not having    healthy and   only a few    meal          
                                    enough food   nutritious    kinds of food               
                                    to eat        food                                      

  First lockdown:     0.252\*\*\*   0.314\*\*\*   0.221\*\*\*   0.204\*\*\*   0.194\*\*\*   
  short run                                                                                 

                      (0.016)       (0.017)       (0.017)       (0.017)       (0.014)       

  First lockdown:     0.123\*\*\*   0.155\*\*\*   0.121\*\*\*   0.070\*\*\*   0.103\*\*\*   
  medium run                                                                                

                      (0.015)       (0.017)       (0.017)       (0.016)       (0.013)       

  Second lockdown:    0.215\*\*\*   0.251\*\*\*   0.224\*\*\*   0.214\*\*\*   0.204\*\*\*   
  medium run                                                                                

                      (0.017)       (0.017)       (0.017)       (0.018)       (0.016)       

  Covid-19            0.002         0.003         0.001         0.000         -0.003\*\*    
  cases/100,000                                                                             

                      (0.001)       (0.002)       (0.002)       (0.002)       (0.001)       

                                                                                            

  No of observations  14,818        14,818        14,818        14,817        14,818        

  Number of           2,302         2,302         2,302         2,302         2,302         
  households                                                                                

  Mean of outcome at  47.5%         27.8%         37.2%         37.4%         13.4%         
  non-lockdown period                                                                       

                                                                                            

                      \(6\)         \(7\)         \(8\)         \(9\)                       

  Outcome variables:  Ate less than Ran out of    Went hungry   Went without                
                      they thought  food          but did not   eating for a                
                      they should                 eat           whole day                   

  First lockdown:     0.212\*\*\*   0.145\*\*\*   0.154\*\*\*   0.063\*\*\*                 
  short run                                                                                 

                      (0.016)       (0.013)       (0.013)       (0.009)                     

  First lockdown:     0.101\*\*\*   0.067\*\*\*   0.085\*\*\*   0.027\*\*\*                 
  medium run                                                                                

                      (0.016)       (0.011)       (0.012)       (0.008)                     

  Second lockdown:    0.264\*\*\*   0.133\*\*\*   0.180\*\*\*   0.103\*\*\*                 
  medium run                                                                                

                      (0.018)       (0.015)       (0.015)       (0.011)                     

  Covid-19            -0.002        -0.000        -0.001        -0.001                      
  cases/100,000                                                                             

                      (0.002)       (0.001)       (0.001)       (0.001)                     

                                                                                            

  No of observations  14,818        14,818        14,818        14,818                      

  Number of           2,302         2,302         2,302         2,302                       
  households                                                                                

  Mean of outcome at  19.9%         9.3%          9.2%          3.1%                        
  non-lockdown period                                                                       

  Note: Linear Model                                                                        
  with household                                                                            
  fixed effects.                                                                            
  Standard errors are                                                                       
  in parentheses.                                                                           
  \*\*\* indicates                                                                          
  significance at 1%                                                                        
  level; \*\* at 5%;                                                                        
  \* at 10%. All                                                                            
  dependent variables                                                                       
  are dummy                                                                                 
  variables. As point                                                                       
  estimates are                                                                             
  relative to                                                                               
  non-lockdown                                                                              
  periods, we present                                                                       
  the mean of outcome                                                                       
  variables in                                                                              
  non-lockdown                                                                              
  periods.                                                                                  
  --------------------------------------------------------------------------------------------

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

  ----------------------------------------------------------------------------------------------
  Table 6: Impact                                                                             
  of stringency                                                                               
  index on food                                                                               
  insecurity                                                                                  
  ----------------- -------------- -------------- -------------- ------------- -------------- --
                                                                                              

                                                                                              

                    \(1\)          \(2\)          \(3\)          \(4\)         \(5\)          

  Outcome           Any food       Worry about    Unable to eat  Had to eat    Had to skip a  
  variables:        insecurity     not having     healthy and    only a few    meal           
                                   enough food to nutritious     kinds of food                
                                   eat            food                                        

  Stringency index  0.006\*\*\*    0.007\*\*\*    0.005\*\*\*    0.005\*\*\*   0.005\*\*\*    

                    (0.000)        (0.000)        (0.000)        (0.000)       (0.000)        

  Covid-19          -0.004\*\*\*   -0.006\*\*\*   -0.004\*\*\*   -0.002        -0.007\*\*\*   
  cases/100,000                                                                               

                    (0.001)        (0.001)        (0.001)        (0.001)       (0.001)        

                                                                                              

  No of             14,818         14,818         14,818         14,817        14,818         
  observations                                                                                

  Number of         2,302          2,302          2,302          2,302         2,302          
  households                                                                                  

                                                                                              

                    \(6\)          \(7\)          \(8\)          \(9\)                        

  Outcome           Ate less than  Ran out of     Went hungry    Went without                 
  variables:        they thought   food           but did not    eating for a                 
                    they should                   eat            whole day                    

  Stringency index  0.006\*\*\*    0.003\*\*\*    0.004\*\*\*    0.002\*\*\*                  

                    (0.000)        (0.000)        (0.000)        (0.000)                      

  Covid-19          -0.004\*\*\*   -0.003\*\*\*   -0.003\*\*\*   -0.001                       
  cases/100,000                                                                               

                    (0.001)        (0.001)        (0.001)        (0.001)                      

                                                                                              

  No of             14,818         14,818         14,818         14,818                       
  observations                                                                                

  Number of         2,302          2,302          2,302          2,302                        
  households                                                                                  

  Note: Linear                                                                                
  Model with                                                                                  
  household fixed                                                                             
  effects. All                                                                                
  dependent                                                                                   
  variables are                                                                               
  dummy variables.                                                                            
  Standard errors                                                                             
  are in                                                                                      
  parentheses.                                                                                
  \*\*\* indicates                                                                            
  significance at                                                                             
  1% level; \*\* at                                                                           
  5%; \* at 10%.                                                                              

                                                                                              
  ----------------------------------------------------------------------------------------------

  --------------------------------------------------------------------------------------------
  Table 7: Impact of                                                                        
  time spent in                                                                             
  residence on food                                                                         
  insecurity                                                                                
  ------------------ ------------- ------------- ------------- ------------- -------------- --
                                                                                            

                                                                                            

                     \(1\)         \(2\)         \(3\)         \(4\)         \(5\)          

  Outcome variables: Any food      Worry about   Unable to eat Had to eat    Had to skip a  
                     insecurity    not having    healthy and   only a few    meal           
                                   enough food   nutritious    kinds of food                
                                   to eat        food                                       

  Time spent in      0.020\*\*\*   0.024\*\*\*   0.018\*\*\*   0.017\*\*\*   0.015\*\*\*    
  residence                                                                                 

                     (0.001)       (0.001)       (0.001)       (0.001)       (0.001)        

  Covid-19           -0.002        -0.003\*\*    -0.002        -0.000        -0.005\*\*\*   
  cases/100,000                                                                             

                     (0.001)       (0.001)       (0.001)       (0.001)       (0.001)        

                                                                                            

  No of observations 14,818        14,818        14,818        14,817        14,818         

  Number of          2,302         2,302         2,302         2,302         2,302          
  households                                                                                

                                                                                            

                     \(6\)         \(7\)         \(8\)         \(9\)                        

  Outcome variables: Ate less than Ran out of    Went hungry   Went without                 
                     they thought  food          but did not   eating for a                 
                     they should                 eat           whole day                    

  Time spent in      0.018\*\*\*   0.011\*\*\*   0.012\*\*\*   0.006\*\*\*                  
  residence                                                                                 

                     (0.001)       (0.001)       (0.001)       (0.001)                      

  Covid-19           -0.003\*\*    -0.002\*\*    -0.002\*\*    -0.000                       
  cases/100,000                                                                             

                     (0.001)       (0.001)       (0.001)       (0.001)                      

                                                                                            

  No of observations 14,818        14,818        14,818        14,818                       

  Number of          2,302         2,302         2,302         2,302                        
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

                                                                                            
  --------------------------------------------------------------------------------------------

**Appendix**

  -----------------------------------------------------------------------------------------
  Table A1: Number of original and                                                   
  new households following round 1                                                  
  for each survey round                                                             
  -------------------------------- ------- ------- ------- -------- ------- ------- -------
                                                                                     

                                                           Rounds                   

                                   1       2       3       4        5       6       7

  Number of original households    2,225   2,145   2,091   2,085    2,070   2,040   1,875
  from Round 1                                                                      

  Cumulative new households added          44      46      44       46      52      55
  after round 1                                                                     

  Total sample size for a          2,225   2,189   2,137   2,129    2,116   2,092   1,930
  particular round                                                                  
  -----------------------------------------------------------------------------------------

**\
**

  -----------------------------------------------------------------------------------------------
  Table A2: Impact of                                                                          
  lockdowns on food                                                                            
  insecurity using                                                                             
  conditional logit                                                                            
  model                                                                                        
  ------------------- ------------- ------------- -------------- -------------- -------------- --
                                                                                               

                      \(1\)         \(2\)         \(3\)          \(4\)          \(5\)          

  Outcome variables:  Any food      Worry about   Unable to eat  Had to eat     Had to skip a  
                      insecurity    not having    healthy and    only a few     meal           
                                    enough food   nutritious     kinds of food                 
                                    to eat        food                                         

  First lockdown:     1.852\*\*\*   1.998\*\*\*   1.454\*\*\*    1.456\*\*\*    1.757\*\*\*    
  short run                                                                                    

                      (0.087)       (0.082)       (0.080)        (0.080)        (0.091)        

  First lockdown:     0.861\*\*\*   1.052\*\*\*   0.742\*\*\*    0.494\*\*\*    0.974\*\*\*    
  medium run                                                                                   

                      (0.087)       (0.084)       (0.082)        (0.082)        (0.097)        

  Second lockdown:    1.632\*\*\*   1.867\*\*\*   1.545\*\*\*    1.539\*\*\*    1.965\*\*\*    
  medium run                                                                                   

                      (0.075)       (0.068)       (0.069)        (0.069)        (0.075)        

  Covid-19            0.015         0.004         0.004          -0.002         -0.037\*\*\*   
  cases/100,000                                                                                

                      (0.009)       (0.009)       (0.009)        (0.009)        (0.012)        

                                                                                               

  No of observations  9,821         11,169        10,785         10,835         8,715          

  Number of           1,484         1,688         1,634          1,639          1,319          
  households                                                                                   

                      \(6\)         \(7\)         \(8\)          \(9\)                         

  Outcome variables:  Ate less than Ran out of    Went hungry    Went without                  
                      they thought  food          but did not    eating for a                  
                      they should                 eat            whole day                     

  First lockdown:     1.723\*\*\*   1.674\*\*\*   1.694\*\*\*    1.420\*\*\*                   
  short run                                                                                    

                      (0.085)       (0.104)       (0.103)        (0.142)                       

  First lockdown:     0.860\*\*\*   0.878\*\*\*   1.001\*\*\*    0.710\*\*\*                   
  medium run                                                                                   

                      (0.090)       (0.113)       (0.110)        (0.157)                       

  Second lockdown:    2.093\*\*\*   1.793\*\*\*   2.147\*\*\*    2.145\*\*\*                   
  medium run                                                                                   

                      (0.072)       (0.082)       (0.083)        (0.110)                       

  Covid-19            -0.025\*\*    -0.014        -0.041\*\*\*   -0.068\*\*\*                  
  cases/100,000                                                                                

                      (0.010)       (0.014)       (0.014)        (0.020)                       

                                                                                               

  No of observations  9,962         7,036         7,112          4,016                         

  Number of           1,509         1,063         1,076          603                           
  households                                                                                   

  Note: Linear Model                                                                           
  with household                                                                               
  fixed effects. All                                                                           
  dependent variables                                                                          
  are dummy                                                                                    
  variables. Standard                                                                          
  errors are in                                                                                
  parentheses. \*\*\*                                                                          
  indicates                                                                                    
  significance at 1%                                                                           
  level; \*\* at 5%;                                                                           
  \* at 10%.                                                                                   

                                                                                               
  -----------------------------------------------------------------------------------------------

*\
*

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

[^1]: One set of studies examines the impact of Covid-19 lockdowns on
    food insecurity (Agamile, 2022; Ceballos et al., 2020, 2021;
    Dasgupta & Robinson, 2021; Egger et al., 2022; Gaitán-Rossi et al.,
    2021; Giacoman et al., 2021; Hamadani et al., 2020; Harris et al.,
    2020; Headey et al., 2020; Jaacks et al., 2021; Kansiime et al.,
    2021; Kesar et al., 2021; Kundu et al., 2021; Lee, Kenneth et al.,
    2022; Nguyen et al., 2021). Another part of the literature examine
    the impact on income, employment, or agricultural production (Balde
    et al., 2020; Deshpande, 2020; Egger et al., 2022; Harris et al.,
    2020; Headey et al., 2020; Jaacks et al., 2021; Kang et al., 2021;
    Kesar et al., 2021; Komin et al., 2021; Rönkkö et al., 2022;
    Ruszczyk et al., 2021; Wild et al., 2021).

[^2]: Two studies examine the impact on income and employment using
    panel data. Results for Ghana show that lockdowns significantly
    decreased employment and earnings (Schotte et al., 2021). In rural
    Uganda, household income declined sharply during the initial
    lockdown. However, a year later, those without a business mostly
    recovered, while business-owning households still had significantly
    lower incomes (Mahmud & Riley, 2023).

[^3]: A linear model has two advantages over non-linear models, such as
    conditional logit, and has often been used in recent studies (Alam &
    Bose, 2020; Alam & Pörtner, 2018; Charles & DeCicca, 2008). First,
    coefficients are easier to interpret. Second, a linear model allows
    a more straightforward comparison of coefficients across regressions
    where some dependent variables are binary and some non-binary.
    Robustness checks, presented in Appendix Tables A1 show that
    conditional logit models lead to similar results.

[^4]: The advantage of using "Our World in Data" is that it collects
    available Covid-19 data from many sources. The data are available
    at <https://covid.ourworldindata.org/data/owid-covid-data.csv>, and
    a complete listing of underlying sources is
    at <https://github.com/owid/covid-19-data/tree/master/public/data/owid-covid-codebook.csv>.

[^5]: This means that any variable that does not change over time that
    are likely to influence our outcome variables would be controlled by
    the household fixed and would consequently drop out of the
    estimations.

[^6]: Each day of the week is scaled relative to a "baseline day," which
    is the median value from the five weeks, January 3 -- February 6,
    2020. Other mobility information, such as the number of visitors to
    groceries and pharmacies per day, are available but tend to be
    noisier and give similar results to our time at home measure.

[^7]: Households were also asked whether they received unemployment
    benefits, but there was only one observation representing a change,
    so we do not have any variation to conduct a conditional ordered
    logit estimation.

[^8]: As our point estimates are relative to non-lockdown periods, we
    present the mean of outcome variables in non-lockdown periods at the
    bottom of each column.

[^9]: While not focusing on lockdowns, one prior study, Gupta et al.
    (2021), finds evidence that the pandemic itself led to a switch in
    occupations, particularly among salaried and business persons, with
    agriculture seeing the biggest inflow of labor compared to other
    industries.

[^10]: We do not have income data for round 7 and thus cannot examine
    the medium-term impact of the second lockdown.

[^11]: For round 1, the survey asks about the employment industry before
    the lockdown, which allows us to identify whether individuals were
    employed in agriculture before the round 1 lockdown.

[^12]: The average non-lockdown mobility measure is around 10 percent
    over baseline and the first lockdown mobility measure is about 30.

[^13]: This pattern holds for both UNPS 2015/16 and UNPS 2019/20. The
    results for the individual surveys are available upon request. UNPS
    2018/19 shows the same questions in the questionnaire, but the
    responses are not available in the data.
