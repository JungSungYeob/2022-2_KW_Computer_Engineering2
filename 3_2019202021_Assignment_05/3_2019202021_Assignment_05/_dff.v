module _dff(clk,d,q,q_bar);
	//set input clk, d and output q, q_bar
	input clk,d;
	output q, q_bar;
	//declare wire clk_inv, w1
	wire clk_inv, w1;
	//process for first dlatch
	_inv U0_inv(.a(clk),.y(clk_inv));
	//input clk_inv and d to get output w1
	_dlatch U1_dlatch(.clk(clk_inv),.d(d),.q(w1),.q_bar());
	//dlatch for output
	_dlatch U2_dlatch(.clk(clk),.d(w1),.q(q),.q_bar(q_bar));
	
endmodule
