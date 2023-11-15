module CAL(clk, reset_n, opcode, opstart,opclear,operandA,operandB,re,opdone);
	input clk, reset_n;
	input [31:0] opcode, opstart,opclear;
	input [31:0] operandA, operandB;
	output [63:0] re;
	output [63:0] opdone;
	
	wire opdone_ALU, opdone_MUL;
	wire [63:0] re_ALU, re_MUL;
	
	assign re_ALU[63:32]=32'b0;
	assign opdone[1]=1'b1;
	
	ALU U0_ALU(.a(operandA),.b(operandB),.op(opcode[3:0]),.result(re_ALU[31:0]),.opdone(opdone_ALU));
	MUL U1_MUL(.clk(clk),.reset_n(reset_n),.multiplier(operandA),.multiplicand(operandB),.op_start(opstart),.op_clear(opclear),.op_done(opdone_MUL),.result(re_MUL));
	
	assign opdone[0]=(opstart==1)?((opcode==32'hD)?opdone_MUL:opdone_ALU) :1'b0;
	assign re = (opstart==1)?((opcode==32'hD)?re_MUL:re_ALU):64'b0;
	
endmodule
