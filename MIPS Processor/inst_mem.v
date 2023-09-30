module inst_mem(input[31:0]pc, input clk, output reg[31:0]instruction);
	reg [31:0] memory [32:0];
	
	integer i;
	integer code = 2348876776;
	initial begin
		for (i = 0; i < 20; i = i + 2) begin
			memory[i] = code;
			code = code + 4;
			memory[i+1] = 32'b00000000001000100001000000100000;
		end
		memory[20] = 32'b10101100000000100000011111010000;
	end

	always @(posedge clk)
		instruction = memory[pc];

endmodule

