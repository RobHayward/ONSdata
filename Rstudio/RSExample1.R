# This is the exampel from the first RS video
install.packages('httr')
library('httr')
# www.ombdapi.com epi on the web
url <- "http://www.omdbapi.com/?t=frozen&y-2013&plot=short&r=json"
frozen <- GET(url)
frozen
details <- content(frozen, "parse")
details$Year
