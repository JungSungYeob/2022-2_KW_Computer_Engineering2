module ns_logic(Ta,Tal,Tb,Tbl,q0,q1,q2,d0,d1,d2);
	input Ta,Tal,Tb,Tbl,q0,q1,q2;//set input Ta,Tal,Tb,Tbl,q0,q1,q2
	output d0,d1,d2;//set output d0,d1,d2;
	
	//declare wires inputs inverter
	wire Ta_2,Tal_2,Tb_2,Tbl_2,q0_2,q1_2,q2_2;
	
	wire d2_w0, d2_w1, d2_w2;
	
	wire d1_w0, d1_w1;
	
	wire d0_w0, d0_w1, d0_w2, d0_w3;
	//invert q0~q2
	_inv U0_inv(.a(q0),.y(q0_2));
	_inv U1_inv(.a(q1),.y(q1_2));
	_inv U2_inv(.a(q2),.y(q2_2));
	//invert Ta, Tal, Tb, Tbl
	_inv U3_inv(.a(Ta),.y(Ta_2));
	_inv U4_inv(.a(Tal),.y(Tal_2));
	_inv U5_inv(.a(Tb),.y(Tb_2));
	_inv U6_inv(.a(Tbl),.y(Tbl_2));
	//d0=(~q2*~q1*~q0*~Ta)+(~q2*q1*~q0*~Tal)+(q2*~q1*~q0*~Tb)+(q2*q1*~q0*~Tbl)
	_and4 U7_and4(.a(q2_2),.b(q1_2),.c(q0_2),.d(Ta_2),.y(d0_w0));
	_and4 U8_and4(.a(q2_2),.b(q1),.c(q0_2),.d(Tal_2),.y(d0_w1));
	_and4 U9_and4(.a(q2),.b(q1_2),.c(q0_2),.d(Tb_2),.y(d0_w2));
	_and4 U10_and4(.a(q2),.b(q1),.c(q0_2),.d(Tbl_2),.y(d0_w3));
	_or4 U11_or4(.a(d0_w0),.b(d0_w1),.c(d0_w2),.d(d0_w3),.y(d0));
	//d1=(~q1*q0)+(q1*~q0)
	_and2 U12_and2(.a(q1_2),.b(q0),.y(d1_w0));
	_and2 U13_and2(.a(q1),.b(q0_2),.y(d1_w1));
	_or2 U14_or2(.a(d1_w0),.b(d1_w1),.y(d1));
	//d2=(~q2*q1*q0)+(q2*~q1)+(q2*q1*~q0)
	_and3 U15_and3(.a(q2_2),.b(q1),.c(q0),.y(d2_w0));
	_and2 U16_and2(.a(q2),.b(q1_2),.y(d2_w1));
	_and3 U17_and3(.a(q2),.b(q1),.c(q0_2),.y(d2_w2));
	_or3 U18_or3(.a(d2_w0),.b(d2_w1),.c(d2_w2),.y(d2));
	
endmodule
