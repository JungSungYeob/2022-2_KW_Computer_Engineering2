`timescale 1ns/100ps
module tb_multiplier;
	reg clk, reset_n;
	reg [63:0] multiplier;
	reg [63:0] multiplicand;
	reg op_start, op_clear;
	wire 	op_done;
	wire	[127:0] result;
	
	
	parameter STEP = 10; //step =10

	//instance of multiplier
	multiplier U0_multiplier(.clk(clk),.reset_n(reset_n),.multiplier(multiplier), .multiplicand(multiplicand),.op_start(op_start),.op_clear(op_clear),.op_done(op_done),.result(result));
								
	always #(STEP/2) clk = ~clk;//every 5 invert clk value
									
	initial
	begin
		clk = 0; reset_n=0; op_start=0; op_clear=0;  multiplier=64'h0;multiplicand=64'h0;
			#20;
		reset_n=1; op_start=1; multiplier=64'h0000_0000_0000_0003; multiplicand=64'h0000_0000_0000_0005;   // 5*3
			#700;
		op_start=0; op_clear=1;
			#20; 
		op_start=1; op_clear=0; multiplier=64'hffff_ffff_ffff_fffd; multiplicand=64'h0000_0000_0000_0005; // 5 * -3
			#700;  
		op_clear=1; op_start=0;
			#20;
		op_start=1; op_clear=0; multiplier=64'h0000_0000_f000_0000; multiplicand=64'hffff_ffff_ffff_fffe; // -2*4026531840
			#700;	
		op_clear=1; op_start=0;
			#20; 
		op_start=1; op_clear=0; multiplier=64'hF012_3456_789A_BCDE; multiplicand=64'h8123_4567_89AB_CDEF;// -1147797409030816546*-9141386507638288913
			#700;
		op_clear=1; op_start=0;
			#20; 
		op_start=1; op_clear=0;  multiplier=64'h0000_0000_0000_0007; multiplicand=64'h0000_0000_0000_0000; //  0*7
			#700;	
		op_clear=1; op_start=0;
			#20; 
		op_start=1; op_clear=0;  multiplier=64'h0000_0000_0000_0000; multiplicand=64'hffff_ffff_ffff_fff9;//7*0
			#700;
		op_clear=1; op_start=0;
			#20; 
		op_start=1; op_clear=0;multiplier=64'h0000_0000_0000_0003; multiplicand=64'h0000_0000_0000_0005;   // 5*3
			#300;
		op_clear =1;//set op_clear when operating
			#100; 
		op_clear =0;//reset op_clear to restart
			#700;	$stop;
	end

endmodule
