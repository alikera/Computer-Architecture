`timescale 1ns/1ns

module mux2to1 #(parameter N)(input selector, input [N - 1:0] num0, num1, output [N -1:0] out);

	assign out = selector ? num1 : num0;

endmodule