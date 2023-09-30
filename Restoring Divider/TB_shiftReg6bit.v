`timescale 1ns/1ns
module TB_shReg();
	reg clk = 0, ld = 0, sin = 0, clr = 0, sh = 0;
	reg [6:0] in;
	wire [6:0] out;
	wire sout;
	shiftReg #(7) TB1(in, clk, clr, ld, sh, sin, out, sout);
	always #33 clk = ~clk;
	initial begin
	#40 in = 7'b1010100;
	#10 ld = 1'b1;
	#120 sin = 1;
	#60 ld = 0;
	#190 clr = 1;
	#79 clr = 0;
	#109 sh = 1;
	#161 sh = 0;
	#184 in = 7'b1000110;
	#5 ld = 1;
	#10 ld = 0;
	#69 sh = 1;
	#5 sin = 0;
	#1000 $stop;
	end
endmodule
	
