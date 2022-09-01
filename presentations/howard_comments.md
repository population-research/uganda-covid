# Comment from Howard University 2022-08-31

These are mostly paraphrased from the seminar and with my own thoughts/questions added.

## Main comments

- What can we say about sample selection from UNPS to UHFS? How is that likely to
affect the results?

- Is the sample nationally representative and why do we not use the sample weights

- To assess the severity/effectiveness of the lockdowns you could use Google mobility
reports from Uganda (citations/arrests might also be an option but harder to get).

- How many change food insecurity over rounds? This is especially relevant since we use
LPM and Stata therefore does not automatically drop those who experience no changes and
they still contribute to N and therefore can lower the standard error.

- Some specification suggestions:
  - By head of household head's sex
  - By region (power might be an issue here)
  - By urban/rural
  
- Identification issue: how do you know that the increase in food insecurity is not a
direct effect of Covid infection in the individual household? Do we have information on
health outcomes/Covid infection at household level? [CCP: I did not answer this well
during the seminar. We do control for the number of cases overall so that will, at least
partly, address this. However, there might be more we can/should do with this.]

- The combination of lockdown indicator variables and round dummies really threw people
for a loop. One concern was the possibility of multicollinearity (which might inflate
the coefficients and significance). The other was what exactly this specification 
identified. Some suggestions for checking this:
  - Talk with Nick Huntington-Klein about the specification
  - Try without the round dummies to just capture the lockdown effects
  - Try season dummies to capture the hungry season. It does help that the surveys after 
  the lockdowns took place at different times, but there might still be an effect. 

- There might be spillovers between rounds in the effects. This is something we do not
currently address, but it *should* bias the effects of the lockdowns toward zero.


## Other questions

- We need some descriptive statistics to show how many respond in each round and
how many were parts of the original sample and how many are added later.

- Was there a mask mandate as part of the lockdowns or afterwards?

- Who answered the surveys (household head vs others) and were the interviews mostly done 
in one setting or had to be split up

- Can you do some type of 2SLS to examine the effect of declining market work on food
insecurity? [CCP: problem is the exclusion restriction since that requires that lockdowns
do not have an direct effect on food insecurity, except through market work. If, for
example, shops/markets are also closed that would invalidate this assumption.]