module _dff_r(clk, reset_n ,d ,q); // resetable d-flipflop
	//set input clk, reset_n, d and output q
	input clk, reset_n, d;
	output q;
	//declare wire w1
	wire w1;
	//get value and(d, reset_n)
	_and2 U0_and2(.a(d),.b(reset_n),.y(w1));
	//d-flipflop to get q
	_dff U1_and2(.clk(clk),.d(w1),.q(q),.q_bar());
endmodule
