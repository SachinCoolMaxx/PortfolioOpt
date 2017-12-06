load data;
month=zeros(24,1);
temp=zeros(24,2);
temp(:,1)=month;
bfslope=zeros(1,20);
for i=1:24
    temp(i,1)=i;
end
for i=1:20    
    temp(:,2)=data(:,i);
    c=cov(temp);
    bfslope(i)=c(1,2)/c(1,1);
end
diff=zeros(23,20);
for i=1:20
    for j=2:24
        diff(j-1,i)=data(j,i)-data(j-1,i);       
    end
end
stockdiffvart=cov(diff);
stockdiffvar=zeros(1,20);
for i=1:20
    stockdiffvar(i)=stockdiffvart(i,i);
end
save stockdiffvar;
save bfslope;