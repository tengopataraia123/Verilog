module tb;

	reg clk  =0;
	wire uart_clock ;
	
	wire [7:0] leds;
	
	reg [7:0] btn = 2'b11;
	reg [3:0] sw = 0;
	
	wire tx;
	wire startTransmit,transmitFinished;
	
	wire [10:0] uart_packet;
	
	always #20 clk <= ~clk;
	
	uartclk uc(clk,uart_clock);
	receiver rr(tx,uart_clock,leds);
	transmiter tr(uart_clock,startTransmit,uart_packet,transmitFinished,tx);
	uartPacketGenerator gen(clk,btn,sw,transmitFinished,startTransmit,uart_packet);
	
	initial begin
		#10;
		sw = 4'b0000;
		#20;
		btn[0] <= 0;
		#20;
		btn[0] <= 1'b1;
		#20;
		sw = 4'b0100;
		#20;
		btn[0] <= 0;
		#20;
		btn[0] <= 1'b1;
		#20;
		btn[1] <= 0;
		#20;
		btn[1] <= 1'b1;
		#20;
	end

endmodule 