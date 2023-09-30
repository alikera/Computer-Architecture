`timescale 1ns/1ns
module datapath(input clk, rst, input reg_dest, PC_src, mem_read, mem_write, mem_to_reg, ALU_src, reg_write, jump, jal, jr, 
				input [2:0] ALU_operation, output [31:0] inst, output ALU_zero);
	wire [31:0] PC_out, read_data1, read_data2, out_sign_ext, read_data, out_adder, out_adderr, out_PC_src, out_jal, out_ALU_src, out_mem_to_reg, ALU_result, out_jump, out_jr;
	wire [4:0] out_reg_dest, out_jal_2; 
	PC my_pc(out_jr, clk, rst, PC_out);
	adder my_adder(PC_out, 32'd4, out_adder);
	inst_mem my_im({2'b00,PC_out[31:2]}, clk, inst);
	adder my_adderr(out_adder, {out_sign_ext[29:0], 2'b00}, out_adderr);
	MUX #(32) mux_5(out_adder, out_adderr, PC_src, out_PC_src);
	MUX #(32) mux_6(out_PC_src, {out_adder[31:28], inst[25:0], 2'b00}, jump, out_jump);
	MUX #(32) mux_7(out_jump, read_data1, jr, out_jr);
	
	MUX #(5) mux_1(inst[20:16], inst[15:11], reg_dest, out_reg_dest);
	MUX #(5) mux_8(out_reg_dest, 5'd31, jal, out_jal_2);
	
	register_file my_rf(clk, rst, reg_write, inst[25:21], inst[20:16], out_jal_2, out_jal, read_data1, read_data2);
	sign_extend my_se(inst[15:0], out_sign_ext);
	MUX #(32) mux_2(read_data2, out_sign_ext, ALU_src, out_ALU_src);
	MUX #(32) mux_3(out_mem_to_reg, out_adder, jal, out_jal);
	
	ALU my_alu(read_data1, out_ALU_src, ALU_operation, ALU_result, ALU_zero);
	
	data_memory my_dm(clk, rst, mem_read, mem_write, ALU_result, read_data2, read_data);
	MUX #(32) mux_4(ALU_result, read_data, mem_to_reg, out_mem_to_reg);
	
endmodule