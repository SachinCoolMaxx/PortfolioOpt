load data.mat
load covar.mat
%load means.mat
load bfslope.mat
load stockdiffvar.mat
%e=normrnd(mu,sigma);
noMCsimu=10000;
acc=zeros(1,20);
expectedPriceMC=zeros(noMCsimu,20);
for k=1:noMCsimu
    acc=zeros(1,20);
    for i=1:20
        for j=1:24
            acc(i)=acc(i)+normrnd(bfslope(i),stockdiffvar(i));
        end
        expectedPriceMC(k,i)=data(24,i)+acc(i);
    end
end
avg=zeros(1,20);
avgExpPriceMC=zeros(1,20);
expRetMC=zeros(1,20);
for k=1:20
    for i=1:noMCsimu
    avg(k)=avg(k)+expectedPriceMC(i,k);
    end
    avgExpPriceMC(k)=avg(k)/noMCsimu;
end
sortedexpectedPriceMC=sort(expectedPriceMC);
for k=1:20
   expRetMC(k)=avgExpPriceMC(k)-data(24,k);
   if(expRetMC(k)<0)
       expRetMC(k)=0.00001;
   end
end
save expRetMC;
save avgExpPriceMC;
save sortedexpectedPriceMC;
save noMCsimu;