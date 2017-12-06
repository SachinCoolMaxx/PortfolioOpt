function index = findBest(matrix,optPar)
index = 0;
min=10000000;
for i=1:20
   if (matrix(i)==1)
      if(optPar(i)<min)
          min=optPar(i);
          index=i;
      end
   end
end
end