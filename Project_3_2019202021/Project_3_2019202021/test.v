`timescale 1ns/100ps

module test;

	reg [31:0]a;
	reg [1:0]shamt;
	wire [31:0]b;
	
	LSL32 U0_LSL32(.d_in(a),.shamt(shamt),.d_out(b));
	
	initial
	begin
		a=32'h1010; shamt=2'b01;
			#10;
		a=32'hFFFF_0000;
			#20;
	end
endmodule
