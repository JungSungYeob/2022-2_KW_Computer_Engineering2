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





