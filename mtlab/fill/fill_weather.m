% weather_all=csvread('weather_all.csv');
% cp=weather_all;
% we=cp(:,2:4:577);
% tp=cp(:,3:4:577);
% pm=cp(:,4:4:577);


for day=1:21
    t=2;
    while t<=144
        
        if pm(day,t)==999
           pt=t;
           while pm(day,pt)==999
                pt=pt+1;
           end
           delta=(pm(day,pt)-pm(day,t-1))/(pt-t+1);
           for i=1:pt-t
               pm(day,t+i-1)=round(pm(day,t-1)+i*delta);
               
           end
           t=pt;
        else
            t=t+1;
        end
    end
end