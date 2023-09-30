`timescale 1ns/1ns
module multiplexer(input [6:0] num1, num2, input selector, output reg [6:0] out);

	assign out = selector ? num1 : num2;

endmodule
