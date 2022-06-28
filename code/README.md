# Code

## Data considerations

Below is a (incomplete) list of possible data concerns and notes about the
data. 
Some of these concerns have more detail provided in the code itself.

### Children's education

Round 1 asks about any children in school before Covid.

Rounds 2 and 3 have no information about education.

Round 4 asks by child in Section 5c, which is listed as 1c
in questionnaire.

Round 5 asks by child in Sections 1c/1d.

Round 6 asks by child in Section 5c, which is listed as 1c
in questionnaire. 

Round 7 asks by child in Section 1c.


### Agriculture - Crops/planting

Round 1 ask how the planting is progressing and changes due
to Covid in the same question. 
This is split into two questions in Round 2.

#### Round 3

There is a Section 5c on livestock in the questionnaire, but there is
no data available for this section (checked across all different formats).


#### Round 6 

`ag_crops_plant`, `ag_crops_grown_1`, `ag_crops_grown_2`,
and `ag_crops_grown_3` appear to have been pre-populated
from round 5 (or 4).



#### Round 7 - Section 6e 1

There is no option for being unable to acquire fertilizer as reason
for not growing crops in Round 7.
Presumably, this is subsumed into the other inputs category.
There is a new option, "Not a farmer," added instead.

Round 7 follows the skip pattern for sale of agricultural
products from round 3 on. 
The household is asked whether it normally sells any agricultural
products, including crops and livestock (`ag_farm_products_sell_normally`).
If no, the revenue, need to sell, able to sell, and where are all 
skipped. 