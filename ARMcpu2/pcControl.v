module pcControl(
	input clk,
	inout [31:0] pcReg,
	output reg [7:0] memoryAddressInput,
	input [31:0] memoryDataOutput,
	output reg [31:0] instruction,
	ouput reg [31:0] newPc
	);
	
	always @(posedge clk) begin
		memoryAddressInput <= pcReg[7:0];
		instruction <= memoryDataOutput;
		newPc <= pcReg+1;
	end
	
endmodule 