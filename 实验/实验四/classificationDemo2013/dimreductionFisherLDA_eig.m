function [X_reduced, Wr] = dimreductionFisherLDA_eig(X, alpha, classnum, reduceDim)

datanum = size(X, 1);
cldatanum = datanum/classnum;
datadim = size(X, 2);

m = mean(X);
m_m = datanum*m'*m;
Xn_Xn = datanum*X'*X;
mk_mk = zeros(size(m_m));
for i = 1:classnum
    mk = mean(X((i-1)*cldatanum+1:i*cldatanum, :));
    mk_mk = mk_mk + cldatanum*mk'*mk;
end
Sw = Xn_Xn - mk_mk;
Sb = mk_mk - m_m;
Jw = (alpha*Sw+(1-alpha)*eye(datadim))\Sb;

[V,D] = eigs(Jw,reduceDim);
%[U, S, V] = svds(Jw, reduceDim);

Wr = V;
X_reduced = X*Wr;
end
