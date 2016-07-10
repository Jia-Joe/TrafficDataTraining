clear all; clc;

data_all = [];
base_name = 'order_num_2016-01-';
for i = 1:21
    if i < 10
        name = [base_name, '0', num2str(i), '.csv'];
        data = csvread(name,1,1);
        if i==1
            data_all = [data_all; data];
        else
            data_all = [data_all; data];
        end
    else
        name = [base_name, num2str(i), '.csv'];
        data = csvread(name,1,1);
        data_all = [data_all; data];
    end
end

%d=8;
%order_all = data_all(d:66:66*21,:);
order_all = data_all;
save order_all order_all
% data_strict = {};
% for d = 1:66
%     data_strict{d} = data_all(d:66:66*21,:);
% end
% 
% for k = 1:6
%     data_show = [];
%     for ind = 11*(k-1)+1:11*(k-1)+11
%         data_show = [data_show; split;  data_strict{ind}];
%     end
%     figure(k)
% 	mesh(data_show);
% end