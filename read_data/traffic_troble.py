'''
from numpy.random import randn
import datetime
import matplotlib.pyplot as plt 
import pandas as pd
'''

'''
Add this!
df.index_col=['district_id','tj_time']
import sys
sys.path.append("f:/di____di/season_1/jzcode")
sys.path.append("f:/di____di/season_1/training_data/")

import get_traffic_num as gtn

import os
os.chdir('f:/di____di/season_1/gbdt')
'''



import os
import string
import pandas as pd
#import numpy as np
from pandas import Series,DataFrame

def traffic_num_loop():
	for ix in range(22,31,2):
		print ix
		get_traffic_num(ix)

#os.chdir('f:/di____di/season_1/training_data')	

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
def traffic_lev(s):
	return int(s.split(':')[1])

def traffic_num_loop():
	for ix in range(1,22):
		print ix
		get_traffic_num(ix)

def get_traffic_num(fn):		
	df=pd.read_table('traffic_data/traffic_data_2016-01-'+filen2s(fn),header=None,names=['district_hash','tj_level1','tj_level2','tj_level3','tj_level4','tj_time'])	
	clm=pd.read_table('cluster_map/cluster_map',header=None,names=['district_hash','district_id'])

	#change to district ID
	ldf=pd.merge(df,clm,how='left')
	del ldf['district_hash']
	ldf['tj_ime']=ldf['tj_time'].map(time_slice)		
	sdf=sorted=ldf.sort(['district_id','tj_time'])
	sdf['tj_level1']=sdf['tj_level1'].map(traffic_lev)
	sdf['tj_level2']=sdf['tj_level2'].map(traffic_lev)
	sdf['tj_level3']=sdf['tj_level3'].map(traffic_lev)
	sdf['tj_level4']=sdf['tj_level4'].map(traffic_lev)
	sdf.columns = ['tj_level1','tj_level2','tj_level3','tj_level4','tj_time','district_id','tj_time_slice']
	sdf.to_csv('traffic_num_data/traffic_num_data_2016-01-'+filen2s(fn)+'.csv',columns=['district_id','tj_time_slice','tj_level1','tj_level2','tj_level3','tj_level4'],index=False);


'''		
def get_order_num(fn):
	#read order_data & cluster_map_data
	df=pd.read_table('order_data/order_data_2016-01-'+filen2s(fn)+'_test',header=None,names=['order_id','driver_id','passenger_id','start_district_hash','dest_district_hash','Price','Time'])
	#df=pd.read_table('order_data/order_data_2016-01-02',header=None,names=['order_id','driver_id','passenger_id','start_district_hash','dest_district_hash','Price','Time'])
	clm=pd.read_table('cluster_map/cluster_map',header=None,names=['district_hash','district_id'])

	#change to district ID
	ldf=pd.merge(df,clm,how='left',left_on='start_district_hash',right_on='district_hash')
	del ldf['district_hash']
	del ldf['start_district_hash']
	ldf.columns = ['order_id','driver_id','passenger_id','dest_district_hash','Price','Time','start_district']
	lldf=pd.merge(ldf,clm,how='left',left_on='dest_district_hash',right_on='district_hash')
	del lldf['district_hash']
	del lldf['dest_district_hash']


	lldf['Time']=lldf['Time'].map(time_slice)	
	lldf.columns = ['order_id','driver_id','passenger_id','Price','time_slice','start_district','dest_district']
	sorted=lldf.sort(['start_district','time_slice'])



	gb=sorted['order_id'].groupby(by=[sorted['start_district'],sorted['time_slice']])
	gp=sorted['driver_id'].groupby(by=[sorted['start_district'],sorted['time_slice']])
	cntr=gb.count()
	cntp=gp.count()
	gap=cntr-cntp
	
	we=cntr.unstack()
	wa=we.fillna(-1000)
	wa.to_csv('num_order_data/order_num_2016-01-'+filen2s(fn)+'_test.csv')
	
	wrc=cntp.unstack()
	wrcr=wrc.fillna(-1000)
	wrcr.to_csv('num_recv_data/recv_num_2016-01-'+filen2s(fn)+'_test.csv')
	
	wpc=gap.unstack()
	wpcr=wpc.fillna(-1000)
	wpcr.to_csv('num_gap_data/gap_num_2016-01-'+filen2s(fn)+'_test.csv')
'''	
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