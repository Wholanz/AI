%there are two ways to reduce both train and test data, one is to settle
%down the dimension and then reduce seperately, the other is to settle down
%precision and then reduce spontaneously

reduceDim = 9;

path = mfilename('fullpath');
ind = strfind(path, '\');
path = path(1:ind(end));
savaPath = strcat(path, 'data\mnist_PCA.mat');
path = strcat(path, 'data\mnist_all.mat');

load(path);
alldata = train0;
for i = 2:10
    varname = strcat('train',num2str(i-1));
    alldata = [alldata; eval(varname)];
end

m = mean(alldata);
M = m'*ones(1,length(alldata));
dataAdjust = double(alldata) - M';
covariance = cov(dataAdjust);
[V,D] = eigs(covariance,reduceDim);
Wr = V;

train0 = double(train0)*Wr;
save(savaPath, 'train0');
train1 = double(train1)*Wr;
save(savaPath, 'train1','-append');
train2 = double(train2)*Wr;
save(savaPath, 'train2','-append');
train3 = double(train3)*Wr;
save(savaPath, 'train3','-append');
train4 = double(train4)*Wr;
save(savaPath, 'train4','-append');
train5 = double(train5)*Wr;
save(savaPath, 'train5','-append');
train6 = double(train6)*Wr;
save(savaPath, 'train6','-append');
train7 = double(train7)*Wr;
save(savaPath, 'train7','-append');
train8 = double(train8)*Wr;
save(savaPath, 'train8','-append');
train9 = double(train9)*Wr;
save(savaPath, 'train9','-append');

for i =1:10
    varname = strcat('test', num2str(i-1));
    alldata = [alldata;eval(varname)];
end

m = mean(alldata);
M = m'*ones(1,length(alldata));
dataAdjust = double(alldata) - M';
covariance = cov(dataAdjust);
[V,D] = eigs(covariance,reduceDim);
Wr = V;

test0 = double(test0)*Wr;
save(savaPath, 'test0','-append');
test1 = double(test1)*Wr;
save(savaPath, 'test1','-append');
test2 = double(test2)*Wr;
save(savaPath, 'test2','-append');
test3 = double(test3)*Wr;
save(savaPath, 'test3','-append');
test4 = double(test4)*Wr;
save(savaPath, 'test4','-append');
test5 = double(test5)*Wr;
save(savaPath, 'test5','-append');
test6 = double(test6)*Wr;
save(savaPath, 'test6','-append');
test7 = double(test7)*Wr;
save(savaPath, 'test7','-append');
test8 = double(test8)*Wr;
save(savaPath, 'test8','-append');
test9 = double(test9)*Wr;
save(savaPath, 'test9','-append');