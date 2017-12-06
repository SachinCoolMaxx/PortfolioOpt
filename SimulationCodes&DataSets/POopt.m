function portfolioSelection = POopt(optPar,minIndex,corr)

portfolioSelection=zeros(1,20);
portfolioSelcopy=zeros(1,20);
portfolioSelection(minIndex)=1; %select the best one
% Following code selects the best Portfolio for a given limit on correlation
corrlimit=0.8;
for i=1:20
    if(i~=minIndex)
        if(corr(minIndex,i)<corrlimit)
            portfolioSelcopy(i)=1;
        end
    end
end
%spindex is the index of the portfolio that was selected in the previous iteration

while(summy(portfolioSelcopy)~=0)
    spindex=findBest(portfolioSelcopy,optPar);
    portfolioSelection(spindex)=1;
    portfolioSelcopy(spindex)=0;
    for i=1:20
       if(portfolioSelcopy(i)==1)
           if(corr(spindex,i)>corrlimit)
               portfolioSelcopy(i)=0;
           end
       end
    end
end
end