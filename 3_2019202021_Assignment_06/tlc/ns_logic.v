module ns_logic(Ta,Tb,d1,d0,q1,q0);//combination logic that determine next state
	input Ta, Tb, q1, q0;//set input Ta, Tb, q1, q0
	output d1, d0;//set output d1, d0
	
	//declare w0, w1
	wire w0, w1;
	//declare Ta_2, Tb_2, q1_2, q0_2
	wire Ta_2, Tb_2, q1_2, q0_2;
	
	//set inputs to invert
	_inv U0_inv(.a(Ta),.y(Ta_2));
	_inv U1_inv(.a(Tb),.y(Tb_2));
	_inv U2_inv(.a(q1),.y(q1_2));
	_inv U3_inv(.a(q0),.y(q0_2));
	
	//d0=(q1*~q0*~Tb) + (~q1*~q0*~Ta)
	_and3 U5_and3(.a(q1),.b(q0_2),.c(Tb_2),.y(w0));
	_and3 U6_and3(.a(q1_2),.b(q0_2),.c(Ta_2),.y(w1));
	_or2 U7_or2(.a(w0),.b(w1),.y(d0));
	
	//get d1 by xor q1, q0
	_xor2 U4_xor2(.a(q1),.b(q0),.y(d1));
endmodule
	