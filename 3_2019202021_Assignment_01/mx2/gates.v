module _nand2(a,b,y);
//create 2-input nand gaet module

//set input output
	input a, b;
	output y;
	
	assign y=~(a&b);
endmodule

module _inv(a,y);
//create 1-input inverter module

//set input output
	input a;
	output y;
	
	assign y=~a;
endmodule
