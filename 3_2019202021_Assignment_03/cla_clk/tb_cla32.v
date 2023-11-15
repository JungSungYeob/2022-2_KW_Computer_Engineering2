`timescale 1ns/100ps
//module tb_cla32
module tb_cla32;
	//set reg 0~31 tb_a, tb_b
	reg [31:0] tb_a, tb_b;
	//set reg tb_ci
	reg tb_ci;
	//declare wire 0~31 tb_s
	wire [31:0] tb_s;
	//declare tb_co
	wire tb_co;
	//declare 0~32 tb_result = 33bit
	wire [32:0] tb_result;
	//assign tb_result(1bit+32bit)
	assign tb_result = {tb_co, tb_s};
	//use cla 32
	cla32 U0_cla4(.a(tb_a),.b(tb_b),.ci(tb_ci),.s(tb_s),.co(tb_co));

initial
begin 
		tb_a=32'h0; tb_b=32'h0; tb_ci = 1'b0; //32bit hexadecimal 0 + hexadecimal 0 + 1bit binary 0
	#10;
		tb_a=32'hFFFF_FFFF; tb_b=32'h0; tb_ci = 1'b0; //32bit hexadecimal FFFF_FFFF + hexadecimal 0 + 1bit binary 0
	#10;
		tb_a=32'hFFFF_0000; tb_b=32'h0000_FFFF; tb_ci = 1'b0; //32bit hexadecimal FFFF_0000 + hexadecimal 0000_FFFF + 1bit binary 0
	#10;
		tb_a=32'h0F0F_F0F0; tb_b=32'hF0F0_0F0F; tb_ci = 1'b0; //32bit hexadecimal 0F0F_F0F0 + hexadecimal F0F0_0F0F + 1bit binary 0
	#10;
		tb_a=32'h0123_4567; tb_b=32'h89AB_CDEF; tb_ci = 1'b0; //32bit hexadecimal 0123_4567 + hexadecimal 89AB_CDEF + 1bit binary 0
	#10;
		tb_a=32'hFFFF_FFFF; tb_b=32'h0000_0001; tb_ci = 1'b0; //32bit hexadecimal FFFF_FFFF + hexadecimal 0000_0001 + 1bit binary 0
	#10;
		tb_ci =1'b1; //1bit binary 1
	#10;
end


endmodule	