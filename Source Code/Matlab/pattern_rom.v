
 `timescale 1ns/1ps 
 module pattern_rom (adrs_clm,out); 
 input [17:0] adrs_clm; 
 output reg [0:5] out; 
 always@(*) begin 
 case({adrs_clm}) 
