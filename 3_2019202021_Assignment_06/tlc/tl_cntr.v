module tl_cntr(clk,reset_n,Ta,Tb,La,Lb); //TLC top module
	input clk, reset_n, Ta, Tb; //set input clk, reset_n, Ta, Tb
	output [1:0]La,Lb;//set output La, Lb;
	
	//declare d1, d0, q0, q1
	wire d1, d0, q0, q1;
	//store current state value
	_register2_r_async U0_register2_r_async(.clk(clk),.reset_n(reset_n),.d1(d1),.d0(d0),.q0(q0),.q1(q1));
	//combination logic that determine next state
	ns_logic U1_ns_logic(.Ta(Ta),.Tb(Tb),.d1(d1),.d0(d0),.q1(q1),.q0(q0));
	//combination logic that determine output by current state value
	o_logic U2_o_logic(.q1(q1),.q0(q0),.La(La),.Lb(Lb));
	
endmodule
