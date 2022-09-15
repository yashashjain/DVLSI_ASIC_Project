filerand = fopen('pattern_rom.v', 'w');

fprintf(filerand,'\n `timescale 1ns/1ps \n module pattern_rom (adrs_clm,out); \n input [17:0] adrs_clm; \n output reg [0:5] out; \n always@(*) begin \n case({adrs_clm}) \n');

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

fprintf(filerand,'\n endcase \n end \n endmodule');

fclose(filerand);
