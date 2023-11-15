`timescale 1ns/100ps

module tb_cntr8;
	//declare reg and wire
	reg tb_clk, tb_reset_n, tb_inc, tb_load;
	reg [7:0] tb_d_in;
	wire [7:0] tb_d_out;
	wire[2:0] tb_o_state;
	//each 20
	parameter STEP =20;
	//instance cntr8
	cntr8 U0_cntr8(.clk(tb_clk),.reset_n(tb_reset_n),.inc(tb_inc),.load(tb_load),.d_in(tb_d_in),.d_out(tb_d_out),.o_state(tb_o_state));
	//each 10
	always#(STEP/2) tb_clk = ~tb_clk;
	//testbench for cntr8
	initial
	begin
		tb_clk=0; tb_reset_n=0; tb_inc =0; tb_load=0; tb_d_in=2'h00;
			#5;
		tb_reset_n =1; tb_inc =1;
			#40;
		tb_inc = 0;
			#40;
		tb_d_in=8'b0110_0100; tb_load = 1'b1;
			#40;
		tb_load =1; tb_inc=1; tb_d_in=2'h00;
			#40;
		tb_inc =0; tb_reset_n = 0;
			#40;
		tb_reset_n = 1;
			#40;
			$stop;
			
	end
	
endmodule
