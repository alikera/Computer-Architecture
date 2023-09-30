`timescale 1ns/1ns
module shiftReg #(parameter N)(input [N-1:0] pIn, pIn_2, input clk, clr, ld, sh, sIn, init, output reg [N-1:0] PO, output reg sOut);

	reg [N-1:0] J;

	always @ (posedge clk) begin
		if (clr)
			J <= 0;
		else if(init)
			J <= pIn_2;
		else if(ld)
			J <= pIn;
		else if(sh)
			J <= {J[N-2:0], sIn};
	end

	assign PO = J;
	assign sOut = J[N-1];

endmodule
