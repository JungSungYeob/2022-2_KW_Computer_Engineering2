module _register3_r(clk,reset_n,d0,d1,d2,q0,q1,q2);//store current state value
	input clk, reset_n, d0,d1,d2;//set input clk, reset_n, d0,d1,d2
	output q0,q1,q2;//set output q0,q1,q2;
	
	//asynchronous d flipflop get q0~q2
	_dff_r_async U0_dff_r_async(.clk(clk),.reset_n(reset_n),.d(d0),.q(q0));
	_dff_r_async U1_dff_r_async(.clk(clk),.reset_n(reset_n),.d(d1),.q(q1));
	_dff_r_async U2_dff_r_async(.clk(clk),.reset_n(reset_n),.d(d2),.q(q2));
	
endmodule
