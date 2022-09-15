function f = fixed(x,row,col)
    %function for converting the floaing point data into fixed format 
    f = zeros(row,col);
    for i = 1:1:row
        f(i,:) = fi(x(i,:),1,21,15);   %each row data converted into fixed point
    end

end

