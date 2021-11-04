module slave(
	input valid_signal,clk,start_calc,
	input [15:0] A_in,B_in,
	output [31:0] read_data,
	output reg ready_signal
);

	reg [31:0] ram [31:0];

	assign read_data = ram[16];
	reg [31:0] i = 0;
	
	always@(posedge clk) begin
		
		if(valid_signal == 1) begin
			ram[1] <= A_in;
			ram[2] <= B_in;
			ram[0] <= start_calc;
			ready_signal <= 0;
		end
		if(ram[0][0] == 1'b1) begin
			
			if(i<16) begin
				if(ram[2][i] == 1'b1) begin
					ram[16] <= ram[16] + ram[5];
				end
				
				ram[5] <= ram[1] << i;
				i = i + 1;
			
			end
			else begin
				i <= 0;
				
				//reset multipllier start signal
				ram[0] <= 0;
				
				ready_signal <= 1;
			end
			
		end
	end
	
	initial begin
	ram[0] = 0;
	ram[1] = 0;
	ram[2] = 0;
	ram[5] = 0;
	ram[16] = 0;
	end
	
endmodule 