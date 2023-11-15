`timescale 1ns/100ps //set timescale

module tb_ha;
	//set reg a,b
	reg a, b;
	//set wire s,co
	wire s,co;
	//set testbench of Half Adder module
	ha HA0 (a,b,co,s);
	
	initial
	begin//start testbench of Half Adder
	//test input a,b of 00,01,10,11

		a=0;b=0;
	#10;
		a=0;b=1;
	#10;
		a=1;b=0;
	#10;
		a=1;b=1;
	#10;
	end

endmodule
