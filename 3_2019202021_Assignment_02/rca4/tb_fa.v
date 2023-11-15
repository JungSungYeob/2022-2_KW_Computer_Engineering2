`timescale 1ns/100ps //set timescale

module tb_fa;
//set reg a,b,ci
reg a, b,ci;
//set wire s,co
wire s,co;
	//set testbench of Full Adder module
	fa FA0 (.a(a),.b(b),.ci(ci),.s(s),.co(co));
	
initial
begin
//start testbench of Full Adder
//test input a,b,ci of 000~111 of output s, co

	a=0;b=0;ci=0;
#10;
	a=0;b=0;ci=1;
#10;
	a=0;b=1;ci=0;
#10;
	a=0;b=1;ci=1;
#10;
	a=1;b=0;ci=0;
#10;
	a=1;b=0;ci=1;
#10;
	a=1;b=1;ci=0;
#10;
	a=1;b=1;ci=1;
#10;
end

endmodule
