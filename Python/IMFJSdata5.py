import requests
import pandas as pd
url = 'http://dataservices.imf.org/REST/SDMX_JSON.svc/ CompactData/DOT/M.US.TXG_FOB_USD.W00?startPeriod=1981&endPeriod=2016'
data=requests.get(url).json()
usexp = pd.DataFrame(data['CompactData']['DataSet']['Series'] ['Obs'])
usexp.columns = ['status', 'usexports', 'date']; 
usexp.tail()
