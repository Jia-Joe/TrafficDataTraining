load('fill_data_final.mat');
cp=fill_data_final;


err=error_order';
mean_err_order=-1000*ones(66*144*21,1);
for i=1:66
    for j=1:144
        for k=1:21
            if j>42&&j<143
                mean_err_order((i-1)*144*21+(j-1)*21+k,1)=err(i,(k-1)*100+j-42);
            end
        end
    end
end
fill_data_final=[fill_data_final,mean_err_order];




err=error_order';
err_mean=zeros(66,100);
for pos=1:66
    for t=1:100
        err_mean(pos,t)=mean(err(pos,t+100:100:2100));
        
    end
end
fill_data_final=[fill_data_final,mean_err_order];

meanrr=-1000*ones(66*144*21,1);
for i=1:66
    for j=1:100
        for k=1:20
            meanrr((i-1)*100*20+(j-1)*20+k,1)=err_mean(i,j);
        end
    end
end

X_train_t1(:,15)=[];
X_train_t1(:,11)=[];
X_train_t1(:,7)=[];
X_train_t2(:,16)=[];
X_train_t2(:,12)=[];
X_train_t2(:,8)=[];
X_train_t3(:,17)=[];
X_train_t3(:,13)=[];
X_train_t3(:,9)=[];
X_train_t4(:,18)=[];
X_train_t4(:,14)=[];
X_train_t4(:,10)=[];
X_train_w1(:,26)=[];
X_train_w1(:,23)=[];
X_train_w1(:,20)=[];
X_train_w2(:,27)=[];
X_train_w2(:,24)=[];
X_train_w2(:,21)=[];

X_test_t1(:,15)=[];
X_test_t1(:,11)=[];
X_test_t1(:,7)=[];
X_test_t2(:,16)=[];
X_test_t2(:,12)=[];
X_test_t2(:,8)=[];
X_test_t3(:,17)=[];
X_test_t3(:,13)=[];
X_test_t3(:,9)=[];
X_test_t4(:,18)=[];
X_test_t4(:,14)=[];
X_test_t4(:,10)=[];
X_test_w1(:,26)=[];
X_test_w1(:,23)=[];
X_test_w1(:,20)=[];
X_test_w2(:,27)=[];
X_test_w2(:,24)=[];
X_test_w2(:,21)=[];


%================TEST================%
psl=[43 44 45 55 56 57 67 68 69 79 80 81 91 92 93 103 104 105 115 116 117 127 128 129 139 140 141];

err=error_order';
ecol=-1000*ones(8910,1);
for i=1:66
    for j=1:5
        for k=1:27
            ecol((i-1)*5*27+(j-1)*27+k)=err(i,(j-1)*100+k)
        end
    end
end


ix1=[];
for i=1:66
    dt=i*ones(43,1);
    ix1=[ix1;dt];
end

r1=csvread('y_test_t1.csv',0,2);
r2=csvread('y_test_t2.csv',0,2);
r3=csvread('y_test_t3.csv',0,2);
r4=csvread('y_test_t4.csv',0,2);
r5=csvread('y_test_w1.csv',0,2);
r6=csvread('y_test_w2.csv',0,2);

mix_all=[ix1,r1,r2,r3,r4,r5,r6];
r7=csvread('y_test_erg.csv',0,2);
r8=csvread('y_test_ero.csv',0,2);
r9=csvread('y_test_erv.csv',0,2);
mix_all=[mix_all,r7];

csvwrite('hope.csv',)













