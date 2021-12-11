module diplayControler(
	input clk,
	input [0:3] number1,number2,number3,number4,
	output reg anode1,anode2,anode3,anode4,
	output reg A,B,C,D,E,F,G
);

	reg[0:1] i = 0;
	
	reg [0:3] number = 0;
	
	always@(posedge clk) begin
		i <= i + 1;
		
		if(i >=  3) begin
			i <= 0;
		end

		case(i)
			0: begin
				number <= number1;
				anode1 <= 1;
				anode2 <= 0;
				anode3 <= 0;
				anode4 <= 0;
			end
			1: begin
				number <= number2;
				anode1 <= 0;
				anode2 <= 1;
				anode3 <= 0;
				anode4 <= 0;
			end
			2: begin
				number <= number3;
				anode1 <= 0;
				anode2 <= 0;
				anode3 <= 1;
				anode4 <= 0;
			end
			3: begin
				number <= number4;
				anode1 <= 0;
				anode2 <= 0;
				anode3 <= 0;
				anode4 <= 1;
			end
		endcase
		
		case(number)
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