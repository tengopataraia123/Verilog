module ControlUnit(
	input clk
	);
	reg [31:0] regs[15:0];
	reg [31:0] PC = 0;
	
	
	//for ram
	reg [31:0] instruction;  //strores next instruction
	reg [31:0] dataForRam; 	//stores data to be writeen in ram
	wire [31:0] dataFromRam; //stores data read from ram
	reg [7:0] addrForRam; // store address of ram where data will be written
	reg we_a;					//enable writing mode in ram
	
	wire [31:0] nextInstruction; //stores previous instruction
	
	//for alu
	reg [31:0] data1;
	reg [31:0] data2;
	wire [31:0] result;
		
	wire [1:0] op = instruction[27:26];
	wire i = instruction[25];  //intermediate or not
	wire [3:0] cmd = instruction[24:21];
	
	
	//for imediate data proccessing
	wire [3:0] Rn = instruction[19:16];
	wire [3:0] Rd = instruction[15:12];
	wire [3:0] rot = instruction[11:8];
	wire [7:0] imm8 = instruction[7:0];
	
	//data proccessing on registers
	wire [3:0] Rm = instruction[3:0];
	
	
	//for immediate memory operation
	wire invI = ~instruction[25];
	wire P = instruction[24];
	wire U = instruction[23];
	wire B = instruction[22];
	wire W = instruction[21];
	wire L = instruction[20];
	wire [11:0] imm12 = instruction[11:0];
	
	RAM ram(
	.data_a(dataForRam),
	.addr_a(addrForRam),
	.addr_b(regs[15][5:0]),
	.we_a(we_a),
	.clk(clk),
	.q_a(dataFromRam), 
	.q_b(nextInstruction)
	);
	
	ALU alu(
	.clk(clk),
	.data1(data1),
	.data2(data2),
	.cmd(cmd),
	.result(result)
	);
	
	always @(posedge clk) begin
		instruction = nextInstruction;
		
		PC = PC + 1;
		if(invI == 0 && P == 1 && U == 1 && B == 0 && W == 0 && L == 0)
			we_a <= 1;
		else
			we_a <= 0;
	end
	
	always @(*) begin
		if(op == 2'b00)begin
			//imediate
			if(i) begin
				data1 <= regs[Rn];
				data2 <= (imm8>>(rot*2));
			end
			else begin
				data1 <= regs[Rn];
				data2 <= regs[Rm];
			end
			regs[Rd] <= result;
		end
		
		if(op == 2'b01) begin
			if(invI == 1 && P == 1 && U == 1 && B == 0 && W == 0 && L == 1) begin
				addrForRam <= regs[Rn] + imm12;
				regs[Rd] <= dataFromRam;
			end
			if(invI == 0 && P == 1 && U == 1 && B == 0 && W == 0 && L == 0) begin
				addrForRam <= regs[Rn] + regs[Rm];
				dataForRam <= regs[Rd];
			end
		end
		
		//increase pc
		regs[15] = PC;
	end
	
	integer count;
	initial begin
		//initialize regs
		for(count = 0; count < 16; count = count + 1)
			regs[count] = 0;
		regs[3] = 39;
	end
	
endmodule 