'''
import sys
sys.path.append("f:/di____di/season_1/jzcode")
sys.path.append("f:/di____di/season_1/training_data/weather_data")

import readfilepath_weather as rf
'''
import os
import string
import pandas as pd
#import numpy as np
from pandas import Series,DataFrame

os.chdir('f:/di____di/season_1/training_data')
df=[];
def read_weather():
	for fn in range(1,5):
		print fn
		df.append(pd.read_table('weather_data/weather_data_2016-01-'+filen2s(fn),header=None,names=['Time','Weather','temperature','PM2.5']))
	return df
	
def write_weather():
	for fn in range(1,5):
		print fn
		pd.read_table('weather_data/weather_data_2016-01-'+filen2s(fn),header=None,names=['Time','Weather','temperature','PM2.5']))
	return df	
'''
import os
import pandas as pd
os.chdir('f:/di____di/season_1/training_data/weather_data')

df=pd.read_table('weather_data_2016-01-01',index_col=['Time','Weather','temperature','PM2.5'])
'''
def filen2s(num):
	if(num<10):
		return '0'+str(num)
	else:
		return str(num)