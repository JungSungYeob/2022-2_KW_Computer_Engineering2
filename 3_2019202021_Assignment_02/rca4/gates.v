module _inv(a,y);
	//set input a;
	input a;
	//set output y;
	output y;
	//assign y
	assign y=~a;
endmodule

module _nand2(a,b,y);
	//set input a,b
	input a, b;
	//set output y
	output y;
	// assign y
	assign y=~(a&b);
endmodule

module _and2(a,b,y);
	//set input a,b
	input a,b;
	//set output y
	output y;
	//assign y
	assign y=a&b;
endmodule

module _or2(a,b,y);
	//set input a,b
	input a,b;
	//set input y
	output y;

	//assign y
	assign y=a|b;
endmodule

module _xor2(a,b,y);
	//set input a,b
	input a,b;
	//set output y
	output y;
	//set wire t1,t2,i1,i2 to use inside _xor2 module
	wire t1,t2,i1,i2;
	
	//use 2 'Inverter', 2 '2-input and', 1 '2-input or'
	_inv IV10(a,i1); //~a=i1
	_inv IV11(b,i2); //~b=i2
	_and2 AD10(i1,b,t1);
	_and2 AD11(i2,a,t2);
	_or2 OR0(t1,t2,y);
	
endmodule
