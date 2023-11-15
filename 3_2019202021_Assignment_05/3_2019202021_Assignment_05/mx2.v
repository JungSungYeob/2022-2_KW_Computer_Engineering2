module mx2(d0,d1,s,y);
//set input d0 d1 s
	input d0,d1;
	input s;
	//set output y
	output y;
	//declare wire sb,w0,w1
	wire sb,w0,w1;
	//create the gate inside the mux using module
	_inv U0_inv (.a(s),.y(sb));
	_nand2 U1_nand2 (.a(d0),.b(sb),.y(w0));
	_nand2 U2_nand2 (.a(d1),.b(s),.y(w1));
	_nand2 U3_nand2 (.a(w0),.b(w1),.y(y));
	
endmodule
