*Directed Study
*Sarah DeGiorgis
*Problem Set 2:  Merging
*October 2, 2018

*Notes

version 15
set more off
insheet using https://raw.githubusercontent.com/sdegiorgis/test/master/PhillyParcelsSubsample.csv, clear
browse
insheet using http://data.phl.opendata.arcgis.com/datasets/b54ec5210cee41c3a884c9086f7af1be_0.csv, clear
insheet using http://data-phl.opendata.arcgis.com/datasets/b54ec5210cee41c3a884c9086f7af1be_0.csv, clear
*I realized that since I'm getting my data from opendataphilly it is all online anyway!  Above are the zip codes
insheet using https://raw.githubusercontent.com/sdegiorgis/test/master/PhillyParcelsSubsample.csv, clear
browse
insheet using https://beta.phila.gov/property/data/?resource=csv, clear //well that would have been really easy if that worked
//I'm going to take another subsample of my parcel data that includes zip code
pwd
ls
cd DirectedStudy
ls
insheet using PhillyPropertiesCleaned.csv, clear
browse
sample 20 //to get a subsample
browse //to take a look at the subsample
*I saved the subsample and uploaded it to Dropbox and made it public
use https://www.dropbox.com/s/8y87cpvv4wuwox4/subsampleparcels.dta?dl=0, clear
*Still says not allowed but I guess that's because I'm only able to share it via email on dropbox
*Going to try to zip it and upload to git
use  https://github.com/sdegiorgis/test/blob/master/subsampleparcels.zip, clear
*oops, have to unzip
copy https://github.com/sdegiorgis/test/blob/master/subsampleparcels.zip ./
unzipfile subsampleparcels.zip
*going to try to get a smaller subsample so I can upload to git without zipping
insheet using PhillyPropertiesCleaned.csv, clear
browse
sample 10 //to get a subsample - this should be a random sample of 10% of my data?
use https://github.com/sdegiorgis/test/raw/master/subsample10.dta, clear
browse //ok!  now I'm going to match on zip code
*First I need to clean up the zip codes in my subsample because they are zip+4 and I just want the 5 digit zip code
*So I can see that all the zip codes in my subsample are a string.  Also most are 9 characters but a few are only 5 and some have a hyphen before the +4
*I think I would like to recode so they're all 5 numbers
edit //gonna try to get the zip codes to just 5 characters
abbrev("zip_code", 5) //didn't work
codebook //so I can see zip_code is a string (str10)
usubstr("zip_code", 1, 5)//command not recognized
substr(zip_code, 1, 5)// command not recognized
gen zip=substr(zip_code, 1, 5) //did something...
edit //it worked!  there is one missing variable bc there was one missing zip_code in the subsample
*ok now I have my 5 digit zip codes
insheet using https://raw.githubusercontent.com/sdegiorgis/test/master/ACShousevalues.csv, clear
edit //so here is a dataset (ACS 2016 5-year estimates) for house values in each Philadelphia 5-digit zip code.  I'd like to get the mean valuation for each zip code and then merge this dataset with my other one on zip
describe
use https://github.com/sdegiorgis/test/raw/master/subsample10.dta, clear
 