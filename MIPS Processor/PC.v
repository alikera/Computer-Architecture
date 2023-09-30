module PC(input [31:0] in, input clk, rst, output reg[31:0] pc);
//posedge ya negedge
	always @(negedge clk, posedge rst) begin
		if(rst)
			pc = 32'b00000000000000000000000000000000;
		else
			pc = in;
	end

endmodule
