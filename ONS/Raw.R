# http://mainlymacro.blogspot.co.uk/2013/12/some-notes-on-uk-recovery.html
# http://www.ons.gov.uk/ons/rel/naa2/quarterly-national-accounts/q3-2013/
#tsd-quarterly-national-accounts--q3-2013.html
# Change the data for latest data and re-name GDP
# Read annual data
da <- read.csv("Data/GDP.csv",header = TRUE, nrows = 65) 
plot(da$NRJS[40:80] ~ da[40:80,1], type = 'l', main = "Savings Ratio", 
xlab = "Time", ylab = "Ratio of Savings to Income")
# as an example of what can be done. 
dat <- as.ts(da, start = 1948, end = 2012, frequency = 1)
str(dat)
plot(dat[,2])
# Read quarterly data
dq <- read.csv("Data/GDP.csv",header = TRUE, 
skip = 93, nrows = 234) 
dqt <- as.ts(dq, start = c(1955,1), end = c(2013,3), frequency = 4)
head(dq[,1:3])
head(dqt[,1:3])
str(dqt)
plot.ts(dqt[,2])
# The time series property does not work. 
# Load the names
lab <- read.csv("Data/GDP.csv", skip = 332, 
                header = FALSE, stringsAsFactors = FALSE)
head(lab)
# extLab function will extract the information about the data from the code.
extLab <- function(name){
a <- which(lab[,1] == name)
a <- paste(lab[a,2], lab[a+1,2], lab[a+2,2], lab[a+3,2], lab[a+4,2], sep = ", ")
return(a)
}
extLab("ABMD")
# Now try to find code for the phrase.  First tried a code and pmatch but
# this does not yet work. 
#http://cran.r-project.org/web/packages/stringr/stringr.pdf
require(stringr)
name <- "savings"
extCod <- function(name){
a <- pmatch(name, lab[,2])
return(lab[a,])
}

extCod("Index")

name <- "Household"
pattern <- lab[,2]
a <- str_detect(name, ignore.case(pattern))
tail(pattern)
FUN <- str_detect(name, lab[,2])
sum(FUN)
