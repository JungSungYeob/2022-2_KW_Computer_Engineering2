`timescale 1ns/100ps

module tb_ram;

//set reg and wire
	reg tb_clk;
	reg tb_cen, tb_wen;
	reg[4:0] tb_addr;
	reg[31:0] tb_din;
	wire[31:0] tb_dout;
	//instance of ram
	ram U0_ram(.clk(tb_clk),.cen(tb_cen),.wen(tb_wen),.addr(tb_addr),.din(tb_din),.dout(tb_dout));
	
	//every 5 invert clk
	always #5 tb_clk=~tb_clk;
	
	initial
	begin
	//write memory
		tb_clk=1'b0; tb_cen=1'b0; tb_wen=1'b0; tb_addr=5'b0; tb_din=32'b0;
			#18;
		tb_cen=1'b1; tb_wen=1'b1; tb_addr=5'h01;tb_din=32'h01;
			#10;
		tb_addr=5'h02;tb_din=32'h02;
			#10;
		tb_addr=5'h03;tb_din=32'h03;
			#10;
		tb_addr=5'h04;tb_din=32'h04;
			#10;
		tb_addr=5'h05;tb_din=32'h05;
			#10;
		tb_addr=5'h06;tb_din=32'h06;
			#10;
		tb_addr=5'h07;tb_din=32'h07;
			#10;
		tb_addr=5'h08;tb_din=32'h08;
			#10;
		tb_addr=5'h09;tb_din=32'h09;
			#10;
		tb_addr=5'h0A;tb_din=32'h0A;
			#10;
		tb_addr=5'h0B;tb_din=32'h0B;
			#10;
		tb_addr=5'h0C;tb_din=32'h0C;
			#10;
		tb_addr=5'h0D;tb_din=32'h0D;
			#10;
		tb_addr=5'h0E;tb_din=32'h0E;
			#10;
		tb_addr=5'h0F;tb_din=32'h0F;
			#10;
		tb_addr=5'h10;tb_din=32'h10;
			#10;
		tb_addr=5'h11;tb_din=32'h11;
			#10;
		tb_addr=5'h12;tb_din=32'h12;
			#10;
		tb_addr=5'h13;tb_din=32'h13;
			#10;
		tb_addr=5'h14;tb_din=32'h14;
			#10;
		tb_addr=5'h15;tb_din=32'h15;
			#10;
		tb_addr=5'h16;tb_din=32'h16;
			#10;
		tb_addr=5'h17;tb_din=32'h17;
			#10;
		tb_addr=5'h18;tb_din=32'h18;
			#10;
		tb_addr=5'h19;tb_din=32'h19;
			#10;
		tb_addr=5'h1A;tb_din=32'h1A;
			#10;
		tb_addr=5'h1B;tb_din=32'h1B;
			#10;
		tb_addr=5'h1C;tb_din=32'h1C;
			#10;
		tb_addr=5'h1D;tb_din=32'h1D;
			#10;
		tb_addr=5'h1E;tb_din=32'h1E;
			#10;
		tb_addr=5'h1F;tb_din=32'h1F;
			#10;
			//read
		tb_wen=1'b0; tb_addr=5'h00;
			#10;
		tb_addr=5'h01;
			#10;
		tb_addr=5'h02;
			#10;
		tb_addr=5'h03;
			#10;
		tb_addr=5'h04;
			#10;
		tb_addr=5'h05;
			#10;
		tb_addr=5'h06;
			#10;
		tb_addr=5'h07;
			#10;
		tb_addr=5'h08;
			#10;
		tb_addr=5'h09;
			#10;
		tb_addr=5'h0A;
			#10;
		tb_addr=5'h0B;
			#10;
		tb_addr=5'h0C;
			#10;
		tb_addr=5'h0D;
			#10;
		tb_addr=5'h0E;
			#10;
		tb_addr=5'h0F;
			#10;
		tb_addr=5'h10;
			#10;
		tb_addr=5'h11;
			#10;
		tb_addr=5'h12;
			#10;
		tb_addr=5'h13;
			#10;
		tb_addr=5'h14;
			#10;
		tb_addr=5'h15;
			#10;
		tb_addr=5'h16;
			#10;
		tb_addr=5'h17;
			#10;
		tb_addr=5'h18;
			#10;
		tb_addr=5'h19;
			#10;
		tb_addr=5'h1A;
			#10;
		tb_addr=5'h1B;
			#10;
		tb_addr=5'h1C;
			#10;
		tb_addr=5'h1D;
			#10;
		tb_addr=5'h1E;
			#10;
		tb_addr=5'h1F;
			#10;
	
		//memory change test
		tb_wen=1'b1;tb_addr=5'h1A;tb_din=32'hFFFFFFFF;
			#10;
		tb_wen=1'b0;
			#10;
			
		//disenable
		tb_cen=1'b0;
			#10;
			#20; $stop;
			
	end
endmodule
		
	