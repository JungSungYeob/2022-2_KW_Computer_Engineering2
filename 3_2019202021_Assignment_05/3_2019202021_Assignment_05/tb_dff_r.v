`timescale 1ns/100ps
module tb_dff_r;
	//set reg clk,d,reset_n
	reg clk;
	reg d;
	reg reset_n;
	//declare wire q
	wire q;
	//step =10
	parameter STEP = 10;
	//load dff_r
	_dff_r U0_dff_r(.clk(clk),.reset_n(reset_n),.d(d),.q(q));
	//every 5
	always#(STEP/2) clk = ~clk;
	//testbench value
	initial
	begin
		clk=1'b0; d=1'b0; reset_n=1'b0; #5;
		d=1'b1; #15;
		d=1'b0; #15;
		d=1'b1; #15;
		
		reset_n = 1'b1; #5;
		d=1'b1; #15;
		d=1'b0; #15;
		d=1'b1; #15;
		d=1'b0; #15;
		d=1'b1; #15;
		
		#(STEP*2);$stop;
		
	end
endmodule
