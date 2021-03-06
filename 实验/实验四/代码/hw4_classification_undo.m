clear all; close all; clc; 
%% ================================load data=============================== 
% Classification Problem: Is it a motobike or plane? (label 1 or 0)
% This data set include 2 classes of visual ojbects: motobike or plane. 
% The raw pixel of each image is used as input vector point x. Each row is a data point. 
% TrainData and TestData are training and testing samples with their 
% labels in TrainLabel and TestLabel respectively. 
load 'caltech101_2s.mat'; % including training and testing data; 
TrainData = double(TrainData); 
TrainLabel = double(TrainLabel);
TestData = double(TestData); 
TestLabel = double(TestLabel);

% display a subset of the training data; 
%idx = [450:513]; 
%DispDictionary(TrainData(idx, :)'); 

%fprintf('Classification accuracy: \n');
%% ************************KNN Classifier*********************************
% First, please using KNN to perform classification. In this section, you
% are required to compare the classification accuracies with different values of K. 
% Suggested values are [1 3 5 9];
%for K=[1 3 5 9]
for K=[1,3,5,9]
  
  %  [~,accuracy] = KNN(TrainData,TrainLabel,TestData,TestLabel,K);
 %   fprintf('KNN Classifier (K = %d):            %5.2f \n', K, accuracy);    
end





%% *********************************Linear Classifier***********************
% Please use Linear Classifier to perform classification. 
% Training the parameters W of linear classifier with respect to input X and T.
% add your code here. 

quadclass = fitcdiscr(TrainData, TrainLabel, 'discrimType', 'diagQuadratic', ...
                     'SaveMemory', 'on', 'FillCoeffs', 'off'); %diagQuadratic or pseudoQuadratic
classlabel = predict(quadclass, TestData);
idx = find(classlabel ~= TestLabel);
accuracy = (1-length(idx)/length(classlabel));

fprintf('Linear Classifier (DIY):           %5.2f \n', accuracy);


%% *********************************Fisher Linear Classifier***********************
% Please use Fisher Linear Classifier to perform classification. 
% Use matlab toolbox
%quadclass = fitcdiscr(TrainData, TrainLabel, 'discrimType', 'diagQuadratic', ...
%                     'SaveMemory', 'on', 'FillCoeffs', 'off'); %diagQuadratic or pseudoQuadratic
%classlabel = predict(quadclass, TestData);
%idx = find(classlabel ~= TestLabel);
%accuracy = (1-length(idx)/length(classlabel))*100.0;







%% *********************************SVM Classifier***********************
% Please use SVM Classifier to perform classification. 
% add your code here. 

SVMStruct = svmtrain(TrainData,TrainLabel);
Group = svmclassify(SVMStruct,TestData);

asum = sum(Group == TestLabel);

accuracy = asum / size(Group,1);

fprintf('(4).Support Vector Machine (MATLAB):   %5.2f%% \n', accuracy);