function [Xtrain, Xtest, T, L] = readData(classnum, datanum_train, datanum_test, datadim)
%READDATA read the train and test data from files according to the option

load('mnist_all.mat');

%----- read data and specify labels -----%
Xtrain = zeros(datanum_train*classnum, datadim);
% pre-allocation for the labels, with each row denotes a single label coded in 1-of-K schema
T = zeros(datanum_train*classnum, classnum);
for i = 1:classnum
    varname = strcat('train', num2str(i-1));
    x = eval(varname);
    index = randperm(size(x, 1));
%    x = x(1:datanum_train, :);
    Xtrain((i-1)*datanum_train+1:i*datanum_train, :) = x(index(1:datanum_train), :);
    T((i-1)*datanum_train+1:i*datanum_train, i) = ones(datanum_train, 1);
end
        
%---- specification of test data ----%
Xtest = zeros(classnum*datanum_test, datadim);
L = [];
for i = 1:classnum
    varname = strcat('test', num2str(i-1));
    xtmp = eval(varname);
    index = randperm(size(xtmp, 1));
    Xtest((i-1)*datanum_test+1:i*datanum_test, :) = xtmp(index(1:datanum_test), :);
    L = [L i*ones(1,datanum_test)];
end