module ha(a,b,co,s);
	//set input a,b
	input a,b;
	//set output co,s
	output co,s;
	//use '2-input xor' and '2-input and'	
	_xor2 XR0 (a,b,s);
	_and2 AD0 (a,b,co);
	
endmodule
