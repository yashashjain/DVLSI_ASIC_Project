/*========================================================================================
* File_name     : first_hidden_layer.v
* Module_name   : first_hidden_layer
* Author        : Yashash Jain
* Project       : Design and implement an ASIC for a Extreme Machine Learning (ELM) inference engine.
* Description   : This module perform the LFSR and ReLU to genertate H matrix (all hidden node value after passing through activation function)
* ========================================================================================*/

`timescale 1ns/10ps

//=======================================================================================
// ------------------------------ MODULE DECLARATION ------------------------------------
//=======================================================================================
 module first_hidden_layer (image_data,
                            Hidden,
                            clock,
                            reset,
                            update
                           );

//=======================================================================================
// ------------------------------ LOCAL PARAMETERS ------------------------------------
//=======================================================================================

  
	parameter bit_length = 21;
	parameter layer_1_size = 300;
    parameter N = 16;
//=======================================================================================
// ------------------------------ I/O DECLARATION ------------------------------------
//=======================================================================================



	input  [1:256]          image_data; //one image 
	input                   clock,reset; //clock and reset
    
    output reg [1:bit_length*layer_1_size] Hidden;
    output  reg update;
//=======================================================================================
// ------------------------------ INTERNAL SIGNALS ------------------------------------
//=======================================================================================
    reg complete;
    reg [bit_length-1:0]            Z1 [1:layer_1_size];
    reg [1:N] out_reg,out_x, out_next;
    wire taps;
    reg [bit_length-1:0] a;
    reg [8:0] i;
    reg [9:0] h;
    reg [5:0] add_zeros;
    reg [5:0] add_ones;
    reg [1:0] flag;

    
//=======================================================================================
// ------------------------------ ALWAYS_FF BLOCKS ------------------------------------
//=======================================================================================
            
                
    always @(posedge clock) begin
        if (reset) begin
            out_reg <= 16'h37DD;
			complete <= 0;
			Hidden <= 0;
			Z1[h] <= 0;
			update <= 0;
			flag <= 2'd0;
		     a<=21'd0;
            i<=9'd1;
            h<=10'd1;
            add_zeros <= 6'b000000;
            add_ones <= 6'b111111;
	    end
        else begin
         if(complete == 0) begin
           if(h<10'd301) begin 
            if(i < 9'd257) begin
                out_reg <= out_next;
                if (image_data[i]) begin  //if input bit is 1 then we have to multiply with w10 (column wise generated LFSR random bit pattern (out_reg)) and add it to get hidden node value
                    if(out_reg[1]==0) begin
                        Z1[h] <= Z1[h] + {add_zeros,out_reg[2:16]}; //column wise addition to get h1,h2,.... 
                    end
                    
                    else begin
                        //2's complememt not rquired because already in matlab i have taken 2's complement
                        //out_reg[1:16] = ~(out_reg[2:16]) + 1'b1;
                        Z1[h] <= Z1[h] + {add_ones,out_reg[2:16]};
                    end 
                     i <= i + 9'd1; 
			    end
			    else
				    i <= i + 9'd1;    
            end
          end //complete vala
       end //1st else 
    end
    
     if(complete == 0) begin
         if(update == 0) begin
          if(i==9'd257) begin  //when all input image bit got mutlipy with first coulum of w10 then we have to store h1...same process until 300th hidden node
            //2's complement
            if(Z1[h][20]!=1)begin   //ReLU y = max(0,x) -->postive number so x
                Hidden <= {Hidden[22:bit_length*layer_1_size], Z1[h]};
                $display(" h = %d, Hidden = %b", h,Z1[h]);
            end
            else begin  //ReLU y = max(0,x)---> negative hidden node value so assign 21'h00000
                Hidden <= {Hidden[22:bit_length*layer_1_size], a};
                $display(" h = %d, Hidden = %b", h,a);
            end
            i <= 9'd1; 
            h <= h+10'd1;
            Z1[h+1] <= 0; //ready for finding nest hidden node value
           end
            if(h==10'd301) begin
                 update <= 1;    //this will trigger to second output layer module 
                 flag <= flag+2'd1;
            end  
           end 
           else if(flag == 2'd2) begin
               complete <= 1;
               h <= 10'd1;
               update <= 0;
               //$display("time = %d finish_hidden_layer",$time);
           end
           
           else
              flag <= flag+2'd1;
          end //complete vala
     end //always
   
     
//=======================================================================================
// ------------------------------ ALWAYS_Combinational BLOCKS ------------------------------------
//=======================================================================================  
       //LFSR part: where we are generating next seed for getting new random value// 
       
        always @(taps, out_reg) begin
                out_x = {taps, out_reg[1:N-1]};
                out_next = (out_x) ^ ({out_x[N],out_x[1:N-1]});
        end
          
        assign taps = out_reg[11] ^ out_reg[13] ^ out_reg[14] ^ out_reg[16];
        
    
 endmodule



