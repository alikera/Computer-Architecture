`timescale 1ns/1ns

`define Start 3'b000
`define Init 3'b001
`define Sub 3'b010
`define Shift 3'b011
`define Check 3'b100
`define End 3'b101

module controller(input clk, cnt_co, start,
        output reg init_dend, clr_dend, ld_dend, sh_dend, init_q, clr_q, ld_q, sh_q, sIn_q, clr_disor, ld_disor, ld_cnt, cnt_en, done);

	reg[2:0] ps, ns;

	always @(ps, cnt_co, start) begin
		ns <= `Start;
		case (ps)
			`Start:
				ns <= start ? `Init : `Start;
			`Init:
				ns <= start ? `Init : `Sub;
			`Sub:
				ns <= `Shift;
			`Shift:
				ns <= cnt_co ? `Check : `Sub;
			`Check:
				ns <= `End;
			`End:
				ns <= `Start;
		endcase
	end

	always @(ps, cnt_co, start) begin
		{init_dend, clr_dend ,ld_dend, sh_dend, init_q, clr_q, ld_q, sh_q, sIn_q, clr_disor, ld_disor, ld_cnt, cnt_en, done} = 14'b00000000000000;

		case (ps)
			`Start:begin
				done <= 1'b0;
				init_dend <= 1'b1;
				ld_disor <=1'b1;
				init_q <= 1'b1;
			end
			`Init:begin
				ld_cnt <= 1'b1;
			end
			`Sub:begin
				ld_dend <= 1'b1;
				ld_q <= 1'b1;
			end
			`Shift:begin
				sh_dend <= 1'b1;
				sh_q <= 1'b1;
				cnt_en <= 1'b1;
			end
			`Check:
				ld_q <= 1'b1;
			`End:
				done <= 1'b1;
		endcase
	end

	always @(posedge clk) begin
		ps <= ns;
	end

endmodule
