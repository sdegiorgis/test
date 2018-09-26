*______________________________________________________________________
*Fall 2018 Directed Study
*Sarah DeGiorgis
//Problem Set 1
//September 21, 2018

*----------------------------
  
* notes :  here could be notes

*----------------------------

cd
copy https://drive.google.com/open?id=1pO8SPek6YCIKtfQ_l0fMHWWOsczZ_WE1 . //why doesn't this work?
//drop the dot from the beginning and add at the end, and adjust path like explained in ps dierections 
//to something like
copy "https://drive.google.com/uc?export=download&id=1pO8SPek6YCIKtfQ_l0fMHWWOsczZ_WE1" .
//still, in this particular case it doesnt work,possibly because file is big and google complains it cannot scan it for viruses
//so i'd use a smaller file or zip it and unzip in stata https://blog.stata.com/tag/unzip/
//or use different service like dropbox.com, wordpress.com etc


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


