#IMF datapackage. 
# Get the 1 month, 3 month and exchange rate data 
# for Serbia, Croatia, Solvenia, Bosnia-Herzegovina, Montenegro, 
# and Albania from IFS
library('IMFData')
#availableDB <- DataflowMethod()
#Does not work currently but there is a list on the README. 
IFS.available.codes <- DataStructureMethod('IFS')
names(IFS.available.codes)
# Codes can be gathered from this
IFS.available.codes[[2]][["Yemen"]]
# Search for data codes
CodeSearch(IFS.available.codes, "CL_INDICATOR_IFS", "GDP")
databaseID <- "IFS"
startdate <- "2001-01-01"
enddate <- "2016-12-31"
checkquery <- FALSE
#========
queryfilter <- list(CL_FREA = "", CL_AREA_IFS = "GR", CL_INDICATOR_IFS = 
                      c("NGDP_EUR", "NGDP_XDC"))
GR.NGDP.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate, 
                                   checkquery)
GR.NGDP.query[, 1:5]
str(GR.NGDP.query)
GR.NGDP.query$Obs[[1]]
#=========================
queryfilter <- list(CL_FREA = 'Q', CL_AREA_IFS = "US", CL_INDICATOR_IFS = 
                      "NGDP_SA_AR_XDC")
Q.US.NGDP.query <- CompactDataMethod(databaseID, queryfilter, startdate, 
                                     enddate, checkquery)
Q.US.NGDP.query[,1:5]
Q.US.NGDP.query$Obs[[1]]
CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery, 
                  verbose = TRUE)$Obs[[1]]
head(CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery, 
                       tidy = TRUE))
