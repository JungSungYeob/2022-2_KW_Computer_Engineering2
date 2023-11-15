module cla_clk(clk,a,b,ci,s,co);
	//set input clk
	input clk;
	//set input 0~31 a,b
	input [31:0]a,b;
	//set input ci
	input ci;
	//set output s
	output [31:0]s;
	//set output co
	output co;
	//set reg using cla32 always
	reg [31:0] reg_a, reg_b;
	reg reg_ci;
	reg [31:0] reg_s;
	reg reg_co;
	
	//set wire 32bit wire_s & 1bit wire_co
	wire [31:0] wire_s;
	wire wire_co;
	
	//D-flipflop
	always@(posedge clk)
	begin
	
	reg_a<=a;
	reg_b<=b;
	reg_ci<=ci;
	
	reg_s<=wire_s;
	reg_co<=wire_co;
	
	end
	
	//use cla32
	cla32 U0_cla32(.a(reg_a),.b(reg_b),.ci(reg_ci),.s(wire_s),.co(wire_co));
	
	//assign s & co
	assign s=reg_s;
	assign co=reg_co;
	
endmodule
