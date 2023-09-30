`timescale 1 ns/ 1 ns

module register(input clk,rst, ld, input [7:0] r_in, output reg [7:0] r_out);

	always @(posedge clk, posedge rst) begin
		if(rst == 1'b1)
			r_out <= 0;
		else if(ld == 1'b1)
			r_out <= r_in;
	end
	
 endmodule

