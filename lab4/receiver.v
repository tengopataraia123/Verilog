module receiver(
	input rx,clk,
	output reg [7:0] leds
	);
	
	reg startReceiving = 0;
	
	reg [8:0] data = 0;
	
	reg [3:0] rCounter = 0;
	reg startParityCheck = 0;
	integer i;
	reg [4:0] parityCount = 0;
	
	always@(posedge clk) begin
		if(rx == 0 && startReceiving == 0) begin
			startReceiving <= 1'b1;
			rCounter <= 1;
		end
		
		if(startReceiving == 1'b1 && rCounter != 9) begin
			data[rCounter-1] <= rx;
			rCounter <= rCounter+1;
		end
		
		if(rCounter == 9) begin
			startReceiving <= 0;
			startParityCheck <= 1'b1;
		end
		
		if(startParityCheck == 1'b1) begin
			
			for(i=0;i<9;i=i+1) begin
				if(data[i] == 1'b1) begin
					parityCount = parityCount + 1;
				end
			end
			
			if(parityCount%2 == 1) begin
				leds <= 8'b11111111;
			end
			
			if(parityCount%2 == 0) begin
				leds <= data[7:0];
			end
			
			rCounter <= 0;
			startParityCheck <= 0;
		end
	end
	
	initial begin
		leds = 0;
	end
	
endmodule 