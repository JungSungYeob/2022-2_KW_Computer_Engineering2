`timescale 1ns/100ps//set timescale

module tb_bus;//testbench of tb_bus
//declare reg and wire for testbench
	reg clk,reset_n;
	reg tb_m0_req,tb_m0_wr,tb_m1_req,tb_m1_wr;
	
	reg [7:0] tb_m0_address,tb_m1_address;
	
	reg [31:0] tb_m0_dout,tb_m1_dout,tb_s0_dout,tb_s1_dout;
	
	wire tb_m0_grant,tb_m1_grant,tb_s0_sel,tb_s1_sel,tb_s_wr;
	wire [31:0] tb_m_din,tb_s_din;
	wire [7:0] tb_s_address;
	
	// instance of bus
	bus U0_bus(.clk(clk),.reset_n(reset_n),.m0_req(tb_m0_req),.m0_wr(tb_m0_wr),.m0_address(tb_m0_address),.m0_dout(tb_m0_dout),
				.m1_req(tb_m1_req),.m1_wr(tb_m1_wr),.m1_address(tb_m1_address),.m1_dout(tb_m1_dout),.s0_dout(tb_s0_dout),.s1_dout(tb_s1_dout),
				.m0_grant(tb_m0_grant),.m1_grant(tb_m1_grant),.m_din(tb_m_din),.s0_sel(tb_s0_sel),.s1_sel(tb_s1_sel),.s_address(tb_s_address),
				.s_wr(tb_s_wr),.s_din(tb_s_din));
	
	always #5 clk = ~clk; // every 5 invert clk
	
	initial
	begin
		clk=1'b0;reset_n=1'b0;tb_m0_req=1'b0;tb_m1_req=1'b0;tb_m0_wr=1'b0;tb_m1_wr=1'b0; tb_m0_address=8'h0;tb_m1_address=8'h0;
		tb_m0_dout=32'h0;tb_m1_dout=32'h0;tb_s0_dout=32'h0;tb_s1_dout=32'h0;
			#18;
		reset_n=1'b1;	
			#10;
			//call m0
		tb_m0_req=1'b1; tb_m0_wr=1'b1; tb_s0_dout=32'hA;tb_s1_dout=32'hB;//set s0 and s1 dout
			#10;
		tb_m0_address=8'h01; tb_m0_dout=32'h00000002;
			#10;
		tb_m0_address=8'h0A; tb_m0_dout=32'h0000000A;
			#10;
		tb_m0_address=8'h18; tb_m0_dout=32'h00000018;
			#10;
		tb_m0_address=8'h20; tb_m0_dout=32'h00000020;
			#10;
		tb_m0_address=8'h2A; tb_m0_dout=32'h0000002A;
			#10;
		tb_m0_address=8'h3F; tb_m0_dout=32'h0000003F;
			#10;
		tb_m0_address=8'hFF; tb_m0_dout=32'h000000FF;
			#10;
			//call m1
		tb_m1_req=1'b1; tb_m1_wr=1'b1; tb_m0_req=1'b0;
			#10;
		tb_m1_address=8'h01; tb_m1_dout=32'h00000002;
			#10;
		tb_m1_address=8'h0A; tb_m1_dout=32'h0000000A;
			#10;
		tb_m1_address=8'h18; tb_m1_dout=32'h00000018;
			#10;
		tb_m1_address=8'h20; tb_m1_dout=32'h00000020;
			#10;
		tb_m1_address=8'h2A; tb_m1_dout=32'h0000002A;
			#10;
		tb_m1_address=8'h3F; tb_m1_dout=32'h0000003F;
			#10;
		tb_m1_address=8'hFF; tb_m1_dout=32'h000000FF;
			#30;
		
		
		//reset all
		clk=1'b1;reset_n=1'b0;tb_m0_req=1'b0;tb_m0_wr=1'b0;tb_m1_req=1'b0;tb_m1_wr=1'b0; tb_m0_address=8'h00;tb_m1_address=8'h00;
		tb_m0_dout=32'h0;tb_m1_dout=32'h0;tb_s0_dout=32'h0;tb_s1_dout=32'h0;
			#10;
		//start test
		reset_n=1'b1;
			#10;
		tb_m0_req=1'b1;
			#20 
		tb_m1_req=1'b1;
			#20
		tb_m1_req=1'b0;
			#20 
		tb_m0_req=1'b0; tb_m1_req=1'b1;
			#20
		tb_m0_req=1'b1; tb_m1_req=1'b0;
			#20
		tb_m1_req=1'b1;
		#30 $stop;
	end
	
endmodule
	