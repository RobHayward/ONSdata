#This will use the IMFData package to get the required data
library(IMFData)
# The first part does not work but the datasets can be gathered from the IMF page
# http://data.imf.org There is also a list in the README for the package
# IFS is the database to be used initially.
availableDB <- DataflowMethod()
# This does not return anything.  Needs a fix. Check package page.
#-----------------------------------------------------------------
# This iwll get the codes that are available for the database
IFS.available.codes <- DataStructureMethod('IFS')
names(IFS.available.codes)
# Frequency, area and indicator.
IFS.available.codes[[1]]
head(IFS.available.codes[[2]])
tail(IFS.available.codes[[2]])
head(IFS.available.codes[[3]])
tail(IFS.available.codes[[3]])
#-----------------------------------
# Search for the code
CodeSearch(IFS.available.codes, 'CL_INDICATOR_IFS', 'Lending')
IFS.available.codes[[3]][1633,]
IFS.available.codes[[3]][1743,]
#----------------------------------
# Make API call to get the data
databaseID <- 'IFS'
startdate='1990-01-01'
enddate='2015-12-31'
checkquery = FALSE

queryfilter <- list(CL_FREA="", CL_AREA_IFS="RS",
                    CL_INDICATOR_IFS = 'FILR_PA')
RS.lending.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery)
RS.lending.query[,1:5]
RS.lending.query$Obs[[1]]
RS.lending.query$Obs[[2]]
RS.lending.query$Obs[[3]]
# Not sure why the data end in February 2004
queryfilter <- list(CL_FREA = "M", CL_AREA_IFS = c("RS", "DE"),
                    CL_INDICATOR_IFS = "FILR_PA")
Balk.lending.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate,
                                       checkquery)
Balk.lending.query[, 1:5]
Balk.lending.query$Obs[[2]]
#-------------------------------------------
# search for Euro code
CodeSearch(IFS.available.codes, 'CL_AREA_IFS', 'Euro')
countries <- c('RU', 'UA', 'RS', 'CS', 'BA', 'AL', 'GR', 'TR', 'HR', 'DE', 'U2', 'SI')
# Balkan countries and Germany
queryfilter <- list(CL_FREA = 'M', CL_AREA_IFS = countries, CL_INDICATOR_IFS = 'FILR_PA')
Balk.lending.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate,
                                        checkquery)
Balk.lending.query[, 1:5]
countries2 <- Balk.lending.query[1:10,2]
# this should remove the rather strange addition to Albanian data
Balk.lending.query[[6]][[2]][1]
# Create a dataframe with time element for all the data
#---------------------------------------------------------
# Does not work
library(zoo)
# for the as.yearmon function
data2 <- data.frame(seq.Date(from = as.Date('1990-01-01'), to = as.Date('2015-12-01'), 
                               by = 'month'))
colnames(data2) <- c('Date')
data2[,1] <- as.yearmon(data2[,1])
a <- Balk.lending.query[[6]][[4]]
colnames(a) <- c('Date', 'DE')
a$Date <- as.yearmon(a$Date, format = "%Y-%m")
a$DE <- as.numeric(a$DE)
data3 <- merge(data2, a, by = 'Date', all.x = TRUE)
str(data3)
head(data3)
tail(data3, 20)
# This now works.  Need to generalise and loop
# Can we turn into a function and apply? 
#---------------------------------------------------
# This is a prototype. It does not work yet. 
# This will change the nature of the returned query so that it has correct 
# dates and the figure are nueric.  
for(i in 1:length(countries2)){
  series <- countries2[[i]]
  colnames(Balk.lending.query[[6]][[i]]) <- c('Date', series)
  Balk.lending.query[[6]][[i]][,1]<- as.yearmon(Balk.lending.query[[6]][[i]]$Date, 
                                                format = '%Y-%m')
  Balk.lending.query[[6]][[i]][,2] <- as.numeric(Balk.lending.query[[6]][[i]][,2])
}
#Now I need to merge the data frames.    
# This is the answer.  Implemented below but does not work???????
# http://stackoverflow.com/questions/3365885/combining-vectors-of-unequal-length-into-a-data-frame                             
data2 <- data.frame(seq.Date(from = as.Date('1990-01-01'), to = as.Date('2015-12-01'), 
                               by = 'month'))
colnames(data2) <- c('Date')
data2[,1] <- as.yearmon(data2[,1])
for(i in 1:length(countries2)){
  data2 <- merge(data2, Balk.lending.query[[6]][[i]], by = 'Date', all.x = TRUE)
}
str(data2)
head(data2)
tail(data2)
write.csv(data2, './IMF/BalkLend.csv')

