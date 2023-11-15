module _dff_r_en(clk, reset_n, en, d, q);//d-flipflop with en and async resettable
	//set input output reg
	input clk, reset_n, en, d;
	output reg q;
	//when rising edge of clk or falling edge of reset_n
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n==0)// if reset X
			q<=1'b0;
		else if(en)// if en get set
			q<=d;
		else
			q<=q;
	end
endmodule

module register8_r_en(clk,reset_n, en,d,q);//regiseter32 with en and async resettable
	//set input output, output reg
	input clk, reset_n, en;
	input [7:0] d;
	output [7:0] q;
	//instance of _dff_r_en
	_dff_r_en U0_dff_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[0]),.q(q[0]));
	_dff_r_en U1_dff_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[1]),.q(q[1]));
	_dff_r_en U2_dff_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[2]),.q(q[2]));
	_dff_r_en U3_dff_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[3]),.q(q[3]));
	_dff_r_en U4_dff_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[4]),.q(q[4]));
	_dff_r_en U5_dff_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[5]),.q(q[5]));
	_dff_r_en U6_dff_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[6]),.q(q[6]));
	_dff_r_en U7_dff_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[7]),.q(q[7]));
endmodule

module register32_r_en(clk,reset_n,en,d,q);
	input clk,reset_n, en;
	input [31:0]d;
	output [31:0]q;
	
	register8_r_en U0_register8_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[7:0]),.q(q[7:0]));
	register8_r_en U1_register8_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[15:8]),.q(q[15:8]));
	register8_r_en U2_register8_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[23:16]),.q(q[23:16]));
	register8_r_en U3_register8_r_en(.clk(clk),.reset_n(reset_n),.en(en),.d(d[31:24]),.q(q[31:24]));
	
endmodule

module register32_8(clk, reset_n, en, d_in, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7);//32bit register for 8-bit register
	//set input and output
	input clk, reset_n;
	input [7:0]en;
	input [31:0]d_in;
	output [31:0]d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7;
	//instance of regisetr32_r_en
	register32_r_en U0_register32_r_en(.clk(clk),.reset_n(reset_n),.en(en[0]),.d(d_in),.q(d_out0));
	register32_r_en U1_register32_r_en(.clk(clk),.reset_n(reset_n),.en(en[1]),.d(d_in),.q(d_out1));	
	register32_r_en U2_register32_r_en(.clk(clk),.reset_n(reset_n),.en(en[2]),.d(d_in),.q(d_out2));
	register32_r_en U3_register32_r_en(.clk(clk),.reset_n(reset_n),.en(en[3]),.d(d_in),.q(d_out3));
	register32_r_en U4_register32_r_en(.clk(clk),.reset_n(reset_n),.en(en[4]),.d(d_in),.q(d_out4));
	register32_r_en U5_register32_r_en(.clk(clk),.reset_n(reset_n),.en(en[5]),.d(d_in),.q(d_out5));
	register32_r_en U6_register32_r_en(.clk(clk),.reset_n(reset_n),.en(en[6]),.d(d_in),.q(d_out6));
	register32_r_en U7_register32_r_en(.clk(clk),.reset_n(reset_n),.en(en[7]),.d(d_in),.q(d_out7));
endmodule
