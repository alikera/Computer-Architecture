`timescale 1ns/1ns
module register #(parameter N)(input [N-1:0] pIn, input clk, clr, ld, output reg [N-1:0] PO);
	reg [N-1:0] J;
	always @ (posedge clk) begin
		if (clr)
			J <= 0;
		else if(ld)
			J <= pIn;
	end

	assign PO = J;

endmodule

