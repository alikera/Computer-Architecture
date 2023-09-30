`timescale 1ns/1ns

module sign_extend(input [15:0] num_1, output [31:0] out);
	wire [16:0] ones, zeroes;
	assign ones = 16'b1111111111111111;
	assign out = num_1[15] ? {ones, num_1} : {16'd0, num_1};
endmodule


