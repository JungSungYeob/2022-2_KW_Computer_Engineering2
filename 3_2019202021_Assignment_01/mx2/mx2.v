module mx2(d0,d1,s,y); //create mx2 mux module using 2-input nand module and 1-input inverter module
	//set input and output
	input d0;
	input d1;
	input s;
	output y;
	
	wire sb, w0, w1;
	// Declare the wire to be used inside the mux
	
	
	//create the gate inside the mux using module
	_inv iv0 (s,sb);
	_nand2 nd20 (d0,sb,w0);
	_nand2 nd21 (d1,s,w1);
	_nand2 nd22 (w0,w1,y);
	
endmodule
