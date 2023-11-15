module _dlatch(clk,d,q,q_bar);
	//set input clk, d and output q, q_bar
	input clk,d;
	output q, q_bar;
	//declare wire R, S, d_inv 
	wire R, S, d_inv;
	//process before sr latch 
	_inv U0_inv(.a(d),.y(d_inv));
	_nand2 U1_nand2(.a(clk),.b(d),.y(S));
	_nand2 U2_nand2(.a(clk),.b(d_inv),.y(R));
	//sr latch process
	_nand2 U3_nand2(.a(S),.b(q_bar),.y(q));
	_nand2 U4_nand2(.a(R),.b(q),.y(q_bar));
	
endmodule
