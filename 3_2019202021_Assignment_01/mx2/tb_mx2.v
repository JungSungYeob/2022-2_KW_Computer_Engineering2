`timescale 1ns/100ps
//set time of pulse

module tb_mx2;
	
	//declare registers and wire for use in testbench
	reg d0, d1, s;
	wire y;
	
	//declare and initialization the module to be used in testbench	
	mx2 u_mx2(d0,d1,s,y);

	//start testbench
	initial begin
	//test the number of all case of mux module(8 case)
		s=0;d0=0;d1=0;
	#10;
		s=0;d0=0;d1=1;
	#10;
		s=0;d0=1;d1=0;
	#10;
		s=0;d0=1;d1=1;
	#10;
		s=1;d0=0;d1=0;
	#10;
		s=1;d0=0;d1=1;
	#10;
		s=1;d0=1;d1=0;
	#10;
		s=1;d0=1;d1=1;
	#10;
	end
endmodule
