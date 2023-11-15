`timescale 1ns/100ps

module tb_shifter;

//set reg and wire
	reg tb_clk, tb_reset_n;
	reg [2:0] tb_op;
	reg [1:0] tb_shamt;
	reg [31:0] tb_d_in;
	wire [31:0]tb_d_out;
	
	parameter STEP=20;
	//instance shifter8
	shifter32 U0_tb_shifter8(.clk(tb_clk),.reset_n(tb_reset_n),.op(tb_op),.shamt(tb_shamt),.d_in(tb_d_in),. d_out(tb_d_out));
	
	always#(STEP/2) tb_clk=~tb_clk;//each 10
	//initiate testbench
	initial
	begin
		tb_clk =0; tb_op=3'b000;tb_reset_n=0; tb_shamt=2'b00; tb_d_in=32'h0000_0000; //all clear
			#5; 
		tb_reset_n=1;
			#20;
		tb_op=3'b001; tb_d_in=32'h0111_0111;
			#40;
		tb_op=3'b010;
			#40;
		tb_shamt = 2'b01;
			#40;
		tb_op=3'b011;
			#40;
		tb_op=3'b010; tb_shamt = 2'b11;
			#40;
		tb_op=3'b001; tb_d_in=32'h1000_0110;
			#40;
		tb_op=3'b100; tb_shamt = 2'b01;
			#40;
		tb_shamt = 2'b11;
			#40;
		tb_reset_n=0;
			#40; $stop;
	end
	
endmodule

		