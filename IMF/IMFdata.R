# This uses the IMFData package
require(IMFData)
# Find the availble datasets from IMF
# http://data.imf.org/?sk=388DFA60-1D26-4ADE-B505-A05A558D9A42&ss=1479329132316
IFS.available.codes <- DataStructureMethod('IFS')
# Available dimension code
names(IFS.available.codes)
# Possible code in the first dimension
IFS.available.codes[[1]] 
# Search code contains GDP
CodeSearch(IFS.available.codes, 'CL_INDICATOR_IFS', 'GDP') 
