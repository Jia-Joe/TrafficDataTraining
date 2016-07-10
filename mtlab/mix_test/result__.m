load('original_test.mat');

r1=ones(66*43,1);
r2=ones(66*43,1);
r2(1)='aaa';
basic_date='2016-01-';

predict_slice=ones(1,9);
for i=1:9
    predict_slice(i)=predict_slice1(3*i)+1;
end

%get 144 slice  for pos day
d=cp(144*21*(pos-1)+day:21:144*21*(pos-1)+(day-1)+21*144,item);

p1=[46    58    70    82    94   106   118   130   142];
p2=[58    70    82    94   106   118   130   142];
pd=[p1,p2,p1,p2,p1];
day=[23 25 27 29 31];


predict_slice1=[43 44 45 55 56 57 67 68 69 79 80 81 91 92 93 103 104 105 115 116 117 127 128 129 139 140 141];
predict_slice2=[55 56 57 67 68 69 79 80 81 91 92 93 103 104 105 115 116 117 127 128 129 139 140 141];
helper=1:27;
mp = containers.Map(predict_slice,helper);

item=3;

copy=original_test;
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
                        X_test(cnt,td)=copy(index+3-td,item);
                    end
                    %time_slice 1 2 3
                    X_test(cnt,3+td)=predict_slice(3*(j-1)+td);
                    %traffic 12 11 ...1
                    X_test(cnt,6+(td-1)*4+1:6+(td-1)*4+4)=copy(index+3-td,4:7);
                    %weather 9 8 ... 1
                    X_test(cnt,18+(td-1)*3+1:18+(td-1)*3+3)=copy(index+3-td,8:10);                                                                 
                end 
                %weekends?
                X_test(cnt,28)=wd(index);            
                cnt=cnt+1;                
                
            end

            
                
                           
        end
    end
    
end
