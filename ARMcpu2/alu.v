module Alu(
	input [3:0] instruction,
	input [31:0] data_a,data_b,
	output reg [31:0] value
	);
	
	always @(*) begin
		if(instruction == 4'b0100) begin
			value <= data_a+data_b;
		end
	end
	
endmodule 