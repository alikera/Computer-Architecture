`timescale 1ns/1ns

module twosComplement(input [5:0] inp, output [5:0] out);
	assign out  = ~inp + 1'b1;
endmodule
