module tb();

	reg clk = 0;
	
	always #1 clk = ~clk;
	
	reg pause = 0,reset = 0;
	
	wire [0:14] number;
	wire [0:3] num1,num2,num3,num4;
	wire and1,and2,and3,and4,A,B,C,D,E,F,G;
	
	counter cnt(clk,pause,reset,number);
	diplayControler display(clk,num1,num2,num3,num4,and1,and2,and3,and4,A,B,C,D,E,F,G);
	numParser parser(number,num1,num2,num3,num4);
	
	initial begin
	
	#50;
	pause = 1;
	#30;
	pause = 0;
	#100;
	reset = 1;
	#20;
	reset = 0;
	
	end

endmodule 