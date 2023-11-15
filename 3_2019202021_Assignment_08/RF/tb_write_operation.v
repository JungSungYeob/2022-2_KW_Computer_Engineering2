`timescale 1ns/100ps
module tb_write_operation;
//set reg and wire
	reg tb_we;
	reg [2:0] tb_Addr;
	wire[7:0] tb_wEn;
	//instance write_operation
	write_operation tb_write_operation(.we(tb_we),.Addr(tb_Addr),.wEn(tb_wEn));
	
	//start testbench
	initial
	begin
	
	tb_we=0;tb_Addr=3'b0;//we=0 disable
		#10;
	tb_we=1;//enable
		#10;
	tb_Addr=3'b001;//Addr=001
		#10;
	tb_Addr=3'b010;//Addr=010
		#10;
	tb_Addr=3'b011;//Addr=011
		#10;
	tb_Addr=3'b100;//Addr=100
		#10;
	tb_Addr=3'b101;//Addr=101
		#10;
	tb_Addr=3'b110;//Addr=110
		#10;
	tb_Addr=3'b111;//Addr=111
		#10;
	end
endmodule
