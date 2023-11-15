`timescale 1ns/100ps

module tb_cla_clk;
	//set reg clk
	reg clk;
	//set reg 0~31 tb_a,tb_b
	reg [31:0] tb_a,tb_b;
	//set reg tb_ci
	reg tb_ci;
	//declare wire 0~31 tb_s_cla
	wire [31:0] tb_s_cla; 
	//declare wire tb_co_cla
	wire tb_co_cla;
	
	//set parameter STEP 10 times => use at clk=~clk
	parameter STEP = 10; //define step = 10
	
	//use cla_clk
	cla_clk U0_cla_clk(.clk(clk),.a(tb_a),.b(tb_b),.ci(tb_ci),.s(tb_s_cla),.co(tb_co_cla)); 
	
	
	
	// step/2 =5 => clk=~clk
	always#(STEP/2) clk=~clk; 
	 
	initial
	begin
	
		clk=1'b1;	tb_a=32'h0; tb_b=32'h0; tb_ci=1'b0; // set clk=1, hexadecimal 0 + hexadecimal 0 + binary 0
		#(STEP);   tb_a=32'hFFFF_FFFF; tb_b=32'h0; tb_ci=1'b1; //hexadecimal FFFF_FFFF + hexadecimal 0 + binary 1
		#(STEP);   tb_a=32'h0000_FFFF; tb_b=32'hFFFF_0000; tb_ci=1'b0; //hexadecimal 0000_FFFF + hexadecimal FFFF_0000 + binary 0
		#(STEP);   tb_a=32'h135f_a562; tb_b=32'h3561_4642; tb_ci=1'b0; //hexadecimal 145f_a562 + hexadecimal 3561_4642 + binary 0
		#(STEP*2); $stop;

	end
	
	endmodule
	