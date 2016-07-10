#order:4362  day 21  1863 #gap 3872  day 16 1341 #recv 1084 day 10 902
#order day 21 1863 
#gap   day 16 1341 
#recv  day 10 902
os.chdir('f:/di____di/season_1/training_data/recv_num_data')

def filen2s(num):
	if(num<10):
		return '0'+str(num)
	else:
		return str(num)
	
df=[]	
for fn in range(1,22):
	print fn
	df.append(pd.read_csv('recv_num_2016-01-'+filen2s(fn)+'.csv'))
	
for fn in range(0,21):
	print fn
	print df[fn].max().max()
	
'''	
0
4362.0
1
865.0
2
937.0
3
1343.0
4
1763.0
5
1220.0
6
831.0
7
1592.0
8
1042.0
9
1394.0
10
1509.0
11
1458.0
12
1601.0
13
1206.0
14
1511.0
15
1715.0
16
980.0
17
1377.0
18
1674.0
19
1529.0
20
1863.0

recv
0
1084.0
1
781.0
2
728.0
3
669.0
4
739.0
5
677.0
6
670.0
7
683.0
8
758.0
9
902.0
10
738.0
11
664.0
12
689.0
13
724.0
14
741.0
15
799.0
16
703.0
17
667.0
18
778.0
19
750.0
20
831.0
'''