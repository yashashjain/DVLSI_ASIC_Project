function rand_n = binary2dec(string)
    random_bit = string;
    sum = 0;
    if (random_bit(1) == '0') %positive value
        for i = 2:16
            if(random_bit(i)=='1')
                sum = sum+2^(-i+1); %taking last 15 bit for fraction part and converting into decimal
            end
        end
        rand_n = sum;
    
    else
         z = random_bit(2:16);
         x = two_comp(z); % 2's complement
         for i = 1:15
            if(x(i)=='1')
                sum = sum+2^(-i);
            end
         end
        rand_n = -sum; %negative value because MSB of LFSR is 1
    end
end

