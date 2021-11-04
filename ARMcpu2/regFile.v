module RegFile(
	input [3:0] addr_a,addr_b,addr_c,
	input [31:0] data_a,data_b,data_c,
	input we_a,we_b,we_c,
	input clk,
	output reg [31:0] q_a,q_b,q_c,
	output [31:0] pc
	);

	reg [31:0] regs[14:0];
	reg [31:0] pcReg = 0;
	
	assign pc = pcReg;
	
	always @(*) begin
		
		if(we_a) begin
			regs[addr_a] <= data_a;
		end
		if(we_b) begin
			regs[addr_b] <= data_b;
		end
		if(we_c) begin
			regs[addr_c] <= data_c;
		end
		
		q_a <= regs[addr_a];
		q_b <= regs[addr_b];
		q_c <= regs[addr_c];
				
	end
	
	always @(posedge clk) begin
		pcReg = pcReg + 1;
	end
	
	integer i;
	
	initial begin
		for(i = 0;i< 15;i = i+1)
			regs[i] = 0;
	end
	
endmodule 