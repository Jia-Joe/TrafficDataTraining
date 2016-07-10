import numpy as np
#import pandas as pd
import scipy.io as sio
from math import fabs
from sklearn.ensemble import RandomForestRegressor
from sklearn.ensemble import GradientBoostingRegressor


if __name__ == '__main__':

	array=sio.loadmat('err.mat')['err']
	samples=[]
	labels=[]
	for i in range(66):
		sample=[]
		label=[]
		for j in range(21):
			for m in range(97):
				ls=[]
				ls.append(m)
				ls.append(m+1)
				ls.append(m+2)
				ls.append(array[i][j*100+m])
				ls.append(array[i][j*100+m+1])
				ls.append(array[i][j*100+m+2])
				sample.append(ls)
				label.append(array[i][j*100+m+3])
		samples.append(sample)	
		labels.append(label)
	samples=np.array(samples)
	labels=np.array(labels)
	print samples.shape, labels.shape
	print labels[0][0:97]
#	print samples
#	print labels
#	print array
	err_all=[]
	for i in range(66):
		err_dis=[]
		print labels[0][0:97]
		for j in range(0):
	#		model = RandomForestRegressor(random_state=0, n_estimators=200).fit(np.vstack((X_train[i][0:j*9],X_train[i][(j+1)*9:])),np.hstack((Y_train[i][0:j*9],Y_train[i][(j+1)*9:])))
			#print (np.vstack((samples[i][0:97*j],samples[i][(j+1)*97:])).shape,np.hstack((labels[i][0:j*97],labels[i][(j+1)*97:])).shape)
			#model = RandomForestRegressor(n_estimators=200).fit(np.vstack((samples[i][0:97*j],samples[i][(j+1)*97:])),np.hstack((labels[i][0:j*97],labels[i][(j+1)*97:])))
			#model = GradientBoostingRegressor(n_estimators=300,max_depth=1).fit(X_train[50][:2820],Y_train[50][:2820])
	#		y_testpre=model.predict(X_train[i][2820:])
			print labels[0][0:97]
			y_test=labels[i][j*97:(j+1)*97]
			#y_testpre=model.predict(samples[i][j*97:(j+1)*97])
			print  (y_test)
			#print  (y_testpre)
			error=0.0
			count=0
			'''
			for i in range(len(y_testpre)):
				if (y_test[i]>0):
					error=error+fabs(y_test[i]-y_testpre[i])/y_test[i]
					count=count+1
			if (count>0):
				err_dis.append(error/count)
		print err_dis
		print np.mean(np.array(err_dis))
		err_all.append(np.mean(np.array(err_dis)))	
	print err_all
	print np.mean(np.array(err_all))
'''
