module cntr8(clk,reset_n,inc,load,d_in,d_out,o_state);
//set input output
	input clk, reset_n, inc, load;
	input [7:0] d_in;
	output [7:0] d_out;
	output [2:0] o_state;
	//declare wire
	wire [2:0] next_state;
	wire [2:0] state;
	//assign output state
	assign o_state = state;
	//next state logic instance
	ns_logic U0_ns_logic(.load(load),.inc(inc),.state(state),.next_state(next_state));
	//3bit register instance
	_register3_r U1_register3_r(.clk(clk),.reset_n(reset_n),.d(next_state),.q(state));
	//output state logic instance
	os_logic U2_os_logic(.state(state),.d_in(d_in),.d_out(d_out));

endmodule
