'''
import sys
sys.path.append("f:/di____di/season_1/jzcode")
sys.path.append("f:/di____di/season_1/training_data/weather_data")

import readfile_order as rfo
'''
import os
import string
import pandas as pd
#import numpy as np
from pandas import Series,DataFrame

os.chdir('f:/di____di/season_1/training_data')
df=[];
def read_order():
	for fn in range(1,22):
		print fn
		df.append(pd.read_table('order_data/order_data_2016-01-'+filen2s(fn)),names=['order_id','driver_id','passenger_id','start_district_hash','dest_district_hash','Price','Time'])
	return df
	
def write_order():
	for fi in range(1,22):
		print fi
		df[fi-1].to_csv('outtest/myorder_'+filen2s(fi)+'.csv')	
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