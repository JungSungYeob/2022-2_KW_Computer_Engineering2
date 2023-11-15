`timescale 1ns/100ps

module tb_tl_cntr;
	reg clk, tb_reset_n, tb_Ta, tb_Tb;
	wire [1:0]tb_La, tb_Lb;
	
	tl_cntr U0_tl_cntr(.clk(clk),.reset_n(tb_reset_n),.Ta(tb_Ta),.Tb(tb_Tb),.La(tb_La),.Lb(tb_Lb));
	
	always #5 clk=~clk;
	
	initial
	begin
	
	clk=0; tb_reset_n=0; tb_Ta = 0;tb_Tb = 0;
		#5;
	tb_reset_n = 1;
		#3;
	tb_Ta=0;tb_Tb=1;
		#10;
	tb_Ta=1;tb_Tb=1;
		#10;	
	tb_Ta=1;tb_Tb=0;
		#10;
	tb_Ta=1;tb_Tb=1;
		#10;
	tb_Ta=0;tb_Tb=1;
		#10;
	tb_Ta=1;tb_Tb=1;
		#10;
	tb_Ta=0;tb_Tb=0;
		#10;	$stop;
	end
endmodule

	