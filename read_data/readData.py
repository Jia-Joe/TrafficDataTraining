import pandas as pd
import os
import  matplotlib.pyplot as plt 

# read data
order_data=pd.read_table('/home/jayn/citydata/season_1/training_data/order_data/order_data_2016-01-01',names=['order_id','driver_id','passenger_id','start_district_hash','dest_district_hash','Price','Time'],lineterminator='\n')
cluster_map=pd.read_table('/home/jayn/citydata/season_1/training_data/cluster_map/cluster_map',names=['district_hash','district_id'],lineterminator='\n')
#merge two dataFrames
order_data=pd.merge(order_data,cluster_map,right_on='district_hash',left_on='start_district_hash',how='left')



start_district_grouped=order_data.groupby(order_data['district_id'])

# get the number of order in every district
orderNumEveryDistrict=start_district_grouped.size() #the type of 	orderNumEveryDistrict is `pandas.core.series.Series`


#print orderNumEveryDistrict
orderNumEveryDistrict.plot()
plt.show()# show the plot






# trainDir = '../citydata/season_1/training_data'			#dir
# cluster_map = trainDir + '/cluster_map/cluster_map'		#file
# order_data = trainDir + '/order_data'					#dir
# poi_data = trainDir + '/poi_data/poi_data'				#file
# traffic_data = trainDir + '/traffic_data'				#dir
# weather_data = trainDir + '/weather_data'



# def readData(dir_path):
# 	if not os.path.isfile(dir_path) and not os.path.isdir(dir_path):
# 		return False	


# 	for fpath,dirs,fs in os.walk(dir_path):
# 		#cnt = 0
# 		for f in fs:
# 			print ('Now working on the file: ',f)
# 			dataFile=pd.read_table(os.path.join(fpath,f))
# 			fp = open()


