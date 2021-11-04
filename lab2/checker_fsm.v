module checker_fsm(
	input clk,
	input btn,
	input [3:0] data_in,
	output reg[7:0] data_out
	);
	
	reg [1:0] state = 0;
	
	always@(posedge clk) begin
		case(state) begin
			0 : begin
				if(data_in == 4'b0011)
					state <= 1;
			end
			1 :begin
				if(data_in == 4'b0001)
					state <= 2;
			end
			2 : begin
				if(data_in == 4'b0100)
					state <= 3;
			end
			3 : begin
				data_out <= 8'b11111111;
			end
		end
	end

	initial begin
		data_out = 0;
	end
		
endmodule 