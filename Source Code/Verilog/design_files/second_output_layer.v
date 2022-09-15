/*========================================================================================
* File_name     : second_output_layer.v
* Module_name   : second_output_layer
* Author        : Yashash Jain
* Project       : Design and implement an ASIC for a Extreme Machine Learning (ELM) inference engine.
* Description   : This module perform the H*W21 part, where it will access the rom memory data from matlab trained weights and multiply to get output node value.
* ========================================================================================*/
`timescale 1ns/10ps

//=======================================================================================
// ------------------------------ MODULE DECLARATION ------------------------------------
//=======================================================================================

module second_output_layer (reset, 
                           combining_1stlayer_A, 
                           Y2_1,
                           Y2_2,
                           Y2_3,
                           Y2_4,
                           Y2_5,
                           Y2_6,
                           Y2_7,
                           Y2_8,
                           Y2_9,
                           Y2_10,
                           clock,
                           update);

//=======================================================================================
// ------------------------------ LOCAL PARAMETERS ------------------------------------
//=======================================================================================

          
	parameter bit_length = 21;
	parameter layer_size = 10;
	parameter layer_1_size = 300;

//=======================================================================================
// ------------------------------ I/O DECLARATION ------------------------------------
//=======================================================================================

	input [bit_length*layer_1_size-1:0] combining_1stlayer_A;
	input                               reset,clock;
 	output reg [bit_length-1:0]       Y2_1,Y2_2,Y2_3,Y2_4,Y2_5,Y2_6,Y2_7,Y2_8,Y2_9,Y2_10;
    output  reg                         update;

//=======================================================================================
// ------------------------------ INTERNAL SIGNALS ------------------------------------
//=======================================================================================
    reg                                  complete;
    reg  [0:bit_length*layer_1_size-1]   input_A;
	reg  [4:0]                           count_multiplication_cycles;
	reg  [8:0]                           address;
	reg                                  load_next_value;
	wire [bit_length-1:0]                weights_row_2ndlayer [1:10];
    wire [bit_length-1:0]                multiplier_result [1:10];
	


//=======================================================================================
// ------------------------------ MODULE INSTANTIATIONS --------------------------------
//=======================================================================================
   
   
//   instantiating the Rom - Weights (W21) of the 2nd layer  
	
	w21_rom_c1 rom1     (.adrs_clm  (address[8:0]),   .out (weights_row_2ndlayer[1]));
	w21_rom_c2 rom2     (.adrs_clm  (address[8:0]),   .out (weights_row_2ndlayer[2]));
	w21_rom_c3 rom3     (.adrs_clm  (address[8:0]),   .out (weights_row_2ndlayer[3]));
	w21_rom_c4 rom4     (.adrs_clm  (address[8:0]),   .out (weights_row_2ndlayer[4]));
	w21_rom_c5 rom5     (.adrs_clm  (address[8:0]),   .out (weights_row_2ndlayer[5]));
	w21_rom_c6 rom6     (.adrs_clm  (address[8:0]),   .out (weights_row_2ndlayer[6]));
	w21_rom_c7 rom7     (.adrs_clm  (address[8:0]),   .out (weights_row_2ndlayer[7]));
	w21_rom_c8 rom8     (.adrs_clm  (address[8:0]),   .out (weights_row_2ndlayer[8]));
	w21_rom_c9 rom9     (.adrs_clm  (address[8:0]),   .out (weights_row_2ndlayer[9]));
	w21_rom_c10 rom10   (.adrs_clm  (address[8:0]),   .out (weights_row_2ndlayer[10]));

//    instantiating the multiplier for computations 
	
	multiplier M_1  (.M  (weights_row_2ndlayer[1]),  .Q  (input_A[0:bit_length-1]),  .product_result  (multiplier_result[1]),  .ready  (load_next_value),   .clock (clock));
	multiplier M_2  (.M  (weights_row_2ndlayer[2]),  .Q  (input_A[0:bit_length-1]),  .product_result  (multiplier_result[2]),  .ready  (load_next_value),   .clock (clock));
	multiplier M_3  (.M  (weights_row_2ndlayer[3]),  .Q  (input_A[0:bit_length-1]),  .product_result  (multiplier_result[3]),  .ready  (load_next_value),   .clock (clock));
	multiplier M_4  (.M  (weights_row_2ndlayer[4]),  .Q  (input_A[0:bit_length-1]),  .product_result  (multiplier_result[4]),  .ready  (load_next_value),   .clock (clock));
	multiplier M_5  (.M  (weights_row_2ndlayer[5]),  .Q  (input_A[0:bit_length-1]),  .product_result  (multiplier_result[5]),  .ready  (load_next_value),   .clock (clock));
	multiplier M_6  (.M  (weights_row_2ndlayer[6]),  .Q  (input_A[0:bit_length-1]),  .product_result  (multiplier_result[6]),  .ready  (load_next_value),   .clock (clock));
	multiplier M_7  (.M  (weights_row_2ndlayer[7]),  .Q  (input_A[0:bit_length-1]),  .product_result  (multiplier_result[7]),  .ready  (load_next_value),   .clock (clock));
	multiplier M_8  (.M  (weights_row_2ndlayer[8]),  .Q  (input_A[0:bit_length-1]),  .product_result  (multiplier_result[8]),  .ready  (load_next_value),   .clock (clock));
	multiplier M_9  (.M  (weights_row_2ndlayer[9]),  .Q  (input_A[0:bit_length-1]),  .product_result  (multiplier_result[9]),  .ready  (load_next_value),   .clock (clock));
	multiplier M_10 (.M  (weights_row_2ndlayer[10]), .Q  (input_A[0:bit_length-1]),  .product_result  (multiplier_result[10]), .ready  (load_next_value),   .clock (clock));
	




//=======================================================================================
// ------------------------------ ALWAYS_FF BLOCKS ------------------------------------
//=======================================================================================


	always@(posedge clock) begin
		if(reset) begin 
		    address                     <= 9'd0;
			count_multiplication_cycles <= 5'd0;
			load_next_value             <= 1'b1;
			complete                    <= 0;
			update                      <= 0;
			input_A                     <= combining_1stlayer_A;
			Y2_1                        <= 0;
            Y2_2                        <= 0;
            Y2_3                        <= 0;
            Y2_4                        <= 0;
            Y2_5                        <= 0;
            Y2_6                        <= 0;
            Y2_7                        <= 0;
            Y2_8                        <= 0;
            Y2_9                        <= 0;
            Y2_10                       <= 0;				
		end 
		  
		 else if (complete == 0) begin
			   if(!update) begin                                               //1st if 
				if (count_multiplication_cycles == 5'd23) begin                //2nd if // one multiplication complete 
					        count_multiplication_cycles <= 5'd0;
						    load_next_value <= 1'b1;
					        Y2_1 <= Y2_1 + multiplier_result[1]; 
					        Y2_2 <= Y2_2 + multiplier_result[2]; 
						    Y2_3 <= Y2_3 + multiplier_result[3]; 
						    Y2_4 <= Y2_4 + multiplier_result[4]; 
					        Y2_5 <= Y2_5 + multiplier_result[5]; 
						    Y2_6 <= Y2_6 + multiplier_result[6]; 
					        Y2_7 <= Y2_7 + multiplier_result[7]; 
					        Y2_8 <= Y2_8 + multiplier_result[8]; 
					        Y2_9 <= Y2_9 + multiplier_result[9]; 
						    Y2_10 <= Y2_10 + multiplier_result[10]; 
						    input_A <= (input_A << 21);
								
						if (address==9'd299) begin    //3rd if //all row multiplication complete 
								address<= 9'd0;
								update <= 1'b1;      //trigger to maximum_number module to perform next task
								
					    end    //3rd if
						else   //3rd else 
						    address <=address + 9'd1;
			     end  //2nd if

				else if (count_multiplication_cycles == 5'd1) begin   //2nd else if //all the rrequired data loaded 
					load_next_value <= 1'b0;
					count_multiplication_cycles <= count_multiplication_cycles + 5'd1;
				end  //2nd else if

				else  //2nd else 
			           count_multiplication_cycles <= count_multiplication_cycles + 5'd1;

	          end //1st if 


		else if (update) begin 
			  address <= address + 9'd1;
			       if (address == 9'd4) begin
                        update <= 0;
                        complete <= 1;
                        address <= 0;
                        //$display("time = %d fnish_second_layer",$time);
				   end
	    end 
     end //1st else if (complete)
   end //always wala
	
endmodule

