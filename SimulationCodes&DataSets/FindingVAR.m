load sortedexpectedPriceMC;
load noMCsimu;
load covar;
load corr;
percentVAR=99.9;
loopLimit=(100-percentVAR)*noMCsimu/100;
acc=zeros(1,20);
var=zeros(1,20);% var is the Value at Risk
for k=1:20
    for i=1:loopLimit
    acc(k)=acc(k)+sortedexpectedPriceMC(i,k);
    end
    var(k)=data(24,k)-acc(k)/loopLimit;
end
%optPar is the ratio of VAR and Expected Value of stock
optParMC=zeros(1,20);
for i=1:20
    optParMC(i)=var(i)/expRetMC(i);
end
[minval,minIndex]=min(optParMC);
POSelectionMC=POopt(optParMC,minIndex,corr);
save var;
save POSelectionMC;
save optParMC;
% %% The following MATRIX tells us what we are including in our Portfolio
% portfolioSelection=zeros(1,20);
% portfolioSelcopy=zeros(1,20);
% portfolioSelection(minIndex)=1; %select the best one
% % Following code selects the best Portfolio for a given limit on correlation
% corrlimit=.8;
% for i=1:20
%     if(i~=minIndex)
%         if(corr(minIndex,i)<corrlimit)
%             portfolioSelcopy(i)=1;
%         end
%     end
% end
% %spindex is the index of the portfolio that was selected in the previous iteration
% 
% while(summy(portfolioSelcopy)~=0)
%     spindex=findBest(portfolioSelcopy,optPar);
%     portfolioSelection(spindex)=1;
%     portfolioSelcopy(spindex)=0;
%     for i=1:20
%        if(portfolioSelcopy(i)==1)
%            if(corr(spindex,i)>corrlimit)
%                portfolioSelcopy(i)=0;
%            end
%        end
%     end
% end