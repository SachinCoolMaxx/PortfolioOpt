load POselectCAPM;
load POSelectionMC;
load optParCAPM1;
load optParMC;
weightsCAPM=zeros(1,20);
weightsMC=zeros(1,20);
sumMC=zeros(1,1);
sumCAPM=zeros(1,1);
for i=1:20
    if(POSelectionMC(i)==1)
        sumMC=sumMC+(1.0/optParMC(i));
    end
    if(POselectCAPM(i)==1)
        sumCAPM=sumCAPM+(1.0/optParCAPM1(i));
    end
end
for i=1:20
    if(POselectCAPM(i)==1)
        weightsCAPM(i)=(1/optParCAPM1(i))/sumCAPM;
    else
        weightsCAPM(i)=0;
    end
    if(POSelectionMC(i)==1)
        weightsMC(i)=(1/optParMC(i))/sumMC;
    else
        weightsMC(i)=0;
    end
end