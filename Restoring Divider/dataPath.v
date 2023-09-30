`timescale 1ns/1ns
module dataPath(input [12:0] dividend, input [5:0] divisor, 
				input clk, init_dend, clr_dend, ld_dend, sh_dend, 
				init_q, clr_q, ld_q, sh_q, sIn_q, 
				clr_disor, ld_disor, ld_cnt, cnt_en,
				output [5:0] quotient,output [6:0] rem, output co);
	
	wire [12:0] temp;
	wire [6:0] out_dend, out_mux;
	wire [5:0] out_disor, temp_q;
	wire [6:0] out_sub, in1;
	wire sOut, sign, cnt_co, sIn_dend;
	wire [5:0] in2;
	wire [2:0] cnt_out;
	assign in1 = dividend[12:6];
	assign in2 = dividend[5:0];

	shiftReg #(7) shreg1(out_mux, in1, clk, clr_dend, ld_dend, sh_dend, sIn_dend, init_dend, out_dend, sOut);
	shiftReg #(6) shreg2(temp_q, in2, clk, clr_q, ld_q, sh_q, sIn_q, init_q, quotient, sIn_dend);
	
	register #(6) reg1(divisor, clk, clr_disor, ld_disor, out_disor);
	subtract sub(out_dend, out_disor, out_sub, sign);
	increaseQ inc(quotient, sign, temp_q);
	
	multiplexer mux(out_dend, out_sub, sign, out_mux);
	counter cnt(clk, ld_cnt, cnt_en, {3'b010}, cnt_out, cnt_co);

	assign rem = out_mux;
	assign co = cnt_co;

endmodule