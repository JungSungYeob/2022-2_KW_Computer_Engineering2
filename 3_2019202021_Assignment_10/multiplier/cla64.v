//module cla 64 bit
module cla64(a,b,ci,s,co);
	//set input 0~31 a,b
	input [63:0] a,b;
	//set input ci
	input ci;
	//set output s
	output [63:0] s;
	//set output co
	output co;
	//declare wire c1~c7
	wire c1 ,c2, c3, c4, c5, c6, c7,c8,c9,c10,c11,c12,c13,c14,c15;
	
	//use cla4 16 times => 64bit cla
	cla4 U0_cla4(.a(a[3:0]),	.b(b[3:0]),		.ci(ci),.s(s[3:0]),	.co(c1));
	cla4 U1_cla4(.a(a[7:4]),	.b(b[7:4]),		.ci(c1),.s(s[7:4]),	.co(c2));
	cla4 U2_cla4(.a(a[11:8]),	.b(b[11:8]),	.ci(c2),.s(s[11:8]),	.co(c3));
	cla4 U3_cla4(.a(a[15:12]),	.b(b[15:12]),	.ci(c3),.s(s[15:12]),.co(c4));
	cla4 U4_cla4(.a(a[19:16]),	.b(b[19:16]),	.ci(c4),.s(s[19:16]),.co(c5));
	cla4 U5_cla4(.a(a[23:20]),	.b(b[23:20]),	.ci(c5),.s(s[23:20]),.co(c6));
	cla4 U6_cla4(.a(a[27:24]),	.b(b[27:24]),	.ci(c6),.s(s[27:24]),.co(c7));
	cla4 U7_cla4(.a(a[31:28]),	.b(b[31:28]),	.ci(c7),.s(s[31:28]),.co(c8));
	cla4 U8_cla4(.a(a[35:32]),	.b(b[35:32]),	.ci(c8),.s(s[35:32]),.co(c9));
	cla4 U9_cla4(.a(a[39:36]),	.b(b[39:36]),	.ci(c9),.s(s[39:36]),.co(c10));
	cla4 U10_cla4(.a(a[43:40]),	.b(b[43:40]),	.ci(c10),.s(s[43:40]),.co(c11));
	cla4 U11_cla4(.a(a[47:44]),	.b(b[47:44]),	.ci(c11),.s(s[47:44]),.co(c12));
	cla4 U12_cla4(.a(a[51:48]),	.b(b[51:48]),	.ci(c12),.s(s[51:48]),.co(c13));
	cla4 U13_cla4(.a(a[55:52]),	.b(b[55:52]),	.ci(c13),.s(s[55:52]),.co(c14));
	cla4 U14_cla4(.a(a[59:56]),	.b(b[59:56]),	.ci(c14),.s(s[59:56]),.co(c15));
	cla4 U15_cla4(.a(a[63:60]),	.b(b[63:60]),	.ci(c15),.s(s[63:60]),.co(co));
	
endmodule
