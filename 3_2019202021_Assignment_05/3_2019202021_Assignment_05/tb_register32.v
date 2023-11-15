`timescale 1ns/100ps
module tb_register32;
//set reg clk 32bit d
		reg clk;
		reg [31:0]d;
		//declare wire 32bit q
		wire [31:0]q;
		//step =10
		parameter STEP = 10;
		//load register32
		_register32 U0_register32(.clk(clk),.d(d),.q(q));
		//every 5
		always #(STEP/2) clk=~clk;
		//testbench value
		initial
		begin
			clk=1'b0;d=32'h00000000; #5;
			d=32'h12345678; #15;
			d=32'hfedcba98; #15;
			d=32'h13579bde; #15;
			d=32'h02468acf; #15;
			d=32'h00ff00ff; #15;
			
			#(STEP*2);$stop;
		end
endmodule
