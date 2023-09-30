`timescale 1ns/1ns
module controller(input clk, rst, zero, input [2:0] opcode,
		    output reg IorD, PC_write, mem_write, mem_read, IR_write, push, pop, tos, AorB, A_write, B_write, ALU_srcA, PC_src,
			output reg [1:0] ALU_srcB, push_src, ALU_op);
	
	reg j, jz;
	reg [3:0] ps, ns;
	parameter [3:0]
	IF = 0, ID = 1, Add = 2, Sub = 3, And = 4, Not = 5, Push = 6, Pop = 7, Jump = 8, JZ = 9, RT = 10, Push_2 = 11, DUMMY = 12;
	always@(ps)begin
		ns <= DUMMY;
		case(ps)
			DUMMY:
				ns <= IF;
			IF:
				ns <= ID;
			ID:
				ns <= (opcode == 3'b000)? Add:
					 (opcode == 3'b001)? Sub:
					 (opcode == 3'b010)? And:
					 (opcode == 3'b011)? Not:
					 (opcode == 3'b100)? Push:
					 (opcode == 3'b101)? Pop:
					 (opcode == 3'b110)? Jump:
					 (opcode == 3'b111)? JZ: ID;
			Add:
				ns <= RT;
			Sub:
				ns <= RT;
			And:
				ns <= RT;
			Not:
				ns <= RT;
			Push:
				ns <= Push_2;
			Pop:
				ns <= IF;
			Jump:
				ns <= IF;
			JZ:
				ns <= IF;
			RT:
				ns <= IF;
			Push_2:
				ns <= IF;
		endcase
	end

	always@(ps)begin
	
		IorD <= 1'b0; PC_write <= 1'b0; mem_write <= 1'b0; mem_read <= 1'b0; IR_write <= 1'b0; push <= 1'b0; pop <= 1'b0; tos <= 1'b0; 
		AorB <= 1'b0; A_write <= 1'b0; B_write <= 1'b0; ALU_srcA <= 1'b0; PC_src <= 1'b0; ALU_srcB <= 2'b00; push_src <= 2'b00; ALU_op <= 2'b00;
	
		case(ps)
			IF:begin
				IorD <= 1'b0;
				ALU_srcA <= 1'b0;
				ALU_srcB <= 2'b01;
				mem_read <= 1'b1;
				ALU_op <= 2'b00;
				PC_write <= 1'b1;
				pop <= 1'b1;
				AorB <= 1'b0;
				A_write <= 1'b1;
				j <= 1'b0;
				jz <= 1'b0;
				IR_write <= 1'b1;
			end
			ID: begin
				tos <= 1'b1;
				AorB <= 1'b1;
				B_write <= 1'b1;
			end
			Add:begin
				ALU_srcA <= 1'b1;
				ALU_srcB <= 2'b00;
				ALU_op <= 2'b00;
				pop <= 1'b1;
			end
			Sub:begin
				ALU_srcA <= 1'b1;
				ALU_srcB <= 2'b00;
				ALU_op <= 2'b01;
				pop <= 1'b1;
			end
			And:begin
				ALU_srcA <= 1'b1;
				ALU_srcB <= 2'b00;
				ALU_op <= 2'b10;
				pop <= 1'b1;
			end
			Not:begin
				ALU_srcA <= 1'b1;
				ALU_op <= 2'b11;
			end
			Push:begin
				IorD <= 1'b1;
				mem_read <= 1'b1;
				push_src <= 2'b01;
				push <= 1'b1;
			end
			Pop:begin
				IorD <= 1'b1;
				mem_write <= 1'b1;
			end
			Jump:begin
				j <= 1'b1;
				PC_write <= 1'b1;
				push_src <= 2'b01;
				push <= 1'b1;
			end
			JZ:begin
				jz <= 1'b1;
				ALU_srcA <= 1'b1;
				ALU_srcB <= 2'b10;
				PC_write <= 1'b1;
				push_src <= 2'b01;
				push <= 1'b1;
			end
			RT:begin
				push_src <= 2'b10;
				push <= 1'b1;
			end
			Push_2:begin
				push_src <= 2'b00;
				push <= 1'b1;
			end
		endcase
	end
	
	always@(posedge clk,posedge rst)begin
		if(rst == 1'b1)
			ps <= DUMMY;
		else
			ps <= ns;
	end
	
	assign PC_src = (jz && zero) || j;
	
endmodule


