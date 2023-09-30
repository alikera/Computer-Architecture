`timescale 1ns/1ns
module counter(input clk, ld, en, input [2:0] init, output reg [2:0] PO, output co);

	always @(posedge clk) begin
		if (ld)
			PO <= init;
		else if(en)
			PO <= PO + 1;
	end

	assign co = & PO;

endmodule

