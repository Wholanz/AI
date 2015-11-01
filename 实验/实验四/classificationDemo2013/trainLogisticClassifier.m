function W = trainLogisticClassifier(Xtrain, T)
%trainLogisticClassifier   Train the parameters W with respect to input X and Y.
%   trainClassifier1(X, Y) returns the learned parameters W which will be
%   used subsequently in the classification task. X is the original sample
%   data and Y is the labels accordingly.
%   
%   trainLogisticClassifier trains the parameters in the original input
%   sapce and chooses logistic regression approach.
%
%   Code by: kuixion
%   Date: 04/17/2013

W = mnrfit(Xtrain, T, 'model', 'nominal', 'interactions', 'on');

end