module alu32(a,b,op,result, c,n,z,v);
	//set input 32bits a,b and opcode
	input [31:0] a,b;
	input [2:0] op;
	//set output 32bits result and c,n,z,v
	output [31:0] result;
	output c,n,z,v;
	//declare wire w_add_b 32bits not, and ,or, xor, xnor, add
	wire [31:0] w_add_b;
	wire [31:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add;
	//declare co_prev, co_add
	wire co_prev, co_add;
	
	_inv_32bits U0_inv_32bits (.a(a), .y(w_not_a)); // inv a
	_inv_32bits U1_inv_32bits (.a(b), .y(w_not_b)); // inv b
	
	//assign 4bits gate
	_and2_32bits U2_and2_32bits (.a(a), .b(b), .y(w_and)); 
	_or2_32bits U3_or2_32bits (.a(a), .b(b), .y(w_or)); 
	_xor2_32bits U4_xor2_32bits (.a(a), .b(b), .y(w_xor)); 
	_xnor2_32bits U5_xnor2_32bits (.a(a), .b(b), .y(w_xnor));
	
	
	mx2_32bits U6_mx2_32bits (.d0(b),.d1(w_not_b),.s(op[0]),.y(w_add_b));
	
	//assign cla4_ov 
	cla32_ov U7_adder (.a(a),.b(w_add_b),.ci(op[0]),.s(w_add),.co_prev(co_prev),.co(co_add));
	
	//assign 4bit MUX8
	mx8_32bits U8_mx8_32bits ( .a(w_not_a) ,.b(w_not_b) ,.c(w_and) ,.d(w_or) ,
									 .e(w_xor) ,.f(w_xnor) ,.g(w_add) ,.h(w_add) ,
									 .s2(op[2]),.s1(op[1]), .s0(op[0]) ,.y(result));
																										
	//assign 4bit calculate flags
	cal_flags32 U9_cal_flags (.op(op), .result(result),
									 .co_add(co_add), .co_prev_add(co_prev),
									 .c(c), .n(n), .z(z), .v(v) );
endmodule
