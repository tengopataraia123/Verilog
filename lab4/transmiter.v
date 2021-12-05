module transmiter(
	input uart_clock,
	input startTransmit,
	input [10:0] data,
	output reg transmitFinished,
	output reg tx);
	
	
	reg [7:0] transmitIndex = 0;
	reg [10:0] uart_packet = 0;
	
	
	
	always@(posedge uart_clock) begin
		if(startTransmit == 1'b1) begin
			if(transmitIndex == 10) begin
				transmitFinished <= 1;
				transmitIndex <= 0;
				tx = 1;
			end
			else if(transmitIndex == 0) begin
				uart_packet <= data;
				transmitIndex <= transmitIndex + 1;
			end
			else begin
				tx <= uart_packet[0];
				uart_packet <= uart_packet >> 1;
				transmitIndex <= transmitIndex + 1;
			end
		end
				
	end
	
	initial begin
		tx = 1;
	end
	
	
endmodule 