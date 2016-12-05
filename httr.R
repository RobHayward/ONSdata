#httr case
library(httr)
r <- GET('http://dataservices/imf.org/REST/SDMX_JSON.svc/Dataflow')
r$status_code
status_code(r)
a <- content(r, 'parse')
headers(r)
str(r)
content(r, 'parse')
content(r, 'raw')
content(r, 'text')
r[[9]]
r$list
r2 <- GET('http://dataservices.imf.org/REST/SDMX_JSON.svc/DataStructure/DOT')
da <- content(r2, 'parse')

da[[1]][[6]][[1]][[2]][8]
# will give the frequency

da[[1]][[6]][[1]][[3]][[7]][[1]][1]
# Will give the country.  Chagne the last two positions to get the full name
# and the short code. 

da[[1]][[6]][[1]][[5]][[7]][1]
#This will give the other counterpart areas for trade.                         

da[[1]][[6]][[1]][[7]][[8]]
# will give the frequency

da[[1]][[7]][[1]][[7]][5]

DataflowMethod <- function(){
  r <- httr::GET('http://dataservices.imf.org/REST/SDMX_JSON.svc/Dataflow/')
  r.parsed <- jsonlite::fromJSON(httr::content(r, "text"))
  available.datasets <- r.parsed$Structure$Dataflows$Dataflow
  available.datasets.id <- available.datasets$KeyFamilyRef$KeyFamilyID
  available.datasets.text <- available.datasets$Name$`#text`
  available.db <- data.frame(
    DatabaseID = available.datasets.id,
    DatabaseText = available.datasets.text,
    stringsAsFactors = FALSE
  )
  return(available.db)
}




