*______________________________________________________________________
*Fall 2018 Directed Study
*Sarah DeGiorgis
//Problem Set 1
//September 21, 2018

*----------------------------
  
* notes :  here could be notes

*----------------------------

cd
. copy https://drive.google.com/open?id=1pO8SPek6YCIKtfQ_l0fMHWWOsczZ_WE1 //why doesn't this work?
cd C:\Users\svd30.CAMDENLAW/Desktop/
use https://drive.google.com/open?id=1pO8SPek6YCIKtfQ_l0fMHWWOsczZ_WE1 //that didn't work either
//https://docs.google.com/uc?id=FILE_ID&export=download
use "https://docs.google.com/uc?id=1pO8SPek6YCIKtfQ_l0fMHWWOsczZ_WE1&export=download"//did not work
cd
use https://docs.google.com/uc?id=1pO8SPek6YCIKtfQ_l0fMHWWOsczZ_WE1&export=download, clear
*ok I can't figure out how to load from google drive so I'm just going to use the file on my computer

cd
ls //I can see that the file is there (PhillyProperties.csv)

version 15
set more off
sysdir
pwd //print working directory
cd C:\Users\SVD30~1.CAM\AppData\Local\Temp
mkdir directedStudy //I made a folder!
cd directedStudy
pwd
copy https://docs.google.com/uc?id=1pO8SPek6YCIKtfQ_l0fMHWWOsczZ_WE1&export=download, clear
*ok giving up on google drive for now
*so now my .csv file is in my directed study folder
insheet using PhillyProperties.csv, clear 
count //this is large
browse //just to see what I'm looking at - I see a lot of red text so I know that means they are strings.  No math with strings!
d 
sample 25
insheet using PhillyProperties.csv, clear
tab sale_price, mi
codebook sale_price
codebook market_value //to see how these fields are different
*means for these two fields are very different
generate price_difference =.// created new variable for price difference
cap drop price_difference
gen price_difference =.
replace price_difference=1 if sale_price==1//just for a test - I noticed a lot of the sale prices were 1
cap drop price_difference
recode sale_price (1 = 1) (>1 = 0), gen (price_difference)

version 15
set more off
sysdir
pwd //print working directory
copy https://www.dropbox.com/s/nwpks6be0oi12kk/PhillyProperties.zip ./
unzipfile PhillyProperties, replace
insheet using https://www.dropbox.com/s/82bdwennujfpc0o/PhillyProperties.csv
count //this is not the whole file - something happened
insheet https://www.dropbox.com/s/82bdwennujfpc0o/PhillyProperties.csv
insheet https://www.dropbox.com/s/nwpks6be0oi12kk/PhillyProperties.zip ./
copy https://www.dropbox.com/s/nwpks6be0oi12kk/PhillyProperties.zip ./ *this seems to work, now I just have to unzip
unzipfile PhillyProperties.zip, replace //keep getting error in opening zip file error
copy https://www.dropbox.com/s/82bdwennujfpc0o/PhillyProperties.csv //invalid file specification error - do I have to use insheet for .csv
insheet using https://www.dropbox.com/s/82bdwennujfpc0o/PhillyProperties.csv

copy https://www.dropbox.com/s/nwpks6be0oi12kk/PhillyProperties.zip ./
unzipfile PhillyProperties.zip, replace
insheet using https://www.dropbox.com/s/82bdwennujfpc0o/PhillyProperties.csv, clear
clear


