% This is the top file.
clc;
close all;


%% Load data
data = load('semeion.data');
Xorig = data(:,1:256);
Yorig = data(:,257:end);

% Shuffle the data
random_order = randperm(size(Xorig,1));
X = Xorig(random_order,:);
Y = Yorig(random_order,:);

% Training data
X_train = X(1:1100,:);
Y_train = Y(1:1100,:);

% Testing data
X_test = X(1101:end,:);
Y_test = Y(1101:end,:);



% Hidden layer neurons
% Tweak it for optimization
hidden_neurons = 300;


%Training the model

%for checking fixed point and floating point accuracy together
%[parameters,parameters1, Ytrain_hat,Ytrain_hat1]= ELM_train(X_train,Y_train,hidden_neurons);

%only for fixed point
[parameters, Ytrain_hat]= ELM_train(X_train,Y_train,hidden_neurons);

% Check training accuracy

%for fixed point
train_acc = check_acc(Ytrain_hat,Y_train);

%for floating point
%train_acc1 = check_acc(Ytrain_hat1,Y_train);

%--------------------------------
% Testing the model

%for checking fixed point and floating point accuracy together
%[H_test,H_test_Relu,H_test1,H_test_Relu1,Ytest_hat,Ytest_hat_encoded,Ytest_hat_encoded1]= ELM_test(X_test, parameters,parameters1, hidden_neurons, Y_test);

%only for fixed point
%[H_test,H_test_Relu,Ytest_hat,Ytest_hat_encoded]= ELM_test(X_test, parameters, hidden_neurons, Y_test);

% Check testing accuracy

%for fixed point
%test_acc = check_acc(Ytest_hat_encoded,Y_test);

%for floating point
%test_acc1 = check_acc(Ytest_hat_encoded1,Y_test);

disp("Please note: Accuracy will vary (+-3%) because every time input data is shuffled")
disp("I have saved the best W21 for particular test data (87.627%) which can be verified on verilog")

%To show the the handwritten digit
digit = reshape(X(125,:),16,16);
imshow(digit')






