module mx2_32bits(d0,d1,s,y);
//input 32bits d0,d1
	input [31:0] 	d0,d1;
	//set input s
	input s;
	//set output 32bits y
	output [31:0]	y;
	
	//if s==0 return d0 if not return d1
	assign y = (s==0)? d0:d1;
	
endmodule
