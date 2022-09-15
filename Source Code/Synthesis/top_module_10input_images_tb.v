/*========================================================================================
* Testbench_name: top_module_10input_images_tb.v
* Author        : Yashash Jain
* Project       : Design and implement an ASIC for a Extreme Machine Learning (ELM) inference engine.
* Description   : This testbech provides test input data with corresponding their true output for checking the accuracy
* ========================================================================================*/


`timescale 1ns/10ps
module top_module_10input_images_tb;

	// Inputs
	reg [31:0] input_32bit_image_data;
	reg reset,master_reset;
	reg clk;
       
	// Outputs
	
	wire final_output_done;
	reg [3:0] true_image;
	wire [3:0] recognised_image;
       
	
	// Instantiate the Unit Under Test (UUT)
	TOP_MODULE_ELM TM (
		.input_32bit_image_data(input_32bit_image_data),
		.reset(reset), 
		.master_reset(master_reset),
        .true_image(true_image),
		.clock(clk), 
		.recognised_image(recognised_image),

		.final_output_done(final_output_done)
          
	);

//delays.sdf file annotated for checking post synthesis timing simulation	

initial
begin
$sdf_annotate("delays.sdf",top_module_10input_images_tb.TM,,"sdf.log","MAXIMUM");
end
	


initial begin
        // Initialize Inputs
        clk = 0;
        forever begin
            #5 clk = !clk;
        end
  end
  
initial begin

// applying 10 images in input (same as in demo.m) and their true image output is also given are also listed along with
    master_reset = 0;
    #1 master_reset = 1;
    #10 master_reset = 0;
    
    
    reset = 0;
    #1 reset = 1;
    #10 reset = 0;
     true_image = 4'd0;
     input_32bit_image_data = 32'b00000000000000000000000001111000;
    #10 input_32bit_image_data = 32'b00000011111111100000011100001111;
    #10 input_32bit_image_data = 32'b00001110000001110001110000000011;
    #10 input_32bit_image_data = 32'b00111100000001110111000000000111;
    #10 input_32bit_image_data = 32'b11100000000011101100000000001100;
    #10 input_32bit_image_data = 32'b11000000000111001100000000111000;
    #10 input_32bit_image_data = 32'b11000000111100001111011111000000;
    #10 input_32bit_image_data = 32'b01111111000000000000000000000000;
    #846280;
    
    
    
    reset = 0;
    #2 reset = 1;
    #10 reset = 0;
     true_image = 4'd1;
     input_32bit_image_data = 32'b00000000000011110000000000001111;
    #10 input_32bit_image_data = 32'b00000000000111100000000000011110;
    #10 input_32bit_image_data = 32'b00000000001110000000000001111000;
    #10 input_32bit_image_data = 32'b00000001111100000000001111100000;
    #10 input_32bit_image_data = 32'b00001111110000000111111011000000;
    #10 input_32bit_image_data = 32'b11110000110000001100000011000000;
    #10 input_32bit_image_data = 32'b00000001110000000000000110000000;
    #10 input_32bit_image_data = 32'b00000001110000000000000110000000;
    #846280;
    
    
    
    reset = 0;
    #2 reset = 1;
    #10 reset = 0;
     true_image = 4'd2;
     input_32bit_image_data = 32'b01111111111111001111111011111110;
    #10 input_32bit_image_data = 32'b11100000000011110000000000001111;
    #10 input_32bit_image_data = 32'b00000000000011100000000000111110;
    #10 input_32bit_image_data = 32'b00000000111110000000001111110000;
    #10 input_32bit_image_data = 32'b00011111110000000011111000000000;
    #10 input_32bit_image_data = 32'b11111000000000001111100000000000;
    #10 input_32bit_image_data = 32'b01111110000000000001111100000000;
    #10 input_32bit_image_data = 32'b00001111111111100000000011111110;
    #846280;
    
    
    
    reset = 0;
    #2 reset = 1;
    #10 reset = 0;
     true_image = 4'd3;
     input_32bit_image_data = 32'b00000001111111100000000100000110;
    #10 input_32bit_image_data = 32'b00000000000000110000000000000011;
    #10 input_32bit_image_data = 32'b00000000000001110000000000011100;
    #10 input_32bit_image_data = 32'b00000111111110000000011111011100;
    #10 input_32bit_image_data = 32'b00000000000011100000000000000111;
    #10 input_32bit_image_data = 32'b00000000000000110000000000000011;
    #10 input_32bit_image_data = 32'b00000000000001110000000000001110;
    #10 input_32bit_image_data = 32'b11001001111111001111111111000000;
    #846280;
    
    
    
    reset = 0;
    #2 reset = 1;
    #10 reset = 0;
     true_image = 4'd4;
     input_32bit_image_data = 32'b00000000000110000000000011111000;
    #10 input_32bit_image_data = 32'b00000011100111000000111000011100;
    #10 input_32bit_image_data = 32'b00011100000011000111000000001100;
    #10 input_32bit_image_data = 32'b11100000000111001100000000011000;
    #10 input_32bit_image_data = 32'b11000000000110001111000111111111;
    #10 input_32bit_image_data = 32'b01111111111110000000000000011000;
    #10 input_32bit_image_data = 32'b00000000000110000000000000011000;
    #10 input_32bit_image_data = 32'b00000000000110000000000000011000;
    #846280;
    
    
    
    reset = 0;
    #2 reset = 1;
    #10 reset = 0;
     true_image = 4'd5;
     input_32bit_image_data = 32'b00111111111111110111111111100000;
    #10 input_32bit_image_data = 32'b01000000000000001100000000000000;
    #10 input_32bit_image_data = 32'b11100000000000001111000000000000;
    #10 input_32bit_image_data = 32'b00111110000000000000111110000000;
    #10 input_32bit_image_data = 32'b00000001110000000000000011111000;
    #10 input_32bit_image_data = 32'b00000000000111000000000000011100;
    #10 input_32bit_image_data = 32'b00000000111110000000001111000000;
    #10 input_32bit_image_data = 32'b00111111000000001111000000000000;
    #846280;
    
    
    
    reset = 0;
    #2 reset = 1;
    #10 reset = 0;
     true_image = 4'd6;
     input_32bit_image_data = 32'b00000001111111110000001111000000;
    #10 input_32bit_image_data = 32'b00011111000000000001110000000000;
    #10 input_32bit_image_data = 32'b01111000000000000111000000000000;
    #10 input_32bit_image_data = 32'b11110000000000001110001111110000;
    #10 input_32bit_image_data = 32'b11111111101111101111100000001110;
    #10 input_32bit_image_data = 32'b11110000000001111110000000000111;
    #10 input_32bit_image_data = 32'b11100000000011100111000000011110;
    #10 input_32bit_image_data = 32'b00111111111111000000011111100000;
    #846280;
    
    
    
    reset = 0;
    #2 reset = 1;
    #10 reset = 0;
     true_image = 4'd7;
     input_32bit_image_data = 32'b11111111111000001101111111110000;
    #10 input_32bit_image_data = 32'b00000000011100000000000001110000;
    #10 input_32bit_image_data = 32'b00000000011000000000000001100000;
    #10 input_32bit_image_data = 32'b00000000011000001111111111111111;
    #10 input_32bit_image_data = 32'b11110000111000000000000001100000;
    #10 input_32bit_image_data = 32'b00000000011000000000000001100000;
    #10 input_32bit_image_data = 32'b00000000011100000000000001110000;
    #10 input_32bit_image_data = 32'b00000000011100000000000000100000;
    #846280;
    
    
    
    reset = 0;
    #2 reset = 1;
    #10 reset = 0;
     true_image = 4'd8;
     input_32bit_image_data = 32'b00111111111100001111000000011110;
    #10 input_32bit_image_data = 32'b11000000000001111100000000000111;
    #10 input_32bit_image_data = 32'b11100000000011100111000000111100;
    #10 input_32bit_image_data = 32'b00111100111100000000111111000000;
    #10 input_32bit_image_data = 32'b00000111100000000001111111000000;
    #10 input_32bit_image_data = 32'b01111111111100000110000000111000;
    #10 input_32bit_image_data = 32'b01110000000110000111100000111000;
    #10 input_32bit_image_data = 32'b00011111111110000000000110000000;
    #846280;
    
    
    
    reset = 0;
    #2 reset = 1;
    #10 reset = 0;
     true_image = 4'd9;
     input_32bit_image_data = 32'b00000001111110000000011110001110;
    #10 input_32bit_image_data = 32'b00000110000001110000011000000111;
    #10 input_32bit_image_data = 32'b00000110000011110000011111111110;
    #10 input_32bit_image_data = 32'b00000111111111110000011111000011;
    #10 input_32bit_image_data = 32'b00000000000000110000000000000011;
    #10 input_32bit_image_data = 32'b00000000000000110000000000000011;
    #10 input_32bit_image_data = 32'b11100000000000110111110000000011;
    #10 input_32bit_image_data = 32'b00011111111111110000000011111100;
    #846280;
    


    $finish;
end

endmodule
