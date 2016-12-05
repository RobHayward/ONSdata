# https://briandew.wordpress.com/2016/05/01/machine-reading-imf-data#-data-retrieval-with-python/

# find the series id and text name
# import libraries
import requests
import pandas as pd

url = 'http://dataservices.imf.org/REST/SDMX_JSON.svc/Dataflow/'
seriesids = requests.get(url).json()
df = pd.DataFrame(seriesids['Structure']['Dataflows']['Dataflow'])
for x in range(6, 13):
     items = (str(df['@id'][x]), str(df['Name'][x]['#text']))
     print ': '.join(items)
