`timescale 1ns/1ns

module control(input clk, input [5:0] opcode,func, input zero,
				output reg reg_dest, PC_src, mem_read, mem_write, mem_to_reg, ALU_src, reg_write, jump, jal,
				output reg [1:0] ALU_op);

	reg bne, beq;
	always @(opcode,func,clk) begin

		{reg_dest, beq, bne, mem_read, mem_write, mem_to_reg, ALU_src, reg_write, jump, jal} <= 10'd0;
		ALU_op <= 2'b00;

		case(opcode)	
			6'd0: begin//add, sub, slt, jr
				{reg_dest, reg_write} <= 2'b11;
				ALU_op <= 2'b10; end
			//addi
			6'd8:
				{reg_write, ALU_src} <= 2'b11;
			//slti
			6'd10: begin
				{reg_write, ALU_src} <= 2'b11;
				ALU_op <= 2'b11; end
			//lw
			6'd35:
				{reg_write, ALU_src, mem_read, mem_to_reg} <= 4'b1111;
			//sw
			6'd43:
				{ALU_src, mem_write} <= 2'b11;
			//j
			6'd2:
				jump <= 1'b1;
			//jal
			6'd3: begin
				reg_write <= 1'b1;
				jal <= 1'b1; 
				jump <= 1'b1;
				end
			//beg
			6'd4: begin
				beq <= 1'b1;
				ALU_op <= 2'b01; end
			//bne
			6'd5: begin
				bne <= 1'b1;
				ALU_op <= 2'b01; end
		endcase
	end	

	assign PC_src = (beq & zero) | (bne & ~zero);
endmodule