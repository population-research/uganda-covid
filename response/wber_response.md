---  
title: 'Response to Editor and Referee Comments — Impact of Twin Lockdowns on Hunger, 
        Labor Market Outcomes, and Household Coping Mechanisms: Evidence from Uganda'
date: January 2024
bibliography: uganda_covid.bib
csl: journal-of-development-economics.csl
link-citations: true
...

\doublespacing

Please find attached the revised version of our paper,
"Impact of Twin Lockdowns on Hunger, Labor Market Outcomes, and Household Coping 
Mechanisms: Evidence from Uganda."
We would like to thank the two referees and the editor for the very useful comments and
suggestions, which we believe have significantly improved the paper.

[Overall changes - and changes not asked for]

[reference our AJTMH paper; could use NPS 8th wave because there is a treatment consulting 
question—did we do that?]

[If we keep the estimation approach we should remove X_1 in eq 1. Currently we have no
other explanatory variables than lockdown dummies and number of cases.]



We list below our responses to the individual comments and suggestions.

# Editor Comments


1. The paper is just reporting 3 out of a possible 7 survey round effects and
interpreting those as lockdown effects. I don’t understand that. Why not just
report all 7 survey round effects (graphically) and think of the paper as trying
to understand why the survey round effects vary.


Graph of all 7 survey round and recast paper as trying to understand survey round effects

[We actually already did something along these lines for the seasonality analyses (Fig 2);
we could graph each of the food insecurity outcomes with shading for the lockdowns.

It would probably make sense to ignore the month of survey for now and just use the
period collected (either using the mid-point of the survey period or a line to indicate
level of food insecurity for the survey period)

Should we do this with household fixed effects and number of Covid cases controlled for
or simple proportions?]

2. What are the household ﬁxed effects doing? In a world where the household’s
latent characteristics associated with food security are independent of what
survey round they are interviewed in, they would have no impact on the survey
round effects. Hence, the household ﬁxed effects are meant to improve efﬁciency
or address sample selection issues. That should be explained and justiﬁed. I
don’t see a “bias” argument unless you have a sample selection problem, and I
cannot imagine that type of problem is time invariant.


We can think of a household's food insecurity status as described by
$$
Y_{i, t}  = \alpha + \beta X_{i, t} + \epsilon_{i, t}
$$

Each household has some underlying risk of food insecurity, which presumably vary over
seasons. 
However, we instead model this as an average food insecurity, which gives us
$$
Y_{i, t}  = \alpha + \beta X_{i, t} + \rho_{i} + \epsilon_{i, t}.
$$

Normally, the idea would be that $X_{i, t}$ is correlated with both $Y_{i, t}$ and 
$\rho_{i}$ and because $\rho_{i}$ is unobserved and, therefore, end up in the error
term, we end up with biased estimates of $\beta$. 
However, here we are interested in the effects of a variable that varies over time but
not over individuals, namely lockdown dummies.
Hence, what we estimate currently is
$$
Y_{i, t}  = \beta_1 L_{1} + \beta_2 L_{2} + \beta_3 L_{7}+ \rho_{i} + \beta_4 Cases_t + \epsilon_{i, t}.
$$
This means that our deviation from mean setup is
$$
(Y_{i, t} - \bar{Y}_{i})  = \beta_1 (L_{1} - \bar{L}_1) 
+ \beta_2 (L_{2} - \bar{L}_2) + \beta_3 (L_{7} - \bar{L}_7) 
+ \beta_4 (Cases_t - \bar{Cases})
+ \rho_{i} + \epsilon_{i, t}.
$$

[If a household drops out after, say 4, rounds then $\bar{L}_1$ will be 0.25. 
This means that for period one the difference to the mean will be 0.75, while the
difference to the mean for the remaining three periods will be -0.25.
Hence, there is always a 1 difference between the lockdown period and the non-lockdown
periods.
Is this how fixed effects help with bias from sample selection over time?]


[how binding is the lockdown and does that vary with unobservable, time-invariant 
characteristics, $\rho_{i}$?
If that is the case, that could be an argument for why we should use household fixed 
effects.]

3. Beyond the survey effects, you have lockdown measures that depend on the
household’s survey date interacted with some disaggregated geography. These
results (in Tables 6 and 7) could be more fully exploited to help explain your
survey round effects. Namely, you could end up with “time to severe lockdown”,
“time from end of severe lockdown”, “in severe lockdown” and control for survey
round effects at the same time (depending on the distribution dates and
geographic heterogeneity, of course). I think this type of mediation style
analysis would be more informative than current Table 6 & 7 which I do not know
how to compare to earlier tables.


4. Attrition is large. Is it correlated with food security? It seems like it
will be correlated with survey round. I think it might be useful to end with a
bounding exercise where you assume attriters are at extremes of the food
security distribution. Your end results would be insigniﬁcant, but the range of
your survey year effects with different assumptions on attrition would provide
the reader of a sense of how sensitive your analysis is to attrition. I feel
comfortable precommitting that your paper will not be rejected for attrition so
long as you are clear on how sensitive your results are to different assumptions
about attriters, even if the answer is "super sensitive".



5. Why isn’t the 8th wave of the NPS used as the baseline? To me, that really
inﬂuences the interpretation of your counterfactuals to your survey round
effects. You don’t need to add this additional data, but you should explain to
your reader why you do not.

The only food security related question in UNPS 2019/20 asks whether there have been a 
situation in the last 12 months when there was not enough food to feed the household.
If the household respond that there has been, there is a follow-up question about which 
months this happened and an open-ended question about why it happened.
The open-ended question about why is coded by the interviewer to match a pre-set list, 
allowing for multiple reasons. 
The "why?" question does not allow any indication of which responses corresponds to which
situations where there was not enough food. 

The reason we did not use the UNPS 2019/20 as the baseline was that this food security 
questions in UNPS 2019/20 differ from the ones asked in UHFS in four ways that would 
likely introduce substantial noice.
There are four main differences as described below.
Furthermore, as, mentioned by Referee 2, focusing on the survey rounds where we have
consistent measures of food insecurity, is a potential strength because it means that we 
can better isolate the effects of the lockdown, instead of conflating the effects of the 
pandemic with the effects of the lockdown.

First, there is no direct correspondance between the UNPS question and any of the UHFS 
questions.
Rather,if the respondent answered affirmatively to any of the five FIES questions, 
"had to skip a meal," "ate less than you thought you
should," "ran out of food," "hungry but did not eat," and "went without eating for 
a whole day,"
we would expect that they would also respond affirmatively to the UNPS question. 

Second, even though we might be able to create a combined answer that could potentially
match the UNPS question, the FIES conditions all questions on a lack of money or other 
resources.
For example, one FIES question asks whether the respondent, or any other adult in the 
household, had to skip a meal because there was not enough money or other resources to get 
food.
The UNPS question have a broader scope, which includes situations such as insecurity in 
reaching the market, the absence of food in the market, and floods.
Furthermore, as mentioned above, there is no way to match individual reasons with 
individual food insecurity events in the UNPS. 

Third, the UNPS asks about individual months, whereas the UHFS asks about the last 30 days 
before the interview, which, depending on when the survey took place does not line up 
with the month-centric question of the UNPS.

Finally, the UHFS questionnaire asks about respondent and other adults in the household,
rather than the entire household as in UNPS. 
As long as children are kept fed even in time of food insecurity, this should not
prevent comparison.
However, it is possible that food goes to the productive member of the household in 
order to preserve his or hers productivity [@Pitt1990].
In that case, the UNPS might well be higher than the UHFS data.

[Still need to find a place to change this in the paper; the current write-up here is too
long for including in the paper]

6. Cases (i,t). This is the number of national cases in the 30 days before the
survey date? What do we think of that as measure of local covid exposure?

It is certainly possible that there are systematic differences in local Covid exposure,
but, unfortunately, we have been unable to identify any external data sources that could 
address regional differences in Covid exposure and lockdown behavior (the exception is the 
regional differences for the Google mobility data discussed below).

While we normally think of cities as having a higher disease load than rural areas,
this might not hold in the case of Covid. 
Rather, large and poorer rural households may be more exposed to Covid infections,
especially if lockdowns are enforced in rural areas.
In the U.S. the rate of death has been substantially higher in rural than in urban areas,
although the United States is clearly an imperfect comparison.
Furthermore, people may be moving from urban to rural areas to "escape" increasing levels 
of Covid infections and bring with them to rural areas.

7. Given the clustered survey design of the NPS, you should be clustering by PSU
throughout (probably only meaningful in the mediation analysis discussed above).


# Referee 1 Comments

## Essential points

1. First, it is not clear how the paper is identifying the impact of Uganda’s
lockdowns. It appears that the identification strategy relies on the only
difference between survey waves being whether or not a lockdown was in place.
However, there are many other factors changing over these periods, only some of
which are addressed in the paper. The paper makes a good attempt to rule out the
impact of seasonality in the robustness checks (although this should come much
earlier, as it is essential for identification). However, many other factors are
changing over this period. In particular, the paper explicitly talks about the
concurrent drought “compounding” the effects of the second lockdown, but this
makes it difficult to know what is being captured by the coefficient on L_7 – is
this coefficient mainly capturing the drought or the second lockdown? There may
also be other confounding events including the Ugandan elections in 2021,
internet blackouts, the lockdown policies of other countries (especially as
remittances are an outcome variable), and so on. This is also especially
important because the survey waves (3, 4, 5, and 6) in the excluded category
contain a big mix of seasons. Other papers in the literature use identification
across space (such as different districts having different lockdown policies)
and time for identification. It would be important for the authors to address
this identification issue more directly.

2. Second, and relatedly, the paper uses a fixed effects regression “to control for
unobservable household characteristics”. It would be helpful for the authors to
explain what including household- or individuallevel fixed effects does when the
identification is based on comparing different points in time. Is this really
about controlling for differences in the sample composition between different
waves of the survey? Is this improving the efficiency of the estimates? Or is
there some other way in which this is helping? Looking at the descriptive
statistics in Table 1, it appears that the results mainly hinge on just
comparing the means between different survey waves, so it would be important to
explain how the fixed effects regressions are going beyond this. Similarly, it
would be helpful to understand how much the fixed effects are adding over and
above a simple OLS (perhaps through a Hausman test). If there is no clear answer
to this, then perhaps one idea for shortening the paper would be to frame it
more as conducting a descriptive exercise – well done descriptive statistics can
still be extremely useful. This would also alleviate some of the difficulties
including fixed effects in the multinomial/ordered logit models.

3. Third, as hinted at in the “Contribution” section of this report, it would be
useful for the paper to explain what additional points we learn from looking at
lockdowns in Uganda, compared to other places. Having two lockdowns is not
unusual in itself, and indeed happened in many countries, even in Sub-Saharan
Africa. Is there something particularly revealing about the Uganda case,
especially now the lockdowns in question are almost two years in the past?
Additionally, explaining how the Uganda lockdowns provide extra information on
aggregate shocks would be particularly important.

## Suggestions

A few smaller suggestions may also strengthen the paper.

The paper would benefit from explaining why it does not use the “raw score” –
potentially with some cutoff à la Wambogo et al. (2018, see
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6121128/) – to aggregate across the
FIES questions. Following Food and Agriculture Organization guidelines (see
https://www.fao.org/3/i4830e/i4830e.pdf) this would also depend on checking the
Rasch model infit statistics, to ensure it is valid. This would be slightly more
standard than just taking the maximum across the eights FIES questions.

The paper at various points refers to “unemployment”. Unemployment has a very
clear definition, meaning someone who is not working (or not employed, more
accurately), who is actively searching, and who is available for
work/employment. If this is what the authors mean, then it would be helpful to
understand how those individuals out of the labor force are being treated in
these regressions. If not, a different term like “not employed” or “not working”
would be more accurate.

The paper uses a multinomial logit approach to look at switches between labor
market statuses. This is an interesting approach, but it might be helpful to
complement this by looking at use transition matrices to better understand labor
market switches.

# Referee 2 Comments

1. Make it clearer what periods we are comparing lockdowns to and discuss whether prior
 literature compares aggregate effect or within-pandemic effects of Lockdowns

This is a well-taken point. 
We have updated the paper on page TK to highlight that we are comparing lockdowns to
other periods during the pandemic, rather than to pre-pandemic periods.

[see also response to E-5 on UNPS food insecurity questions]

## Essential Points

1. The authors are actually comparing lockdowns to other periods during
COVID-19, as the data is ﬁrst gathered in June 2020 (well after the ﬁrst
lockdown initiated). This could be more clearly articulated earlier so that it
is not a surprise to the reader.

I would also argue it is potentially a strength of the paper – the authors are
holding COVID-19 (relatively) constant, and indeed cases are actually higher
during some non-lockdown periods allowing them to look more precisely at
lockdowns, as opposed to the disease. I would recommend the authors make this
distinction clearer, as well as to discuss more explicitly which parts of the
relevant literature are speciﬁcally able to focus on lockdowns vs. merely the
aggregate effect of the pandemic and lockdowns.

2. It is not clear to me why reductions in paid work seems to be in the authors’
preferred channel. Based on Table 3, paid work is certainly decreasing, but so
is farm income and income from assets, remittances from within country,
assistance from non-family individuals, and assistance from NGOs. I would like
to see the authors better justify why they believe paid work speciﬁcally to be
the main pathway.

In particular, Table 5 suggests that agricultural households saw no decrease in
market work at all (comparing the coefﬁcient on “First lockdown: short run” and
“Ag household x First lockdown: short run”) yet still had roughly a 14pp
increase in facing any food insecurity in that same period. This seems at odds
with the authors’ primary explanation.

3. One point which is severely underdiscussed are the changes in household size.
There are increases in both adult and child members; how much of the results on
food insecurity could be explained by these changes? As well, even among those
not living at home, children would have been home considerably more during this
time period due to school closures from March 2020 through January 2022; since
many Ugandan children have lunch at school or attend boarding schools, these
changes may lead to signiﬁcant increases in food security. It is unclear why
this channel is not considered a primary one.

## Suggestions

4. How do the speciﬁc numeric estimations of food insecurity in this paper –
which seem to be based on fairly standard measures – compare to other papers in
the literature? The authors make speciﬁc comparisons to other household ﬁxed
effects models, but not to the broader literature, or even to the subset of
literature that focuses on Uganda (Kansiime et al. focuses on Uganda; as does
Agamile (2022), who actually uses much of the same dataset). Is the 25 pp
estimate found by the authors large, small, or average relative to these papers?

5. How much should we expect the household ﬁxed effects to deal with in this
estimation? My main concern about omitted variable bias would be something like
“vulnerability.” Yet given the wide-ranging effects of the shock, many aspects
of vulnerability would likely be affected by COVID-19 and the lockdowns (income
diversiﬁcation, availability of remittances, health, etc.). Others (land
quality, education of household head, etc.) would likely be absorbed by the ﬁxed
effect. How different would the results be if the authors used an index of
economic vulnerability from the 2019/20 UNPS data instead of household ﬁxed
effects? The authors argue in the set up that the use of household ﬁxed effects
represents a meaningful contribution to the literature but are fairly mild in
their description of what the ﬁxed effects achieve on page 9. More consistency
would be helpful.

6. On page 21, the authors note that they interact lockdown variables with
“whether the household was engaged in agricultural production in the prior
round.” This makes it very difﬁcult to interpret Table 5; why not use engagement
in agricultural production from the 2019/20 UNPS data? At the least, I’d like to
see the authors justify making this variable dynamic in more speciﬁc detail.

7. The authors’ choices about how to deﬁne short-run, medium-run and
non-lockdown are unclear. Based on Figure 1, it’s hard to understand why period
2 (August 2020) is medium-run, but period 3 (September 2020, one month later,
with the same stringency index and similar time spent at residence) is
considered non-lockdown. It would be helpful to see a clearer articulation of
these choices.

8. How good is Google Mobility data in Uganda? How disaggregated is it? Is there
good reason to think this data is accurate in rural areas? How many time periods
are there in the data, and how is the measure constructed (e.g., last thirty
days)? Based on Figure 1, it seems like the data (and much of the COVID-19) data
is national in scope; is this correct? A little more detail would be helpful.

9. To the extent it is possible, it would be helpful to see more detail on
whether enforcement of lockdowns might have varied subnationally. I would expect
that it did (and in particular, that it might have been much less strictly
enforced in rural parts of Uganda).



\clearpage
\onehalfspacing
# References {-}

