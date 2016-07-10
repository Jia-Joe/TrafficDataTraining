pm=er;

for day=1:66
    t=2;
    while t<=2100
        
        if isnan(pm(day,t))
           pt=t;
           while isnan(pm(day,pt))
                pt=pt+1;
           end
           delta=(pm(day,pt)-pm(day,t-1))/(pt-t+1);
           for i=1:pt-t
               pm(day,t+i-1)=pm(day,t-1)+i*delta;
               
           end
           t=pt;
        else
            t=t+1;
        end
    end
end
err_recv_fill=pm';