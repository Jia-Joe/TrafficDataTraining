clear all; clc;

data_all = -1000*ones(66*144*21,3);

strict_num = 8;
%base_name = './gap_num_data/gap_num_2016-01-';
name = 'fill_weather_all.csv';

data = csvread(name,0,0);%

for i=1:144
    % data(j,1) data(j,2) 
    for j=1:21
        for d=1:66
            index=144*21*(d-1)+21*(i-1)+j;
            for k=1:3      
                if data(j,4*(i-1)+k+1)==999
                    data_all(index,k)=-1000;
                else
                    data_all(index,k)=data(j,4*(i-1)+k+1);
                end
            end
        end
    end
end



weather_all = data_all;
save weather_all weather_all
clear all; clc;

%base_name = './gap_num_data/gap_num_2016-01-';

% 
% data_strict = {};
% for d = 1:66
%     data_strict{d} = data_all(d:66:66*21,:);
% end