module _dff_rs(clk, set_n, reset_n, d, q); //set and resettable d-flipflop
	//set input clk, set_n, reset_n, d and output q
	input clk, set_n, reset_n, d;
	output q;
	//declare wires w_d1, w_d2
	wire w_d1, w_d2, set_inv;
	//process of set/resettable d-flipflop
	_inv U0_inv(.a(set_n),.y(set_inv));
	_or2 U1_or2(.a(d),.b(set_inv),.y(w_d1));
	_and2 U2_and2(.a(w_d1),.b(reset_n),.y(w_d2));
	_dff U3_dff(.clk(clk),.d(w_d2),.q(q),.q_bar());
endmodule
