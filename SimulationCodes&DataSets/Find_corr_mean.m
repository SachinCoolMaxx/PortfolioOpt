load data.mat;
[rows, columns] = size(data);
%Finding the means for all companies
means=zeros(1,columns);%declaring an array containing means, of size=columns 
for col=1:columns
    sum=0;
    for row=1:(rows-2)
        sum=sum+data(row,col);
    end
    means(col)=sum/24;
end
%Finding cov(i,j) for all
covar=cov(data);
%finding correlation(i,j) for all i,j
corr=zeros(20);
for i=1:20
    for j=1:20
        corr(i,j)=covar(i,j)/sqrt(covar(i,i)*covar(j,j));
    end
end
save means;
save covar;
save corr;