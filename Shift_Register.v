module Shift_Register (

	input                                              Data,
	input                                              Active,
	input                                              CLK,
	input                                              RST,
	output         reg                                 CRC,
	output         reg                                 Valid

);


reg       [7:0]               LFSR;  
parameter [7:0]               Initial = 8'b10001110; 
reg                           Feedback ;


  
always@(posedge CLK or negedge RST)
  begin
   if (!RST) 
    begin
     LFSR <= Initial;
	 CRC <= 1'b0;
	 Valid <= 1'b0;
	end 
   else if(Active)
     begin		  
        Feedback <= LFSR[0] ^ Data;
		LFSR[7] <= Feedback;
        LFSR[6] <= Feedback ^ LFSR[7];
		LFSR[5] <= LFSR[6];
		LFSR[4] <= LFSR [5];
		LFSR[3] <= LFSR[4];
        LFSR[2] <= Feedback ^ LFSR[3]; 
		LFSR[1] <= LFSR[2];
		LFSR[0] <= LFSR[1];
      end
	  else
	    begin
		{CRC,LFSR[7:1]} <= LFSR ;
        Valid <= 1'b1;
		end
	end	
endmodule 		