module uart(
	input clk,
	input startTransmit,
	input [10:0] data,
	output reg tx);
	
	reg [10:0] uart_packet = 0;
	
	reg [7:0] transmitIndex = 10;
	
	always@(posedge clk) begin
		if(startTransmit) begin
			if(transmitIndex == 10) begin
				startTransmit <= 0;
				transmitIndex <= 0;
				tx <= 1'b1;
				uart_packet <= data;
			end
			else begin
				tx <= uart_packet[10];
				uart_packet <= uart_packet << 1;
				transmitIndex <= transmitIndex + 1;
			end
		end
	end
	
endmodule 