function [H_test,H_test_Relu,Ytest_hat,Ytest_hat_encoded]= ELM_test(X_test, parameters, hidden_neurons, Y_test)
% This function tests the ELM model

% Input description:
% X_test, Y_test: Testing data and label
% parameters: contain weight matrices

% Output desciption
% Ytest_hat : predicted one-hot encoded output for fixed point
% Ytest_hat1 : predicted one-hot encoded output  for floating point

%Save test image data in 32 nit format.
fileXtest = fopen('ELM_test_accuracy_493_images.txt', 'w');
for i=1:1:493
    k = 1;
    fprintf(fileXtest,'\n reset = 0;\n #2 reset = 1; \n #10 reset = 0; \n');
    y1 = Y_test(i,:);
    y1 = num2str(y1);
    y1 = y1(y1 ~= ' ');
    for t = 1:10
        if(y1(t)=='1')
           fprintf(fileXtest,"true_image = 4'd%d; \n", (t-1));
        end
    end
    for j=1:1:8
        x1 = X_test(i,(k:32*j));
        x1 = num2str(x1);
        x1 = x1(x1 ~= ' ');
        k = k+32;
        if(j==1)
            fprintf(fileXtest,"input_32bit_image_data = 32'b%s; \n", x1);
   
        end
        if(j >1)
            fprintf(fileXtest,"#10 input_32bit_image_data = 32'b%s; \n", x1);
        end
    end
            
   fprintf(fileXtest,'#846280;');
end
fclose(fileXtest);

% hidden layer output
x = fixed(X_test*parameters.W10, 493, hidden_neurons);
%x1 = X_test*parameters1.W101;
H_test = x;
%H_test1 = x1;
H_test_Relu = ReLU(x);
%H_test_Relu1 = ReLU(x1);

% prediction from output layer 
y = fixed(H_test_Relu*parameters.W21, 493, 10);
%y1 = H_test_Relu1*parameters1.W211;

Ytest_hat = y;
%Ytest_hat1 = y1;
Ytest_hat_encoded= (Ytest_hat==max(Ytest_hat,[],2));
%Ytest_hat_encoded1= (Ytest_hat1==max(Ytest_hat1,[],2));

end

