`timescale 1us/1ns
module tb_Shift_Register ();
reg                                                                tb_Data;
reg                                                                tb_Active;
reg                                                                tb_CLK;
reg                                                                tb_RST;
wire                                                               tb_CRC;
wire                                                               tb_Valid;


  

always #0.5 tb_CLK = !tb_CLK ;
  
 
Shift_Register DUT
(
.Data(tb_Data),
.Active(tb_Active),
.CLK(tb_CLK),
.RST(tb_RST),
.CRC(tb_CRC),
.Valid(tb_Valid)         
);



initial
  begin 
  
   $dumpfile ("Shift_Register.vcd");
   $dumpvars;
   
   tb_Data = 1'b0;
   tb_Active = 1'b0;
   tb_CLK = 1'b0; 
 

 
 $display("Test Case 1");
    #0.3
    tb_Data = 1'b0;
    tb_Active = 1'b0;
	#0.7
	if( tb_CRC != 1'b0 )
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");
		 
	


	
$display("Test Case 2");
    #0.3
    tb_Data = 1'b1;
    tb_Active = 1'b1;
	#0.7
	if( tb_CRC != 1'b1 )
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");	     



		 
 $display("Test Case 3");
    #0.3
	tb_Data = 1'b0;
    tb_Active = 1'b1;
	#0.7
	if( tb_CRC != 1'b0 )
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");
		
		 		 
			 
	#10				 
   
   
   $finish;
   
   end
   
 
 
 endmodule  
   
   

