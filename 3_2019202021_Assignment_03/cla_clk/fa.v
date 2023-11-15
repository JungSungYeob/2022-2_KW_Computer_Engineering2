module fa(a,b,ci,co,s);
	//set input a,b,c
	input a,b,ci;
	//set output co,s
	output co, s;
	//set wire c1,c2,sm to use inside fa module
	wire c1,c2,sm;
	
	//use 2 'Half Adder' and 1 '2-input or'
	ha HA10 (b,ci,c1,sm);
	ha HA11 (a,sm,c2,s);
	_or2 AD00 (c1,c2,co); 
	
endmodule
