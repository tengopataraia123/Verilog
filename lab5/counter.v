module counter(
	input clk,
	input pause,
	input reset,
	output [0:14] number);
	
	integer clkCount = 0;
	integer count = 0;
	
	assign number = count;
	
	reg oldPause = 0,oldReset = 0;
	
	reg paused = 0;
	
	always@(posedge clk) begin
		oldPause <= pause;
		oldReset <= reset;
	
	
		if(reset != oldReset) begin
			count <= 0;
		end
		
		if(oldPause != pause) begin
			paused = ~paused;
		end
		
		if(!paused) begin
			clkCount <= clkCount + 1;
			
			if(clkCount == 10) begin
				count <= count + 1;
				clkCount <= 0;
			end
		end
	end

	
endmodule 