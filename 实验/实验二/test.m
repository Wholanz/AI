clear all
close all
clc

fprintf('Loading data...\n');

load USPS_train
load USPS_test

fprintf('Loading complete!\n');

train_data = data_train;
test_data = data_test;
train_label = label_train;
test_label = label_test;

fprintf('Classifying and calculating accuracy...\n');

fprintf('\n\n\nTest for k=5 begin....\n\n\n');

k = 5;
[class,accuracy] = classification(train_data,train_label,test_data,test_label,k);
%[class,accuracy]=knn_my(k, data_train, label_train, data_test, label_test);
save k5 class
save k5c accuracy

fprintf('\n\n\nTest for k=5 complete! The accuracy is %d\n\n\n', accuracy);

fprintf('\n\n\nTest for k=10 begin....\n\n\n');

k = 10;
[class,accuracy] = classification(train_data,train_label,test_data,test_label,k);
%[class,accuracy]=knn_my(k, data_train, label_train, data_test, label_test);
save k10 class
save k10c accuracy

fprintf('\n\n\nTest for k=10 complete!The accuracy is %d\n\n\n',accuracy);

fprintf('\n\n\nTest for k=20 begin....\n\n\n');

k = 20;
[class,accuracy] = classification(data_train,label_train,data_test,label_test,k);
%[class,accuracy]=knn_my(k, data_train, label_train, data_test, label_test);
save k20 class
save k20c accuracy

fprintf('\n\n\nTest for k=20 complete!The accuracy is %d\n\n\n',accuracy);

fprintf('Calculating complete!\n');

