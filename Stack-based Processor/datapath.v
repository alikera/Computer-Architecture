`timescale 1ns/1ns

module datapath(input clk, rst, IorD, PC_write, mem_write, mem_read, IR_write, push, pop, tos, AorB, A_write, B_write, ALU_srcA, PC_src,
			         input [1:0] ALU_srcB, push_src, ALU_control,
			         output zero, output [2:0] opcode);
				
	wire [4:0] PC_in, PC_out, address;
	wire [7:0] read_data, IR_out, MDR_out, A_out, B_out, d_in, d_out, ALU_inpA, ALU_inpB, ALU_res, ALU_out;
				
	PC my_pc(clk, rst, PC_write, PC_in, PC_out);
	
	mux2to1 #(5) inst(IorD, PC_out, IR_out[4:0], address);
	
	inst_mem mem(clk, rst, mem_read, mem_write, A_out, address, read_data);
	
	register IR(clk, rst, IR_write, read_data, IR_out);
	register MDR(clk, rst, 1'b1, read_data, MDR_out);
	
	mux3to1 #(8) stkSrc(push_src, MDR_out, A_out, ALU_out, d_in);
	Stack stack(clk, rst, d_in, push, pop, tos, d_out);
	
	register A(clk, rst, A_write, d_out, A_out);
	register B(clk, rst, B_write, d_out, B_out);
	
	mux2to1 #(8) srcA(ALU_srcA, {PC_out[4], PC_out[4], PC_out[4], PC_out}, A_out, ALU_inpA);
	mux3to1 #(8) srcB(ALU_srcB, B_out, 8'b00000001, 8'b00000000, ALU_inpB);
	
	ALU alu(ALU_inpA, ALU_inpB, ALU_control, zero, ALU_res);
	
	register reg_ALU(clk, rst, 1'b1, ALU_res, ALU_out);
	
	mux2to1 #(5) srcPC(PC_src, ALU_res[4:0], IR_out[4:0], PC_in);
	
	assign opcode = IR_out[7:5];

endmodule
