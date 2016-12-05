#L ok at structure of DOTS data to find the dimensions for our data request
import requests
import pandas as pd
url = "http://dataservices.imf.org/REST/SDMX_JSON.svc/DataStructure/DOT"
dotstruct = requests.get(url).json()
df = pd.DataFrame(dotstruct['Structure']['KeyFamilies']['KeyFamily']\
          ['Components']['Dimension'])
for x in range(0, 4): 
     items = ("Dimension", str(x+1), str(df['@codelist'][x]))
     print ': '.join(items)
