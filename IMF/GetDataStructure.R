url <- http://dataservices.imf.org/REST/SDMX_JSON.svc/DataStructure/{database ID}
url <- "http://dataservices.imf.org/REST/SDMX_JSON.svc/DataStructure/DS-FSIRE"
url <- "http://dataservices.imf.org/REST/SDMX_JSON.svc/DataStructure/FAS"
base_url <- "http://dataservices.imf.org/REST/SDMX_JSON.svc/Dataflow/"
# this will depend on whether using rjson (as in this case) or jsonlite
# look at documentation.  Probably best to use jsonlite
myData<- fromJSON(file = url)
str(myData)

# the freequence (M, D, Q, B, Y)
myData[[1]][[6]][[1]][[2]]
# Countries 1C_ALLC seems to be all countries
# There are also the ISO Codes
# Running through each of these will move through countries by chainging final code
myData[[1]][[6]][[1]][[3]][[7]][2]
# This will take each of the coutnries 1 is clode AL, 2 is name Albania
myData[[1]][[6]][[1]][[3]][[7]][[2]][1]
# This just gives the code for series
myData[[1]][[6]][[1]][[4]][[7]][[1]][[1]]
# This gives the descrption of the data
myData[[1]][[6]][[1]][[4]][[7]][[1]][[2]][[2]]
myData[[1]][[6]][[1]][[4]][[7]][[1]][[2]][[2]]

url <- "http://dataservices.imf.org/REST/SDMX_JSON.svc/CompactData/FAS/A.FCLOFMH_XDC?StartPeriod=2000-01-01&endPeriod=2013-12-31"
  dimension1}+{item2 from dimension1}+{item N from dimension1}.{item1 from
    dimension2}+{item2 from dimension2}+{item M from dimension2}?startPeriod={start
      date}&endPeriod={end date}