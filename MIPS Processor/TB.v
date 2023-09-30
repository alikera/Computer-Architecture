`timescale 1ns/1ns
module TB();
	reg clk = 1'b0, rst = 1'b0;
	MIPS m(clk, rst);
	always #10 clk = ~clk;
	initial begin
	#4 rst = 1'b1;
	#1 rst = 1'b0;
	#10000 $stop;
	end
endmodule
	