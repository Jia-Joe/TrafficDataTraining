clear all;
load('cp.mat');
load('mean_recv.mat');

item=2;
cp1=cp;
mean_item=mean_recv;
prs=[43 44 45 55 56 57 67 68 69 79 80 81 91 92 93 103 104 105 115 116 117 127 128 129 139 140 141];

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
cp1=cp1(:,item);
for ix=1:8910/3
    pt=(ix-1)*3+1;
    ptc=(ix-1)*3+1;
    if cp1(pt,1)<-1000
        ifo=hhis(mean_item,prs,pt);
        pos=ifo(1,2);
        day=ifo(1,3);
        ag=ifo(:,1);
        
        nu=0;
        td=day;
        while cp1(ptc,1)<0
            nu=nu+1;
            if td==139
                break;
            end
            iffo=hhis(mean_item,prs,ptc+3);
            td=iffo(1,3);
            ptc=ptc+3;
            
        end        
        %===================================%
        if nu==1
            if day==43
                cp1(pt:pt+2)=round(0.8*ag+0.2*mean(cp1(pt+3:pt+5)));
            elseif day==139
                cp1(pt:pt+2)=round(0.8*ag+0.2*mean(cp1(pt-3:pt-1)));
            else
                cp1(pt:pt+2)=round(0.7*ag+0.15*mean(cp1(pt+3:pt+5))+0.15*mean(cp1(pt-3:pt-1)));
            end
        elseif nu==9
            for i=1:9
                iffo=hhis(mean_item,prs,pt+3*(i-1));
                cp1(pt+3*(i-1):pt+3*i-1)=round(iffo(:,1));
            end
        else
        ifo_=hhis(mean_item,prs,pt+3*(nu-1));

        for i=1:nu
            iffo=hhis(mean_item,prs,pt+3*(i-1));
            agg=iffo(:,1);
            if i==1
                if day==43
                    cp1(pt:pt+2)=round(agg);
                else
                    cp1(pt:pt+2)=round(0.8*agg+0.2*mean(cp1(pt-3:pt-1)));
                end
            elseif i==nu
                if ifo_(1,3)==139
                    cp1(pt+3*(i-1):pt+3*i-1)=round(agg);
                else
                    cp1(pt+3*(i-1):pt+3*i-1)=round(0.8*agg+0.2*mean(cp1(pt+3*i:pt+3*i+2)));
                end
            else
                cp1(pt+3*(i-1):pt+3*i-1)=round(agg);
            end
        end

        end
        
        %===================================%
    end

    
end

cp11=cp1;
for i=1:66*135
    if cp11(i)==-1000
        cp11(i)=100;
    end
end
    