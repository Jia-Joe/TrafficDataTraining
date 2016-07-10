wo=csvread('p_order.csv',0,0);
wr=csvread('p_recv.csv',0,0);
wg=csvread('p_gap.csv',0,0);
wm=csvread('ret_or_gap.csv',0,0);
wm=wo-wr;

for i=1:2838
   if wm(i)<-0.5
       wm(i)=0.618*wm(i-1)+0.382*(i-2);
   end
end
for i=1:2838
   if wm(i)<-0
       wm(i)=-wm(i);
   end
end
csvwrite('aa.csv',wm);


cp=original_test(2);
gap=ones(21,144,66);
for i=1:66
    gap(:,:,i)=cp(i:66:66*21,:);
      
end
mv=ones(66,1);
for i=1:66
    mv(i)=min(min(gap(:,:,i)));
     
end



lack=ones(66,1);
for i=1:66
   lack(i)=sum(sum(gap(:,43:142,i)<0));
end
[sl,sli]=sort(lack);

tot=[];
th=350;
for i=1:66
    if(lack(i)<th)
    tot=[tot;gap(:,:,i)];
    end
    
end
tot=tot';

for i=1:11
    subplot(4,3,i);
   tpd(gap,slack,(i-1)*6+1,i*6); 
    
end
for i=19:24
    subplot(2,3,i-18);
   tpd(gap,slack,i,i); 
    
end

%%%%%%%%%²åÖµ
here=zeros(66,17);
ix=zeros(66,17);
for pos=1:66
    dt=gap(:,43:142,pos);
    cnt=1;
    for i=1:21
        for j=1:100
            if cnt<17&&dt(i,j)<0;
                here(pos,cnt)=10000*i+42+j;
                ix(pos,cnt)=144*21*(pos-1)+21*(j-1)+i;
                cnt=cnt+1;
            end
        end
        if cnt==17
            break;
        end
    end
    if cnt==17
        here(pos,:)=-1000*ones(1,17);
    end
end



