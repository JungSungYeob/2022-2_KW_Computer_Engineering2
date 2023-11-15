//inverter(not gate)
module _inv(a,y);
	//set input output
	input a;
	output y;
	//assign y
	assign y=~a;
endmodule
	

//2-input nand gate
module _nand2(a,b,y);
	//set input output
	input a,b;
	output y;
	//assign y
	assign y=~(a&b);
endmodule


//2-input and gate
module _and2(a,b,y);
	//set input output
	input a,b;
	output y;
	//assign y
	assign y= a&b;
endmodule


//2-input or gate
module _or2(a,b,y);
	//set input output	
	input a,b;
	output y;
	//assign y
	assign y=a|b;
endmodule



//2-input xor gate
module _xor2(a,b,y);
	//set input output	
	input a,b;
	output y;
	//declare wires to implement
	wire i0, i1;
	wire w0, w1;
	// calculate of 2-input xor gate according to Karnaugh map
	_inv U0_inv (.a(a), .y(i0));
	_inv U1_inv (.a(b), .y(i1));
	_and2 U2_and2 (.a(i0),.b(b),.y(w0));
	_and2 U3_and2 (.a(a),.b(i1),.y(w1));
	_or2 U4_or2 (.a(w0),.b(w1),.y(y));
endmodule


//3-input and gate
module _and3(a,b,c,y);
	//set input output
	input a,b,c;
	output y;
	//assign y
	assign y=a&b&c;
endmodule

//4-input and gate
module _and4(a,b,c,d,y);
	//set input output
	input a,b,c,d;
	output y;
	//assign y
	assign y=a&b&c&d;
endmodule

//5-input and gate
module _and5(a,b,c,d,e,y);
	//set input output
	input a,b,c,d,e;
	output y;
	//assign y;
	assign y=a&b&c&d&e;
endmodule

//3-input or gate
module _or3(a,b,c,y);
	//set input output
	input a,b,c;
	output y;
	//assign y
	assign y=a|b|c;
endmodule

//4-input or gate
module _or4(a,b,c,d,y);
	//set input output
	input a,b,c,d;
	output y;
	//assign y
	assign y=a|b|c|d;
endmodule

//5-input or gate
module _or5(a,b,c,d,e,y);
	//set input output
	input a,b,c,d,e;
	output y;
	//assign y
	assign y=a|b|c|d|e;
endmodule

//4bits inverter
module _inv_4bits(a,y);
//set input output
	input [3:0] a;
	output[3:0] y;
	//assign y
	assign y=~a;
endmodule

//4bits 2input and gate
module _and2_4bits(a,b,y);
//set input output
	input [3:0] a,b;
	output [3:0] y;
	//assign y
	assign y=a&b;
endmodule

	
//4bits 2input or gate
module _or2_4bits(a,b,y);
//set input output
	input [3:0] a,b;
	output [3:0] y;
	//assign y
	assign y=a|b;
endmodule
	
	
//4bits 2input xor gate
module _xor2_4bits(a,b,y);
//set input output
	input [3:0] a,b;
	output [3:0]y;
	//use xor2 gate for 4bits
	_xor2 U0_xor2(.a(a[0]),.b(b[0]),.y(y[0]));
	_xor2 U1_xor2(.a(a[1]),.b(b[1]),.y(y[1]));
	_xor2 U2_xor2(.a(a[2]),.b(b[2]),.y(y[2]));
	_xor2 U3_xor2(.a(a[3]),.b(b[3]),.y(y[3]));
endmodule
	
//4bits 2input xnor gate
module _xnor2_4bits(a,b,y);
//set input output
	input [3:0] a,b;
	output [3:0] y;
	//declare wire w0
	wire[3:0] w0;
	_xor2_4bits U0_xor2_4bits(.a(a),.b(b),.y(w0));
	_inv_4bits U1_inv_4bits(.a(w0),.y(y));
endmodule




