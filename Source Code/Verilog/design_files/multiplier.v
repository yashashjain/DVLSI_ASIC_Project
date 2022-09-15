/*========================================================================================
* File_name     : multiplier.v
* Module_name   : multiplier
* Author        : Yashash Jain
* Project       : Design and implement an ASIC for a Extreme Machine Learning (ELM) inference engine.
* Description   : This is Add shift based signed multplier which compute H*W21 multiplication.
* ========================================================================================*/

`timescale 1ns/10ps

//=======================================================================================
// ------------------------------ MODULE DECLARATION ------------------------------------
//=======================================================================================

   module multiplier(
                            M,
                            Q,
                            product_result,
                            ready,
                            clock);

//=======================================================================================
// ------------------------------ LOCAL PARAMETERS ------------------------------------
//=======================================================================================
          
        parameter N = 21;


//=======================================================================================
// ------------------------------ I/O DECLARATION ------------------------------------
//=======================================================================================

    input    [N-1:0] M;
	input    [N-1:0] Q;
	input    ready,clock;                
    output   [N-1:0] product_result;


//=======================================================================================
// ------------------------------ INTERNAL SIGNALS ------------------------------------
//=======================================================================================

	reg            val;
	reg [4:0]      count;
	reg [2*N-1:0]  M_int,Q_int,ACC;
	reg [N-1:0]    add_zeros ;
    reg [N-1:0]    add_ones ;
    
//=======================================================================================
// ------------------------------ ASSIGN STATEMENTS ------------------------------------
//=======================================================================================
    
	assign product_result =  val ?(ACC[35:15]):(21'd0);


//=======================================================================================
// ------------------------------ ALWAYS_FF BLOCKS ------------------------------------
//=======================================================================================

  always@(posedge clock) begin
		if(ready) begin                                           //readying operation 
			add_zeros <= 21'h00000;
            add_ones <= 21'h1FFFF;
			ACC   <= 42'd0;
			if(Q[N-1]==1)
			  Q_int <= {add_ones,Q};
			else
			  Q_int <= {add_zeros,Q};                          //for safety to get origina data intact if we shift to the right in multiplier (Q)
			  
			if(M[N-1]==1)
			  M_int <= {add_ones,M};
			else
			  M_int <= {add_zeros,M};                         //for safety to get origina data intact if we shift to the left in multiplicand (M)
			
			count <= 5'b0;
			val   <= 1'b0;
		 end
		
		else if(!val) begin                                          
			if (count != 5'd20) begin                            
		         if(Q_int[0]==1) 
                     ACC <= ACC + M_int;                    //Accumulator will add the data if Q_int[0]==1
            end
            else begin
                 if(Q_int[0]==1) 
                      ACC <= ACC + (~M_int + 42'd1);  //It will take care the last sign bit multplication to convert into 2's complement in negative number multiplier case
                 count <= 0;
                 val <= 1'b1;
            end
            M_int <= M_int<<1;
            Q_int <= Q_int>>1;
            count <= count+1;
        end
    end
	 
	
	
endmodule


