`timescale 1ns/1ns

module Stack(input clk, rst, input [7:0] d_in, input push, pop, tos, output reg [7:0] d_out);

	reg [7:0] ptr;
	reg [7:0] stack [0:31];
	
	initial begin
		ptr <= 8'b00000010;
		stack[0] <= 8'b00010101;
		stack[1] <= 8'b00111111;
	end

	always @(negedge clk, posedge rst) begin
		if (push)
			ptr <= ptr + 1;
			
		else if (pop)
			ptr <= ptr - 1;
	end

	always @(negedge clk) begin
		if (push || pop) begin
			if(push)
				stack[ptr] <= d_in;
			
			if (pop)
				stack[ptr - 1] <= 8'bxxxxxxxx;
				
			d_out <= stack[ptr-1];
		end
		
		else if(tos)
			d_out <= stack[ptr - 1];
	end

endmodule