`timescale 1ns/1ns

module ALU_TB();
	reg [31:0] A, B;
	reg [2:0] op;
	wire [31:0] res;
	wire z;
	
	ALU TB1(A, B, op, res, z);

	initial begin
	#1 A = 32'd8;
	#1 B = 32'd2;
	#10 op = 3'd0;
	#10 op = 3'd1;
	#10 op = 3'd2;
	#10 op = 3'd3;
	#10 op = 3'd7;
	#10 B = 32'd8;
	#50 $stop;
	end
endmodule
