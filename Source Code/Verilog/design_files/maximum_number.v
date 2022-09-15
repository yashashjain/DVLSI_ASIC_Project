/**========================================================================================
* File_name     : maximum_number.v
* Module_name   : maximum_number
* Author        : Yashash Jain
* Project       : Design and implement an ASIC for a Extreme Machine Learning (ELM) inference engine.
* Description   : It is similar to one hot coded part where we are finding maximum value in ouput as well as there position (0-9)
* ========================================================================================*/

`timescale 1ns/10ps

//=======================================================================================
// ------------------------------ MODULE DECLARATION ------------------------------------
//=======================================================================================
 
    module maximum_number (clock,
                           in0,
                           in1,
                           in2,
                           in3,
                           in4,
                           in5,
                           in6,
                           in7,
                           in8,
                           in9,
                           index,
                           update,
                           reset);

//=======================================================================================
// ------------------------------ LOCAL PARAMETERS ------------------------------------
//=======================================================================================
      
    parameter bit_length = 21;

//=======================================================================================
// ------------------------------ I/O DECLARATION ------------------------------------
//=======================================================================================
        
      input                           clock,reset;
      input signed [bit_length-1:0]   in1,in2,in3,in4,in5,in6,in7,in8,in9,in0; 
      output reg   [3:0]              index;
      output reg                      update;
  

//=======================================================================================
// ------------------------------ INTERNAL SIGNALS ------------------------------------
//=======================================================================================

  reg        [3:0]            position;
  reg signed [bit_length-1:0] memory[0:9];
  reg signed [bit_length-1:0] maximum;
  reg        [3:0]            count;
    


//=======================================================================================
// ------------------------------ ALWAYS_FF BLOCKS ------------------------------------
//=======================================================================================
   
        always@(posedge clock) begin
            if(reset) begin 
                memory[1] <= in1;
                memory[2] <= in2;
                memory[3] <= in3;
                memory[4] <= in4;
                memory[5] <= in5;
                memory[6] <= in6;
                memory[7] <= in7;
                memory[8] <= in8;
                memory[9] <= in9;
                memory[0] <= in0;
                maximum <= in1;
                position <= 4'd0;
                index <= 4'd0;
                count <= 0;
                update <= 1'b0;
            end  
	       else if (count <= 4'd9) begin
			if(maximum <= memory[count])begin
				  maximum <= memory[count];
				  position <= count;
		    end 
			count <= count+1;
		   end
		  else if (count == 4'd10) begin
		    $display("Predicted_Image = %d",position);
  			update <= 1'b1;
  			index <= position;
  		    count <= 4'd12;
  		    $display("time = %d final_output_done",$time);
          end
         else if (count == 4'd12)begin
           update <= 1'b0;
         end
  end
            
endmodule