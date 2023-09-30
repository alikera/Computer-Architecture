`timescale 1ns/1ns

module subtract(input [6:0] num_1, input [5:0] num_2, output [6:0] out, output sign);
	wire [5:0] t_num_2;
	twosComplement tc(num_2, t_num_2);
	assign out = num_1 + {1'b1, t_num_2};
	assign sign = out[6];
endmodule
