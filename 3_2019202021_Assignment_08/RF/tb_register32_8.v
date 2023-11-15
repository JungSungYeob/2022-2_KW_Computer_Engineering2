`timescale 1ns/100ps
	module tb_register32_8;
	//set reg and wire
	reg tb_clk, tb_reset_n;
	reg [7:0] tb_en;
	reg [31:0] tb_d_in;
	wire [31:0] tb_d_out0,tb_d_out1,tb_d_out2,tb_d_out3,tb_d_out4,tb_d_out5,tb_d_out6,tb_d_out7;
	//instance register32_8
	register32_8 U0_register32_8(.clk(tb_clk),.reset_n(tb_reset_n),.en(tb_en),.d_in(tb_d_in),
				.d_out0(tb_d_out0),.d_out1(tb_d_out1),.d_out2(tb_d_out2),
				.d_out3(tb_d_out3),.d_out4(tb_d_out4),.d_out5(tb_d_out5),
				.d_out6(tb_d_out6),.d_out7(tb_d_out7));
	//every 5 chang clk
	always
	begin
		tb_clk=1; #5;
		tb_clk=0; #5;
	end
	//testbench
	initial
	begin
		tb_clk=1; tb_reset_n=0; tb_en=8'h0; tb_d_in=32'h0;//set all 0
			#5;
		tb_reset_n=1; //reset
			#10;
		tb_en=0000_0001; tb_d_in = 32'h0000_0001;//1st one hot encoding
			#10;
		tb_en=0000_0010;tb_d_in = 32'h0000_0002;//2nd one hot encoding
			#10;
		tb_en=0000_0100;tb_d_in = 32'h0000_0003;//3rd one hot encoding
			#10;
		tb_en=0000_1000;tb_d_in = 32'h0000_0004;//4th one hot encoding
			#10
		tb_en=0001_0000;tb_d_in = 32'h0000_0005;//5th one hot encoding
			#10;
		tb_en=0010_0000;tb_d_in = 32'h0000_0006;//6th one hot encoding
			#10;
		tb_en=0100_0000;tb_d_in = 32'h0000_0007;//7th one hot encoding
			#10;
		tb_en=1000_0000;tb_d_in = 32'h0000_0008;//8th one hot encoding
			#10;$stop;
	end
endmodule
