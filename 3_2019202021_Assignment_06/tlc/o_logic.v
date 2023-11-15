module o_logic(q1,q0,La,Lb);//combination logic that determine output by current state value
	input q1, q0;//set input q1, q0;
	output [1:0]La,Lb;//set output 2bit La, Lb
	
	wire w1;//declare w1;
	
	//invert q1 and and2
	//La[0]=inv_q1 & q0
	_inv U0_inv(.a(q1),.y(w1));
	_and2 U1_and2(.a(w1),.b(q0),.y(La[0]));
	//assign La[1] = q1
	assign La[1]=q1;
	//Lb[0]=q1 & q0
	_and2 U2_and2(.a(q1),.b(q0),.y(Lb[0]));
	//assign Lb[1] = w1;
	assign Lb[1]=w1;

	
endmodule
