`timescale 1ns/1ns

module mux3to1 #(parameter N) (input [1:0] selector, input [N - 1:0] num0, num1, num2, output [N - 1:0] out);

	assign out = (selector == 2'b00) ? num0 : 
			        (selector == 2'b01) ? num1 :
			        (selector == 2'b10) ? num2 : 0;

endmodule
