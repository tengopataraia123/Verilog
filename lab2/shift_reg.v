module shift_reg(
	input [3:0] data_in,
	input btn,
	input clk,
	output reg [7:0] data_out);
	
	reg flag = 0;
	reg [3:0] r1,r2,r3;
	
	always@(posedge clk) begin
		if(btn == 1 && flag == 0) begin
			flag <= 1;
			//code goes here
			
			r1 <= data_in;
			r2 <= r1;
			r3 <= r2;			
		end
		else if(btn == 0 && flag == 1) begin
			flag <= 0;
		end
		
		if(r1 == 4 && r2 == 1 && r3 == 3) begin
			data_out <= 8'b11111111;
		end
		else begin
			data_out <= 0;
		end
	end
endmodule 