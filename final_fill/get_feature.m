clear all;clc;
load('fill_data_final.mat');
load('mean_all.mat');
% We have 66*97*20=128040 rows              basic_data(index,1)=order_mat(66*(i-1)+j);

item=1;

copy=fill_data_final;
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
X_train=[X_train,mean_all(:,item)];
% X_train=Xy_train_all;
% X_train(:,4+2:5+2)=[];
% X_train(:,20+2:25+2)=[];
% 
% cp=Xy_train_all;
% for i=5+2:4:13+2
%     traff=zeros(66*141*20,1);
%     for j=0:3
%         traff=traff+cp(:,i+j);
%     end
%     cp(:,i) =cp(:,i)./traff;
% end
% cp(:,8:10)=[];
% cp(:,9:11)=[];
% cp(:,10:12)=[];
% cp(:,10)=[];
% 
% cp=Xy_train_all;
% sz=66*97*20;
% slcp=zeros(sz,20);
% cnt=1;
% for i=1:186120
%     if cp(i,10)>=45&&cp(i,10)<=141%%%%%
%         slcp(cnt,:)=cp(i,:);
%         cnt=cnt+1;
%     end
%     
% end
% %%%%%=======================readPOI
% col=43;
% poia=[];
% poi=log(poi);
% for i=1:col
%     poia=[poia;poi'];
% end
% poia=reshape(poia,col*66,1);
% slcp=[slcp,poia];
% 
% 
% %%%%%=======================POI
% lv1=[1     7     8    12    23    28    37    48    51];
% lv2=[2 4 6 9 11 13 14 18 19 20 21 22 24 26 27 25 29 35 38 42 46 53 54 57 64 66];
% lv3=[];
% for i=1:66
%     if ~any([lv1,lv2]==i)
%         lv3=[lv3,i];
%     end
% end
% lv=[lv1,lv2,lv3];
% lv=int32(lv);
% ixx=1:66;
% mpoi = containers.Map(lv,ixx);
% 
% %%%%%=======================reshape lv123
% szp=size(slcp);
% lvcp=zeros(66*97*20,szp(2));
% for i=1:66
%     ivx=lv(i);
%     lvcp(97*20*(i-1)+1:97*20*i,:)=slcp(97*20*(ivx-1)+1:97*20*ivx,:);
%     
% end












        



% X_train_gap=X_train;
% y_train_gap=y_train;
