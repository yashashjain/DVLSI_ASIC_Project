% function [parameters,parameters1, Ytrain_hat, Ytrain_hat1] = ELM_train(X_train,Y_train,hidden_neurons)
function [parameters, Ytrain_hat] = ELM_train(X_train,Y_train,hidden_neurons)
% This function trains the ELM model

% Input description:
% X_train, Y_train: Training data and label
% hidden_neurons: #neurons in hidden layer

% Output desciption
% parameters: stores the weight matrices
% Ytrain_hat : predicted one-hot encoded output 

input_nodes =  size(X_train,2);

% input to hidden layer weight random initialization 
W10= LFSR(input_nodes,hidden_neurons);
%W101 = W10;
W10 = fixed(W10,input_nodes,hidden_neurons);
parameters.W10 = W10;
%parameters1.W101 = W101;

% hidden layer output
z = fixed(X_train*W10,1100, hidden_neurons);
%z1 = X_train*W101;
H = ReLU(z);
%H1 = ReLU(z1);

% hidden to output layer weight
W21 = pinv(H)*Y_train;
%floating point
%W211 = pinv(H1)*Y_train;
%parameters1.W211 = W211;
output_node = 10;
W21 = fixed(W21,hidden_neurons,output_node);
parameters.W21 = W21;

%save W21 coliumn wise for using rom in verilog 

a1 = fi((W21(:,1)),1,21,15) ;
a2 = fi((W21(:,2)),1,21,15) ;
a3 = fi((W21(:,3)),1,21,15) ;
a4 = fi((W21(:,4)),1,21,15) ;
a5 = fi((W21(:,5)),1,21,15) ;
a6 = fi((W21(:,6)),1,21,15) ;
a7 = fi((W21(:,7)),1,21,15) ;
a8 = fi((W21(:,8)),1,21,15) ;
a9= fi((W21(:,9)),1,21,15) ;
a10 = fi((W21(:,10)),1,21,15) ;

filerand = fopen('pattern_rom.v', 'w');
fileW1 = fopen('w21_rom_c1.v', 'w');
fileW2 = fopen('w21_rom_c2.v', 'w');
fileW3 = fopen('w21_rom_c3.v', 'w');
fileW4 = fopen('w21_rom_c4.v', 'w');
fileW5 = fopen('w21_rom_c5.v', 'w');
fileW6 = fopen('w21_rom_c6.v', 'w');
fileW7 = fopen('w21_rom_c7.v', 'w');
fileW8 = fopen('w21_rom_c8.v', 'w');
fileW9 = fopen('w21_rom_c9.v', 'w');
fileW10 = fopen('w21_rom_c10.v', 'w');

y1 = bin(a1);
y2 = bin(a2);
y3 = bin(a3);
y4 = bin(a4);
y5 = bin(a5);
y6 = bin(a6);
y7 = bin(a7);
y8 = bin(a8);
y9 = bin(a9);
y10 = bin(a10);

fprintf(filerand,'\n `timescale 1ns/1ps \n module pattern_rom (adrs_clm,out); \n input [17:0] adrs_clm; \n output reg [0:5] out; \n always@(*) begin \n case({adrs_clm}) \n');
fprintf(fileW1,'\n `timescale 1ns/10ps \n module w21_rom_c1(adrs_clm,out); \n input [8:0] adrs_clm; \n output reg [20:0] out; \n always@(*) begin \n case({adrs_clm}) \n');
fprintf(fileW2,'\n `timescale 1ns/10ps \n module w21_rom_c2(adrs_clm,out); \n input [8:0] adrs_clm; \n output reg [20:0] out; \n always@(*) begin \n case({adrs_clm}) \n');
fprintf(fileW3,'\n `timescale 1ns/10ps \n module w21_rom_c3(adrs_clm,out); \n input [8:0] adrs_clm; \n output reg [20:0] out; \n always@(*) begin \n case({adrs_clm}) \n');
fprintf(fileW4,'\n `timescale 1ns/10ps \n module w21_rom_c4(adrs_clm,out); \n input [8:0] adrs_clm; \n output reg [20:0] out; \n always@(*) begin \n case({adrs_clm}) \n');
fprintf(fileW5,'\n `timescale 1ns/10ps \n module w21_rom_c5(adrs_clm,out); \n input [8:0] adrs_clm; \n output reg [20:0] out; \n always@(*) begin \n case({adrs_clm}) \n');
fprintf(fileW6,'\n `timescale 1ns/10ps \n module w21_rom_c6(adrs_clm,out); \n input [8:0] adrs_clm; \n output reg [20:0] out; \n always@(*) begin \n case({adrs_clm}) \n');
fprintf(fileW7,'\n `timescale 1ns/10ps \n module w21_rom_c7(adrs_clm,out); \n input [8:0] adrs_clm; \n output reg [20:0] out; \n always@(*) begin \n case({adrs_clm}) \n');
fprintf(fileW8,'\n `timescale 1ns/10ps \n module w21_rom_c8(adrs_clm,out); \n input [8:0] adrs_clm; \n output reg [20:0] out; \n always@(*) begin \n case({adrs_clm}) \n');
fprintf(fileW9,'\n `timescale 1ns/10ps \n module w21_rom_c9(adrs_clm,out); \n input [8:0] adrs_clm; \n output reg [20:0] out; \n always@(*) begin \n case({adrs_clm}) \n');
fprintf(fileW10,'\n `timescale 1ns/10ps \n module w21_rom_c10(adrs_clm,out); \n input [8:0] adrs_clm; \n output reg [20:0] out; \n always@(*) begin \n case({adrs_clm}) \n');

for i = 1:1:100000
    str = '0';
    new_random = randperm(3);
    for j = 1:1:4
        a = fi(new_random(j)-1, 0, 2, 0);
        g = bin(a);
        str = append(str,g);
    end
    b = fi(i-1,0,17,0);
    x = bin(b);
    y = str(2:3*2);
    x = convertCharsToStrings(x);
    
    fprintf(filerand,"17'b%s: out <= 6'b%s; \n", x,convertCharsToStrings(y));
    
    
end

for i = 1:1:hidden_neurons
    b = fi(i-1,0,9,0);                                            
    x = bin(b);
    x = convertCharsToStrings(x);
    
    fprintf(fileW1,"9'b%s: out <= 21'b%s; \n", x,convertCharsToStrings(y1(i,:)));
    fprintf(fileW2,"9'b%s: out <= 21'b%s; \n", x,convertCharsToStrings(y2(i,:)));
    fprintf(fileW3,"9'b%s: out <= 21'b%s; \n", x,convertCharsToStrings(y3(i,:)));
    fprintf(fileW4,"9'b%s: out <= 21'b%s; \n", x,convertCharsToStrings(y4(i,:)));
    fprintf(fileW5,"9'b%s: out <= 21'b%s; \n", x,convertCharsToStrings(y5(i,:)));
    fprintf(fileW6,"9'b%s: out <= 21'b%s; \n", x,convertCharsToStrings(y6(i,:)));
    fprintf(fileW7,"9'b%s: out <= 21'b%s; \n", x,convertCharsToStrings(y7(i,:)));
    fprintf(fileW8,"9'b%s: out <= 21'b%s; \n", x,convertCharsToStrings(y8(i,:)));
    fprintf(fileW9,"9'b%s: out <= 21'b%s; \n", x,convertCharsToStrings(y9(i,:)));
    fprintf(fileW10,"9'b%s: out <= 21'b%s; \n", x,convertCharsToStrings(y10(i,:)));
    
end
fprintf(filerand,'\n endcase \n end \n endmodule');
fprintf(fileW1,'\n endcase \n end \n endmodule');
fprintf(fileW2,'\n endcase \n end \n endmodule');
fprintf(fileW3,'\n endcase \n end \n endmodule');
fprintf(fileW4,'\n endcase \n end \n endmodule');
fprintf(fileW5,'\n endcase \n end \n endmodule');
fprintf(fileW6,'\n endcase \n end \n endmodule');
fprintf(fileW7,'\n endcase \n end \n endmodule');
fprintf(fileW8,'\n endcase \n end \n endmodule');
fprintf(fileW9,'\n endcase \n end \n endmodule');
fprintf(fileW10,'\n endcase \n end \n endmodule');

fclose(filerand);
fclose(fileW1);
fclose(fileW2);
fclose(fileW3);
fclose(fileW4);
fclose(fileW5);
fclose(fileW6);
fclose(fileW7);
fclose(fileW8);
fclose(fileW9);
fclose(fileW10);

% prediction from output layer
%Ytrain_hat1 = H1*W211;
Ytrain_hat = fixed(H*W21, 1100, 10);
Ytrain_hat=(Ytrain_hat==max(Ytrain_hat,[],2));
%Ytrain_hat1=(Ytrain_hat1==max(Ytrain_hat1,[],2));
end