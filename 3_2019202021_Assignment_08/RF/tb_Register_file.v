`timescale 1ns/100ps
	module tb_Register_file;
	//set reg and wire
	reg tb_clk, tb_reset_n, tb_we;
	reg [2:0]tb_wAddr, tb_rAddr;
	reg [31:0]tb_wData;
	wire [31:0]tb_rData;
	//instance Register_file
	Register_file U0_Register_file(.clk(tb_clk),.reset_n(tb_reset_n),.we(tb_we),.wAddr(tb_wAddr),.rAddr(tb_rAddr),.wData(tb_wData),.rData(tb_rData));
	//clk change evrry 5 
		always
	begin
		tb_clk=1; #5;
		tb_clk=0; #5;
	end
	//start test bench
	initial
	begin
		tb_clk=1; tb_reset_n=0; tb_we=0; tb_wAddr=3'b0;tb_rAddr=3'b0;tb_wData=32'h0000_0000;
			#5;
		tb_reset_n=1; tb_we=1; tb_wData=32'h1111_1111;//test for input
			#10;
		tb_wAddr=3'b001; tb_wData=32'h1234_1234;//store 32'h12341234 to 001
			#10;
		tb_wAddr=3'b010;//store 32'h12341234 to 010
			#10;
		tb_wAddr=3'b011; tb_wData=32'h43; store 32'h43 to 011
			#10;
		tb_we=0;
			#10;
		tb_rAddr=3'b001;//read address 001
			#10;
		tb_rAddr=3'b010;//read address 010
			#10;
		tb_rAddr=3'b011;//read address 011
			#10;
			#10;$stop;
	end
	
endmodule

		
			
		
		
			