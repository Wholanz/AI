load Xtrain
load Xtest

r1 = Xtrain(1,:)
r2 = Xtrain(2,:)
r3 = Xtrain(3,:)
r4 = Xtrain(4,:)
r5 = Xtrain(5,:)

newM = [r2;r4;r5;r1;r3]'

sigm = cov(newM)

sigmaa = sigm(1:3,1:3)
sigmab = sigm(1:3,4:5)
sigmba = sigm(4:5,1:3)
sigmbb = sigm(4:5,4:5)

invsigmbb = inv(sigmbb)


ua = [mean(r2);mean(r4);mean(r5)]
ub = [mean(r1);mean(r3)]

testXb = Xtest

for i=1:10
 ua2bsum(:,i) = ua + sigmab * invsigmbb *(testXb(:,i) - ub)
end

sigma2b = sigmaa - sigmab * invsigmbb * sigmba

ua2b = roundn(ua2bsum, -2)
sigma2b = roundn(sigma2b, -2)