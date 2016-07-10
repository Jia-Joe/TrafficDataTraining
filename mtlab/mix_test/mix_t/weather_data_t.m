clear all; clc;

data_all = -1000*ones(66*27*5,3);
predict_slice=[43 44 45 55 56 57 67 68 69 79 80 81 91 92 93 103 104 105 115 116 117 127 128 129 139 140 141];
helper=1:27;
mp = containers.Map(predict_slice,helper);
strict_num = 8;
%base_name = './gap_num_data/gap_num_2016-01-';
base_name = 'weather_data_2016-01-';
for i = 23:2:32
    day=(i-21)/2;

        name = [base_name,  num2str(i), '_test.csv'];
        data = csvread(name,1,0);%
        sz=size(data);
        for j=1:sz
            % data(j,1) data(j,2)
            if mp.isKey(data(j,1))
                for k=1:66
                    index=27*5*(k-1)+27*(day-1)+mp(data(j,1));
                    for k=1:3
                        data_all(index,k)=data(j,1+k);
                    end
                end
            end
        end
    
end

weather_all_t = data_all;
save weather_all_t weather_all_t
% 
% data_strict = {};
% for d = 1:66
%     data_strict{d} = data_all(d:66:66*21,:);
% end