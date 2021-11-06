module de0_nano_soc_baseline(


	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	
	//////////// KEY ////////////
	/* 3.3-V LVTTL */
	input				[1:0]			KEY,
	
	//////////// LED ////////////
	/* 3.3-V LVTTL */
	output reg [7:0] LED
	
);

	wire clk;
	assign clk = CLOCK_50;
	
	reg flag1 = 0;  //for key[0]
	reg flag2 = 0;  //for key[1]
	
	reg [2:0] stage = 3'b000;   //3 stage
	reg temp; //temporary bit
	
	
	reg [7:0] stage1Counter = 0;
	reg [7:0] stage2Counter = 0;
	
	
	//circular shift
	task changeState;
	begin
		temp = stage[2];
		stage = stage << 1;
		stage[0] = temp;
		
		
		//initial case
		if(stage == 0)
			stage = 1;
	end
	endtask
	
	
	always @(posedge clk) begin
		
		if(flag1 == 0 && KEY[0] == 1) begin
			flag1 <= 1;
			changeState();
		end
		if(flag1 == 1 && KEY[0] == 0) begin
			flag1 <= 0;
		end
	end
	
	always @(posedge clk) begin
		
		if(flag2 == 0 && KEY[1] == 1) begin
			flag2 <= 1;
			
			//increase appropriate stage counter
			
			if(stage == 3'b001)
				stage1Counter <= stage1Counter + 1;
			else if(stage == 3'b010)
				stage2Counter <= stage2Counter + 1;
			
		end
		if(flag2 == 1 && KEY[1] == 0) begin
			flag2 <= 0;
		end
	end
	
	always @(posedge clk) begin
		case(stage)
		3'b001 : begin
		LED <= 1;
		end
		3'b010 : begin 
		LED[1] <= 1;
		LED[0] <= 1;
		end
		3'b100 : LED[7:0] <= stage1Counter * stage2Counter;
		endcase
	end

endmodule