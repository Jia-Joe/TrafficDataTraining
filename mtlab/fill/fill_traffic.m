load('original_data.mat');
cp=original_data;

sz=66*141*21;

for level=1:4
item=3+level;

traffic1=ones(66,144*21);
for pos=1:66
   data=cp((pos-1)*144*21+1:pos*144*21,item);
   for day=1:21
      traffic1(pos,144*(day-1)+1:144*day)=(data(day:21:144*21,1))'; 
   end
    
end

traffic1(54,3024)=1;
for i=1:66
    tra2=traffic1(i,2);tra3=traffic1(i,3);
    if tra2>55&&tra3>0
        traffic1(i,1)=2*traffic1(i,2)-traffic1(i,3);
    else
        pp=1;
       while traffic1(i,pp)==-1000
            pp=pp+1;
       end   
       traffic1(i,1)=traffic1(i,pp);
    end
    

end

for pos=1:66
    t=2;
    while t<=3024
        
        if traffic1(pos,t)==-1000
           pt=t;
           while traffic1(pos,pt)==-1000
                pt=pt+1;
           end
           delta=(traffic1(pos,pt)-traffic1(pos,t-1))/(pt-t+1);
           for i=1:pt-t
               traffic1(pos,t+i-1)=round(traffic1(pos,t-1)+i*delta);
               
           end
           t=pt;
        else
            t=t+1;
        end
    end
end
similar=[66,18,17,57,29,22];
trs=zeros(1,144*21);
for i=1:6
    trs=trs+traffic1(similar(i),:);
    trs=round(trs/6);
end
traffic1(54,:)=trs;


for pos=1:66
   data=ones(144*21,1);
   for day=1:21
      data(day:21:144*21,1)=(traffic1(pos,144*(day-1)+1:144*day))'; 
   end
   cp((pos-1)*144*21+1:pos*144*21,item)=data; 
end

end
% for day=2:21
%    traffic1(:,1+(day-1)*144) = round((traffic1(:,2+(day-1)*144) + traffic1(:,(day-1)*144))/2);  
%     
% end