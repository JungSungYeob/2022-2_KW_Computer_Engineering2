`timescale 1ns/100ps
module tb_read_operation;
	//set reg and wire
	reg [31:0] tb_from_reg0, tb_from_reg1, tb_from_reg2, tb_from_reg3, tb_from_reg4, tb_from_reg5, tb_from_reg6, tb_from_reg7;
	reg [2:0] tb_Addr;
	wire [31:0] tb_Data;
	//instance read_operation
	read_operation U0_read_operation(.Addr(tb_Addr), .Data(tb_Data), .from_reg0(tb_from_reg0), .from_reg1(tb_from_reg1), .from_reg2(tb_from_reg2), 
											.from_reg3(tb_from_reg3), .from_reg4(tb_from_reg4), .from_reg5(tb_from_reg5), 
											.from_reg6(tb_from_reg6), .from_reg7(tb_from_reg7));
	//testbench
	initial
	begin
	//set reg value first
	tb_from_reg0 = 32'h0000_0000;
	tb_from_reg1 = 32'h0000_0001;
	tb_from_reg2 = 32'h0000_0002;
	tb_from_reg3 = 32'h0000_0003;
	tb_from_reg4 = 32'h0000_0004;
	tb_from_reg5 = 32'h0000_0005;
	tb_from_reg6 = 32'h0000_0006;
	tb_from_reg7 = 32'h0000_0007;
		#10;
	tb_Addr=3'b000;//get value for 000
		#10;
	tb_Addr=3'b001;//get value from 001
		#10
	tb_Addr=3'b010;//get value from 010
		#10;
	tb_Addr=3'b011;//get value from 011
		#10;
	tb_Addr=3'b100;//get value from 100
		#10;
	tb_Addr=3'b101;//get value from 101
		#10;
	tb_Addr=3'b110;//get value from 110
		#10;
	tb_Addr=3'b111;//get value from 111
		#10;
	
	end
endmodule
