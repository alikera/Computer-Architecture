module PC(input clk, rst, PC_write, input [4:0] in,  output reg[4:0] pc);

	initial pc <= 5'b00000;
	always @(posedge clk, posedge rst) begin
		if(rst)
			pc <= 5'b00000;
		else if (PC_write)
			pc <= in;
	end

endmodule