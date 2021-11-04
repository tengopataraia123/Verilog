module master;
	reg [15:0] A,B;
	wire [31:0] read_data;
	
	reg [31:0] result =0 ;
	reg clk = 0;
	reg valid_signal = 0,start_calc=0;
	wire ready_signal;
	
	slave sv(valid_signal,clk,start_calc,A,B,read_data,ready_signal);
	
	always #5 clk = ~clk;
	
	initial begin
		#10;
		A = 24;
		B = 30;
		valid_signal = 1;
		#10;
		
		start_calc = 1;
		valid_signal = 1;
		#10;
		
		valid_signal = 0;
	end
	
	always@(posedge clk) begin
		if(ready_signal == 1) begin
			
			result <= read_data;
		end
	end
	
endmodule 