module shifter8(clk,reset_n,op,shamt,d_in,d_out);
//set input output
	input clk,reset_n;
	input [2:0]op;
	input [1:0]shamt;
	input [7:0]d_in;
	output [7:0] d_out;
	//declare wire
	wire [7:0]d_n;
	//instance cc_logic and register8
	cc_logic U0_cc_logic(.op(op),.shamt(shamt),.d_in(d_in),.d_out(d_out),.d_next(d_n));
	_register8_r U1_register_r(.clk(clk),.reset_n(reset_n),.d(d_n),.q(d_out));
	
endmodule
