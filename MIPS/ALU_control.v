`timescale 1ns/1ns

module ALU_control(input clk, input [5:0] func, input [1:0] ALU_op, output reg jr, output reg [2:0] ALU_operation);

  always @(func, ALU_op) begin
    ALU_operation <= 3'b000;
    jr <= 1'b0;
    case (ALU_op)
      2'b00: begin
        ALU_operation <= 3'b010; end
      2'b01:
        ALU_operation <= 3'b011;
      2'b10: begin
		if (func == 6'd8)
          jr <= 1'b1;
		  
        if (func == 6'd36)//and
          ALU_operation <= 3'b000;
        else if (func == 6'd37)//or
          ALU_operation <=3'b001;
        else if (func == 6'd32)//add
          ALU_operation <=3'b010;
        else if (func == 6'd34)//sub
          ALU_operation <=3'b011;
        else if (func == 6'd42)//slt
          ALU_operation <=3'b111;
	  end
	  2'b11:
		  ALU_operation <=3'b111;
    endcase
  end
endmodule