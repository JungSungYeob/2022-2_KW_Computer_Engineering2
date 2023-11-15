module _dff_en(clk, en, d, q); //enable d-flipflop
	//set input clk, en, d and q
	input clk, en, d;
	output q;
	//declare w1
	wire w1;
	//use mux to get value from q or d
	mx2 U0_mx2(.d0(q),.d1(d),.s(en),.y(w1));
	//ues d-flipflop to get q
	_dff U1_dff(.clk(clk),.d(w1),.q(q),.q_bar());
	
endmodule
