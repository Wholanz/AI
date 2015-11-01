function [X_reduced, Wr] = dimreductionFisherLDA(X, alpha, classnum, reduceDim)
%dimreductionFisherLDA  
%
%   Code by: kuixion
%   Date: 04/15/2013

datanum = size(X, 1)/classnum;
datadim = size(X, 2);

mk = zeros(classnum, datadim);
Sw = zeros(datadim, datadim);
for i = 1:classnum
    SubX = X((i-1)*datanum+1:i*datanum, :);
    mk(i, :) = sum(SubX)/datanum;
    for j = 1:datanum
        Sw = Sw+(SubX(j, :)-mk(i,:))'*(SubX(j, :)-mk(i,:));
    end
end

m = sum(mk)/classnum;
mk = mk'; m = m';
Sb = zeros(datadim, datadim);
for i=1:classnum
    Sb = Sb + datanum*(mk(i)-m)*(mk(i)-m)';
end
Jw = (alpha*Sw+(1-alpha)*eye(datadim))\Sb;

%[V, D] = eigs(Jw, reduceDim);
[U, S, V] = svds(Jw, reduceDim);

Wr = V;
X_reduced = X*Wr;
end
