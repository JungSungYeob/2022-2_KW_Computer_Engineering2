module ALU(a,b,op,result, opdone);
	//set input 32bits a,b and opcode
	input [31:0] a,b;
	input [3:0] op;
	//set output 32bits result and c,n,z,v
	output [31:0] result;
	output [31:0] opdone;
	//declare wire w_add_b 32bits not, and ,or, xor, xnor, add
	wire [31:0] w_add_b;
	wire [31:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add, w_slt, w_sgt, w_lsl, w_lsr, w_asr;
	//declare co_prev, co_add
	wire co_prev, co_add;
	
	_inv_32bits U0_inv_32bits (.a(a), .y(w_not_a)); // inv a
	_inv_32bits U1_inv_32bits (.a(b), .y(w_not_b)); // inv b
	
	//assign 4bits gate
	_and2_32bits U2_and2_32bits (.a(a), .b(b), .y(w_and)); 
	_or2_32bits U3_or2_32bits (.a(a), .b(b), .y(w_or)); 
	_xor2_32bits U4_xor2_32bits (.a(a), .b(b), .y(w_xor)); 
	_xnor2_32bits U5_xnor2_32bits (.a(a), .b(b), .y(w_xnor));
	
	SLT U6_SLT(.a(a),.b(b),.y(w_slt));
	
	SGT U7_SGT(.a(a),.b(b),.y(w_sgt));
	
	LSL32 U8_LSL(.d_in(b),.shamt(2'b01),.d_out(w_lsl));
	
	LSR32 U9_LSR(.d_in(b),.shamt(2'b01),.d_out(w_lsr));
	
	ASR32 U10_ASR(.d_in(b),.shamt(2'b01),.d_out(w_asr));
	
	mux2_32bit U11_mux2_32bit (.a(b),.b(w_not_b),.en(op[2]),.y(w_add_b));
	
	//assign cla4_ov 
	cla32_ov U12_adder (.a(a),.b(w_add_b),.ci(op[2]),.s(w_add),.co_prev(co_prev),.co(co_add));
	
	//assign 4bit MUX8
	mux16_32bits U13_mux16_32bits ( .a(w_not_a) ,.b(w_not_b) ,.c(w_and) ,.d(w_or) ,
									 .e(w_xor) ,.f(w_xnor) ,.g(w_slt) ,.h(w_sgt),.i(w_lsl),
									 .j(w_lsr) ,.k(w_asr) ,.l(w_add),.m(w_add),.n(32'b0),.o(32'b0),.p(32'b0),
									 .s3(op[3]),.s2(op[2]),.s1(op[1]), .s0(op[0]) ,.y(result));
																										
	assign opdone=1'b1;
endmodule
