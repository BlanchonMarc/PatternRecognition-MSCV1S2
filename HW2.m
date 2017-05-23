%% HOMEWORK 2

clear all; close all; clc;

%% PROBLEM 1

%Load the Training data
filename = 'spamTrain.txt'; 
delimiterIn = ',';
TrainData = importdata(filename,delimiterIn); %Import using a delimiter

%Load the TestLabels
filename = 'spamTestLabels.txt'; 
delimiterIn = ',';
spamTestLabels = importdata(filename,delimiterIn); %Import using a delimiter

%Load the TrainLabels
filename = 'spamTrainLabels.txt'; 
delimiterIn = ',';
TrainLabels = importdata(filename,delimiterIn); %Import using a delimiter

%Load the Test
filename = 'spamTest.txt'; 
delimiterIn = ',';
spamTest = importdata(filename,delimiterIn); %Import using a delimiter



%Sub Problem 1 Average Length
LengthUninCap = TrainData(55 , :); % extract from data the average length of Uninterrupted Capital Letters Sequence

LengthUninCap_Max = max(LengthUninCap); % Max of the sequence
LengthUninCap_Mean = mean (LengthUninCap); % Mean of the Sequence

%Sub Problem 2 Longest Length

LongLengthUninCap = TrainData(56 , :); % extract from data the longest length of  Uninterrupted Capital Letters Sequence

LongLengthUninCap_Max = max(LongLengthUninCap); % Max of the sequence
LongLengthUninCap_Mean = mean (LongLengthUninCap); % Mean of the Sequence

%Sub Problem 3 Pre-processing

% a
ZeroMeanUnitVar = (TrainData - repmat(mean(TrainData), size(TrainData,1), 1)) ./ repmat(std(TrainData), size(TrainData,1), 1);
%Normalization of matrix 0 mean and unit variance. 
%Usage of formula (x - x_mean) / var(x)
%Usage of repmat to replicate size of matrix with value of mean or var to
%avoid dimension errors

mean(ZeroMeanUnitVar);
var(ZeroMeanUnitVar);


% b 

TransformedMat = log(TrainData + 0.1);

% c

%Binarization using conditions on matrix, if element > 0 then convert to 1
BinarizedMat = TrainData;
BinarizedMat(BinarizedMat > 0) = 1;



%% Learning Training Feature Standardized

lambda = 0.1 : 0.01 : 0.2;

fprintf('Training with Standardized Features \n');

for i = 1 : length(lambda)
    [w,cost] = Optimize(ZeroMeanUnitVar, TrainLabels, zeros(size(ZeroMeanUnitVar,2),1), lambda(i));
    firstEstimation = predict()
end
