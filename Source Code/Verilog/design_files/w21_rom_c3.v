
 `timescale 1ns/10ps 
 module w21_rom_c3(adrs_clm,out); 
 input [8:0] adrs_clm; 
 output reg [20:0] out; 
 always@(*) begin 
 case({adrs_clm}) 
9'b000000000: out <= 21'b111111111111111100001; 
9'b000000001: out <= 21'b000000000001000001000; 
9'b000000010: out <= 21'b111111111111101101010; 
9'b000000011: out <= 21'b111111111111111011111; 
9'b000000100: out <= 21'b000000000000100000011; 
9'b000000101: out <= 21'b111111111111110100001; 
9'b000000110: out <= 21'b000000000000010000101; 
9'b000000111: out <= 21'b000000000000110111111; 
9'b000001000: out <= 21'b111111111111111111111; 
9'b000001001: out <= 21'b000000000001100010000; 
9'b000001010: out <= 21'b111111111111100101110; 
9'b000001011: out <= 21'b000000000000010001011; 
9'b000001100: out <= 21'b111111111111101111010; 
9'b000001101: out <= 21'b000000000000100010100; 
9'b000001110: out <= 21'b111111111111111001010; 
9'b000001111: out <= 21'b111111111111110011110; 
9'b000010000: out <= 21'b111111111111001001111; 
9'b000010001: out <= 21'b000000000000001011101; 
9'b000010010: out <= 21'b111111111111110101101; 
9'b000010011: out <= 21'b111111111111000110100; 
9'b000010100: out <= 21'b111111111111101001001; 
9'b000010101: out <= 21'b000000000000100000001; 
9'b000010110: out <= 21'b111111111111111110011; 
9'b000010111: out <= 21'b111111111111111001111; 
9'b000011000: out <= 21'b111111111111110100111; 
9'b000011001: out <= 21'b000000000000001110100; 
9'b000011010: out <= 21'b000000000000011010011; 
9'b000011011: out <= 21'b111111111110110001111; 
9'b000011100: out <= 21'b000000000000000011011; 
9'b000011101: out <= 21'b111111111111111001000; 
9'b000011110: out <= 21'b111111111111111111000; 
9'b000011111: out <= 21'b111111111111010101100; 
9'b000100000: out <= 21'b111111111111110100001; 
9'b000100001: out <= 21'b000000000000000100101; 
9'b000100010: out <= 21'b000000000000011010110; 
9'b000100011: out <= 21'b000000000001001000000; 
9'b000100100: out <= 21'b111111111111100010111; 
9'b000100101: out <= 21'b111111111111111000110; 
9'b000100110: out <= 21'b111111111111010011111; 
9'b000100111: out <= 21'b111111111111100111000; 
9'b000101000: out <= 21'b000000000000010000100; 
9'b000101001: out <= 21'b000000000000000011110; 
9'b000101010: out <= 21'b000000000000010010101; 
9'b000101011: out <= 21'b000000000001011010111; 
9'b000101100: out <= 21'b000000000000000011010; 
9'b000101101: out <= 21'b000000000001011101100; 
9'b000101110: out <= 21'b111111111111101101000; 
9'b000101111: out <= 21'b000000000000000110001; 
9'b000110000: out <= 21'b111111111111101010111; 
9'b000110001: out <= 21'b111111111111100111000; 
9'b000110010: out <= 21'b000000000000100011111; 
9'b000110011: out <= 21'b000000000001011010101; 
9'b000110100: out <= 21'b111111111111010100110; 
9'b000110101: out <= 21'b111111111111110000101; 
9'b000110110: out <= 21'b111111111111100110100; 
9'b000110111: out <= 21'b111111111111010010100; 
9'b000111000: out <= 21'b111111111111111010110; 
9'b000111001: out <= 21'b111111111111110101010; 
9'b000111010: out <= 21'b000000000000000111001; 
9'b000111011: out <= 21'b000000000000001011100; 
9'b000111100: out <= 21'b111111111111110011101; 
9'b000111101: out <= 21'b111111111111000001001; 
9'b000111110: out <= 21'b111111111111011011100; 
9'b000111111: out <= 21'b111111111111111110101; 
9'b001000000: out <= 21'b111111111111110100011; 
9'b001000001: out <= 21'b000000000000000101111; 
9'b001000010: out <= 21'b000000000000010010001; 
9'b001000011: out <= 21'b111111111111111111101; 
9'b001000100: out <= 21'b000000000000000000010; 
9'b001000101: out <= 21'b111111111111110111001; 
9'b001000110: out <= 21'b000000000000100001101; 
9'b001000111: out <= 21'b111111111111010011111; 
9'b001001000: out <= 21'b111111111111111001001; 
9'b001001001: out <= 21'b000000000000001111111; 
9'b001001010: out <= 21'b000000000000001010011; 
9'b001001011: out <= 21'b000000000000001010101; 
9'b001001100: out <= 21'b000000000000000111000; 
9'b001001101: out <= 21'b000000000000010100111; 
9'b001001110: out <= 21'b111111111111111110100; 
9'b001001111: out <= 21'b000000000000010100111; 
9'b001010000: out <= 21'b111111111111111110010; 
9'b001010001: out <= 21'b000000000000100011000; 
9'b001010010: out <= 21'b000000000000010100101; 
9'b001010011: out <= 21'b000000000000001110011; 
9'b001010100: out <= 21'b111111111111010101001; 
9'b001010101: out <= 21'b111111111111101100010; 
9'b001010110: out <= 21'b111111111111010001110; 
9'b001010111: out <= 21'b000000000000011010110; 
9'b001011000: out <= 21'b111111111111011000000; 
9'b001011001: out <= 21'b000000000000000010010; 
9'b001011010: out <= 21'b000000000000001111010; 
9'b001011011: out <= 21'b111111111110001101011; 
9'b001011100: out <= 21'b000000000000110011000; 
9'b001011101: out <= 21'b000000000000001000110; 
9'b001011110: out <= 21'b000000000000101110111; 
9'b001011111: out <= 21'b111111111111111111000; 
9'b001100000: out <= 21'b111111111111100100101; 
9'b001100001: out <= 21'b000000000000101100100; 
9'b001100010: out <= 21'b111111111111111111010; 
9'b001100011: out <= 21'b111111111111010011011; 
9'b001100100: out <= 21'b111111111111011100001; 
9'b001100101: out <= 21'b111111111111010101111; 
9'b001100110: out <= 21'b111111111111101101000; 
9'b001100111: out <= 21'b111111111111011111010; 
9'b001101000: out <= 21'b000000000000001010011; 
9'b001101001: out <= 21'b111111111111010010010; 
9'b001101010: out <= 21'b111111111111110010101; 
9'b001101011: out <= 21'b111111111111110010000; 
9'b001101100: out <= 21'b000000000000000010001; 
9'b001101101: out <= 21'b000000000000000001101; 
9'b001101110: out <= 21'b000000000000101110101; 
9'b001101111: out <= 21'b000000000000011010101; 
9'b001110000: out <= 21'b111111111111110100111; 
9'b001110001: out <= 21'b000000000000001111100; 
9'b001110010: out <= 21'b000000000000000001000; 
9'b001110011: out <= 21'b000000000000000010111; 
9'b001110100: out <= 21'b111111111111111001111; 
9'b001110101: out <= 21'b111111111111110001001; 
9'b001110110: out <= 21'b000000000000000000011; 
9'b001110111: out <= 21'b111111111111100010010; 
9'b001111000: out <= 21'b000000000000000100011; 
9'b001111001: out <= 21'b000000000000010111101; 
9'b001111010: out <= 21'b111111111111111100101; 
9'b001111011: out <= 21'b000000000001110000111; 
9'b001111100: out <= 21'b000000000000001011001; 
9'b001111101: out <= 21'b000000000000011101100; 
9'b001111110: out <= 21'b111111111111111101111; 
9'b001111111: out <= 21'b111111111111100110010; 
9'b010000000: out <= 21'b000000000000011000001; 
9'b010000001: out <= 21'b111111111110100110000; 
9'b010000010: out <= 21'b111111111111111111110; 
9'b010000011: out <= 21'b111111111111101111101; 
9'b010000100: out <= 21'b000000000000000111011; 
9'b010000101: out <= 21'b000000000000001110101; 
9'b010000110: out <= 21'b000000000000100011100; 
9'b010000111: out <= 21'b000000000000011111011; 
9'b010001000: out <= 21'b000000000000000011111; 
9'b010001001: out <= 21'b111111111111100010010; 
9'b010001010: out <= 21'b000000000000000011101; 
9'b010001011: out <= 21'b000000000000010110101; 
9'b010001100: out <= 21'b111111111111110001111; 
9'b010001101: out <= 21'b111111111110011010011; 
9'b010001110: out <= 21'b000000000000001001111; 
9'b010001111: out <= 21'b111111111111100111110; 
9'b010010000: out <= 21'b111111111111101010010; 
9'b010010001: out <= 21'b000000000000000111110; 
9'b010010010: out <= 21'b000000000000011011111; 
9'b010010011: out <= 21'b000000000000110100111; 
9'b010010100: out <= 21'b000000000000001010110; 
9'b010010101: out <= 21'b000000000000000111000; 
9'b010010110: out <= 21'b000000000000000001100; 
9'b010010111: out <= 21'b000000000000010101011; 
9'b010011000: out <= 21'b000000000001001101011; 
9'b010011001: out <= 21'b111111111110100100010; 
9'b010011010: out <= 21'b000000000000000100011; 
9'b010011011: out <= 21'b000000000000010001111; 
9'b010011100: out <= 21'b111111111111011101000; 
9'b010011101: out <= 21'b111111111111110011110; 
9'b010011110: out <= 21'b111111111111010010000; 
9'b010011111: out <= 21'b000000000000100101001; 
9'b010100000: out <= 21'b111111111111111010000; 
9'b010100001: out <= 21'b111111111111011001111; 
9'b010100010: out <= 21'b111111111111110101000; 
9'b010100011: out <= 21'b111111111111010000100; 
9'b010100100: out <= 21'b111111111111110110001; 
9'b010100101: out <= 21'b111111111111011001011; 
9'b010100110: out <= 21'b000000000000011100111; 
9'b010100111: out <= 21'b111111111111111101000; 
9'b010101000: out <= 21'b111111111111011011101; 
9'b010101001: out <= 21'b111111111111110010011; 
9'b010101010: out <= 21'b111111111111011110100; 
9'b010101011: out <= 21'b000000000000101111101; 
9'b010101100: out <= 21'b111111111111100111111; 
9'b010101101: out <= 21'b000000000000000111011; 
9'b010101110: out <= 21'b111111111111101111111; 
9'b010101111: out <= 21'b000000000001011001000; 
9'b010110000: out <= 21'b000000000000000101001; 
9'b010110001: out <= 21'b111111111110001111010; 
9'b010110010: out <= 21'b000000000000001111010; 
9'b010110011: out <= 21'b111111111111101000010; 
9'b010110100: out <= 21'b000000000000010101100; 
9'b010110101: out <= 21'b000000000000011101001; 
9'b010110110: out <= 21'b000000000000111100101; 
9'b010110111: out <= 21'b111111111111101101110; 
9'b010111000: out <= 21'b000000000000100011010; 
9'b010111001: out <= 21'b000000000000100011101; 
9'b010111010: out <= 21'b000000000000101111101; 
9'b010111011: out <= 21'b000000000000011101100; 
9'b010111100: out <= 21'b000000000000001100010; 
9'b010111101: out <= 21'b000000000000111011110; 
9'b010111110: out <= 21'b000000000000000001110; 
9'b010111111: out <= 21'b111111111111001010110; 
9'b011000000: out <= 21'b111111111111100001110; 
9'b011000001: out <= 21'b111111111111001111110; 
9'b011000010: out <= 21'b000000000000010011100; 
9'b011000011: out <= 21'b000000000000011110011; 
9'b011000100: out <= 21'b111111111111000100010; 
9'b011000101: out <= 21'b000000000000000010010; 
9'b011000110: out <= 21'b111111111111110101001; 
9'b011000111: out <= 21'b111111111111000111101; 
9'b011001000: out <= 21'b000000000000100110001; 
9'b011001001: out <= 21'b000000000000001010111; 
9'b011001010: out <= 21'b111111111111100111010; 
9'b011001011: out <= 21'b111111111111101000101; 
9'b011001100: out <= 21'b000000000000000101110; 
9'b011001101: out <= 21'b111111111111110111000; 
9'b011001110: out <= 21'b111111111111110001010; 
9'b011001111: out <= 21'b111111111101101011011; 
9'b011010000: out <= 21'b000000000000000000110; 
9'b011010001: out <= 21'b000000000000010101101; 
9'b011010010: out <= 21'b111111111111101000110; 
9'b011010011: out <= 21'b000000000001010010110; 
9'b011010100: out <= 21'b111111111111110100010; 
9'b011010101: out <= 21'b000000000011000011110; 
9'b011010110: out <= 21'b000000000000000010000; 
9'b011010111: out <= 21'b111111111111100110110; 
9'b011011000: out <= 21'b000000000000001100110; 
9'b011011001: out <= 21'b000000000000011101100; 
9'b011011010: out <= 21'b111111111111101000101; 
9'b011011011: out <= 21'b000000000000000000100; 
9'b011011100: out <= 21'b000000000000010100011; 
9'b011011101: out <= 21'b000000000000011100011; 
9'b011011110: out <= 21'b000000000001010000011; 
9'b011011111: out <= 21'b111111111111111101101; 
9'b011100000: out <= 21'b000000000000101100011; 
9'b011100001: out <= 21'b000000000000001011010; 
9'b011100010: out <= 21'b111111111111100010100; 
9'b011100011: out <= 21'b111111111111100001010; 
9'b011100100: out <= 21'b000000000000000010011; 
9'b011100101: out <= 21'b111111111111111000000; 
9'b011100110: out <= 21'b000000000000000111000; 
9'b011100111: out <= 21'b111111111111001110000; 
9'b011101000: out <= 21'b111111111111010110110; 
9'b011101001: out <= 21'b111111111111000110101; 
9'b011101010: out <= 21'b000000000000000100011; 
9'b011101011: out <= 21'b000000000001010101010; 
9'b011101100: out <= 21'b111111111111010100110; 
9'b011101101: out <= 21'b111111111111011011011; 
9'b011101110: out <= 21'b000000000000001010100; 
9'b011101111: out <= 21'b111111111111010000001; 
9'b011110000: out <= 21'b000000000000001011111; 
9'b011110001: out <= 21'b111111111111000111010; 
9'b011110010: out <= 21'b000000000000001101101; 
9'b011110011: out <= 21'b111111111111111110111; 
9'b011110100: out <= 21'b000000000000110100101; 
9'b011110101: out <= 21'b000000000000110101010; 
9'b011110110: out <= 21'b000000000000011000101; 
9'b011110111: out <= 21'b111111111111111000000; 
9'b011111000: out <= 21'b111111111111011110110; 
9'b011111001: out <= 21'b111111111111111101000; 
9'b011111010: out <= 21'b111111111111001011010; 
9'b011111011: out <= 21'b000000000000010101000; 
9'b011111100: out <= 21'b000000000000010000111; 
9'b011111101: out <= 21'b111111111111010101100; 
9'b011111110: out <= 21'b111111111111110100011; 
9'b011111111: out <= 21'b000000000000101110001; 
9'b100000000: out <= 21'b000000000000101010010; 
9'b100000001: out <= 21'b000000000000010100011; 
9'b100000010: out <= 21'b111111111111010111100; 
9'b100000011: out <= 21'b000000000000001111011; 
9'b100000100: out <= 21'b111111111111011110011; 
9'b100000101: out <= 21'b000000000000000100100; 
9'b100000110: out <= 21'b000000000000100010110; 
9'b100000111: out <= 21'b111111111111011001110; 
9'b100001000: out <= 21'b000000000000100111010; 
9'b100001001: out <= 21'b000000000000111111111; 
9'b100001010: out <= 21'b111111111111000011110; 
9'b100001011: out <= 21'b111111111111110110101; 
9'b100001100: out <= 21'b000000000000001001010; 
9'b100001101: out <= 21'b111111111111100001111; 
9'b100001110: out <= 21'b000000000000001101000; 
9'b100001111: out <= 21'b111111111111000010110; 
9'b100010000: out <= 21'b000000000000000101011; 
9'b100010001: out <= 21'b000000000000000010111; 
9'b100010010: out <= 21'b000000000000010011101; 
9'b100010011: out <= 21'b000000000000001101011; 
9'b100010100: out <= 21'b111111111111110010111; 
9'b100010101: out <= 21'b111111111111111001100; 
9'b100010110: out <= 21'b000000000000000010101; 
9'b100010111: out <= 21'b111111111111101001111; 
9'b100011000: out <= 21'b000000000000010100001; 
9'b100011001: out <= 21'b000000000000000011001; 
9'b100011010: out <= 21'b000000000000000111101; 
9'b100011011: out <= 21'b111111111111111100001; 
9'b100011100: out <= 21'b000000000000001110110; 
9'b100011101: out <= 21'b000000000000110001000; 
9'b100011110: out <= 21'b111111111111010101110; 
9'b100011111: out <= 21'b000000000000011100010; 
9'b100100000: out <= 21'b111111111111111110010; 
9'b100100001: out <= 21'b000000000001000001000; 
9'b100100010: out <= 21'b000000000000111110000; 
9'b100100011: out <= 21'b000000000000101010001; 
9'b100100100: out <= 21'b000000000000001110111; 
9'b100100101: out <= 21'b111111111111101011001; 
9'b100100110: out <= 21'b000000000001101011111; 
9'b100100111: out <= 21'b000000000000000111100; 
9'b100101000: out <= 21'b111111111110101101010; 
9'b100101001: out <= 21'b000000000001011010000; 
9'b100101010: out <= 21'b000000000000110010011; 
9'b100101011: out <= 21'b000000000000111010000; 

 endcase 
 end 
 endmodule