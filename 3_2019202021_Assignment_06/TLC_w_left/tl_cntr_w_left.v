module tl_cntr_w_left(clk,reset_n,Ta,Tal,Tb,Tbl,La,Lb);//TLC with left top module
	input clk,reset_n,Ta,Tal,Tb,Tbl;//set input clk,reset_n, Ta, Tal, Tb, Tbl
	output [1:0]La,Lb;//set output 2bit La, Lb
	//declare wires
	wire q0,q1,q2,d0,d1,d2;
	//store current state value
	_register3_r U0_register3_r(.clk(clk),.reset_n(reset_n),.d0(d0),.d1(d1),.d2(d2),.q0(q0),.q1(q1),.q2(q2));
	//combination logic that determine next state
	ns_logic U1_ns_logic(.Ta(Ta),.Tal(Tal),.Tb(Tb),.Tbl(Tbl),.q0(q0),.q1(q1),.q2(q2),.d0(d0),.d1(d1),.d2(d2));
	//combination loginc that determine output by current state value
	o_logic U2_o_logic(.q0(q0),.q1(q1),.q2(q2),.La(La),.Lb(Lb));
	
endmodule
