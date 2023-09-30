`timescale 1ns/1ns
module MIPS(input clk, rst);
	wire reg_dest, PC_src, mem_read, mem_write, mem_to_reg, ALU_src, reg_write, jump, jal, jr, ALU_zero;
	wire [2:0] ALU_operation;
	wire [31:0] inst;
	wire [1:0] ALU_op;
	
	datapath dp(clk, rst, reg_dest, PC_src, mem_read, mem_write, mem_to_reg, ALU_src, reg_write, jump, jal, jr, 
	ALU_operation [2:0], inst [31:0], ALU_zero);
	control control(clk, inst [31:26], inst[5:0], ALU_zero, reg_dest, PC_src, mem_read, mem_write, mem_to_reg, ALU_src, reg_write, jump, jal, ALU_op);
	ALU_control alu_cont(clk, inst [5:0], ALU_op, jr, ALU_operation);
	
endmodule
