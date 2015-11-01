function classificationDemo(drtype, clstype, reduceDim)
%DEMO   display all the demo classification program according to the data
%   path and the option.
%   Parameters:
%       drtype:   The type of Dimensionality Reduction
%                 0 ---- use all data dimension
%                 1 ---- random selected dimensions
%                 2 ---- FLDA dimensionality reduction
%                 3 ---- PCA dimensionality reduction
%      clstype:   The type of Classifier
%                 0 ---- knn classifier
%                 1 ---- linear classifier
%                 2 ---- logistic regression
%                 3 ---- svm classifier
%      reduceDim: reduced dimension, default = 9
%   Code by: kuixiong
%   Date: 04/17/2013

addpath(genpath('../'))

classnum = 10;
datanum_train = 1000;
datanum_test = 800;
datadim = 28*28;
lamda = 0.001; % regulization coeffient
alpha = 0.8;%0.999; % threshold for FLDA
K = 10; % the number of nearest neighbours for KNN classifier

if nargin < 2
    drtype = 2;
    clstype = 0;
    reduceDim = classnum-1;
    %reduceDim = round(datadim*0.04);
end

disp(['Classnum: ' num2str(classnum, '%d')]);
disp(['data number for train: ' num2str(datanum_train, '%d')]);
disp(['data number for test: ' num2str(datanum_test, '%d')]);
disp(['data dimensions: ' num2str(datadim, '%d')]);
disp(' ');

[Xtrain, Xtest, T, L] = readData(classnum, datanum_train, datanum_test, datadim);
switch drtype
    case 0 % use all data dimension
        disp(['use all data dimension: ' num2str(datadim, '%d')]);
        rXtrain = Xtrain; rXtest = Xtest;
        
    case 1 % random selected dimensions
        disp(['random selected dimensions: ' num2str(reduceDim, '%d')]);
        dimPerm = randperm(datadim);
        dimIndex = dimPerm(1:reduceDim);
        rXtrain = Xtrain(:,dimIndex);
        rXtest = Xtest(:,dimIndex);
        
    case 2 % FLDA dimesionality reduction
        disp(['FLDA dimesionality reduction: ' num2str(reduceDim, '%d')]);
        %[rXtrain, Wr] = dimreductionFisherLDA(Xtrain, alpha, classnum, reduceDim); 
        [rXtrain, Wr] = dimreductionFisherLDA_eig(Xtrain, alpha, classnum, reduceDim); 
        rXtest = Xtest*Wr;
        
    case 3 % PCA dimesionality reduction
        disp(['PCA dimesionality reduction: ' num2str(reduceDim, '%d')]);
        [rXtrain, Wr] = dimreductionPCA(Xtrain, classnum, reduceDim);
        rXtest = Xtest*Wr;
        
    otherwise 
        help classificationDemo;
end

switch clstype
    case 0  % knn classifier
        disp('use knn classifier');
        classlabel = testKNNClassifier(rXtrain, T, rXtest, K); 
        
    case 1  % linear classifier
        disp('use linear classifier');
        W = trainLinearClassifier(rXtrain, T, lamda);
        classlabel = testLinearClassifier(W, rXtest);
        
    case 2  % logistic regression
        disp('use logistic regression');
        W = trainLogisticClassifier(rXtrain, T);
        classlabel = testLogisticClassifier(W, rXtest);
        
    case 3  % svm classifier
        disp('use svm classifier');
        %W = trainSVMClassifier(rXtrain, T);
        %classlabel = testSVMClassifier(W, rXtest);
        
    otherwise
        help classificationDemo;
end

rate = Accuracy(classlabel, L);
avg = mean(rate);
disp('The accuracy rate on test data set: ');
disp(num2str([[0:9]' rate'*100], '#                 %d --> %.2f%%  '));
%disp(' ');
disp(['The mean accuracy rate: ' num2str(avg*100, '%.2f%%')]);
disp(' ');

end