`timescale 1ns/1ns

module Multi_Cycle(input clk, rst);

	wire IorD, PC_write, mem_write, mem_read, IR_write, push, pop, tos, AorB, A_write, B_write, ALU_srcA, PC_src;
	wire[1:0] ALU_srcB, push_src, ALU_control;
	wire zero;
	wire [2:0] opcode;	

	datapath dp(clk, rst, IorD, PC_write, mem_write, mem_read, IR_write, push, pop, tos, AorB, A_write, B_write, ALU_srcA, PC_src,
			         ALU_srcB, push_src, ALU_control,
			         zero, opcode);

	controller cont(clk, rst, zero, opcode,
		    		IorD, PC_write, mem_write, mem_read, IR_write, push, pop, tos, AorB, A_write, B_write, ALU_srcA, PC_src,
					ALU_srcB, push_src, ALU_control);

endmodule
