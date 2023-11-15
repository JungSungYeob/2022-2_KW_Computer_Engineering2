module shifter32(clk,reset_n,op,shamt,d_in,d_out);
//set input output
	input clk,reset_n;
	input [2:0]op;
	input [1:0]shamt;
	input [31:0]d_in;
	output [31:0] d_out;
	//declare wire
	wire [31:0]d_n;
	//instance cc_logic and register8
	cc_logic U0_cc_logic(.op(op),.shamt(2'b01),.d_in(d_in),.d_out(d_out),.d_next(d_n));
	_register32_r U1_register_r(.clk(clk),.reset_n(reset_n),.d(d_n),.q(d_out));
	
endmodule

module cc_logic(op,shamt,d_in,d_out,d_next);
//set input output and reg
	input [2:0] op;
	input [1:0] shamt;
	input [31:0] d_in, d_out;
	output [31:0] d_next;
	reg [31:0] d_next;
	
	wire [31:0] d_lsl, d_lsr, d_asr;
	//set opcode 
	parameter NOP = 	3'b000;
	parameter LOAD = 	3'b001;
	parameter LSL = 	3'b010;
	parameter LSR = 	3'b011;
	parameter ASR = 	3'b100;
	//always op shamt d_in d_out d_lsl d_lsr d_asr
	always@(op,shamt,d_in,d_out,d_lsl,d_lsr,d_asr)
	begin
		case(op)//each case
		NOP :d_next<=d_out;
	   LOAD:d_next<=d_in;
      LSL :d_next<=d_lsl;
      LSR :d_next<=d_lsr;
      ASR :d_next<=d_asr;
		default: d_next<=8'bx;//else return NULL
		endcase
	end
	//get value
	LSL32 U0_LSL32(.d_in(d_out),.shamt(shamt),.d_out(d_lsl));
	LSR32 U1_LSR32(.d_in(d_out),.shamt(shamt),.d_out(d_lsr));
	ASR32 U2_ASR32(.d_in(d_out),.shamt(shamt),.d_out(d_asr));
	
endmodule

module LSL32(d_in,shamt,d_out);
//LSL left shift
	//set input output
	input [31:0]d_in;
	input [1:0]shamt;
	output [31:0]d_out;
	//shift left amount of shamt
	mx4 U0_mx4(.d0(d_in[0]),	.d1(1'b0),		.d2(1'b0),		.d3(1'b0),		.s(shamt),	.y(d_out[0]));
	mx4 U1_mx4(.d0(d_in[1]),	.d1(d_in[0]),	.d2(1'b0),		.d3(1'b0),		.s(shamt),	.y(d_out[1]));
	mx4 U2_mx4(.d0(d_in[2]),	.d1(d_in[1]),	.d2(d_in[0]),	.d3(1'b0),		.s(shamt),	.y(d_out[2]));
	mx4 U3_mx4(.d0(d_in[3]),	.d1(d_in[2]),	.d2(d_in[1]),	.d3(d_in[0]),	.s(shamt),	.y(d_out[3]));
	mx4 U4_mx4(.d0(d_in[4]),	.d1(d_in[3]),	.d2(d_in[2]),	.d3(d_in[1]),	.s(shamt),	.y(d_out[4]));
	mx4 U5_mx4(.d0(d_in[5]),	.d1(d_in[4]),	.d2(d_in[3]),	.d3(d_in[2]),	.s(shamt),	.y(d_out[5]));
	mx4 U6_mx4(.d0(d_in[6]),	.d1(d_in[5]),	.d2(d_in[4]),	.d3(d_in[3]),	.s(shamt),	.y(d_out[6]));
	mx4 U7_mx4(.d0(d_in[7]),	.d1(d_in[6]),	.d2(d_in[5]),	.d3(d_in[4]),	.s(shamt),	.y(d_out[7]));
	mx4 U8_mx4(.d0(d_in[8]),	.d1(d_in[7]),	.d2(d_in[6]),	.d3(d_in[5]),	.s(shamt),	.y(d_out[8]));
	mx4 U9_mx4(.d0(d_in[9]),	.d1(d_in[8]),	.d2(d_in[7]),	.d3(d_in[6]),	.s(shamt),	.y(d_out[9]));
	mx4 U10_mx4(.d0(d_in[10]),	.d1(d_in[9]),	.d2(d_in[8]),	.d3(d_in[7]),	.s(shamt),	.y(d_out[10]));
	mx4 U11_mx4(.d0(d_in[11]),	.d1(d_in[10]),	.d2(d_in[9]),	.d3(d_in[8]),	.s(shamt),	.y(d_out[11]));
	mx4 U12_mx4(.d0(d_in[12]),	.d1(d_in[11]),	.d2(d_in[10]),	.d3(d_in[9]),	.s(shamt),	.y(d_out[12]));
	mx4 U13_mx4(.d0(d_in[13]),	.d1(d_in[12]),	.d2(d_in[11]),	.d3(d_in[10]),	.s(shamt),	.y(d_out[13]));
	mx4 U14_mx4(.d0(d_in[14]),	.d1(d_in[13]),	.d2(d_in[12]),	.d3(d_in[11]),	.s(shamt),	.y(d_out[14]));
	mx4 U15_mx4(.d0(d_in[15]),	.d1(d_in[14]),	.d2(d_in[13]),	.d3(d_in[12]),	.s(shamt),	.y(d_out[15]));
	mx4 U16_mx4(.d0(d_in[16]),	.d1(d_in[15]),	.d2(d_in[14]),	.d3(d_in[13]),	.s(shamt),	.y(d_out[16]));
	mx4 U17_mx4(.d0(d_in[17]),	.d1(d_in[16]),	.d2(d_in[15]),	.d3(d_in[14]),	.s(shamt),	.y(d_out[17]));
	mx4 U18_mx4(.d0(d_in[18]),	.d1(d_in[17]),	.d2(d_in[16]),	.d3(d_in[15]),	.s(shamt),	.y(d_out[18]));
	mx4 U19_mx4(.d0(d_in[19]),	.d1(d_in[18]),	.d2(d_in[17]),	.d3(d_in[16]),	.s(shamt),	.y(d_out[19]));
	mx4 U20_mx4(.d0(d_in[20]),	.d1(d_in[19]),	.d2(d_in[18]),	.d3(d_in[17]),	.s(shamt),	.y(d_out[20]));
	mx4 U21_mx4(.d0(d_in[21]),	.d1(d_in[20]),	.d2(d_in[19]),	.d3(d_in[18]),	.s(shamt),	.y(d_out[21]));
	mx4 U22_mx4(.d0(d_in[22]),	.d1(d_in[21]),	.d2(d_in[20]),	.d3(d_in[19]),	.s(shamt),	.y(d_out[22]));
	mx4 U23_mx4(.d0(d_in[23]),	.d1(d_in[22]),	.d2(d_in[21]),	.d3(d_in[20]),	.s(shamt),	.y(d_out[23]));
	mx4 U24_mx4(.d0(d_in[24]),	.d1(d_in[23]),	.d2(d_in[22]),	.d3(d_in[21]),	.s(shamt),	.y(d_out[24]));
	mx4 U25_mx4(.d0(d_in[25]),	.d1(d_in[24]),	.d2(d_in[23]),	.d3(d_in[22]),	.s(shamt),	.y(d_out[25]));
	mx4 U26_mx4(.d0(d_in[26]),	.d1(d_in[25]),	.d2(d_in[24]),	.d3(d_in[23]),	.s(shamt),	.y(d_out[26]));
	mx4 U27_mx4(.d0(d_in[27]),	.d1(d_in[26]),	.d2(d_in[25]),	.d3(d_in[24]),	.s(shamt),	.y(d_out[27]));
	mx4 U28_mx4(.d0(d_in[28]),	.d1(d_in[27]),	.d2(d_in[26]),	.d3(d_in[25]),	.s(shamt),	.y(d_out[28]));
	mx4 U29_mx4(.d0(d_in[29]),	.d1(d_in[28]),	.d2(d_in[27]),	.d3(d_in[26]),	.s(shamt),	.y(d_out[29]));
	mx4 U30_mx4(.d0(d_in[30]),	.d1(d_in[29]),	.d2(d_in[28]),	.d3(d_in[27]),	.s(shamt),	.y(d_out[30]));
	mx4 U31_mx4(.d0(d_in[31]),	.d1(d_in[30]),	.d2(d_in[29]),	.d3(d_in[28]),	.s(shamt),	.y(d_out[31]));
	
	
endmodule

module LSR32(d_in,shamt,d_out);
//set input output
	input [31:0]d_in;
	input [1:0]shamt;
	output [31:0]d_out;
	//shift right amount of shamt
	mx4 U0_mx4(.d0(d_in[0]),	.d1(d_in[1]),	.d2(d_in[2]),	.d3(d_in[3]),	.s(shamt),	.y(d_out[0]));
	mx4 U1_mx4(.d0(d_in[1]),	.d1(d_in[2]),	.d2(d_in[3]),	.d3(d_in[4]),	.s(shamt),	.y(d_out[1]));
	mx4 U2_mx4(.d0(d_in[2]),	.d1(d_in[3]),	.d2(d_in[4]),	.d3(d_in[5]),	.s(shamt),	.y(d_out[2]));
	mx4 U3_mx4(.d0(d_in[3]),	.d1(d_in[4]),	.d2(d_in[5]),	.d3(d_in[6]),	.s(shamt),	.y(d_out[3]));
	mx4 U4_mx4(.d0(d_in[4]),	.d1(d_in[5]),	.d2(d_in[6]),	.d3(d_in[7]),	.s(shamt),	.y(d_out[4]));
	mx4 U5_mx4(.d0(d_in[5]),	.d1(d_in[6]),	.d2(d_in[7]),	.d3(d_in[8]),	.s(shamt),	.y(d_out[5]));
	mx4 U6_mx4(.d0(d_in[6]),	.d1(d_in[7]),	.d2(d_in[8]),	.d3(d_in[9]),	.s(shamt),	.y(d_out[6]));
	mx4 U7_mx4(.d0(d_in[7]),	.d1(d_in[8]),	.d2(d_in[9]),	.d3(d_in[10]),	.s(shamt),	.y(d_out[7]));
	mx4 U8_mx4(.d0(d_in[8]),	.d1(d_in[9]),	.d2(d_in[10]),	.d3(d_in[11]),	.s(shamt),	.y(d_out[8]));
	mx4 U9_mx4(.d0(d_in[9]),	.d1(d_in[10]),	.d2(d_in[11]),	.d3(d_in[12]),	.s(shamt),	.y(d_out[9]));
	mx4 U10_mx4(.d0(d_in[10]),	.d1(d_in[11]),	.d2(d_in[12]),	.d3(d_in[13]),	.s(shamt),	.y(d_out[10]));
	mx4 U11_mx4(.d0(d_in[11]),	.d1(d_in[12]),	.d2(d_in[13]),	.d3(d_in[14]),	.s(shamt),	.y(d_out[11]));
	mx4 U12_mx4(.d0(d_in[12]),	.d1(d_in[13]),	.d2(d_in[14]),	.d3(d_in[15]),	.s(shamt),	.y(d_out[12]));
	mx4 U13_mx4(.d0(d_in[13]),	.d1(d_in[14]),	.d2(d_in[15]),	.d3(d_in[16]),	.s(shamt),	.y(d_out[13]));
	mx4 U14_mx4(.d0(d_in[14]),	.d1(d_in[15]),	.d2(d_in[16]),	.d3(d_in[17]),	.s(shamt),	.y(d_out[14]));
	mx4 U15_mx4(.d0(d_in[15]),	.d1(d_in[16]),	.d2(d_in[17]),	.d3(d_in[18]),	.s(shamt),	.y(d_out[15]));
	mx4 U16_mx4(.d0(d_in[16]),	.d1(d_in[17]),	.d2(d_in[18]),	.d3(d_in[19]),	.s(shamt),	.y(d_out[16]));
	mx4 U17_mx4(.d0(d_in[17]),	.d1(d_in[18]),	.d2(d_in[19]),	.d3(d_in[20]),	.s(shamt),	.y(d_out[17]));
	mx4 U18_mx4(.d0(d_in[18]),	.d1(d_in[19]),	.d2(d_in[20]),	.d3(d_in[21]),	.s(shamt),	.y(d_out[18]));
	mx4 U19_mx4(.d0(d_in[19]),	.d1(d_in[20]),	.d2(d_in[21]),	.d3(d_in[22]),	.s(shamt),	.y(d_out[19]));
	mx4 U20_mx4(.d0(d_in[20]),	.d1(d_in[21]),	.d2(d_in[22]),	.d3(d_in[23]),	.s(shamt),	.y(d_out[20]));
	mx4 U21_mx4(.d0(d_in[21]),	.d1(d_in[22]),	.d2(d_in[23]),	.d3(d_in[24]),	.s(shamt),	.y(d_out[21]));
	mx4 U22_mx4(.d0(d_in[22]),	.d1(d_in[23]),	.d2(d_in[24]),	.d3(d_in[25]),	.s(shamt),	.y(d_out[22]));
	mx4 U23_mx4(.d0(d_in[23]),	.d1(d_in[24]),	.d2(d_in[25]),	.d3(d_in[26]),	.s(shamt),	.y(d_out[23]));
	mx4 U24_mx4(.d0(d_in[24]),	.d1(d_in[25]),	.d2(d_in[26]),	.d3(d_in[27]),	.s(shamt),	.y(d_out[24]));
	mx4 U25_mx4(.d0(d_in[25]),	.d1(d_in[26]),	.d2(d_in[27]),	.d3(d_in[28]),	.s(shamt),	.y(d_out[25]));
	mx4 U26_mx4(.d0(d_in[26]),	.d1(d_in[27]),	.d2(d_in[28]),	.d3(d_in[29]),	.s(shamt),	.y(d_out[26]));
	mx4 U27_mx4(.d0(d_in[27]),	.d1(d_in[28]),	.d2(d_in[29]),	.d3(d_in[30]),	.s(shamt),	.y(d_out[27]));
	mx4 U28_mx4(.d0(d_in[28]),	.d1(d_in[29]),	.d2(d_in[30]),	.d3(d_in[31]),	.s(shamt),	.y(d_out[28]));
	mx4 U29_mx4(.d0(d_in[29]),	.d1(d_in[30]),	.d2(d_in[31]),	.d3(1'b0),		.s(shamt),	.y(d_out[29]));
	mx4 U30_mx4(.d0(d_in[30]),	.d1(d_in[31]),	.d2(1'b0),		.d3(1'b0),		.s(shamt),	.y(d_out[30]));
	mx4 U31_mx4(.d0(d_in[31]),	.d1(1'b0),		.d2(1'b0),		.d3(1'b0),		.s(shamt),	.y(d_out[31]));
	
endmodule

module ASR32(d_in,shamt,d_out);
//set input output
	input [31:0]d_in;
	input [1:0]shamt;
	output [31:0]d_out;
	//shift and paste amount of shamt
	mx4 U0_mx4(.d0(d_in[0]),	.d1(d_in[1]),	.d2(d_in[2]),	.d3(d_in[3]),	.s(shamt),	.y(d_out[0]));
	mx4 U1_mx4(.d0(d_in[1]),	.d1(d_in[2]),	.d2(d_in[3]),	.d3(d_in[4]),	.s(shamt),	.y(d_out[1]));
	mx4 U2_mx4(.d0(d_in[2]),	.d1(d_in[3]),	.d2(d_in[4]),	.d3(d_in[5]),	.s(shamt),	.y(d_out[2]));
	mx4 U3_mx4(.d0(d_in[3]),	.d1(d_in[4]),	.d2(d_in[5]),	.d3(d_in[6]),	.s(shamt),	.y(d_out[3]));
	mx4 U4_mx4(.d0(d_in[4]),	.d1(d_in[5]),	.d2(d_in[6]),	.d3(d_in[7]),	.s(shamt),	.y(d_out[4]));
	mx4 U5_mx4(.d0(d_in[5]),	.d1(d_in[6]),	.d2(d_in[7]),	.d3(d_in[8]),	.s(shamt),	.y(d_out[5]));
	mx4 U6_mx4(.d0(d_in[6]),	.d1(d_in[7]),	.d2(d_in[8]),	.d3(d_in[9]),	.s(shamt),	.y(d_out[6]));
	mx4 U7_mx4(.d0(d_in[7]),	.d1(d_in[8]),	.d2(d_in[9]),	.d3(d_in[10]),	.s(shamt),	.y(d_out[7]));
	mx4 U8_mx4(.d0(d_in[8]),	.d1(d_in[9]),	.d2(d_in[10]),	.d3(d_in[11]),	.s(shamt),	.y(d_out[8]));
	mx4 U9_mx4(.d0(d_in[9]),	.d1(d_in[10]),	.d2(d_in[11]),	.d3(d_in[12]),	.s(shamt),	.y(d_out[9]));
	mx4 U10_mx4(.d0(d_in[10]),	.d1(d_in[11]),	.d2(d_in[12]),	.d3(d_in[13]),	.s(shamt),	.y(d_out[10]));
	mx4 U11_mx4(.d0(d_in[11]),	.d1(d_in[12]),	.d2(d_in[13]),	.d3(d_in[14]),	.s(shamt),	.y(d_out[11]));
	mx4 U12_mx4(.d0(d_in[12]),	.d1(d_in[13]),	.d2(d_in[14]),	.d3(d_in[15]),	.s(shamt),	.y(d_out[12]));
	mx4 U13_mx4(.d0(d_in[13]),	.d1(d_in[14]),	.d2(d_in[15]),	.d3(d_in[16]),	.s(shamt),	.y(d_out[13]));
	mx4 U14_mx4(.d0(d_in[14]),	.d1(d_in[15]),	.d2(d_in[16]),	.d3(d_in[17]),	.s(shamt),	.y(d_out[14]));
	mx4 U15_mx4(.d0(d_in[15]),	.d1(d_in[16]),	.d2(d_in[17]),	.d3(d_in[18]),	.s(shamt),	.y(d_out[15]));
	mx4 U16_mx4(.d0(d_in[16]),	.d1(d_in[17]),	.d2(d_in[18]),	.d3(d_in[19]),	.s(shamt),	.y(d_out[16]));
	mx4 U17_mx4(.d0(d_in[17]),	.d1(d_in[18]),	.d2(d_in[19]),	.d3(d_in[20]),	.s(shamt),	.y(d_out[17]));
	mx4 U18_mx4(.d0(d_in[18]),	.d1(d_in[19]),	.d2(d_in[20]),	.d3(d_in[21]),	.s(shamt),	.y(d_out[18]));
	mx4 U19_mx4(.d0(d_in[19]),	.d1(d_in[20]),	.d2(d_in[21]),	.d3(d_in[22]),	.s(shamt),	.y(d_out[19]));
	mx4 U20_mx4(.d0(d_in[20]),	.d1(d_in[21]),	.d2(d_in[22]),	.d3(d_in[23]),	.s(shamt),	.y(d_out[20]));
	mx4 U21_mx4(.d0(d_in[21]),	.d1(d_in[22]),	.d2(d_in[23]),	.d3(d_in[24]),	.s(shamt),	.y(d_out[21]));
	mx4 U22_mx4(.d0(d_in[22]),	.d1(d_in[23]),	.d2(d_in[24]),	.d3(d_in[25]),	.s(shamt),	.y(d_out[22]));
	mx4 U23_mx4(.d0(d_in[23]),	.d1(d_in[24]),	.d2(d_in[25]),	.d3(d_in[26]),	.s(shamt),	.y(d_out[23]));
	mx4 U24_mx4(.d0(d_in[24]),	.d1(d_in[25]),	.d2(d_in[26]),	.d3(d_in[27]),	.s(shamt),	.y(d_out[24]));
	mx4 U25_mx4(.d0(d_in[25]),	.d1(d_in[26]),	.d2(d_in[27]),	.d3(d_in[28]),	.s(shamt),	.y(d_out[25]));
	mx4 U26_mx4(.d0(d_in[26]),	.d1(d_in[27]),	.d2(d_in[28]),	.d3(d_in[29]),	.s(shamt),	.y(d_out[26]));
	mx4 U27_mx4(.d0(d_in[27]),	.d1(d_in[28]),	.d2(d_in[29]),	.d3(d_in[30]),	.s(shamt),	.y(d_out[27]));
	mx4 U28_mx4(.d0(d_in[28]),	.d1(d_in[29]),	.d2(d_in[30]),	.d3(d_in[31]),	.s(shamt),	.y(d_out[28]));
	mx4 U29_mx4(.d0(d_in[29]),	.d1(d_in[30]),	.d2(d_in[31]),	.d3(d_in[31]),	.s(shamt),	.y(d_out[29]));
	mx4 U30_mx4(.d0(d_in[30]),	.d1(d_in[31]),	.d2(d_in[31]),	.d3(d_in[31]),	.s(shamt),	.y(d_out[30]));
	mx4 U31_mx4(.d0(d_in[31]),	.d1(d_in[31]),	.d2(d_in[31]),	.d3(d_in[31]),	.s(shamt),	.y(d_out[31]));
	
endmodule

module mx2(d0,d1,s,y);
	input d0, d1,s;
	output y;
	
	wire sb,w0,w1;
	
	_inv U0_inv(.a(s),.y(sb));
	_nand2 U1_nand2(.a(d0),.b(sb),.y(w0));
	_nand2 U2_nand2(.a(d1),.b(s),.y(w1));
	_nand2 U3_nand2(.a(w0),.b(w1),.y(y));
	
endmodule

module mx4(y,d0,d1,d2,d3,s);
	input d0,d1,d2,d3;
	input [1:0] s;
	output y;
	
	wire w0, w1;
	
	mx2 U0_mx2(.d0(d0),.d1(d1),.s(s[0]),.y(w0));
	mx2 U1_mx2(.d0(d2),.d1(d3),.s(s[0]),.y(w1));
	mx2 U2_mx2(.d0(w0),.d1(w1),.s(s[1]),.y(y));
	
	
endmodule


module _register32_r(clk,reset_n,d,q);
//set input output
	input clk, reset_n;
	input [31:0] d;
	output [31:0] q;
	//8bit d-flipflop for register
	_dff_r U0_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[0]),	.q(q[0]));
	_dff_r U1_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[1]),	.q(q[1]));
	_dff_r U2_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[2]),	.q(q[2]));
	_dff_r U3_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[3]),	.q(q[3]));
	_dff_r U4_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[4]),	.q(q[4]));
	_dff_r U5_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[5]),	.q(q[5]));
	_dff_r U6_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[6]),	.q(q[6]));
	_dff_r U7_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[7]),	.q(q[7]));
	_dff_r U8_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[8]),	.q(q[8]));
	_dff_r U9_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[9]),	.q(q[9]));
	_dff_r U10_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[10]),	.q(q[10]));
	_dff_r U11_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[11]),	.q(q[11]));
	_dff_r U12_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[12]),	.q(q[12]));
	_dff_r U13_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[13]),	.q(q[13]));
	_dff_r U14_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[14]),	.q(q[14]));
	_dff_r U15_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[15]),	.q(q[15]));
	_dff_r U16_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[16]),	.q(q[16]));
	_dff_r U17_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[17]),	.q(q[17]));
	_dff_r U18_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[18]),	.q(q[18]));
	_dff_r U19_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[19]),	.q(q[19]));
	_dff_r U20_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[20]),	.q(q[20]));
	_dff_r U21_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[21]),	.q(q[21]));
	_dff_r U22_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[22]),	.q(q[22]));
	_dff_r U23_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[23]),	.q(q[23]));
	_dff_r U24_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[24]),	.q(q[24]));
	_dff_r U25_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[25]),	.q(q[25]));
	_dff_r U26_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[26]),	.q(q[26]));
	_dff_r U27_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[27]),	.q(q[27]));
	_dff_r U28_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[28]),	.q(q[28]));
	_dff_r U29_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[29]),	.q(q[29]));
	_dff_r U30_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[30]),	.q(q[30]));
	_dff_r U31_dff_r(.clk(clk), 	.reset_n(reset_n),	.d(d[31]),	.q(q[31]));
	
endmodule

module _dff_r(clk, reset_n, d, q);//asynchronous d flipflop resettable
	input clk, reset_n, d;//set input clk, reset_n, d
	output q; //set output q;
	reg q; //declare reg q;
	
	//set clock rising edge or reset_n falling edge
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n==0)
			q<=1'b0; //nonblocking
		else
			q<=d;
	end
	
endmodule

