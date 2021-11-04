module tb();

//test alu

reg clk = 0 ;

	ControlUnit CPU(.clk(clk));
	
	initial begin
	#10
	clk = 1;
	#10
	clk = 0;
	#10
	clk = 1;
	#10
	clk = 0;
	#10
	clk = 1;
	#10
	clk = 0;
	#10
	clk = 1;
	#10
	clk = 0;
	#10
	clk = 1;
	#10
	clk = 0;
	
	end

endmodule 