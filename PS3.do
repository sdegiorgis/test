*Directed Study
*Sarah DeGiorgis
*Problem Set 3:  More Merging
*October 9, 2018

*Notes

version 15 
set more off  
pwd //to see where we are

*First I need to clean up my dataset that I merged last time bc it has a lot of things I don't need on it
use subsample10, clear
save subsample10merged, replace //this is the dataset I merged in PS2
*I just wanted to rename that, but now I want to use my unmerged subsample dataset

use https://github.com/sdegiorgis/test/raw/master/subsample10.dta, clear
edit
drop building_code category_code garage_spaces garage_type mailing* //getting rid of some variables I don't need
gen zip=substr(zip_code, 1, 5) //to get 5 digit zip code
*One missing value bc one was missing in the original dataset
edit //to take a look - I've created a variable "zip" which is just the first five digits of zip_code
destring zip, gen (zip5) //to generate a new variable, zip5, which is just zip but not stored as a string
edit
drop zip //don't need that string zip anymore but I probably could have done this in one step?
edit
save subsample10, replace //saved this version

use https://github.com/sdegiorgis/test/raw/master/subsample10clean.dta, clear
edit
save subsample10clean, replace //did I need to do this?

insheet using https://raw.githubusercontent.com/sdegiorgis/test/master/ACSownerrenter.csv, clear
edit //making sure it's the right one
rename id2 zip5 //renaming the zip code variable so I can merge
save ACSownerrenter, replace

*Merge 1*

use subsample10clean, clear
merge m:1 zip5 using ACSownerrenter //again using many to one.  merged!
l zip5 if _merge~=3
drop if _merge==2 //drop ifsay we dont need them bc they dont match the core

drop _merge

save merged1, replace //saving this version to merge more to

*Merge 2*

insheet using https://raw.githubusercontent.com/sdegiorgis/test/master/ACSdemographics.csv, clear
rename id2 zip5 //again renaming so the variables have the same name
edit //to check.  Looks like my column names (from ACS) are too long.  Is it easier to change this in excel or stata?
save ACSdemographics, replace

use merged1, clear
merge m:1 zip5 using ACSdemographics, gen(merge2) //error because I already have a variable named "merge" from the last merge!  oops
save merged2, replace

*Merge 3*

insheet using https://raw.githubusercontent.com/sdegiorgis/test/master/ACSmortgage.csv, clear
rename id2 zip5
edit
save ACSmortgage, replace

use merged2, clear
ren * sarah_*


merge m:1 zip5 using ACSmortgage, gen(merge3) //telling it to name the new variable something other than _merge (default)
*ok I thought it would only merge on zip5 but apparently because I have two v5 variables it is trying to merge those too?
