## Find er data
library(IMFData)
IFS.available.codes <- DataStructureMethod('IFS')
#-----------------------------------
# Search for the code
CodeSearch(IFS.available.codes, 'CL_INDICATOR_IFS', 'lending')
#----------------------------------
databaseID <- 'IFS'
startdate='1990-01-01'
enddate='2015-12-31'
checkquery = FALSE
countries <- c('RU', 'UA', 'RS', 'CS', 'BA', 'AL', 'GR', 'TR', 'HR', 'DE', 'U2', 'SI')
indicators <- c('FILR_PA', 'ENDA_XDC_USD_RATE')
queryfilter <- list(CL_FREA = 'M', CL_AREA_IFS = countries, CL_INDICATOR_IFS = indicators)
Balk.er.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate,
                                        checkquery)
# check what you have
Balk.er.query[, 1:5]
str(Balk.er.query)
countries2 <- Balk.er.query[,2]
# This will change the nature of the returned query so that it has correct 
# dates, correct headings and the figures are numeric.  
library(zoo)
for(i in 1:length(countries2)){
  series <- countries2[[i]]
  colnames(Balk.er.query[[6]][[i]]) <- c('Date', series)
  Balk.er.query[[6]][[i]][,1]<- as.yearmon(Balk.er.query[[6]][[i]]$Date, 
                                                format = '%Y-%m')
  Balk.er.query[[6]][[i]][,2] <- as.numeric(Balk.er.query[[6]][[i]][,2])
}
#Now I need to merge the data frames.    
# This is the answer.  Implemented below but does not work???????
# http://stackoverflow.com/questions/3365885/combining-vectors-of-unequal-length-into-a-data-frame                             
data2 <- data.frame(seq.Date(from = as.Date('1990-01-01'), to = as.Date('2015-12-01'), 
                               by = 'month'))
colnames(data2) <- c('Date')
data2[,1] <- as.yearmon(data2[,1])
for(i in 1:length(countries2)){
  data2 <- merge(data2, Balk.er.query[[6]][[i]], by = 'Date', all.x = TRUE)
}

write.csv(data2, './IMF/BalkLendtemp2.csv')
colnames(data2) <- gsub('x','LR', colnames(data2))
colnames(data2) <- gsub('y', 'ER', colnames(data2))
str(data2)
head(data2)
tail(data2)
