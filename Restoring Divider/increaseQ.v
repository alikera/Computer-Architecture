`timescale 1ns/1ns
module increaseQ(input [5:0] num, input sign, output reg [5:0] out);

	assign out = sign ? num : {num[5:1], 1'b1};

endmodule
