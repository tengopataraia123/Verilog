module tdpRam(
	input [31:0] data_a,
	input [7:0] addr_a, addr_b,
	input we_a, clk,
	output reg [31:0] q_a, q_b
);
	// Declare the RAM variable
	reg [31:0] ram[255:0];
	
	// Port A
	always @ (posedge clk)
	begin
		if (we_a) 
		begin
			ram[addr_a] <= data_a;
			q_a <= data_a;
		end
		else 
		begin
			q_a <= ram[addr_a];
		end
	end
	
	// Port B
	always @ (posedge clk)
	begin
		begin
			q_b <= ram[addr_b];
		end
	end
		
	initial begin
		ram[0] = 32'b00000010100000000000000000000111;
		ram[1] = 32'b00000010100000010001000000001001;
		ram[2] = 32'b00000000100000000010000000000001;
		ram[3] = 32'b00000101100100100011000000000000;
		ram[4] = 32'b00000101100100010100000000000000;
		ram[5] = 32'b00000111100000110010000000000100;
	end
	
endmodule
