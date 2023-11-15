module alu4 (a,b,op,result,c,n,z,v);
	// set input a,b
	input [3:0] a,b;
	// set 3-bit input opcode
	input [2:0] op; 
	// set 4-bit output result
	output [3:0] result;
	// set output cnzv flags	
	output c,n,z,v; 
	//declare wire w_add_b
	wire [3:0] w_add_b;
	// wire calcul result to 8-to-1 MUX
	wire [3:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add;
	// add carryout(n) carryout(n-1)
	wire c3_add, co_add; 

	//assign a & b inv
	_inv_4bits U0_inv_4bits (.a(a), .y(w_not_a)); // inv a
	_inv_4bits U1_inv_4bits (.a(b), .y(w_not_b)); // inv b
	
	//assign 4bits gate
	_and2_4bits U2_and2_4bits (.a(a), .b(b), .y(w_and)); 
	_or2_4bits U3_or2_4bits (.a(a), .b(b), .y(w_or)); 
	_xor2_4bits U4_xor2_4bits (.a(a), .b(b), .y(w_xor)); 
	_xnor2_4bits U5_xnor2_4bits (.a(a), .b(b), .y(w_xnor));
	
	//assign 4bits mx2 gate
	mx2_4bits U6_mx2_4bits (.d0(b),.d1(w_not_b),.s(op[0]),.y(w_add_b));
	
	//assign cla4_ov (for output c3)
	cla4_ov U7_adder (.a(a),.b(w_add_b),.ci(op[0]),.s(w_add),.c3(c3_add),.co(co_add));
	
	//assign 4bit 8-to-1 MUX
	mx8_4bits U8_mx8_4bits ( .a(w_not_a) ,.b(w_not_b) ,.c(w_and) ,.d(w_or) ,
									 .e(w_xor) ,.f(w_xnor) ,.g(w_add) ,.h(w_add) ,
									 .s2(op[2]),.s1(op[1]), .s0(op[0]) ,.y(result));
																										
	//assign 4-bit calculate flags
	cal_flags4 U9_cal_flags (.op(op), .result(result),.co_add(co_add), .c3_add(c3_add),
									 .c(c), .n(n), .z(z), .v(v) );

									 
endmodule
