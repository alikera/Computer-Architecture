`timescale 1ns/1ns

module adder(input [31:0] num_1, input [31:0] num_2, output [31:0] out);
	assign out = num_1 + num_2;
endmodule

