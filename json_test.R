require(jsonlite)
require(rjson)
json_file <- http://dataservices.imf.org/REST/SDMX_JSON.svc/Dataflow/
json_data <- fromJSON(json_file)
str(json_data)

# now needs to have some way of extractoing the key names. 