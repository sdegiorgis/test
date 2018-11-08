*Sarah DeGiorgis
*PS 4:  Graphics
*Directed Study
*November 8, 2018

*Notes!

version 15 
set more off  
pwd //to see where we are
insheet using https://raw.githubusercontent.com/sdegiorgis/test/master/NHPD%20Properties.csv, clear //this is a dataset of subsidized housing units in Philly from the National Housing Preservation Database
d //to see what we have
*zip code is a string and also some have the +4 ending, so I'm going to change them all into 5 digit integers
gen zip=substr(zipcode, 1, 5)//this gives me just the 5 digits and takes out the dashes
destring zip, gen(zipn)//to generate zipn, which is the zip code as numbers
drop zip //just dropping the string zip variable bc I don't need it anymore
edit //just checking...
twoway (bar totalunits zipn, sort), xlabel(#43, labsize(tiny)) //this is a bar graph of subsidized units in each zip code.  How do I get the x axis ticks to be every zip code?
tabulate zipn, sort //this is probably an easier way to see how many subsidized properties are in each zip code

insheet using https://raw.githubusercontent.com/sdegiorgis/test/master/Everything.csv, clear
*This is a dataset I created of house values (from ACS) and subsidized housing units (National Housing Preservation Database)
twoway (bar totalsubsidizedunits id2, fcolor(%50)) (bar totalhousingunits id2, fcolor(%50)), xscale(log) xlabel(minmax, labsize(tiny))
*Trying to see total housing units vs total subsidized units
