module instrmem (
    input [31:0] instr_addr,
    output [31:0] instruction
);

	reg [255:0] memory [31:0];
	
	assign instruction = memory[instr_addr];
	
	initial begin
		memory[0] = 32'b00000010100000000000000000000111;
		memory[1] = 32'b00000010100000010001000000001001;
		memory[2] = 32'b00000000100000000010000000000001;
		memory[3] = 32'b00000101100100100011000000000000;
		memory[4] = 32'b00000101100100010100000000000000;
		memory[5] = 32'b00000111100000110010000000000100;
	end

endmodule 