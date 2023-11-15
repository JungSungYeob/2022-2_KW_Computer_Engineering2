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
	clb U4_clb(.a(a),.b(b),.ci(ci),.c1(c1),.c2(c2),.c3(c3),.co(co));
	
endmodule
