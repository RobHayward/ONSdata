# http://mainlymacro.blogspot.co.uk/2013/12/some-notes-on-uk-recovery.html
# http://www.ons.gov.uk/ons/rel/naa2/quarterly-national-accounts/q3-2013/
#tsd-quarterly-national-accounts--q3-2013.html
# Change the data for latest data and re-name GDP
# Read annual data
da <- read.csv("C:/Users/Toshiba/Desktop/GDP.csv ",header = TRUE, nrows = 65) 
plot(da$NRJS[40:80] ~ da[40:80,1], type = 'l', main = "Savings Ratio", 
xlab = "Time", ylab = "Ratio of Savings to Income")
# as an example of what can be done. 
dat <- as.ts(da, start = 1948, end = 2012, frequency = 1)
str(dat)
plot(dat[,2])
# Read quarterly data
dq <- read.csv("C:/Users/Toshiba/Desktop/GDP.csv ",header = TRUE, 
skip = 93, nrows = 234) 
dqt <- as.ts(dq, start = c(1955,1), end = c(2013,3), frequency = 4)
head(dq[,1:3])
head(dqt[,1:3])
str(dqt)
plot.ts(dqt[,2])
# The time series property does not work. 
# Load the names
lab <- read.csv("C:/Users/Toshiba/Desktop/GDP.csv ", skip = 332, header = FALSE)
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
name <- "saving"
extCod <- function(name){
a <- pmatch(name, lab[,2])
which(lab[,2] == name)
a <- lab[a,]
class(lab[,2])
return(a)
}
a
name
extCod("savings")
pmatch("", "")                             # returns NA
pmatch("m",   c("mean", "median", "mode")) # returns NA
pmatch("med", c("mean", "median", "mode")) # returns 2

pmatch(c("", "ab", "ab"), c("abc", "ab"), dup = FALSE)
pmatch(c("", "ab", "ab"), c("abc", "ab"), dup = TRUE)
## compare
charmatch(c("", "ab", "ab"), c("abc", "ab"))
?as.string
?subset