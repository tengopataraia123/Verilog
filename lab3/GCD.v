module GCD(
	input [3:0] number,
	input [1:0] buttons,
	input clk,
	output reg [7:0] result);
	
	reg [15:0] numbers = 0;
	
	reg [1:0] flags = 0;
	
	reg [7:0] num1,num2,reminder;
	
	reg startCalculation = 0;
	
	always@(posedge clk) begin
	
		if(buttons[0] == 0 && flags[0] == 0) begin
			numbers[3:0] <= number;
			numbers[7:4] <= numbers[3:0];
			numbers[11:8] <= numbers[7:4];
			numbers[15:12] <= numbers[11:8];
			flags[0] <= 1;
		end
		
		if(buttons[0] == 1 && flags[0] == 1) begin
			flags[0] <= 0;
		end
		
		if(buttons[1] == 0 && flags[1] == 0) begin
			twoscomplement(numbers[15:8],numbers[7:0],num1,num2);
			startCalculation <= 1'b1;
			flags[1] <= 1;
		end
		
		if(buttons[1] == 1 && flags[1] == 1) begin
			flags[1] <= 0;
		end
		
		
		if(startCalculation == 1'b1) begin
			reminder = num1%num2;
			num1 = num2;
			num2 = reminder;
			
			if(num1 == 0 || num2 == 0) begin
				startCalculation <= 0;
				result <= num1 + num2;
			end
			
		end
	
	end
	
	
	task twoscomplement(input [7:0] a,b, output reg [7:0] c,d);
		begin
			
			if(a[7] == 1'b1) begin
				c[6:0] = a[6:0];
				c = c*2+1;
			end
			else begin
				c = a;
			end
			
			if(b[7] == 1'b1) begin
				d[6:0] = b[6:0];
				d = d*2+1;
			end
			else begin
				d = b;
			end
			
			if(c < d) begin
				c = d + c;
				d = c - d;
				c = c - d;
			end
		
		end
	endtask
	
endmodule 