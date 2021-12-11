module counter(
	input clk,
	input pause,
	input reset,
	output [0:14] number);
	
	integer clk_count = 0;
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
			clk_count <= clk_count + 1;
			
			if(clk_count == 50000000) begin
				count <= count + 1;
				clk_count <= 0;
			end
		end
	end

	
endmodule 