`timescale 1ns/1ns
module TB_counter();
	reg clk = 0, en = 0;
	reg [2:0] init;
	wire [2:0] po;
	wire co;
	counter TB2(clk, en, init, po, co);
	always #100 clk = ~clk;
	initial begin
	#10 init = 3'b010;
	#150 en = ~en;
	#2000 $stop;
	end
endmodule
