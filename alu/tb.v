module tb;

	reg [31:0] A,B;
	wire [31:0] result;
	
	reg[3:0] cmd;
	wire [3:0] nzcv;
	
	reg [1:0] sh;
	
	reg [4:0] shtam5;
	
	reg i,s;

	alu cpu_alu(A,B,cmd,sh,shatm5,i,s,result,nzcv);
	
	initial begin
		#10;
		cmd = 4'b1101;
		sh = 2'b11;
		A = 255;
		B = 5;
		#10;
		
	end

endmodule 