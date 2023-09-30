`timescale 1ns/1ns

module ALU(input [31:0] A, B, [2:0] operation, output reg [31:0] ALU_result, output reg zero);

	always @ (*) begin
		ALU_result = 32'b0;
		zero = 1'b0;
		if (A == B)
			zero <= 1'b1;
		case (operation)
			3'd0: ALU_result <= A & B;
			3'd1: ALU_result <= A | B;
			3'd2: ALU_result <= A + B;
			3'd3: ALU_result <= A - B;
			3'd7: ALU_result <= A < B;
			default: ALU_result <= 32'd0;
		endcase
	end
endmodule
