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


1. Why not just report all 7 survey round effects (graphically) and think of the paper 
as trying to understand why the survey round effects vary?


Graph of all 7 survey round and recast paper as trying to understand survey round effects

[We actually already did something along these lines for the seasonality analyses (Fig 2);
we could graph each of the food insecurity outcomes with shading for the lockdowns.

It would probably make sense to ignore the month of survey for now and just use the
period collected (either using the mid-point of the survey period or a line to indicate
level of food insecurity for the survey period)

Should we do this with household fixed effects and number of Covid cases controlled for
or simple proportions?]

2. What are the household fixed effects doing?


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

3. Use mediation analysis to explain lockdown effects instead of Tables 6 and 7




5. Why isn't the 8th wave of the NPS used as the baseline?

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

6. What do we think of the national cases in the 30 days before the survey date as a 
measure of local covid exposure?

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



# Referee 1 Comments


# Referee 2 Comments

1. Make it clearer what periods we are comparing lockdowns to and discuss whether prior
 literature compares aggregate effect or within-pandemic effects of Lockdowns

This is a well-taken point. 
We have updated the paper on page TK to highlight that we are comparing lockdowns to
other periods during the pandemic, rather than to pre-pandemic periods.

[see also response to E-5 on UNPS food insecurity questions]




\clearpage
\onehalfspacing
# References {-}

