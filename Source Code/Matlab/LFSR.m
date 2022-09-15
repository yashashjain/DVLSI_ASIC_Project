%% LFSR Implementation
% 16-bit LFSR X^16 + X^14 + X^13 + X^11 + 1
%%

function new_random  = LFSR(LFSR_row,LFSR_col)


    lfsr = [0,0,1,1,0,1,1,1,1,1,0,1,1,1,0,1]; %inital seed
   
    new_random = zeros(LFSR_row,LFSR_col);
    %column wise store the lfsr generated values.
    for i = 1:1:LFSR_col
        for j = 1:1:LFSR_row
            if(j==1 && i==1)
               %disp('no change'); 
            else
                lfsr = xor(lfsr,(circshift(lfsr,[0,1]))); % cyclic shift and xor for getting randomness
            end
            string = int2str(lfsr);
            string = string(string ~=' ');  %removing spaces in string
            new_random (j,i) = (binary2dec(string));
            x=lfsr;
            r = xor(lfsr(11), lfsr(13));
            s = xor(r, lfsr(14));
            lfsr(1) = xor(s, lfsr(16));
            lfsr(2:16) = x(1:15);  %updated LFSR (after feedback)
        end
    end
end

