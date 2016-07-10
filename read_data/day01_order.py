from numpy.random import randn
import datetime
import matplotlib.pyplot as plt 
import pandas as pd

#read order_data & cluster_map_data
df=pd.read_table('order_data/order_data_2016-01-01',header=None,names=['order_id','driver_id','passenger_id','start_district_hash','dest_district_hash','Price','Time'])
clm=pd.read_table('cluster_map/cluster_map',header=None,names=['district_hash','district_id'])

#change to district ID
ldf=pd.merge(df,clm,how='left',left_on='start_district_hash',right_on='district_hash')
del ldf['district_hash']
del ldf['start_district_hash']
ldf.columns = ['order_id','driver_id','passenger_id','dest_district_hash','Price','Time','start_district']
lldf=pd.merge(ldf,clm,how='left',left_on='dest_district_hash',right_on='district_hash')
del lldf['district_hash']
del lldf['dest_district_hash']
lldf.columns = ['order_id','driver_id','passenger_id','Price','Time','start_district','dest_district']


sorted1=lldf.sort(['start_district','time_slice'])

gp=sorted1['order_id'].groupby(['start_district','time_slice'])

'''
#Too slow!
from dateutil.parser import parse
def timepiece(s):
	dt=parse(s)
	return dt.hour*6+dt.minute//10+1
'''	

#change to time_slice	
def time_slice(s):
	hms = s.split(' ')[1]
	hour = int(hms.split(':')[0])
	minute = int(hms.split(':')[1])	
	return hour*6+minute/10+1

order1['Time']=order1['Time'].map(time_slice)	
lldf.columns = ['order_id','driver_id','passenger_id','Price','time_slice','start_district','dest_district']

gp=sorted1['order_id'].groupby(['start_district','time_slice'])


cnt.columns[[start_district,time_slice],order_num]

we=cnt.unstack()
wa=we.fillna(0)

'''
import os
os.getcwd()

os.chdir('f:/di____di/season_1/training_data')
reed = pd.read_table('order_data/order_data_2016-01-08',header=None)

plt.show()
'''