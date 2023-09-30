module inst_mem(input clk, rst, mem_read, mem_write, input [7:0] write_data, input[4:0] adr, output reg[7:0] read_data);
	
	reg [7:0] memory [0:31];
	
	initial begin
		memory[15] <= 8'd7;
		memory[16] <= 8'd10;
		memory[17] <= 8'd3;
		memory[18] <= 8'd22;
		memory[22] <= 8'd0;

		memory[0] <= 8'b10010010;
		memory[1] <= 8'b10010000;
		memory[2] <= 8'b000xxxxx;
		
		memory[3] <= 8'b10001111;
		memory[4] <= 8'b10010001;
		memory[5] <= 8'b000xxxxx;

		memory[6] <= 8'b001xxxxx;
		memory[7] <= 8'b10110110;
		/*memory[1] <= 8'b000xxxxx;
		memory[2] <= 8'b001xxxxx;
		memory[3] <= 8'b10010010;
		memory[4] <= 8'b10010001;
		memory[5] <= 8'b011xxxxx;
		memory[6] <= 8'b010xxxxx;
		
		memory[11] <= 8'b10010010;
		memory[12] <= 8'b10010110;
		memory[13] <= 8'b11100000;
		
		
		memory[7] <= 8'b11001011;*/
		
		
	end

	always @(negedge clk) begin
		if (mem_write)
			memory[adr] <= write_data;
		else if (mem_read)
			read_data <= memory[adr];
	end

endmodule


