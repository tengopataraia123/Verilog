module tb();

	reg clk = 0;

	ControlUnit cpu(.clk(clk));

	always #10 clk = ~clk;
	
endmodule 