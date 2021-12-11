module tb();

	reg clk = 0;
	
	always #1 clk = ~clk;
	
	reg pause = 0,reset = 0;
	
	wire [0:14] number;
	wire anode1,anode2,anode4,anode3,A,B,C,D,E,F,G;
	
	counter cnt(clk,pause,reset,number);
	diplayControler display(clk,number,anode1,anode2,anode3,anode4,A,B,C,D,E,F,G);
	
	initial begin
	
	#20;
	pause = 1;
	#20;
	pause = 0;
	#60;
	reset = 1;
	#20;
	reset = 0;
	
	end

endmodule 