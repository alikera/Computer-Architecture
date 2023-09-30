`timescale 1ns/1ns

module data_memory(input clk, rst, mem_read, mem_write, input [31:0] address, write_data, 
				   output reg [31:0] read_data);

	reg [31:0] mem [0:65535];
	initial begin
		mem[1000] = 32'd1;
		mem[1004] = 32'd2;
		mem[1008] = 32'd3;
		mem[1012] = 32'd4;
		mem[1016] = 32'd5;
		mem[1020] = 32'd6;
		mem[1024] = 32'd7;
		mem[1028] = 32'd8;
		mem[1032] = 32'd9;
		mem[1036] = 32'd10;
	end
	
	integer i;

	always @(negedge clk, posedge rst) begin
		if (mem_write)
			mem[address] <= write_data;
	end

	assign read_data = mem_read ? mem[address] : 32'd0;

endmodule