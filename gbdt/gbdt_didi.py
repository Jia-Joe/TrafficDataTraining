#!/usr/bin/python
'''
import os
os.chdir('f:/di____di/mix/')

import gbdt_didi as rpg
'''

import numpy as np
import matplotlib.pyplot as plt
import scipy.io as sio
from sklearn.ensemble import GradientBoostingRegressor

#import xgboost as xgb

def mape(yy,yy_hat):
	res = 0
	cnt = 0
	for i in range(len(yy)):
		if yy[i] <= 0:
			continue
		else:
			res = res + np.abs(np.double((yy[i]-yy_hat[i])))/np.double(yy[i])
			cnt = cnt + 1
	if cnt == 0:
		return -1000
	else:
		return res/cnt

def cal(X_train,y_train,X_test,y_test):
	#########GradientBoostingRegressor
	est = GradientBoostingRegressor(n_estimators=300, learning_rate=0.1,max_depth=1, random_state=0, loss='ls').fit(X_train, y_train.ravel())
	
	y_hat = est.predict(X_test)
	
	#########xgboost
#	dtrain = xgb.DMatrix(X_train,y_train)
#	dtest = xgb.DMatrix(X_test)
#	param = {'max_depth':2, 'eta':1, 'silent':1, 'objective':'reg:linear' }
#	num_round = 2
#	bst = xgb.train(param, dtrain, num_round)
	# make prediction
#	preds = bst.predict(dtest)
	
#	return (y_hat,preds)
	return y_hat	


if __name__ == '__main__':
	_X = sio.loadmat('X_train_gap.mat')
	_y = sio.loadmat('y_train_gap.mat')
	
	X = _X['X_train_gap']
	y = _y['y_train_gap']
	
	gbdt_list_all = []
	xgboost_list_all = []
	
	for s in range(5):
	
		gbdt_list = []
		xgboost_list = []

		for i in range(20):	
			X_train =np.vstack((X[s*141*20:s*141*20+i*141],X[s*141*20+(i+1)*141:(s+1)*141*20]))
			y_train =np.vstack((y[s*141*20:s*141*20+i*141],y[s*141*20+(i+1)*141:(s+1)*141*20]))
			X_test = X[s*141*20+i*141:s*141*20+(i+1)*141]
			y_test = y[s*141*20+i*141:s*141*20+(i+1)*141]
		#	print 'X.shpe : ' , X_train.shape
		#	print 'y.shape : ' , y_train.shape
			#y_gbdt,y_xgboost = cal(X_train,y_train,X_test,y_test)
			y_gbdt = cal(X_train,y_train,X_test,y_test)
		#	plt.figure(num=1, figsize=(8, 6))
			#print 'Test %d day:'%(i+1)
			#print 'GBDT MAPE: ' , mape(y_test.T[0],y_gbdt)
			#print 'xgboost MAPE: ' , mape(y_test.T[0],y_xgboost)
			
			#gbdt_list.append(mape(y_test.T[0],y_gbdt))
			gbdt_list_all=np.append(gbdt_list_all,y_gbdt)
			#xgboost_list.append(mape(y_test.T[0],y_xgboost))	
		print 'The %d strict:'%(s+1)		
		print 'gbdt mean:',np.mean(np.array(gbdt_list))
		#print 'xgboost mean:',np.mean(np.array(xgboost_list))
	np.savetxt('strange.csv', gbdt_list_all, delimiter = ',')








#	plt.plot(np.arange(0, 141, 1), y_test.T[0], 'r')
#	plt.plot(np.arange(0, 141, 1), y_hat, 'b')
#	plt.plot(np.arange(0, 141, 1), preds, 'g')

#	plt.show()
