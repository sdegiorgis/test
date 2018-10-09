*Directed Study
*Sarah DeGiorgis
*Problem Set 2:  Merging
*October 2, 2018

*Notes

version 15
set more off
use https://github.com/sdegiorgis/test/raw/master/subsample10.dta, clear
save subsample10, replace //saved this version w 5-digit zip code as a string

insheet using https://raw.githubusercontent.com/sdegiorgis/test/master/ACShousevalues.csv, clear
egen rowM=rowmean(estimatet*) //to give me a mean for each row - this is the mean value for each zip code
edit //just checking to make sure that worked
save ACShousevalues, replace

*I realized I probably need to make my zip codes in the subsample10 file numeric instead of strings
use subsample10, clear
edit //variable name is zip
destring zip, gen (zipn)//to generate a new variable, zipn, which is just zip but numeric
edit //gotta check...ok zipn is my zip codes and they are numeric!
save subsample10, replace //saved it with the new variable

*so now to merge!
use ACShousevalues, clear
edit //so this one has numeric 5-digit zip codes but I think the variable name has to be the same so I'm going to generate a new variable named "zipn" to match my other data
generate zipn = id2
edit //ok now I have zipn in this dataset
save ACShousevalues, replace

use subsample10, clear
merge m:1 zipn using ACShousevalues// I'm using m:1 since I have multiple instances of each zip code in the master dataset but only one of each zip code in the "using" set - correct?
// so 58,089 were matched, 4 were not matched, 2 from master and 2 from using
edit //it merged??
save subsample10, replace
