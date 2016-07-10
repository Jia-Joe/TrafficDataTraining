load('original_test.mat');
cp3=original_test(1:135,8:10);


predict_slice=[43 44 45 55 56 57 67 68 69 79 80 81 91 92 93 103 104 105 115 116 117 127 128 129 139 140 141];
helper=1:27;
mp = containers.Map(predict_slice,helper);

c3=[];
for i=1:66
    c3=[c3;cp3];
end

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
for i=1:8910
    for j=1:4
       if ok(i)==1&& cp2(i,j)<-100
            cp2(i,j)=-9999;
       end
    end
    
end
sr=[66,18,17,57,29,22,54];
sum=zeros(135,4);
for i=1:5
    sum=sum+cp2((sr(i)-1)*135+1:sr(i)*135,:);    
end
cp2((sr(7)-1)*135+1:sr(7)*135,:)=round(sum/6);




cp1=cp(:,1:3);
for i=1:8910
    for j=1:3
       if ok(i)==1&& cp1(i,j)<-100
            cp1(i,j)=-9999;
       end
    end
    
end


item=2;
for i=1:8910/3
   ix=(i-1)*3;
   slice=cp1((i-1)*3+1:i*3,item); 
   cnt=3;
   for j=1:3
       if slice(j)<-5000
          cnt=cnt-1; 
       end
   end
   if cnt==1
        if slice(1)>=0; cp1(ix+2,item)=slice(1); cp1(ix+3,item)=slice(1); end
        if slice(2)>=0; cp1(ix+3,item)=slice(2); cp1(ix+1,item)=slice(2); end
        if slice(3)>=0; cp1(ix+1,item)=slice(3); cp1(ix+2,item)=slice(3); end
   elseif cnt==2
        if slice(1)<0; cp1(ix+1,item)=round((slice(2)+slice(3))/2); end
        if slice(2)<0; cp1(ix+2,item)=round((slice(3)+slice(1))/2); end
        if slice(3)<0; cp1(ix+3,item)=round((slice(1)+slice(2))/2); end
%    elseif cnt==0
% 
%         cp1(ix+1,item)=0;   
%         cp1(ix+2,item)=0;
%         cp1(ix+3,item)=0;

   end
    
end





