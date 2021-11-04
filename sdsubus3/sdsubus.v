module bus(
	input [15:0] num1,num2,
	input valid,
	input clk,
	output reg ready,
	output [31:0] result);
	
	reg [31:0] regs[31:0];
	
	assign result = regs[16];
	
	always@(posedge clk) begin
		if(valid == 1'b1) begin
			regs[1][15:0] <= num1;
			regs[2][15:0] <= num2;
			regs[0] <= 1;
		end
		if(regs[0] == 1) begin
			regs[2] <= regs[2] << 1;
			regs[1] <= regs[1] >> 1;
			
			if(regs[1][0] == 1'b1) begin
				regs[16] <= regs[16] + regs[2];
			end
			
			if(regs[1] == 0) begin
				regs[0] <= 0;
				ready <= 1;
			end
		end
	end
	
	integer i;
	initial begin
		for(i=0;i<32;i=i+1) begin
			regs[i] = 0;
		end
	end
	
endmodule 