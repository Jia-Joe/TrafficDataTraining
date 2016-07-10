clear all; clc;


% predict_slice1=[43 44 45 55 56 57 67 68 69 79 80 81 91 92 93 103 104 105 115 116 117 127 128 129 139 140 141];
% helper1=1:27;
% mp1 = containers.Map(predict_slice1,helper1);
% predict_slice2=[55 56 57 67 68 69 79 80 81 91 92 93 103 104 105 115 116 117 127 128 129 139 140 141];
% helper2=4:27;
% mp2 = containers.Map(predict_slice2,helper2);

% predict_slice=[43 44 45 55 56 57 67 68 69 79 80 81 91 92 93 103 104 105 115 116 117 127 128 129 139 140 141];
% helper=1:27;
% mp = containers.Map(predict_slice,helper);

data_all = -1000*ones(66*5*27,3);

base_name ={ 'order_num_2016-01-', 'recv_num_2016-01-', 'gap_num_2016-01-'};
%base_name =['order_num_2016-01-', 'recv_num_2016-01-', 'gap_num_2016-01-'];
for fi=1:3
    for i = 23:2:32    
        name = strcat(char(base_name(fi)),  num2str(i), '_test.csv');
        data = csvread(name,1,1);%
        day=(i-21)/2;
        if mod(day,2)==1
            for j=1:66
                for k=1:27
                    index=27*5*(j-1)+27*(day-1)+k;
                    if data(j,k)<0
                        data_all(index,fi)=-1000;
                    else
                        data_all(index,fi)=data(j,k);
                    end
                end
            end
        else
            for j=1:66
                for k=1:24
                    index=27*5*(j-1)+27*(day-1)+k+3;
                    if data(j,k)<0
                        data_all(index,fi)=-1000;
                    else
                        data_all(index,fi)=data(j,k);
                    end
                end
            end
        end
    end
end
basic_all_t = data_all;
save basic_all_t basic_all_t
