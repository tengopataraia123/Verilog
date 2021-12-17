module regfile(
	input clk,
	input  [3:0]  rA1, rA2, rA3,
	output [31:0] rD1, rD2, rD3,
	input        wEn1,
	input [3:0]  wA1,
	input [31:0] wD1,
	output[31:0] rDr15
	);
	
	reg [31:0] refile [15:0];
	
	assign rD1 = refile[rA1];
	assign rD2 = refile[rA2];
	assign rD3 = refile[rA3];
	assign rDr15 = refile[15];
	
	always@(posedge clk) begin
		if (wEn1) begin 
			refile[wA1] <= wD1;
		end
		refile[15] <= refile[15] + 1;
	end
	
endmodule 