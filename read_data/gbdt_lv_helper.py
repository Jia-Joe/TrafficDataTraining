#!/usr/bin/python
'''
import os
os.chdir('f:/di____di/out_data/')

import gbdt_predict as rpg
'''

import numpy as np
import matplotlib.pyplot as plt
import scipy.io as sio
from sklearn.ensemble import GradientBoostingRegressor

#9 26 31


lv1=np.array([1, 7, 8, 12, 23, 28, 37, 48, 51])
lv2=np.array([2,4,6,9,11,13,14,18,19,20,21,22,24,26,27,25,29,35,38,42,46,53,54,57,64,66])
lv3=[]

lv12=np.hstack((lv1,lv2))
for i in range(1,67):
	if not(lv12==i).any():
		lv3.append(i)
lv3=np.array(lv3)	
	
print ("He is %d years %d old"%(a,a))






	
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

def cal(X_train,y_train,X_test):
	#########GradientBoostingRegressor
	est = GradientBoostingRegressor(n_estimators=300, learning_rate=0.1,max_depth=1, random_state=0, loss='ls').fit(X_train, y_train.ravel())
	
	y_hat = est.predict(X_test)
	return y_hat	


if __name__ == '__main__':
	_Xg = sio.loadmat('fill_X_train_gap.mat')
	_yg = sio.loadmat('y_train_gap.mat')
	_Xgt = sio.loadmat('fill_X_test_gap.mat')
	
	_Xo = sio.loadmat('fill_X_train_order.mat')
	_yo = sio.loadmat('y_train_order.mat')
	_Xot = sio.loadmat('fill_X_test_order.mat')
	
	_Xr = sio.loadmat('fill_X_train_recv.mat')
	_yr = sio.loadmat('y_train_recv.mat')
	_Xrt = sio.loadmat('fill_X_test_recv.mat')
	
	Xg = _Xg['fill_X_train_gap']
	yg = _yg['y_train_gap']
	Xgt = _Xgt['fill_X_test_gap']
	
	Xo = _Xo['fill_X_train_order']
	yo = _yo['y_train_order']
	Xot = _Xot['fill_X_test_order']
	
	Xr = _Xr['fill_X_train_recv']
	yr = _yr['y_train_recv']
	Xrt = _Xrt['fill_X_test_recv']

	gbdt_list_all = []
	xgboost_list_all = []
	ret_o = []
	ret_r = []
	ret_g = []

	for s in range(66):	
		X_train = Xg;
		y_train = yg;
		for ww in range(65):
			X_train = np.vstack((X_train,Xg[s*141*20:(s+1)*141*20]))
			y_train = np.vstack((y_train,yg[s*141*20:(s+1)*141*20]))

		
		X_test = Xgt[s*43:(s+1)*43]
		y_gbdt = cal(X_train,y_train,X_test)
		ret_g = np.append(ret_g,y_gbdt)
		print s+300
	np.savetxt('p_gap.csv', ret_g, delimiter = ',')
	
	#ret_or_gap=ret_o-ret_r
	#np.savetxt('ret_or_gap.csv', ret_or_gap, delimiter = ',')



	for s in range(66):	
	
		X_train = Xo;
		y_train = yo;
		for ww in range(65):
			X_train = np.vstack((X_train,Xo[s*141*20:(s+1)*141*20]))
			y_train = np.vstack((y_train,yo[s*141*20:(s+1)*141*20]))

		
		X_test = Xot[s*43:(s+1)*43]
		y_gbdt = cal(X_train,y_train,X_test)
		ret_o = np.append(ret_o,y_gbdt)
		
		print s+100
	#np.savetxt('p_order.csv', ret_o, delimiter = ',')
	
	for s in range(66):	
		X_train = Xr;
		y_train = yr;
		for ww in range(65):
			X_train = np.vstack((X_train,Xr[s*141*20:(s+1)*141*20]))
			y_train = np.vstack((y_train,yr[s*141*20:(s+1)*141*20]))

		
		X_test = Xrt[s*43:(s+1)*43]
		y_gbdt = cal(X_train,y_train,X_test)
		ret_r = np.append(ret_r,y_gbdt)
		print s+200
	np.savetxt('p_recv.csv', ret_r, delimiter = ',')



#	plt.plot(np.arange(0, 141, 1), y_test.T[0], 'r')
#	plt.plot(np.arange(0, 141, 1), y_hat, 'b')
#	plt.plot(np.arange(0, 141, 1), preds, 'g')

#	plt.show()
