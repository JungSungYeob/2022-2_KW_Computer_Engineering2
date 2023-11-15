`timescale 1ns/100ps
module tb_dff_rs_sync_async;
//set reg clk, set_n, reset_n,d
	reg clk, set_n, reset_n, d;
	//declare wire sync, async
	wire q_sync, q_async;
	//step =10
	parameter STEP = 10;
	//load dff_rs_sync_async
	_dff_rs_sync_async U0_dff_rs_sync_async(.clk(clk),.set_n(set_n),.reset_n(reset_n),.d(d),.q_sync(q_sync),.q_async(q_async));
	//every 5
	always #(STEP/2) clk=~clk;
		//testbench value
	initial
	begin
		clk = 1'b0; set_n = 1'b0; reset_n = 1'b0; d=0; #5;
		d = 1'b1; reset_n = 1'b1; #15;
		d = 1'b0; #15;
		d = 1'b1; reset_n = 1'b0; #15;
		d = 1'b0; set_n=1'b1; #15;
		d = 1'b1; #15;
		d = 1'b0; #15;
		d = 1'b1; reset_n = 1'b1; #15;
		d = 1'b0; #15;
		d = 1'b1; #15;
		d = 1'b0; #15;
		#(STEP*2);$stop;
	end
endmodule