'''
from numpy.random import randn
import datetime
import matplotlib.pyplot as plt 
import pandas as pd
'''

'''
import sys
sys.path.append("f:/di____di/season_1/jzcode")
sys.path.append("f:/di____di/season_1/training_data/")

import get_weather_num as gwn

import os
os.chdir('f:/di____di/season_1/training_data/')
'''

import os
import string
import pandas as pd
#import numpy as np
from pandas import Series,DataFrame

def weather_num_loop():
	for ix in range(1,22):
		print ix
		get_weather_num(ix)
		
#change to time_slice	
def time_slice(s):
	hms = s.split(' ')[1]
	hour = int(hms.split(':')[0])
	minute = int(hms.split(':')[1])	
	return hour*6+minute/10+1
def filen2s(num):
	if(num<10):
		return '0'+str(num)
	else:
		return str(num)
		
def get_weather_num(fn):
	#read order_data & cluster_map_data
	df=pd.read_table('weather_data/weather_data_2016-01-'+filen2s(fn),header=None,names=['Time','Weather','temperature','PM2.5'])

	df['Time']=df['Time'].map(time_slice)	
	sdf=df.sort(['Time'])
	sdf.to_csv('t_weather_data/weather_data_2016-01-'+filen2s(fn)+'.csv',columns=['Time','Weather','temperature','PM2.5'],index=False)	
'''
#Too slow!
from dateutil.parser import parse
def timepiece(s):
	dt=parse(s)
	return dt.hour*6+dt.minute//10+1
'''	






'''
import os
os.getcwd()

os.chdir('f:/di____di/season_1/training_data')
reed = pd.read_table('order_data/order_data_2016-01-08',header=None)

plt.show()
'''