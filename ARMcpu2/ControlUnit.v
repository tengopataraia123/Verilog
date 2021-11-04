module ControlUnit(
	input clk
	);
	
	wire [31:0] pc;
	
	wire [31:0] instruction;
	
	//alias data op
	wire [1:0] op = instruction[27:26];
	wire I = instruction[25];
	wire [3:0] Rn = instruction[19:16];
	wire [3:0] Rd = instruction[15:12];
	wire [3:0] Rm = instruction[3:0];
	wire [7:0] imm8 = instruction[7:0];
	
	
	//alias memory op
	wire P = instruction[24];
	wire U = instruction[23];
	wire B = instruction[22];
	wire W = instruction[21];
	wire L = instruction[20];
	wire [11:0] imm12 = instruction[11:0];
	
	
	//ALU
	reg [31:0] data1,data2;
	wire [ 31:0] result;
	reg [3:0] aluInstruction = 0;
	
	
	//register file
	reg [3:0] addr_a = 0,addr_b = 0,addr_c=0;
	reg [31:0] data_a = 0,data_b = 0,data_c=0;
	reg we_a = 0,we_b = 0,we_c = 0;
	wire [31:0] q_a,q_b,q_c;
	
	//ram
	reg [7:0] ramDataAddress;
	reg [31:0] ramDataIn;
	wire [31:0] ramDataOut;
	reg ramEnWrite = 0;
	
	
	tdpRam ram(
	.clk(clk),
	.addr_b(pc[7:0]),
	.q_b(instruction),
	.addr_a(ramDataAddress),
	.data_a(ramDataIn),
	.q_a(ramDataOut),
	.we_a(ramEnWrite)
	);
	
	RegFile regFile(
		addr_a,addr_b,addr_c,
		data_a,data_b,data_c,
		we_a,we_b,we_c,
		clk,
		q_a,q_b,q_c,
		pc		
	);
	
	Alu alu(
		.instruction(aluInstruction),
		.data_a(data1),
		.data_b(data2),
		.value(result)
		);
	
	always @(instruction) begin
		if(op == 2'b00 && I == 1) begin
			aluInstruction = instruction[24:21];
			addr_a = Rn;
			data1 = q_a;
			data2 = imm8;
			addr_c = Rd;
		end
		
		if(op == 2'b00 && I == 0) begin
			aluInstruction = instruction[24:21];
			addr_a = Rn;
			data1 = q_a;
			addr_b = Rm;
			data2 = q_b;
			addr_c = Rd;
		end
		
		if(op == 2'b01) begin
			
			//load (offset address in immediate)
			if(I == 0 && P == 1 && U == 1 && B == 0 && W == 0 && L == 1) begin
				
				//calculate address
				aluInstruction = 4'b0100; //add
				addr_a = Rn;
				data1 = q_a;
				data2 = imm12;
				
				//load from address to register
				ramDataAddress = result[7:0];
				addr_c = Rd;
				data_c = ramDataOut;
			end
			
			
			//store offset address in register
			if(I == 1 && P == 1 && U == 1 && B == 0 && W == 0 && L == 0) begin
				
				//calculate address
				aluInstruction = 4'b0100; //add
				addr_a = Rn;
				data1 = q_a;
				addr_b = Rm;
				data2 = q_b;
				
				//load from address to register
				ramDataAddress = result[7:0];
				addr_c = Rd; //select register
				ramDataIn = q_c;
			end
		
		end
	
	end
	
	always @(result) begin
		we_c <= 1;
		data_c <= result;
	end
	
	always @(negedge clk) begin
		we_c <= 0;
	end
	
endmodule 