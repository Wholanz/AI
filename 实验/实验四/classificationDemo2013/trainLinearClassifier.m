function W = trainLinearClassifier(X, T, lamda)
%linearClassifier   Train the parameters W with respect to input X and T.
%   trainLinearClassifier(X, T, lamda) returns the learned parameters W which will be
%   used subsequently in the classification task. 
%   Input parameters:
%           X -- the original sample data 
%           T -- the labels
%       lamda -- the coefficient to control the reguralization term. 
%                The penalty is canceled if lamda = 0.    
%   trainLinearClassifier trains the parameters in the original input
%   space and chooses linear classifcation approach.
%
%   Code by: kuixion
%   Date: 04/15/2013

datadim = size(X, 2) + 1;
X = [ones(size(X, 1), 1), X]; % Adding the first column for w_0
W = (X'*X + lamda*eye(datadim))\X'*T;