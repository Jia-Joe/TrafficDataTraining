import os
import string
import pandas as pd
import numpy as np
from pandas import Series,DataFrame

os.chdir('f:/di____di/season_1/training_data/poi_data')
df=pd.read_table('poi_data_count',header=None,error_bad_lines=False)
df=df.fillna('nx')
re=np.zeros([66,26])
mx=20
for x in range(0,66):
	for y in range(1,24):
		s=df.ix[x].ix[y]
		if(s!='nx'):
			tp=int(s.split(':')[0])
			if tp>mx:
				mx=tp
			re[x][tp]=int(s.split(':')[1])

			
df=pd.csv('ddf1.csv')