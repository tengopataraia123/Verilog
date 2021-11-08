module GCD(
	input [3:0] number,
	input [1:0] buttons,
	input clk,
	output reg [7:0] result);
	
	reg [15:0] numbers = 0;
	
	reg [7:0] num1 = 0,num2 = 0,reminder = 0,finalNum1=0,finalNum2 = 0;
	
	reg [1:0] oldButtons = 0;
	
	reg startCalculation = 0,assignFlag = 0,finished = 0;
	
	wire [7:0] a,b;
	
	assign a = numbers[15:8];
	assign b = numbers[7:0];
	
	always@(posedge clk) begin
	
		oldButtons <= buttons;
	
		if(buttons[0] != oldButtons[0] && buttons[0] == 0) begin
			numbers[3:0] <= number;
			numbers[7:4] <= numbers[3:0];
			numbers[11:8] <= numbers[7:4];
			numbers[15:12] <= numbers[11:8];
		end
		
		
		if(buttons[1] != oldButtons[1] && buttons[1] == 0) begin
			if(a[7] == 1'b1) begin
				num1 <= ~a+1;
			end
			else begin
				num1 <= a;
			end
			
			if(b[7] == 1'b1) begin
				num2 <= ~b+1;
			end
			else begin
				num2 <= b;
			end
		end
		
		if(num1 < num2 && startCalculation == 0) begin
				num1 <= num2;
				num2 <= num1;
		end
		
		if(num1 >= num2 && num1 != 0 && num2 != 0) begin
			startCalculation <= 1'b1;
		end
				
		if(startCalculation == 1'b1) begin
			if(assignFlag == 0) begin
				finalNum1 = num1;
				finalNum2 = num2;
				assignFlag <= 1'b1;
			end
			reminder = finalNum1%finalNum2;
			finalNum1 = finalNum2;
			finalNum2 = reminder;
			
			if(finalNum1 == 0 || finalNum2 == 0) begin
				startCalculation <= 0;
				assignFlag <= 0;
				num1 <= 0;
				num2 <= 0;
				result <= finalNum1 + finalNum2;
			end
			
		end
	
	end
	
endmodule 