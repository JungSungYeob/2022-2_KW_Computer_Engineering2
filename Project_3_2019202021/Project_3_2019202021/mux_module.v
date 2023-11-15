module mux2(en,a,b,y);//2-to-1 mux 1bit
//set input output
	input en, a,b;
	output y;
	//assign y
	assign y=((en==1'b0)?a:b);
endmodule

module mux2_8bit(en,a,b,y);//2-to-1 mux 8bits
//set input output
	input en;
	input [7:0]a,b;
	output [7:0]y;
	//assign y
	assign y=((en==1'b0)?a:b);
endmodule

module mux2_32bit(en,a,b,y);//2-to-1 mux 32bits
//set input output
	input en;
	input [31:0]a,b;
	output [31:0]y;
	//assign y
	assign y=((en==1'b0)?a:b);
endmodule

module mux3_32bit(en,a,b,c,y);//3-to-1 mux 32bits
//set input output
	input [1:0]en;
	input [31:0]a,b,c;
	output [31:0]y;
	//assign y
	assign y=(en==2'b00)?a:((en==2'b01)?b:((en==2'b10)?c:32'b0));
endmodule

module mux16_32bits(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,s3,s2,s1,s0,y);
//set input 32bits a~h
	input [31:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p;
	//set input s2~s0
	input s3, s2, s1, s0;
	//set output 32bits y
	output [31:0] y;
	//declare w0~w15
	wire [31:0]	w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15;
	
	//assign 32bits mx2 15times
	mux2_32bit U0_mux2_32bits( .a(a), .b(b), .en(s0), .y(w0));
	mux2_32bit U1_mux2_32bits( .a(c), .b(d), .en(s0), .y(w1));
	mux2_32bit U2_mux2_32bits( .a(e), .b(f), .en(s0), .y(w2));
	mux2_32bit U3_mux2_32bits( .a(g), .b(h), .en(s0), .y(w3));
	mux2_32bit U4_mux2_32bits( .a(i), .b(j), .en(s0), .y(w4));
	mux2_32bit U5_mux2_32bits( .a(k), .b(l), .en(s0), .y(w5));
	mux2_32bit U6_mux2_32bits( .a(m), .b(n), .en(s0), .y(w6));
	mux2_32bit U7_mux2_32bits( .a(o), .b(p), .en(s0), .y(w7));
	
	mux2_32bit U8_mux2_32bits( .a(w0), .b(w1), .en(s1), .y(w8));
	mux2_32bit U9_mux2_32bits( .a(w2), .b(w3), .en(s1), .y(w9));
	mux2_32bit U10_mux2_32bits( .a(w4), .b(w5), .en(s1), .y(w10));
	mux2_32bit U11_mux2_32bits( .a(w6), .b(w7), .en(s1), .y(w11));
	
	mux2_32bit U12_mux2_32bits( .a(w8), .b(w9), .en(s2), .y(w12));
	mux2_32bit U13_mux2_32bits( .a(w10), .b(w11), .en(s2), .y(w13));
	
	mux2_32bit U14_mux2_32bits( .a(w12), .b(w13), .en(s3), .y(y));
	
	
endmodule

