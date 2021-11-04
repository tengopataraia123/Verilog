module tb();

	reg clk = 0;
	
	always #10 clk = ~clk;
	
	reg [1:0] keys = 0;
	wire [7:0] leds;
	
	de0_nano_soc_baseline counter(clk,keys,leds);
	
	initial begin
	#50;
	keys[0] = 1;
	#50;
	keys[0] = 0;
	#50;
	
	keys[1] = 1;
	#50;
	keys[1] = 0;
	#50;
	keys[1] = 1;
	#50;
	keys[1] = 0;
	#50;
	
	
	
	
	
	keys[0] = 1;
	#50;
	keys[0] = 0;
	#50;
	keys[1] = 1;
	#50;
	keys[1] = 0;
	#50;
	keys[1] = 1;
	#50;
	keys[1] = 0;
	#50;
	keys[1] = 1;
	#50;
	keys[1] = 0;
	#50;
	
	
	
	keys[0] = 1;
	#50;
	keys[0] = 0;
	#50;
	
	
	
	end
	

endmodule 