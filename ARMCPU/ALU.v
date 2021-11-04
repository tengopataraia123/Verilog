module ALU(
	input clk,
	input [31:0] data1,
	input [31:0] data2,
	input [3:0] cmd,
	output reg[31:0] result
);

always @(*) begin
	if(cmd == 4'b0100) //add
	begin
		result <= data1 + data2;
	end
	else if(cmd == 4'b0010) //sub
	begin
		result <= data1 - data2;
	end
	
end
	
endmodule 