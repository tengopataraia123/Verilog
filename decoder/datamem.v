module datamem (
    input clk,
    input        dmWEn,
    input [31:0] dmRWAddr,
    input [31:0] dmWData,
    output [31:0] dmRData
);

	reg [255:0] memory [31:0];

	assign dmRData = memory[dmRWAddr];
	
	always@(posedge clk) begin
		if(dmWEn) begin
			memory[dmRWAddr] <= dmWData;
		end
	end

endmodule 