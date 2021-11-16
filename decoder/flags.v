module flags (
    input clk,
    input s_in,
    input [3:0] flagsfromALU,
    output reg [3:0] NZCV
);

	always@(posedge clk) begin
		if(s_in == 1) begin
			NZCV <= flagsfromALU;
		end
	end

endmodule 