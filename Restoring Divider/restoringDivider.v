`timescale 1ns/1ns
module restoringDivider(input [11:0] dividend, input [5:0] divisor, input clk, start, output [5:0] quotient, output [6:0] rem, output done);

	wire init_dend, clr_dend, ld_dend, sh_dend, init_q, clr_q, ld_q, sh_q, sIn_q, clr_disor, ld_disor, ld_cnt, cnt_en, co;
	
	reg [12:0] dend;
	assign dend = {1'b0, dividend[11:0]};

	dataPath dp(dend, divisor, clk,
				init_dend, clr_dend, ld_dend, sh_dend, 
				init_q, clr_q, ld_q, sh_q, sIn_q, 
				clr_disor, ld_disor, ld_cnt, cnt_en,
				quotient, rem, co);
	
	controller cont(clk, co, start,
					init_dend, clr_dend, ld_dend, sh_dend, 
					init_q, clr_q, ld_q, sh_q, sIn_q, 
					clr_disor, ld_disor, 
					ld_cnt, cnt_en, done);

endmodule
