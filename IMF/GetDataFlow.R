require(jsonlite)
require(rjson)
base_url <- "http://dataservices.imf.org/REST/SDMX_JSON.svc/Dataflow/"
# this will depend on whether using rjson (as in this case) or jsonlite
# look at documentation.  Probably best to use jsonlite
myData<- fromJSON(file = base_url)
str(myData)

# now needs to have some way of extractoing the key names. 
myData[[1]][[6]][[1]][[1]][[6]][[2]]
myData[[1]][[6]][[1]][[1]][[1]]

# Changeing the last two will change the dataset and the info that is taken from it.
# 1 is the fist data set; [[6]][2]is the title 

myList <- data.frame(Name = rep(NA, 74), Code = rep(NA, 74))
for(i in 1:74){
  myList[i, 1] <- myData[[1]][[6]][[1]][[i]][[6]][[2]]
  myList[i, 2] <- myData[[1]][[6]][[1]][[i]][[1]]
}
head(myList)
  # myList contains the list of data.  Stage One

