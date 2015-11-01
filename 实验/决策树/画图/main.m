clear all;
close all;
clc;

train = importdata('trainData.mat');

name = {'Age of the patient';'Spectacle prescription';'Astigmatic';'Tear production rate'};

matrix = decisiontree(train,name);