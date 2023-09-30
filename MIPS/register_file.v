`timescale 1ns/1ns

module register_file(input clk, rst, reg_write_en, input [4:0] read_addr1, read_addr2, write_addr, input [31:0] write_data, 
					output [31:0] read_data1, read_data2);

	reg [31:0] regs [31:0];

	integer i;

	always @(posedge clk, posedge rst) begin
		if (rst) begin
			for (i = 0; i < 32; i = i + 1)
				regs[i] = 32'd0;
		end

		else if (reg_write_en)
			regs[write_addr] <= write_data;
	end

	assign read_data1 = regs[read_addr1];
	assign read_data2 = regs[read_addr2];

endmodule