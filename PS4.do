*Directed Study
*Sarah DeGiorgis
*Problem Set 4:  Graphics
*October 25, 2018

*Notes

version 15 
set more off  
pwd //to see where we are
insheet using https://raw.githubusercontent.com/sdegiorgis/test/master/ACSmortgage.csv, clear
edit //this is a dataset from ACS with total number of occupied units per zip code and mortgage characteristics
d //just taking a look
twoway (bar estimatetotal id2), ytitle(Number of Housing Units) xtitle(Zip Code) xlabel(#49, labels labsize(tiny) ticks) title(Total Number of Housing Units By Zip Code in Philadelphia) caption(Data from 2016 American Community Survey 5-Year Estimates) legend(on)
*above is just a graph of the number of housing units in each zip code.  How do I get rid of the zip codes with no housing units?  Or should I drop them from my dataset before graphing?
*Now I want to graph the total number of housing units and the number of housing units with a mortgage in each zip code
twoway (bar estimatetotal id2,sort) (bar estimatehousingunitswithamortgag id2,sort), ytitle(Number of Housing Units) xtitle(Zip Code) xlabel(#49, labels labsize(tiny) ticks) title(Total Number of Housing Units By Zip Code in Philadelphia) caption(Data from 2016 American Community Survey 5-Year Estimates) legend(on size(small)rows(2))
*okay this is generally what I wanted, going to try to make it look nicer
twoway (bar estimatetotal id2) (bar estimatehousingunitswithamortgag id2), ytitle(Number of Housing Units) xtitle(Zip Code) xlabel(#49, labels labsize(tiny) ticks) title(Total Number of Housing Units By Zip Code in Philadelphia) caption(Data from 2016 American Community Survey 5-Year Estimates) legend(on stack rows(2) rowgap(tiny) colgap(zero) keygap(tiny) size(tiny) margin(tiny) nobox linegap(tiny) region(lwidth(vvvthin)) title(Legend, size(small)))
*yeah, kinda - how do I make the legend smaller?
graph save Graph "\\acquisitions.rutgers.edu\redirection$\svd30\Desktop\HousingUnitsMortgageByZip.gph"(file \\acquisitions.rutgers.edu\redirection$\svd30\Desktop\HousingUnitsMortgageByZip.gph saved)

scatter estimatetotal estimatehousingunitswithamortgag, mlab(id2)
gr matrix est* v*, half
hist estimatetotal, percent
