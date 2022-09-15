/*========================================================================================
* File_name     : taking_input_image.v
* Module_name   : taking_input_image
* Author        : Yashash Jain
* Project       : Design and implement an ASIC for a Extreme Machine Learning (ELM) inference engine.
* Description   : In this modeule, 32 bit of 8 image data are taking serially and convert into 1D array of complete one 256 bit image
* ========================================================================================*/


`timescale 1ns/10ps

//=======================================================================================
// ------------------------------ MODULE DECLARATION ------------------------------------
//=======================================================================================

 module taking_input_image(
                          image_32_bit,
                          image_256_bit,
                          update,
                          clock,
                          reset);


//=======================================================================================
// ------------------------------ I/O DECLARATION ------------------------------------
//=======================================================================================

	input [31:0] image_32_bit;
	input clock;
	input reset;
	
	output reg update;
	output reg [1:256] image_256_bit;

//=======================================================================================
// ------------------------------ INTERNAL SIGNALS ------------------------------------
//=======================================================================================

     reg complete;
     reg [3:0] count;                   


//=======================================================================================
// ------------------------------ ALWAYS_FF BLOCKS ------------------------------------
//=======================================================================================
        always@(posedge clock) begin
	      if (reset) begin
			update <= 0;
			complete <= 0;
			count <= 0;
			image_256_bit <= 0;
		  end
	      else if (complete == 0) begin
	           if (update==0) begin
	                image_256_bit <= {image_256_bit[33:256],image_32_bit};   //shifting the 256 bit register to store complete image as matlab indices
		               if (count == 4'b0111) 
                          update <= 1;  // updating that the image has completely stored
		       end
		       else if (count == 4'd9) begin
		          complete <= 1;
		          update <= 0;
		         // $display("time = %d fnish_input_taking",$time);
		       end
		      count <= count + 1'b1;
		  end
	    end


      endmodule


