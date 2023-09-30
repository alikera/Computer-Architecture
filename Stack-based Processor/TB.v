`timescale 1ns/1ns

module TB();
	reg clk = 1'b1, rst = 1'b1;
	Multi_Cycle MC(clk, rst);
	
	always #10 clk = ~clk;
	
	initial begin
		#7 rst = 1'b0;
		#1000 $stop;
	end

endmodule