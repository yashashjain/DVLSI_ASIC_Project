/*========================================================================================
* File_name     : TOP_MODULE_ELM.v
* Module_name   : TOP_MODULE_ELM
* Author        : Yashash Jain
* Project       : Design and implement an ASIC for a Extreme Machine Learning (ELM) inference engine.
* Description   : This is my Top Module through which all the modules taking_input_image, (first_hidden_layer, second_output_layer, maximun_number) will be called
* ========================================================================================*/

`timescale 1ns/10ps

//=======================================================================================
// ------------------------------ MODULE DECLARATION ------------------------------------
//=======================================================================================
  

module TOP_MODULE_ELM (
                   reset, 
                   master_reset,
                   clock,
                   true_image,
                   input_32bit_image_data,
                   recognised_image,
                   final_output_done,
                   count1
                  );


//=======================================================================================
// ------------------------------  LOCAL PARAMETERS -----------------------------------
//=======================================================================================

    parameter bit_length = 21;
	parameter layer_1_size = 300;
	

//=======================================================================================
// ------------------------------ I/O DECLARATION ------------------------------------
//=======================================================================================

	input [31:0] input_32bit_image_data;
	input clock,reset,master_reset; //clock and reset
	input  [3:0] true_image;
	
	output wire [3:0] recognised_image;
	output wire final_output_done;
	output reg [9:0] count1;
    reg done;
    

//=======================================================================================
// ------------------------------ INTERNAL SIGNALS ------------------------------------
//=======================================================================================
    
    wire complete_image_taken, first_layer_output_done, second_layer_output_done;
    
	wire  [0:bit_length*layer_1_size - 1] first_layer_outputs_combined;

    wire [0:255] complete_256bit_image_data; //one image 
 
    wire [bit_length-1:0]     second_layer_output1,
                              second_layer_output2,
                              second_layer_output3,
                              second_layer_output4,
                              second_layer_output5,
                              second_layer_output6,
                              second_layer_output7,
                              second_layer_output8, 
                              second_layer_output9,
                              second_layer_output10;


//=======================================================================================
// ------------------------------ MODULE INSTANTIATIONS --------------------------------
//=======================================================================================
      
    
	//Combining Images from 32 bit input data
	taking_input_image IM (    .image_32_bit     (input_32bit_image_data),
                             .clock            (clock),
                             .reset            (reset),
                             .image_256_bit    (complete_256bit_image_data), 
                             .update           (complete_image_taken));
                             
    //Compute H matrix (Hidden Lyaer Output WIth ReLU included)
	first_hidden_layer FL(    .image_data    (complete_256bit_image_data), 
		                      .Hidden        (first_layer_outputs_combined), 
                              .clock         (clock), 
                              .reset         (complete_image_taken), 
                              .update      (first_layer_output_done));
	
	//Compute Output Node Values
	second_output_layer  Sl(    .reset                   (first_layer_output_done),
                                .update                  (second_layer_output_done),		
		                        .combining_1stlayer_A    (first_layer_outputs_combined), 
		                        .clock                   (clock),
		                        .Y2_1                    (second_layer_output1),
                                .Y2_2                    (second_layer_output2),
                                .Y2_3                    (second_layer_output3),
                                .Y2_4                    (second_layer_output4),
                                .Y2_5                    (second_layer_output5),
		                        .Y2_6                    (second_layer_output6),
                                .Y2_7                    (second_layer_output7), 
                                .Y2_8                    (second_layer_output8), 
                                .Y2_9                    (second_layer_output9), 
                                .Y2_10                   (second_layer_output10)
	                                                                           );
	// Maximun Number Finder 
	maximum_number MN (         .clock        (clock),
                                .in0          (second_layer_output1),
                                .in1          (second_layer_output2),
                                .in2          (second_layer_output3),
                                .in3          (second_layer_output4),
                                .in4          (second_layer_output5),
		                        .in5          (second_layer_output6), 
                                .in6          (second_layer_output7), 
                                .in7          (second_layer_output8), 
                                .in8          (second_layer_output9), 
                                .in9          (second_layer_output10),
                                .index        (recognised_image),
                                .update       (final_output_done),
                                .reset        (second_layer_output_done));
  
 //=======================================================================================
// ------------------------------ ALWAYS_FF BLOCKS ------------------------------------
//=======================================================================================
 // Test Accuracy check purposes:
 // only used in Verilog for cheching test accuracy, not used in synthesis HW design
          always@(posedge clock) begin
				if (master_reset) begin
					count1 <= 0;
				end
				
				else if (reset) begin
					done <= 0;
				end

				else if (done == 0) begin
					if (final_output_done) begin  // when we got the recognised image 
						if(true_image == recognised_image) begin  //compare with true image
							count1 <= count1 + 1 ;
						end
						done <= 1;
					end
				end
			end
	

 endmodule