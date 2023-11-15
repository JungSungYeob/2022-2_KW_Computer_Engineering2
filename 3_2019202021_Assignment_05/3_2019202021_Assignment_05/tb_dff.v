`timescale 1ns/100ps

module tb_dff;
//set reg clk,d
	reg clk;
	reg d;
	//declare wire q q_bar
	wire q;
	wire q_bar;
	//step =10
	parameter STEP = 10;
//load dff
	_dff U0_dff(.clk(clk),.d(d),.q(q),.q_bar(q_bar));
	//every 5
	always#(STEP/2) clk = ~clk;
//testbench value
	initial
	begin
		clk=1'b0;d=1'b0; #5;
		d=1'b1; #15;
		d=1'b0; #15;
		d=1'b1; #15;
		d=1'b0; #15;
		d=1'b1; #15;
		
		#(STEP*2);$stop;
		
	end
endmodule
