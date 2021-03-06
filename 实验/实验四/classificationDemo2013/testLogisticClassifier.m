function classlabel = testLogisticClassifier(W, X)
%testLogisticClassifier   classsify an input with the help the trained parameter W.
%   x is an input vector, and this function is going to calculate the y
%   accordingly and then make the category decision on x.
%
%   testLogisticClassifier classify the input vector in its original sample space and
%   uses 1-of-K coding scheme while make the classification decision based
%   on the largest y(i).
%
%   Code by: kuixiong
%   Date: 04/18/2013

y = mnrval(W, X);
[ymax classlabel] = max(y');

end