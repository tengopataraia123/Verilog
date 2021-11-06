module GCD(
	input [3:0] number,
	input [1:0] buttons,
	input clk,
	output reg [7:0] result);
	
	reg [15:0] numbers = 0;
	
	reg [7:0] num1,num2,reminder;
	
	reg [1:0] oldButtons = 0;
	
	reg startCalculation = 0;
	
	always@(posedge clk) begin
	
		oldButtons <= buttons;
	
		if(buttons[0] != oldButtons[0]) begin
			numbers[3:0] <= number;
			numbers[7:4] <= numbers[3:0];
			numbers[11:8] <= numbers[7:4];
			numbers[15:12] <= numbers[11:8];
		end
		
		
		if(buttons[1] != oldButtons[1]) begin
			twoscomplement(numbers[15:8],numbers[7:0],num1,num2);
			startCalculation <= 1'b1;
		end
		
		
		if(startCalculation == 1'b1) begin
			reminder <= num1%num2;
			num1 <= num2;
			num2 <= reminder;
			
			if(num1 == 0 || num2 == 0) begin
				startCalculation <= 0;
				result <= num1 + num2;
			end
			
		end
	
	end
	
	
	task twoscomplement(input [7:0] a,b, output reg [7:0] c,d);
		begin
			
			if(a[7] == 1'b1) begin
				c <= a*2+1;
			end
			else begin
				c <= a;
			end
			
			if(b[7] == 1'b1) begin
				d <= d*2+1;
			end
			else begin
				d <= b;
			end
			
			if(c < d) begin
				c <= d + c;
				d <= c - d;
				c <= c - d;
			end
		
		end
	endtask
	
endmodule 