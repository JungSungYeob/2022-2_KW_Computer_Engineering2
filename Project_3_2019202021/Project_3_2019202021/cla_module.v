//module cla 32 bit
module cla32(a,b,ci,s,co);
	//set input 0~31 a,b
	input [31:0] a,b;
	//set input ci
	input ci;
	//set output s
	output [31:0] s;
	//set output co
	output co;
	//declare wire c1~c7
	wire c1 ,c2, c3, c4, c5, c6, c7;
	
	//use cla4 8 times => 32bit cla
	cla4 U0_cla4(.a(a[3:0]),.b(b[3:0]),.ci(ci),.s(s[3:0]),.co(c1));
	cla4 U1_cla4(.a(a[7:4]),.b(b[7:4]),.ci(c1),.s(s[7:4]),.co(c2));
	cla4 U2_cla4(.a(a[11:8]),.b(b[11:8]),.ci(c2),.s(s[11:8]),.co(c3));
	cla4 U3_cla4(.a(a[15:12]),.b(b[15:12]),.ci(c3),.s(s[15:12]),.co(c4));
	cla4 U4_cla4(.a(a[19:16]),.b(b[19:16]),.ci(c4),.s(s[19:16]),.co(c5));
	cla4 U5_cla4(.a(a[23:20]),.b(b[23:20]),.ci(c5),.s(s[23:20]),.co(c6));
	cla4 U6_cla4(.a(a[27:24]),.b(b[27:24]),.ci(c6),.s(s[27:24]),.co(c7));
	cla4 U7_cla4(.a(a[31:28]),.b(b[31:28]),.ci(c7),.s(s[31:28]),.co(co));
	
endmodule

//module cla4 sequence of fa_v2
module cla4(a,b,ci,s,co);
	//set input 0~3 a,b
	input [3:0] a,b;
	//set input ci
	input ci;
	//set output 0~3 s
	output [3:0] s;
	//set output
	output co;
	//declare wire c1~c3 to implement
	wire c1,c2,c3;

	//use fa_v2 module
	fa_v2 U0_fa_v2(.a(a[0]),.b(b[0]),.ci(ci),.s(s[0]));
	fa_v2 U1_fa_v2(.a(a[1]),.b(b[1]),.ci(c1),.s(s[1]));
	fa_v2 U2_fa_v2(.a(a[2]),.b(b[2]),.ci(c2),.s(s[2]));
	fa_v2 U3_fa_v2(.a(a[3]),.b(b[3]),.ci(c3),.s(s[3]));
	
	//use clb4 module
	clb4 U4_clb(.a(a),.b(b),.ci(ci),.c1(c1),.c2(c2),.c3(c3),.co(co));
	
endmodule

//full adder version 2 for cla
module fa_v2(a,b,ci,s);
	//set input output
	input a,b,ci;
	output s;
	//declare a wire(w0) to implement
	wire w0;
	//calculate 2-input fa_v2 for output s
	_xor2 XR1(.a(a),.b(b),.y(w0));
	_xor2 XR2(.a(w0),.b(ci),.y(s));
endmodule

//module clb which calculate carry out
module clb4(a,b,ci,c1,c2,c3,co);
	//set input 0~3 a,b
	input[3:0]a,b;
	//set input ci
	input ci;
	//set output carry out
	output c1,c2,c3,co;
	
	//declare wires to implement in clb4
	wire [3:0] g, p;
	wire w0_c1;
	wire w0_c2, w1_c2;
	wire w0_c3,w1_c3,w2_c3;
	wire w0_co,w1_co,w2_co,w3_co;
	
	//calculate g=ab
	_and2 AD2_0(.a(a[0]),.b(b[0]),.y(g[0]));
	_and2 AD2_1(.a(a[1]),.b(b[1]),.y(g[1]));
	_and2 AD2_2(.a(a[2]),.b(b[2]),.y(g[2]));
	_and2 AD2_3(.a(a[3]),.b(b[3]),.y(g[3]));
	
	//calculate p=a+b
	_or2 OR2_0(.a(a[0]),.b(b[0]),.y(p[0]));
	_or2 OR2_1(.a(a[1]),.b(b[1]),.y(p[1]));
	_or2 OR2_2(.a(a[2]),.b(b[2]),.y(p[2]));
	_or2 OR2_3(.a(a[3]),.b(b[3]),.y(p[3]));
	
	//c1=g[0]+(p[0]*ci)
	_and2 AD2_4(.a(p[0]),.b(ci),.y(w0_c1));
	_or2 OR2_4(.a(g[0]),.b(w0_c1),.y(c1));
	
	//c2=g[1]+(p[1]*c1)
	_and2 AD2_5(.a(p[1]),.b(g[0]),.y(w0_c2));
	_and3 AD3_1(.a(p[1]),.b(p[0]),.c(ci),.y(w1_c2));
	_or3 OR3_1(.a(g[1]),.b(w0_c2),.c(w1_c2),.y(c2));
	
	//c3=g[2]+(p[2]*c2)
	_and2 AD2_6(.a(p[2]),.b(g[1]),.y(w0_c3));
	_and3 AD3_2(.a(p[2]),.b(p[1]),.c(g[0]),.y(w1_c3));
	_and4 AD4_1(.a(p[2]),.b(p[1]),.c(p[0]),.d(ci),.y(w2_c3));
	_or4 OR4_1(.a(g[2]),.b(w0_c3),.c(w1_c3),.d(w2_c3),.y(c3));
	
	//c0=g[3]+[p[3]*c3)
	_and2 AD2_7(.a(p[3]),.b(g[2]),.y(w0_co));
	_and3 AD3_3(.a(p[3]),.b(p[2]),.c(g[1]),.y(w1_co));
	_and4 AD4_2(.a(p[3]),.b(p[2]),.c(p[1]),.d(g[0]),.y(w2_co));
	_and5 AD5_1(.a(p[3]),.b(p[2]),.c(p[1]),.d(p[0]),.e(ci),.y(w3_co));
	_or5 OR5_1(.a(g[3]),.b(w0_co),.c(w1_co),.d(w2_co),.e(w3_co),.y(co));
	
endmodule

//module cla4 sequence of fa_v2
module cla4_ov(a,b,ci,s,c3,co);
	//set input 0~3 a,b
	input [3:0] a,b;
	//set input ci
	input ci;
	//set output 0~3 s
	output [3:0] s;
	//set output
	output c3, co;
	//declare wire c1~c3 to implement
	wire c1,c2;

	//use fa_v2 module
	fa_v2 U0_fa_v2(.a(a[0]),.b(b[0]),.ci(ci),.s(s[0]));
	fa_v2 U1_fa_v2(.a(a[1]),.b(b[1]),.ci(c1),.s(s[1]));
	fa_v2 U2_fa_v2(.a(a[2]),.b(b[2]),.ci(c2),.s(s[2]));
	fa_v2 U3_fa_v2(.a(a[3]),.b(b[3]),.ci(c3),.s(s[3]));
	
	//use clb4 module
	clb4 U4_clb4(.a(a),.b(b),.ci(ci),.c1(c1),.c2(c2),.c3(c3),.co(co));
	
endmodule

module cla32_ov(a,b,ci,s,co_prev,co);
//set input 32bits a,b
	input [31:0] a,b;
	//set input ci
	input ci;
	//set output 32bits s
	output [31:0] s;
	//set output co_prev and co
	output co_prev;
	output co;
	//declare c1~c7
	wire c1,c2,c3,c4,c5,c6,c7;
	//assign cla4 7times
	cla4 U0_cla4 (.a(a[3:0]),		.b(b[3:0]),		.ci(ci),	.s(s[3:0]),		.co(c1));
	cla4 U1_cla4 (.a(a[7:4]),		.b(b[7:4]),		.ci(c1),	.s(s[7:4]),		.co(c2));
	cla4 U2_cla4 (.a(a[11:8]),		.b(b[11:8]),	.ci(c2),	.s(s[11:8]),	.co(c3));
	cla4 U3_cla4 (.a(a[15:12]),	.b(b[15:12]),	.ci(c3),	.s(s[15:12]),	.co(c4));
	cla4 U4_cla4 (.a(a[19:16]),	.b(b[19:16]),	.ci(c4),	.s(s[19:16]),	.co(c5));
	cla4 U5_cla4 (.a(a[23:20]),	.b(b[23:20]),	.ci(c5),	.s(s[23:20]),	.co(c6));
	cla4 U6_cla4 (.a(a[27:24]),	.b(b[27:24]),	.ci(c6),	.s(s[27:24]),	.co(c7));
	
	cla4_ov U7_cla4_ov (.a(a[31:28]),	.b(b[31:28]),	.ci(c7),	.s(s[31:28]),	.c3(co_prev),	.co(co));
	
endmodule
