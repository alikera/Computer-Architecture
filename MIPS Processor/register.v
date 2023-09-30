`timescale 1ns/1ns
module register (input [31:0] pIn, input clk, clr, ld, output reg [31:0] PO);
	reg [31:0] J;
	always @ (posedge clk) begin
		if (clr)
			J <= 0;
		else if(ld)
			J <= pIn;
	end

	assign PO = J;

endmodule


