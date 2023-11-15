module o_logic(q0,q1,q2,La,Lb);//combination loginc that determine output by current state value
	input q0, q1,q2;//set input q0~q2
	output [1:0]La,Lb;//set output 2bit La,Lb
	
	//declare wire
	wire q0_2, q1_2, q2_2;
	
	wire w0;
	//set inverter q0~q2
	_inv U0_inv(.a(q0),.y(q0_2));
	_inv U1_inv(.a(q1),.y(q1_2));
	_inv U2_inv(.a(q2),.y(q2_2));
	//La[0]=q0+q2
	_or2 U3_or2(.a(q0),.b(q2),.y(La[0]));
	//La[1]=(q1*~q0)+q2
	_and2 U4_and2(.a(q1),.b(q0_2),.y(w0));
	_or2 U5_or2(.a(w0),.b(q2),.y(La[1]));
	//Lb[0]=~q2 + q0
	_or2 U6_or2(.a(q2_2),.b(q0),.y(Lb[0]));
	//Lb[1]=(q1*~q0)+~q2
	_or2 U7_or2(.a(w0),.b(q2_2),.y(Lb[1]));
endmodule