`timescale 1ns/100ps

module tb_tl_cntr_w_left;
	reg clk, tb_reset_n, tb_Ta, tb_Tal, tb_Tb, tb_Tbl;
	wire[1:0]tb_La,tb_Lb;
	
	tl_cntr_w_left U0_tl_cntr_w_left(.clk(clk),.reset_n(tb_reset_n),.Ta(tb_Ta),.Tal(tb_Tal),.Tb(tb_Tb),.Tbl(tb_Tbl),.La(tb_La),.Lb(tb_Lb));
	
	always #5 clk=~clk;
	
	initial
	begin
		clk =0; tb_reset_n =0; tb_Ta=0; tb_Tal=0; tb_Tb=0; tb_Tbl=0; #5
		
		tb_reset_n=1; #300
		$stop;
	end
endmodule
