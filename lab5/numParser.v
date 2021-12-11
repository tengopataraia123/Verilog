module numParser(
	input [0:14] number,
	output [0:3] number1,number2,number3,number4
	);
	
	assign number1 = number % 10;
	assign number2 = (number / 10) % 10;
	assign number3 = (number / 100) % 10;
	assign number4 = (number / 1000 ) % 10;
	
endmodule 