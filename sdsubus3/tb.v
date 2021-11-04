module tb();
	reg [15:0] A,B;
	
	wire [31:0] result ;
	reg clk = 0;
	reg valid_signal = 0;
	wire ready_signal;
	reg [31:0] data;
	
	bus sdsubus(A,B,valid_signal,clk,ready_signal,result);
	
	always #5 clk = ~clk;
	
	initial begin
		#10;
		A = 25;
		B = 25;
		valid_signal = 1;
		#10;
		
		valid_signal = 1;
		#10;
		
		valid_signal = 0;
	end
	
	always@(posedge clk) begin
		if(ready_signal == 1) begin
			//do something with data
			data <= result;
		end
	end
endmodule 