function [X_reduced, Wr] = dimreductionPCA(X, classnum, reduceDim)
%dimreductionPCA   Train the parameters W with respect to input X and Y.
%   trainClassifier2() returns the learned parameters W which will be
%   used subsequently in the classification task. X is the original sample
%   data and Y is the labels accordingly.
%   
%   dimreductionPCA trains the parameters in the reduced space using PCA
%   and chooses linear classifcation approach.
%
%   Code by: kuixion
%   Date: 04/17/2013
datanum = size(X,1)/classnum;

m = mean(X);
M = m'*ones(1, datanum*classnum);
dataAdjust = X - M';     % adjust data by substracting mean
covariance = cov(dataAdjust);
[V, D] = eigs(covariance, reduceDim);   % get the reduceDim-th - largest - eigen value - eigenector
Wr = V;
X_reduced = dataAdjust*Wr;  % retain reduced data

end