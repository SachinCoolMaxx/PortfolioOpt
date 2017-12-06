%DONOT RUN THIS AGAIN - the indices of data mat would CHANGE!!!!
filename='FinalData.xlsx';
data=xlsread(filename);
save data;
SPmarket=xlsread('sp500.xlsx');
save SPmarket;