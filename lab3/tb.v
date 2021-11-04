module tb;

	reg clk = 0;
	
	always #5 clk = ~clk;
	
	reg [3:0] sw;
	reg [1:0] key = 2'b11;
	wire [7:0] led;
	
	GCD gcd(sw,key,clk,led);
	
	initial begin
		#10;
		sw = 4'b0000;
		key[0] = 1'b0;
		#10;
		key[0] = 1'b1;
		#10;
		sw = 4'b1111;
		key[0] = 1'b0;
		#10;
		key[0] = 1'b1;
		#10;
		sw = 4'b0001;
		key[0] = 1'b0;
		#10;
		key[0] = 1'b1;
		#10;
		sw = 4'b1001;
		key[0] = 1'b0;
		#10;
		key[0] = 1'b1;
		#10;
		
		key[1] = 1'b0;
		#10;
		key[1] = 1'b1;
		
	end

endmodule 