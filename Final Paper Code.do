*Sarah DeGiorgis
*Directed Study Fall 2018
*Final Paper Code:  Final Project
*December 12, 2018

version 15
set more off
insheet using https://raw.githubusercontent.com/sdegiorgis/DirectedStudy/Data/Percent%20Grad%20Degree%20by%20Census%20Tract.csv, clear
destring percentgraddegree, gen (percent16) force //forced it because there were some nonnumeric characters I didn't care about
destring v9, gen (percent15) force
destring v11, gen (percent14) force
destring v13, gen (percent13) force
destring v15, gen (percent12) force
destring v17, gen (percent11) force
destring v19, gen (percent10) force
drop percentgraddegree v9 v11 v13 v15 v17 v19 //dropping string versions of percentages
generate tract = id2-42100000000 //cleaning up tract numbers
generate change = percent16-percent10 //generating a variable for change from 2010 to 2016
split geography, p(,) //just splitting this so I can label the graph nicely
twoway (scatter change rank16 if rank16 < 22, mlabel(geography1) mlabsize(tiny)), yline(0) xlabel(minmax) //graph showing change from 2010 to 2016, added a line at 0
