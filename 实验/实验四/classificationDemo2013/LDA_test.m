option = 2;
addpath(genpath('../'))

classnum = 10;
datanum_train = 1000;
datanum_test = 800;
datadim = 28*28;
lamda = 0.001; % regulization coeffient
sigma = 0.001; % threshold for LDA

disp(['Classnum: ' num2str(classnum, '%d')]);
disp(['data number for train: ' num2str(datanum_train, '%d')]);
disp(['data number for test: ' num2str(datanum_test, '%d')]);
disp(['data dimensions: ' num2str(datadim, '%d')]);
disp(' ');

[Xtrain, Xtest, T, L] = readData(classnum, datanum_train, datanum_test, datadim);
[v t] = max(T');


%linclass  = ClassificationDiscriminant.fit(Xtrain, t', 'DiscrimType','pseudoLinear',...
%    'SaveMemory','on','FillCoeffs','off');
%[classlabel score cost] = predict(linclass,Xtest);
%linclass  = ClassificationDiscriminant.fit(Xtrain, t', 'DiscrimType','diagLinear');
%[classlabel score cost] = predict(linclass,Xtest);
quadclass = ClassificationDiscriminant.fit(Xtrain, t', 'DiscrimType','pseudoQuadratic',...
    'SaveMemory','on','FillCoeffs','off');
[classlabel score cost] = predict(quadclass,Xtest);
% quadclass = ClassificationDiscriminant.fit(Xtrain, t', 'DiscrimType','diagQuadratic');
% [classlabel score cost] = predict(quadclass,Xtest);

rate = Accuracy(classlabel, L');
avg = mean(rate);
disp('The accuracy rate on test data set: ');
disp(num2str([[0:9]' rate'*100], '#                 %d --> %.2f%%  '));
%disp(' ');
disp(['The mean accuracy rate: ' num2str(avg*100, '%.2f%%')]);
disp(' ');
