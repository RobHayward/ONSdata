# Annotations for the series 
import requests
import pandas as pd
url = "http://dataservices.imf.org/REST/SDMX_JSON.svc/DataStructure/DOT"
dotstrut = requests.get(url).json()
df = pd.DataFrame(dotstrut['Structure']['KeyFamilies']['KeyFamily']
                  ['Annotations'])
for x in range(0, 7):
  items = (str(df['Annotation'][x]['AnnotationTitle']),
           str(df['Annotation'][x]['AnnotationText']['#text']))
print ': '.join(items)
