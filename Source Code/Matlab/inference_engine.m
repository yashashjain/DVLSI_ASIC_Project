function y = inference_engine(image,w10,w21)
    %Feed forward with fixed point
    a1 = image;
    z2 = a1*w10;
    z2_fix = fixed(z2,size(z2,1),size(z2,2)); %arguments are (matrix, row, column)
    
    a2 = ReLU(z2_fix); %passign through activation function
    a2_fix = fixed(a2,size(a2,1),size(a2,2));

    z3 = a2_fix*w21;
    z3_fix = fixed(z3,size(z3,1),size(z3,2)); %Output vector
    
    %Get the index of the maximum output
    [max_value,index] = max(z3_fix);
    y = index-1; %matlab indexes are from 1-10, to get 0-9, substract by 1

end