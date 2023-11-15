module _register2_r_async(clk, reset_n, d0, d1, q0, q1);//store current state value
	input clk, reset_n, d0, d1; //set input clk, reset_n, d0,d1
	output q0, q1;//set output q0, q1
	//asynchronous d flipflop
	_dff_r_async U0_dff_r_async(.clk(clk),.reset_n(reset_n),.d(d0),.q(q0));
	_dff_r_async U1_dff_r_async(.clk(clk),.reset_n(reset_n),.d(d1),.q(q1));
endmodule
