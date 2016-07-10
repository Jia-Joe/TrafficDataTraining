clear all; clc;

data_all = -1*ones(66*144*21,4);

strict_num = 8;
%base_name = './gap_num_data/gap_num_2016-01-';
base_name = 'traffic_num_data_2016-01-';
for i = 1:21
    if i<10
        name = [base_name, '0', num2str(i), '.csv'];
    else        
        name = [base_name,  num2str(i), '.csv'];
    end
    
    data = csvread(name,1,0);%
    sz=size(data);
    for j=1:sz
        % data(j,1) data(j,2)       
        index=144*21*(data(j,1)-1)+21*(data(j,2)-1)+i;
        for k=1:4               
            data_all(index,k)=data(j,2+k);
        end
        
    end

end

traffic_all = data_all;
save traffic_all traffic_all
clear all; clc;

%base_name = './gap_num_data/gap_num_2016-01-';

% 
% data_strict = {};
% for d = 1:66
%     data_strict{d} = data_all(d:66:66*21,:);
% end