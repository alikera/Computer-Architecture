`timescale 1ns/1ns
module MUX #(parameter N) (input [N-1:0] up, down, input selector, output [N-1:0] out);
	assign out = selector ? down : up;
endmodule
