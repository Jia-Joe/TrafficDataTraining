clear all; clc;

basic_data=-1*ones(66*144*21,3);
for i=1:21
   
    for j=1:66
       
        for k=1:144
            index=144*21*(j-1)+21*(k-1)+i;
            basic_data(index,1)=order_mat(66*(i-1)+j);
        end
    end
    
end

for i=1:21
   
    for j=1:66
       
        for k=1:144
            index=144*21*(j-1)+21*(k-1)+i;
            basic_data(index,2)=recv_mat(66*(i-1)+j);
        end
    end
    
end
for i=1:21
   
    for j=1:66
       
        for k=1:144
            index=144*21*(j-1)+21*(k-1)+i;
            basic_data(index,3)=gap_mat(66*(i-1)+j);
        end
    end
    
end


%d=8;
%order_all = data_all(d:66:66*21,:);
%order_all = data_all;
%save order_all order_all
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