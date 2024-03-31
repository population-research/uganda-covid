---  
title: 'Response to Editor and Referee Comments — Impact of Twin Lockdowns on Hunger, 
        Labor Market Outcomes, and Household Coping Mechanisms: Evidence from Uganda'
date: March 2024
bibliography: ../paper/uganda_covid.bib
csl: the-quarterly-journal-of-economics.csl
link-citations: true
...

\doublespacing

Please find attached the revised version of our paper,
"Impact of Twin Lockdowns on Hunger, Labor Market Outcomes, and Household Coping 
Mechanisms: Evidence from Uganda."
We would like to thank the two referees and the editor for the very useful comments and
suggestions, which we believe have significantly improved the paper.

**Notable changes:**

1. To ease the interpretation of the results, to address the potential multiple comparisons
issues raised by Referee 1, and in response to Referee 1's comment on the measurement 
approach, we have revised our measures of food insecurity.
We now use three food insecurity measures: any, moderate or severe, and severe
food insecurity, based on the sum of the eight food insecurity questions.
"Any" corresponds to having answered yes to any of the questions, "moderate or severe" to 
having answered yes to 4 or more, and "severe" if answered yes to 7 or 8 questions.
These definitions are based on @FAO2015 and @FAO2016 and are discussed in the
Data section.


2. In response to the overall comments from both the editor and referees, we have 
substantially restructured the paper.
We now begin with a more in-depth examination of the lockdowns, which includes the
figure on the stringency measure, mobility measure, and COVID-19 deaths and cases.
This is followed by an analysis of the extent to which the lockdowns explain 
the changes in food insecurity.
We do this using a full set of survey indicator variables.
We also include the seasonality analyses, together with a new regional analysis 
and the attrition bounding exercise here.
After having examined the relationship between lockdowns and food insecurity, 
we analyze how households/individuals respond to the lockdowns.

3. We have updated the citations with both new papers and newer or published
versions of prior cited articles.

Below, we list our responses to individual comments and suggestions.

# Editor Comments

1. The paper is just reporting 3 out of a possible 7 survey round effects and
interpreting those as lockdown effects. I don’t understand that. Why not just
report all 7 survey round effects (graphically) and think of the paper as trying
to understand why the survey round effects vary.

    **Response:** We thank the editor for the suggestion and have updated all 
    estimations to include survey round indicators for each round.
    To ease interpretation with the larger number of dummies, we now present most 
    of the results graphically.
    Furthermore, in the Introduction, we have added a figure with the raw percentage 
    of households that report any, moderate to severe, and severe food insecurity 
    by survey round, and have recast the introductory paragraph to follow this suggestion.
    Finally, the paper has been rewritten accordingly.


2. What are the household fixed effects doing? In a world where the household’s
latent characteristics associated with food security are independent of what
survey round they are interviewed in, they would have no impact on the survey
round effects. Hence, the household fixed effects are meant to improve efficiency
or address sample selection issues. That should be explained and justified. I
don’t see a “bias” argument unless you have a sample selection problem, and I
cannot imagine that type of problem is time invariant.

    **Response:** In the absence of individual-level explanatory variables, it is 
    correct that the standard bias argument for fixed effects is less compelling.
    A prior version of our paper did include household-level explanatory variables, 
    and we failed to adequately rewrite the motivation for fixed effects when
    those variables were removed.
    
    However, there are three important remaining motivations for using fixed effects
    over pooled OLS here: the estimates are more conservative, estimates are more
    robust to measurement errors that vary systematically across individuals, 
    and allows us to easily control for time-invariant individual characteristics 
    that may affect food insecurity but which are difficult to capture well.
    We have rewritten the paper to reflect these arguments for fixed effects
    and provide more detail on each there.
    
    Finally, the standard Hausman test handily rejects the null for the basic 
    model with survey dummies and COVID-19 cases, for all three cumulative
    food insecurity outcomes, indicating that fixed effects models are 
    preferred to random effects models.
    

3. Beyond the survey effects, you have lockdown measures that depend on the
household’s survey date interacted with some disaggregated geography. These
results (in Tables 6 and 7) could be more fully exploited to help explain your
survey round effects. Namely, you could end up with “time to severe lockdown”,
“time from end of severe lockdown”, “in severe lockdown” and control for survey
round effects at the same time (depending on the distribution dates and
geographic heterogeneity, of course). I think this type of mediation style
analysis would be more informative than current Table 6 & 7 which I do not know
how to compare to earlier tables.

    **Response:**  The two measures of lockdown---stringency and the percentage
    change in time spent at residential---that we originally used varied only 
    temporally, not spatially. 
    Furthermore, none of the survey rounds took place during the two most severe 
    parts of the lockdowns.
    The implication of this is that the effect of time from severe lockdown 
    estimated interacted with survey indicators would only be identified by
    the variation within each survey round of when a household was surveyed.
    However, this temporal variation within each round is very limited.
    In addition, a concern with this approach is that, despite this being a 
    phone survey, each region did not have the same distribution of interview dates.
    
    However, we appreciate the difficulty of interpreting the results in Tables 
    6 and 7 compared to the other results and have restructured our analysis to 
    address these issues.
    First, we now discuss what can be learned about the degree of lockdown from
    the Google mobility data (see also our response below to R2, Suggestion 8)
    in the "Lockdown Context and Enforcement" section.
    Second, we present results for all rounds relative to Round 4 and discuss
    how far each survey round is from the lockdowns in the Estimation Strategy section. 
    Finally, we have added a new subsection that examines the differential
    impact of lockdowns across the regions and also discuss what can be learned about the 
    degrees of lockdown by region using regional Google mobility data 
    (See also our response to R2, Suggestion 9 below.)
    

4. Attrition is large. Is it correlated with food security? It seems like it
will be correlated with survey round. I think it might be useful to end with a
bounding exercise where you assume attriters are at extremes of the food
security distribution. Your end results would be insignificant, but the range of
your survey year effects with different assumptions on attrition would provide
the reader of a sense of how sensitive your analysis is to attrition. I feel
comfortable precommitting that your paper will not be rejected for attrition so
long as you are clear on how sensitive your results are to different assumptions
about attriters, even if the answer is "super sensitive".

    **Response:** We have added a discussion of this with a graph showing the national
    level food insecurity estimations for each of the three levels of food insecurity 
    assuming that all attrited households would have been food secure or 
    that all attrited households would have been food insecure. 
    Except for severe food insecurity in round 1 when we assume that 
    attrited households are food insecure, the results that were statistically 
    significant in the main model remain significant for the bounding exercise.



5. Why isn’t the 8th wave of the NPS used as the baseline? To me, that really
influences the interpretation of your counterfactuals to your survey round
effects. You don’t need to add this additional data, but you should explain to
your reader why you do not.

    **Response:** The only food security-related question in UNPS 2019/20 asks 
    whether there has been a situation in the last 12 months when there was not 
    enough food to feed the household, plus two follow-up questions about why
    and what months this occurred in.
    Unfortunately, this question does not align with any of the food insecurity
    questions asked in the phone survey.
    We now discuss in the subsection on Food Insecurity Measurement the differences
    across the surveys and why we cannot use the NPS as the baseline.
    See also our response to Referee 2 on the interpretation of the effects.
    

6. Cases (i,t). This is the number of national cases in the 30 days before the
survey date? What do we think of that as measure of local covid exposure?

    **Response:** It is certainly possible that there are systematic differences in 
    local COVID-19 exposure, but, unfortunately, we have been unable to identify any 
    data sources that could address regional differences in COVID-19 exposure.
    
    As discussed above, we now include an analysis of the regional variation 
    in food insecurity and discuss the role of potential differences 
    in COVID-19 cases across regions.
    Furthermore, we also examine regional lockdown behavior through the 
    regional Google Mobility data on visits to retail and recreation locations.
    See also our responses below to the last two suggestions from Referee 2.
    
    
7. Given the clustered survey design of the NPS, you should be clustering by PSU
throughout (probably only meaningful in the mediation analysis discussed above).

    **Response:** We have updated all estimations to use clustering by PSU 
    and clarified this in the Estimation Strategy section.


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

    **Response:** As we mention in the "Notable Changes" above, we have redone 
    our analysis to address this point by including survey round indicators for 
    all rounds.
    Furthermore, we have expanded the robustness analyses to include a
    regional analysis, which includes a discussion of potential differential
    enforcement of lockdowns across regions and how the main region affected
    by below-normal rainfall was the Western region.
    We have substantially expanded our discussion of our identification
    strategy and what we believe are its advantages in the Introduction and
    in the Estimation Strategy sections.
    
    We should also clarify that we originally overstated the extent and severity 
    of the dry period based on concurrent reports. 
    Since then rainfall data has become available covering that period and,
    while there are below-normal rainfalls in all four regions, it was relatively
    short-lived and mainly appeared to have substantially affected the Western 
    region.
    We discuss this in the Lockdown Context and Enforcement and in the regional
    Variation sections.
    

2. Second, and relatedly, the paper uses a fixed effects regression “to control for
unobservable household characteristics”. It would be helpful for the authors to
explain what including household- or individual-level fixed effects does when the
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

	**Response:** We have updated our discussion of why we use a fixed effects
	model. Please see our response to Editor Comment 2 above for more detail.

3. Third, as hinted at in the “Contribution” section of this report, it would be
useful for the paper to explain what additional points we learn from looking at
lockdowns in Uganda, compared to other places. Having two lockdowns is not
unusual in itself, and indeed happened in many countries, even in Sub-Saharan
Africa. Is there something particularly revealing about the Uganda case,
especially now the lockdowns in question are almost two years in the past?
Additionally, explaining how the Uganda lockdowns provide extra information on
aggregate shocks would be particularly important.

    **Response:** We have rewritten the Introduction to better motivate why 
    we examine the Uganda lockdowns, address our specific contribution, 
    and what sets our paper apart from the prior literature.
    Uganda had some of the strictest lockdowns, along with low numbers of
    COVID-19 cases, which allows us to identify the impact of the lockdown policy itself. 
    Understanding the costs and benefits of lockdowns will be particularly relevant for 
    future pandemic policies, as, unfortunately, all too well illustrated by
    the recent Ebola lockdown in parts of Uganda. 
    It also helps us understand the impact of an aggregate shock compared to
    idiosyncratic shocks. 
    Lastly, as the world’s poor are still trying to recover from the pandemic, 
    we believe that this analysis can provide important information on 
    household coping and their recovery. 
    

## Suggestions

A few smaller suggestions may also strengthen the paper.

1. The paper would benefit from explaining why it does not use the “raw score” –
potentially with some cutoff à la Wambogo et al. (2018, see
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6121128/) – to aggregate across the
FIES questions. Following Food and Agriculture Organization guidelines (see
https://www.fao.org/3/i4830e/i4830e.pdf) this would also depend on checking the
Rasch model infit statistics, to ensure it is valid. This would be slightly more
standard than just taking the maximum across the eight FIES questions.

    **Response:** We appreciate the suggestion, and, as mentioned above, we have 
    moved to the standard three-level measure of food insecurity based on this
    suggestion and the references. 
    This makes the explanation of our results and comparison with the prior literature 
    easier.
    It also implies that our new measures have already been checked with the Rasch 
    model infit statistics.


2. The paper at various points refers to “unemployment”. Unemployment has a very
clear definition, meaning someone who is not working (or not employed, more
accurately), who is actively searching, and who is available for
work/employment. If this is what the authors mean, then it would be helpful to
understand how those individuals out of the labor force are being treated in
these regressions. If not, a different term like “not employed” or “not working”
would be more accurate.

    **Response:** We did, indeed, use unemployment as short-hand for not working,
    even though the survey does allow for other reasons for not working than
    strict unemployment (such as lacking transport or not wanting to work
    because of fear of COVID-19 exposure).
    We have updated the paper throughout to use "not working" rather than unemployment.
    

3. The paper uses a multinomial logit approach to look at switches between labor
market statuses. This is an interesting approach, but it might be helpful to
complement this by looking at use transition matrices to better understand labor
market switches.

	**Response:** That is a great suggestion. 
	We have included a table showing the transition probabilities between 
	the three groups (working outside agriculture, working in agriculture, and not working).
	The table notes also show the pre-COVID-19 distribution across the three groups.
	Furthermore, we have added an Appendix Figure showing the unweighted
	absolute number of households in the three groups.
	Finally, we have expanded the discussion of movement between sectors using the 
	transition probabilities and the figure.

4. In Table 5 the paper is interacting the impact of lockdowns with a dummy
variable capturing whether the household was an agricultural household. It would
be helpful for the authors to explain how the paper avoids the critiques of
including interactions or doing sub-group comparisons in linear probability
models, as outlined in Holm et al. (2015, see
https://link.springer.com/article/10.1007/s11135-014-0057-0).

    **Response:** Thank you for drawing our attention to this paper.
    If we understand @Holm2015 correctly, their main concern is that testing
    for differences across groups using LPM results in a too high 
    probability of rejecting a true null of no differences across groups.
    We do not rely on or test differences across agricultural/non-agricultural 
    households but instead analyze the pattern of food insecurity within each group.
    Furthermore, we now present results using separate samples based on pre-COVID-19
    agricultural status, as explained below in our response to R2, Suggestion 6,
    and the results are similar across the separate samples and the interaction 
    models.
    Finally, for our new analysis of regional variation, we use separate samples 
    and do not test for differences across regions.
    

5. It would be useful for the authors to show how the results would be affected by
multiple hypothesis testing corrections, since there are many outcome variables
being considered. Alternatively, the authors should provide a qualitative
explanation of why this is not needed.

    **Response:** We now only use the three standard food insecurity levels,
    multiple comparison correction is less of a concern than when we had 9
    different food insecurity measures.
    If there are specific analyses where some type of correction would still be 
    helpful, we are, of course, open to including that.
    

# Referee 2 Comments


## Essential Points

1. The authors are actually comparing lockdowns to other periods during
COVID-19, as the data is first gathered in June 2020 (well after the first
lockdown initiated). This could be more clearly articulated earlier so that it
is not a surprise to the reader.

    I would also argue it is potentially a strength of the paper – the authors are
    holding COVID-19 (relatively) constant, and indeed cases are actually higher
    during some non-lockdown periods allowing them to look more precisely at
    lockdowns, as opposed to the disease. I would recommend the authors make this
    distinction clearer, as well as to discuss more explicitly which parts of the
    relevant literature are specifically able to focus on lockdowns vs. merely the
    aggregate effect of the pandemic and lockdowns.
    
    **Response:** We now clarify in the Introduction and in the 
    Estimation Strategy section that we are comparing 
    lockdowns to other periods during the pandemic with less severe lockdowns 
    and that with the low number of COVID-19 cases we can therefore identify the 
    effect of the lockdown separately from the spread of COVID-19.
    See also our response to Referee 1 (Essential Point 1), above.
        

2. It is not clear to me why reductions in paid work seems to be in the authors’
preferred channel. Based on Table 3, paid work is certainly decreasing, but so
is farm income and income from assets, remittances from within country,
assistance from non-family individuals, and assistance from NGOs. I would like
to see the authors better justify why they believe paid work specifically to be
the main pathway.

    In particular, Table 5 suggests that agricultural households saw no decrease in
    market work at all (comparing the coefficient on “First lockdown: short run” and
    “Ag household x First lockdown: short run”) yet still had roughly a 14pp
    increase in facing any food insecurity in that same period. This seems at odds
    with the authors’ primary explanation.
    
    **Response:** Thank you for bringing this to our attention. It was not
    our intention for paid work to be seen as the "preferred channel" through 
    which the lockdowns affected food insecurity.
    As you point out, income decreases across agricultural, non-farm,
    and wage employment.
    However, agricultural households do appear to suffer less from increases 
    in food insecurity, especially at the severe levels, than non-agricultural
    households.
    We have edited the abstract and the paper throughout to emphasize the
    overall reduction in income and transfers (although the estimates on
    transfers are noisier with the new estimation set-up and clustered standard 
    errors).

3. One point which is severely underdiscussed are the changes in household size.
There are increases in both adult and child members; how much of the results on
food insecurity could be explained by these changes? As well, even among those
not living at home, children would have been home considerably more during this
time period due to school closures from March 2020 through January 2022; since
many Ugandan children have lunch at school or attend boarding schools, these
changes may lead to significant increases in food security. It is unclear why
this channel is not considered a primary one.

    **Response:** Before we respond to the main question, we should point out 
    that the original number of household members estimations
    were difficult to interpret because they essentially estimated how the 
    lockdowns affected the *change* in number of members.
    With the move to using indicators for each round, we now directly
    estimating how the round indicators affect the number of members (total,
    adults, and children).
    One advantage of this, besides easier interpretation, is that we can use 
    pre-COVID-19 as the base/excluded period.
    
    The new results, indeed, show significant increases in the number of children 
    below 18 compared to pre-COVID-19, but little change in the number of adults 
    until after the second severe lockdown.
    One possible explanation for these results could certainly be the school 
    closures leading to children returning home from boarding schools.
    The concern about this explanation is that the number of household 
    members younger than 18 is increasing at an approximately uniform rate between 
    surveys until Round 4, rather than being associated with a substantial
    increase in connection with the first severe lockdowns and its associated
    school closures.
    
    Hence, while we agree completely that the increase compared to the pre-COVID-19 
    period likely contributed to raising the *base* level of food insecurity 
    compared to before COVID-19, we do not see the changes in the number of
    children as a primary channel through which the lockdowns increase 
    food insecurity.
    That the change in the number of children should drive the increase in
    food insecurity especially runs counter to what we observe for the 
    first severe lockdown; there are more children in Round 4 
    (our base level for the food insecurity estimations) than in Round 1.
    We have included an expanded discussion of this important point.

    Furthermore, unfortunately, we cannot establish whether the absence of 
    school lunches added to the level of food insecurity, but we now discuss 
    the possibility in the section.
    Clearly, the lack of school lunches may raise the base level of food 
    insecurity, as shown by @Abay2021 for Nigeria.
    It is, however, unlikely to drive the lockdown-related changes that
    we observe, as the schools were closed in all of the UHFS survey rounds
    and there is, therefore, no variation in school closures.
    

## Suggestions

4. How do the specific numeric estimations of food insecurity in this paper –
which seem to be based on fairly standard measures – compare to other papers in
the literature? The authors make specific comparisons to other household fixed
effects models, but not to the broader literature, or even to the subset of
literature that focuses on Uganda (Kansiime et al. focuses on Uganda; as does
Agamile (2022), who actually uses much of the same dataset). Is the 25 pp
estimate found by the authors large, small, or average relative to these papers?

    **Response:** Among the studies that try to provide causal evidence based on
    panel data, most do not find an impact on food insecurity. 
    The exception is @Amare2021, who found a 39 percentage-point increase 
    in moderate (skipping a meal) and an 11 percentage-point increase in severe food
    insecurity (going without eating a whole day).

    There were large variations among other studies. For example, for any kind
    of food insecurity, the impact varied between 13.1% [@Agamile2022] and 59%
    [@Nguyen2021a]. 
    For studies focusing on moderate security, the impact varied between 
    11.1% [@Agamile2022] and 53% [@Ceballos2021]. 
    For severe food insecurity, the impacts varied between null effects
    [@Gaitan-Rossi2021] and 16% [@Kansiime2021].

5. How much should we expect the household fixed effects to deal with in this
estimation? My main concern about omitted variable bias would be something like
“vulnerability.” Yet given the wide-ranging effects of the shock, many aspects
of vulnerability would likely be affected by COVID-19 and the lockdowns (income
diversification, availability of remittances, health, etc.). Others (land
quality, education of household head, etc.) would likely be absorbed by the fixed
effect. How different would the results be if the authors used an index of
economic vulnerability from the 2019/20 UNPS data instead of household fixed
effects? The authors argue in the set up that the use of household fixed effects
represents a meaningful contribution to the literature but are fairly mild in
their description of what the fixed effects achieve on page 9. More consistency
would be helpful.

    **Response:** As we discuss in our response to the Editor's 2nd comment,
    the absence of individual-level variables does remove one of the 
    usual arguments for using fixed effects.
    We have included a paragraph in the Estimation Strategy on why we still
    use household fixed effects.
    Furthermore, we have rewritten the discussion in the Introduction of our 
    contribution to ensure it is consistent with the rest of the paper.
    

6. On page 21, the authors note that they interact lockdown variables with
“whether the household was engaged in agricultural production in the prior
round.” This makes it very difficult to interpret Table 5; why not use engagement
in agricultural production from the 2019/20 UNPS data? At the least, I’d like to
see the authors justify making this variable dynamic in more specific detail.

    **Response:** To address this, we now use two different approaches.
    First, following the reviewer's suggestion, we use agricultural status from
    the UNPS 2019/20 data for our analysis.
    We split the sample into two and separately present results for households 
    that were in agriculture and those that were not in agriculture before COVID-19.
    Second, we show the results equivalent to the original table but with all 
    survey rounds, interacting households' agricultural status in the prior round 
    with survey indicators (in effect, allowing households to change status).
    We discuss the updated results in the Agricultural vs. Non-Agricultural Households
    section.

7. The authors’ choices about how to define short-run, medium-run and
non-lockdown are unclear. Based on Figure 1, it’s hard to understand why period
2 (August 2020) is medium-run, but period 3 (September 2020, one month later,
with the same stringency index and similar time spent at residence) is
considered non-lockdown. It would be helpful to see a clearer articulation of
these choices.

	**Response:** In response to this and the questions above, we have 
	redone the analyses so that they include all survey indicators.
	Furthermore, in the Estimation Strategy section, we now include a 
	detailed discussion of how long after the end of lockdowns each survey 
	occurred, which we hope will better motivate our choices. 
	

8. How good is Google Mobility data in Uganda? How disaggregated is it? Is there
good reason to think this data is accurate in rural areas? How many time periods
are there in the data, and how is the measure constructed (e.g., last thirty
days)? Based on Figure 1, it seems like the data (and much of the COVID-19) data
is national in scope; is this correct? A little more detail would be helpful.

	**Response:** The Google Mobility data provide daily information,
	both nationally and by the four regions in Uganda, on the
	change relative to the baseline for six different location types.
	The six location types are Retail and recreation, 
	Supermarkets and pharmacies, Parks, Public transport, 
	Workplaces, and Residential.
	
	The coverage varies depending on the location type and area.
	If there is an insufficient number to avoid privacy concerns or to meet
	Google's quality threshold, the date/location type combination will be 
	missing.
	Date/location type combinations can be missing from regional data, while
	still being available in the national data.
	
	As we discussed above, we removed the original Tables 6 and 7
	in response to the Editor's concern about the difficulty of comparing the
	results.
	Instead, we now discuss in detail the changes in the number of visitors to 
	retail and recreation locations in the Lockdown Context and Enforcement 
	section. 
	Furthermore, we use the same variable to examine the regional distribution
	of lockdown (see below).
	
	In terms of urban/rural differences in coverage, we now discuss the 
	differences in urbanization across the four regions in the section
	on Regional Variation. 
	Briefly, the Central region, home to Kampala, is the only region with
	any sizable urban centers; the fifth-largest center, Mbarara in the 
	Western region had fewer than 200,000 people at the last census.
	Despite this, there is enough coverage to allow us to say something about
	the degrees of lockdown by region when we use retail locations, which
	includes marketplaces.
	
	The mobility data is, indeed, more spotty in the more rural parts of the country.
	Originally, we used the time spent in residential locations, but that 
	suffers from almost no coverage in the Northern region and little 
	coverage around the first lockdown in the Eastern and Western regions.
	Visits to workplaces have high coverage for all regions, but we decided
	to use retail instead because it is unclear to what extent "visits to workplaces" would
	be relevant for more rural areas, while even more rural areas will have
	marketplaces and retail locations.
	
	We now show all mobility measures, both nationally and regionally, in 
	the Appendix. 
	For transit, Eastern is missing completely, while Northern is almost
	completely missing between survey rounds 6 and 7.
	For parks, Eastern is missing completely, while Northern is spotty 
	between 4 and 5 and between 6 and 7.
	For grocery/pharmacy, Northern is completely missing, while Eastern and 
	Western are very spotty throughout.
	

9. To the extent it is possible, it would be helpful to see more detail on
whether enforcement of lockdowns might have varied subnationally. I would expect
that it did (and in particular, that it might have been much less strictly
enforced in rural parts of Uganda).

	**Response:** To address this, we now include the Google Mobility 
	measure of the percentage changes in the number of visits to retail
	location relative to the baseline period.
	Lockdowns are, indeed, less strictly enforced in the more rural regions 
	than in the Central region judging from the percentage changes.
	However, the first lockdown is still clearly heavily enforced in those
	three regions.
	The pattern for the second lockdown enforcement is more mixed, but, as we describe 
	in the paper, there is still clear evidence of enforcement, even in more rural areas.

\clearpage
\onehalfspacing
# References {-}

