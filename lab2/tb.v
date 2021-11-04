module tb();

	reg clk = 0;
	reg btn = 0;
	reg [3:0] data_in = 0;
	wire [7:0] data_out;
	
	shift_reg checker(data_in,btn,clk,data_out);
	
	always #5 clk = ~clk;
	
	initial begin
		data_in = 3;
		#3
		btn = 1;
		#15;
		btn = 0;
		#15;
		data_in = 1;
		btn = 1;
		#15;
		btn = 0;
		#15;
		data_in = 4;
		btn = 1;
		#15;
		btn = 0;
		#15;
	end

endmodule 