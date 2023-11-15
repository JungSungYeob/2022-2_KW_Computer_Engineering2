`timescale 1ns/100ps
module tb_dff_rs;
//set reg clk, d, reset_n, set_n
	reg clk;
	reg d, reset_n, set_n;
	//declare q;
	wire q;
	//step =10
	parameter STEP = 10;
	//load dff_rs
	_dff_rs U0_dff_rs(.clk(clk),.set_n(set_n),.reset_n(reset_n),.d(d),.q(q));
	//every 5
	always#(STEP/2) clk = ~clk;
	//testbench value
	initial
	begin
		clk=1'b0; d= 1'b0; set_n=1'b0; reset_n=1'b0; #5;
		d=1'b1; #15;
		d=1'b0; #15;
		d=1'b1; #15;
		
		reset_n = 1'b1; #5;
		d=1'b0; #15;
		d=1'b1; #15;
		d=1'b0; #15;
		d=1'b1; #15;
		
		set_n = 1'b1; #5;
		d=1'b0; #15;
		d=1'b1; #15;
		d=1'b0; #15;
		d=1'b1; #15;
		
		#(STEP*2);$stop;
		
	end
endmodule
