module uartclk(
	input clk,
	output reg uart_clock);
	
	integer count = 0;
	
	always@(posedge clk) begin
		count <= count + 1;
		uart_clock <= 0;
		if(count == 50000) begin
			count <= 0;
			uart_clock <= 1;
		end
	end
	
endmodule 