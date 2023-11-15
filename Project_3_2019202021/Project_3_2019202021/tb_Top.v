`timescale 1ns/100ps
module tb_Top;
	reg clk, reset_n;
	reg tb_M_req, tb_M_wr;
	reg [7:0] tb_M_addr;
	reg [31:0] tb_M_dout;
	wire tb_M_grant;
	wire [31:0] tb_M_din;
	
	Top U0_top(.clk(clk),.reset_n(reset_n),.M_req(tb_M_req),.M_wr(tb_M_wr),.M_addr(tb_M_addr),.M_dout(tb_M_dout),.M_grant(tb_M_grant),.M_din(tb_M_din));
	
	always #5 clk=~clk;
	
	initial
	begin
		clk=1'b0;reset_n=1'b0;tb_M_req=1'b0;tb_M_addr=8'b0;
		tb_M_dout=32'b0;
			#18;
		
		reset_n=1'b1;
			#10;
		tb_M_req=1'b1; tb_M_wr=1'b1; tb_M_addr=8'h30; tb_M_dout=8'h1;
			#10;
		tb_M_addr=8'h01;tb_M_dout=8'h2;
			#10;
		tb_M_addr=8'h02;tb_M_dout=8'h3;
			#10;
		tb_M_addr=8'h03;tb_M_dout=8'h4;
			#10;
		tb_M_addr=8'h04;tb_M_dout=8'h5;
			#10;
		tb_M_addr=8'h05;tb_M_dout=8'h6;
			#10;
		tb_M_addr=8'h16;tb_M_dout=8'h7;
			#10;
		tb_M_addr=8'h17;tb_M_dout=8'h8;
			#10;
		tb_M_addr=8'h18;tb_M_dout=8'h9;
			#10;
		tb_M_addr=8'h19;tb_M_dout=8'hA;
			#10;	
		tb_M_addr=8'h1F;tb_M_dout=8'hF;
			#10;
		tb_M_wr=1'b0;
			#10;
		tb_M_addr=8'h01;
			#10;
		tb_M_addr=8'h02;
			#10;
		tb_M_addr=8'h03;
			#10;
		tb_M_addr=8'h04;
			#10;
		tb_M_addr=8'h05;
			#10;
		tb_M_addr=8'h16;
			#10;
		tb_M_addr=8'h17;
			#10;
		tb_M_addr=8'h18;
			#10;
		tb_M_addr=8'h19;
			#10;		
		tb_M_addr=8'h1F;	
			#10;
		#20;$stop;
	end
endmodule
