//full adder version 2 for cla
module fa_v2(a,b,ci,s);
	//set input output
	input a,b,ci;
	output s;
	//declare a wire(w0) to implement
	wire w0;
	//calculate 2-input fa_v2 for output s
	_xor2 XR1(.a(a),.b(b),.y(w0));
	_xor2 XR2(.a(w0),.b(ci),.y(s));
endmodule
