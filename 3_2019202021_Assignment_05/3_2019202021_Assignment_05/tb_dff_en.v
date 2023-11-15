`timescale 1ns/100ps

module tb_dff_en;
//set reg clk
	reg clk;
	reg d;
	reg en;
	//declare wire q
	wire q;
	//step =10
	parameter STEP = 10;
//load dff_en
	_dff_en U0_dff_en(.clk(clk),.en(en) ,.d(d),.q(q));
	//every 5
	always#(STEP/2) clk = ~clk;
	//testbench value
	initial
	begin
		clk=1'b0; d=1'b0; #5;
		en = 1'b1; #15;
		d=1'b1; #15;
		d=1'b0; #15;
		d=1'b1; #15;
		d=1'b0; #15;
		en = 1'b0; #5;
		d=1'b1; #15;
		d=1'b0; #15;
		d=1'b1; #15;
		d=1'b0; #15;
		#(STEP*2);$stop;
		
	end
endmodule
