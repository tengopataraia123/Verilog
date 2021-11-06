module transmiter(
	input clk,uart_clock,
	input [1:0] btn,
	input [3:0] sw,
	output reg [10:0] uart_packet,
	output reg startTransmit);
	
	reg [7:0] data = 0;
	reg counter = 0;
	reg startParityCheck = 0;
	reg [1:0] oldBtn = 0;
	
	reg [3:0] bitCount = 0;
	reg [3:0] parityIndex = 0;
	
	
	always@(posedge clk) begin
		oldBtn[1:0] <= btn[1:0];
		
		if(oldBtn[0] != btn[0]) begin
			if(counter == 0) begin
				data[3:0] <= sw;
				counter <= 1'b1;
			end
			if(counter == 1'b1) begin
				data[7:4] <= sw;
			end
		end
		
		if(oldBtn[1] != btn[1]) begin
			//start transmit
			startParityCheck <= 1'b1;
			uart_packet[10] <= 0;
			uart_packet[9:2] <= data;
			uart_packet[0] <= 1'b1;
			
		end
		
		if(startParityCheck == 1'b1) begin
			if(parityIndex == 8) begin
				startParityCheck <= 0;
				startTransmit <= 1'b1;
				if(bitCount%2 == 0) begin
					uart_packet[1] <= 1;
				end
				else begin
					uart_packet[1] <= 0;
				end
			end
			else begin
				if(data[parityIndex] == 1'b1) begin
					bitCount = bitCount + 1;
					parityIndex = parityIndex + 1;
				end
			end
		end
		
	end
	
	
	
endmodule 