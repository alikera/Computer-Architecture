`timescale 1ns/1ns

module testbenchDivider();
	
	reg [11:0] dividend;
	reg [5:0] divisor;
	reg clk = 1'b0;
	reg start = 1'b0;

	wire [5:0] quotient;
	wire [6:0] rem;
	wire done;

	restoringDivider TB(dividend, divisor, clk, start, quotient, rem, done);
	always #11 clk = ~clk;
	initial begin
	#10 dividend = 12'b001010110101;
	divisor = 6'b001011;
	start = ~start;
	#50 start = ~start;

	#653 dividend = 12'b011010010101;
	divisor = 6'b011111;
	start = ~start;
	#50 start = ~start;

	#653 dividend = 12'b000010010111;
	divisor = 6'b011010;
	start = ~start;
	#50 start = ~start;

	#653 dividend = 12'b0000011000;
	divisor = 6'b000001;
	start = ~start;
	#50 start = ~start;

	#653 dividend = 12'b001000000000;
	divisor = 6'b010000;
	start = ~start;
	#50 start = ~start;

	#777 $stop;
	end
endmodule
