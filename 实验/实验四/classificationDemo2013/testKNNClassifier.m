function classlabel = testKNNClassifier(X_train, T, X_test, K)
% testKNNClassifier Find the K neareat neighbours and predict the class label with certain confidence.
%    [idx, pred, prob] = knn_prob(X_train, T, X_test, K) finds K nearest neighbors in X_train for
%    each point in X_test.
% Input:
%    X_train: an MX-by-N training data matrix and X_test is an  MY-by-N test data matrix.
%             Rows of X_train and X_test correspond to observations and columns correspond to variables.
%          T: a column vector which contains the labels of all the samples in X.
%          K: the number of nearest neighbours.
% Output:
%    classlabel:  the predictive class labels for each sample in X_Test.

%    idx: an MY-by-K matrix each row of which is the index of the K neareast neighbors in X.
%    pred: an MY-by-1 column vector indicating the predictive class labels for each sample in Y.
%    prob: a column vector with each element indicating the confidence.

MY = size(X_test, 1);
[idx, D] = knnsearch(X_train, X_test, 'K', K);
[value L] = max(T,[],2);
idx = L(idx);
for i = 1: MY
    table = tabulate(idx(i, :));
    [prob(i, :), pred_idx] = max(table(:, 3));
    pred(i, :) = table(pred_idx, 1);    
end

classlabel = pred;

end