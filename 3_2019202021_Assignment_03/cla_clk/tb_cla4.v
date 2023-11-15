`timescale 1ns/100ps
//module tb_cla4
module tb_cla4;
	//set reg 0~3 tb_a & tb_b
	reg [3:0] tb_a, tb_b;
	//set reg tb_ci
	reg tb_ci;
	//declare wire 0~3 tb_s
	wire [3:0] tb_s;
	//declare tb_co
	wire tb_co;
	//declare 0~4 tb_result = 5bit
	wire [4:0] tb_result;
	
	//assign tb_result(1bit+4bit)
	assign tb_result = {tb_co, tb_s};
	//use cla4
	cla4 U0_cla4(.a(tb_a),.b(tb_b),.ci(tb_ci),.s(tb_s),.co(tb_co));

initial
begin 
	tb_a=4'b0; tb_b=4'b0; tb_ci = 0;//a=0000,b=0000,ci=0
	#10;
		tb_a=4'b0001; tb_b=4'b0001; tb_ci = 0; //a=0001,b=0001,ci=0
	#10;
		tb_a=4'b1001; tb_b=4'b0110; tb_ci = 0; //a=1001,b=0110,ci=0
	#10;
		tb_a=4'b1111; tb_b=4'b1111; tb_ci = 0; //a=1111,b=1111,ci=0
	#10;
		tb_ci =1;//a=1111,b=1111,ci=1
	#10;
end


endmodule	