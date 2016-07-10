load('fill_data_all.mat');
% We have 66*141*20=186120 rows              basic_data(index,1)=order_mat(66*(i-1)+j);

item=3;

copy=fill_data_all;
wd=zeros(66*144*21,1);
ok=ones(66*144*21,1);
for i=1:66
   
    for j=1:144
       
        for k=1:21
            index=144*21*(i-1)+21*(j-1)+k;
            if k<4||k==9||k==10||k==16||k==17
                wd(index)=1;
            end
            if j<4||k==1
                ok(index)=0;
            end
        end
    end
    
end


X_train=-1000*ones(66*141*20,28);
y_train=zeros(66*141*20,1);

cnt=1;
for i=1:66
   
    for j=1:144
       
        for k=1:21          
            index=144*21*(i-1)+21*(j-1)+k;
            if ok(index)
                y_train(cnt)=copy(index,item);
                for td=1:3
                    %order_num 3 2 1
                    X_train(cnt,td)=copy(index-td*21,item);
                    %time_slice 1 2 3
                    X_train(cnt,7-td)=j-td;
                    %traffic 12 11 ...1
                    X_train(cnt,6+(td-1)*4+1:6+(td-1)*4+4)=copy(index-td*21,4:7);
                    %weather 9 8 ... 1
                    X_train(cnt,18+(td-1)*3+1:18+(td-1)*3+3)=copy(index-td*21,8:10);                 
                end
                %weekends? 
                X_train(cnt,28)=wd(index);
                
                cnt=cnt+1;
            end
        end
    end
    
end
% X_train_gap=X_train;
% y_train_gap=y_train;
