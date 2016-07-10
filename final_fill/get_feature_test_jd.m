clear all;
clc;
load('fill_test_final.mat');
load('fill_data_final.mat');

predict_slice=[43 44 45 55 56 57 67 68 69 79 80 81 91 92 93 103 104 105 115 116 117 127 128 129 139 140 141];
helper=1:27;
mp = containers.Map(predict_slice,helper);

item=13;

copy=fill_test_final;
copy_or=fill_data_final;
wd=zeros(66*5*27,1);
ok=ones(66*5*27,1);
for i=1:66
   
    for j=1:5
       
        for k=1:27
            index=5*27*(i-1)+27*(j-1)+k;
            if j==1||j==5
                wd(index)=1;
            end
            if mod(j,2)==0&&k<4
                ok(index)=0;
            end
        end
    end
    
end


X_test=-1000*ones(66*43,28);
%y_train=zeros(66*5*9,1);

cnt=1;
for i=1:66
   
    for k=1:5
       
        for j=1:9         
            

            %y_train(cnt)=copy(index,1);
            if ok(5*27*(i-1)+27*(k-1)+3*(j-1)+1)
                for td=1:3
                    index=5*27*(i-1)+27*(k-1)+3*(j-1)+td;
                
                    %order_num 3 2 1
                    if(copy(index+3-td,1)<0)
                        X_test(cnt,td)=0;
                    else
                        X_test(cnt,td)=copy(index+4-2*td,item);
                    end
                    %time_slice 1 2 3
                    X_test(cnt,3+td)=predict_slice(3*(j-1)+td);
                    %traffic 12 11 ...1
                    X_test(cnt,6+(td-1)*4+1:6+(td-1)*4+4)=copy(index+4-2*td,4:7);
                    %weather 9 8 ... 1
                    X_test(cnt,18+(td-1)*3+1:18+(td-1)*3+3)=copy(index+4-2*td,8:10);                                                                 
                end 
                %weekends?
                X_test(cnt,28)=wd(index);            
                cnt=cnt+1;                
                
            end

            
                
                           
        end
    end
    
end

mean_mx=zeros(66,144);
mean_item=zeros(66*43,1);
for i=1:66   
    for j=1:144 
        sum=0;
        for k=2:21     
            index=144*21*(i-1)+21*(j-1)+k;
            sum=sum+copy_or(index,item);
        end
        mean_mx(i,j)=sum/20;
    end
end


dy=46:12:142;
dy1=dy(2:9);
da=[dy,dy1,dy,dy1,dy];
for i=1:66
    for k=1:43
        mean_item((i-1)*43+k,1)=mean_mx(i,da(k));
    end
end

X_test=[X_test,mean_item];
% cp=X_test_all;
% for i=2:4:10
%     traff=zeros(66*43,1);
%     for j=0:3
%         traff=traff+cp(:,i+j);
%     end
%     cp(:,i) =cp(:,i)./traff;
% end
% ihh=3;
% cp(:,ihh:ihh+2)=[];
% cp(:,ihh+1:ihh+3)=[];
% cp(:,ihh+2:ihh+4)=[];
% cp(:,ihh+2)=[];
% cp(:,ihh+4:ihh+9)=[];
% 
% col=43;
% poia=[];
% poi=log(poi);
% for i=1:col
%     poia=[poia;poi'];
% end
% poia=reshape(poia,col*66,1);
% cp=[cp,poia];
% %%%%%%%%%%%%%%%%%%%%%%(0,1)%%%%%%%%%%%%%%%%%%
% cp=[X_test_all,zeros(2838,3)];
% cp=[cp;lvcp];
% for i=11:13
%     cp(:,i)=mapminmax(cp(:,i)',0,1)';
% end
% i=14;
% cp(:,i)=mapminmax(cp(:,i)',0,1)';
% i=15;
% cp(:,i)=mapminmax(cp(:,i)',0.2,1.2)';
% i=17;
% cp(:,i)=mapminmax(cp(:,i)',0,1.2)';
% 
% Xt_g1=cp(1:2838,1:17);
% cp(1:2838,:)=[];
% %cp==Xy_g1
% fill_X_train_order=[Xy_g1(:,1:3),Xy_g1(:,10:17)];
% fill_X_train_recv =[Xy_g1(:,4:6),Xy_g1(:,10:17)];
% fill_X_train_gap = [Xy_g1(:,7:9),Xy_g1(:,10:17)];
% 
% y_train_order=Xy_g1(:,18);
% y_train_recv =Xy_g1(:,19);
% y_train_gap = Xy_g1(:,20);
% 
% fill_X_test_order=[Xt_g1(:,1:3),Xt_g1(:,10:17)];
% fill_X_test_recv =[Xt_g1(:,4:6),Xt_g1(:,10:17)];
% fill_X_test_gap = [Xt_g1(:,7:9),Xt_g1(:,10:17)];












