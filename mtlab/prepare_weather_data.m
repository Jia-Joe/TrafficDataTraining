clear all; clc;

load('X_train.mat');
load('traffic_s8.mat');
traffic_s8 = [traffic_s8(1,:); traffic_s8];

y_train = [];
X_train = [];

y_test = [];
X_test = [];

for day = 1:21
	for slice = 4:144
		if day ~= 10
			y_train = [y_train; gap_s8(day, slice)];
			x_temp = [gap_s8(day, slice-3); gap_s8(day, slice-2); gap_s8(day, slice-1); ...
				slice-3; slice-2; slice-1; traffic_s8(slice-3, (day-1)*4+1:day*4)'; traffic_s8(slice-2, (day-1)*4+1:day*4)'; traffic_s8(slice-1, (day-1)*4+1:day*4)'];
			X_train = [X_train, x_temp];
			clear x_temp;
		else
			y_test = [y_test; gap_s8(day, slice)];
			x_temp = [gap_s8(day, slice-3); gap_s8(day, slice-2); gap_s8(day, slice-1); ...
				slice-3; slice-2; slice-1; traffic_s8(slice-3, (day-1)*4+1:day*4)'; traffic_s8(slice-2, (day-1)*4+1:day*4)'; traffic_s8(slice-1, (day-1)*4+1:day*4)'];
			X_test = [X_test, x_temp];
			clear x_temp;
		end
	end
end

% y_train = y_train'/max(y_train);
% X_train = X_train'/max(max(X_train));
% 
% y_test = y_test'/max(y_test);
% X_test = X_test'/max(max(X_test));

y_train = y_train;
X_train = X_train';

y_test = y_test;
X_test = X_test';

save y_train y_train
save X_train X_train
save y_test y_test
save X_test X_test