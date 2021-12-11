module diplayControler(
	input clk,
	input [0:15] number,
	output reg a1,a2,a3,a4,
	output reg A,B,C,D,E,F,G
);

	reg[0:1] i = 0;
	
	reg [0:3] num = 0;
	
	assign num1 = number % 10;
	assign num2 = (number / 10) % 10;
	assign num3 = (number / 100) % 10;
	assign num4 = (number / 1000 ) % 10;
	
	always@(posedge clk) begin
		i <= i + 1;
		
		if(i >=  3) begin
			i <= 0;
		end
		
		a1 <= 0;
		a2 <= 0;
		a3 <= 0;
		a4 <= 0;

		case(i)
			0: begin
				num <= num1;
				a1 <= 1;
			end
			1: begin
				num <= num2;
				a2 <= 1;
			end
			2: begin
				num <= num3;
				a3 <= 1;
			end
			3: begin
				num <= num4;
				a4 <= 1;
			end
		endcase
		
		case(num)
			0: begin
				A <= 1;
				B <= 1;
				C <= 1;
				D <= 1;
				E <= 1;
				F <= 1;
				G <= 0;
			end
			1: begin
				A <= 0;
				B <= 1;
				C <= 1;
				D <= 0;
				E <= 0;
				F <= 0;
				G <= 0;
			end
			2: begin
				A <= 1;
				B <= 1;
				C <= 0;
				D <= 1;
				E <= 1;
				F <= 0;
				G <= 1;
			end
			3: begin
				A <= 1;
				B <= 1;
				C <= 1;
				D <= 1;
				E <= 0;
				F <= 0;
				G <= 1;
			end
			4: begin
				A <= 0;
				B <= 1;
				C <= 1;
				D <= 0;
				E <= 0;
				F <= 1;
				G <= 1;
			end
			5: begin
				A <= 1;
				B <= 1;
				C <= 0;
				D <= 1;
				E <= 1;
				F <= 0;
				G <= 1;
			end
			6: begin
				A <= 1;
				B <= 0;
				C <= 1;
				D <= 1;
				E <= 1;
				F <= 1;
				G <= 1;
			end
			7: begin
			
			end
			8: begin
				A <= 1;
				B <= 1;
				C <= 1;
				D <= 0;
				E <= 0;
				F <= 0;
				G <= 0;
			end
			9: begin
				A <= 1;
				B <= 1;
				C <= 1;
				D <= 1;
				E <= 0;
				F <= 1;
				G <= 1;
			end
			default: begin
				A <= 0;
				B <= 0;
				C <= 0;
				D <= 0;
				E <= 0;
				F <= 0;
				G <= 0;
			end
		endcase
		
	end	

endmodule 