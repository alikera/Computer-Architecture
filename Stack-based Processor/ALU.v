`timescale 1ns/1ns

module ALU(input [7:0] A, input [7:0] B, input [1:0] cont, output zero, output [7:0] out);

	assign zero = (A == 8'b00000000) ? 1'b1 : 1'b0;
	
	assign out = (cont == 2'b00) ? A + B :
			        (cont == 2'b01) ? B - A :
			        (cont == 2'b10) ? A & B :
			        (cont == 2'b11) ? ~A : 8'b00000000;
	
endmodule
