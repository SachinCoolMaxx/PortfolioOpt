load SPmarket;
load data;
load corr;
load var;
load optParMC;
diff1=zeros(23,20);
spdiff=zeros(1,23);
for i=1:20
    for j=2:24
        diff1(j-1,i)=(data(j,i)-data(j-1,i))/data(j-1,i);
        spdiff(j-1)=(SPmarket(j)-SPmarket(j-1))/SPmarket(j-1);
    end
end
differences=zeros(23,21);
for k=1:20
    differences(:,k)=diff1(:,k);    
end
differences(:,21)=spdiff;
beta1=cov(differences);
%finding correlation(i,j) for all i,j
beta2=zeros(21);

for i=1:21
    for j=1:21
        beta2(i,j)=beta1(i,j)/sqrt(beta1(i,i)*beta1(j,j));
    end
end
beta=zeros(1,20);
for k=1:20
    beta(k)=beta2(21,k);
end
rm=40.4138346;
rf=5.16;
ra=zeros(1,20); %ra is the rate of return for two years

for j=1:20
    ra(j)=(rf+(beta(j)*(rm-rf)))/100;
end
ExptValCAPM=zeros(1,20);
ExptRetCAPM=zeros(1,20);
for k=1:20
    ExptValCAPM(k)=(ra(k)+1)*data(24,k);
    ExptRetCAPM(k)=ra(k)*data(24,k);
    if(ExptRetCAPM(k)<0)
        ExptRetCAPM(k)=0.0001;
    end
end
optParCAPM1=zeros(1,20);
for i=1:20
    optParCAPM1(i)=var(i)/ExptRetCAPM(i);
end
[minval,minIndex]=min(optParCAPM1);
POselectCAPM=POopt(optParCAPM1,minIndex,corr);
save optParCAPM1;
save POselectCAPM;