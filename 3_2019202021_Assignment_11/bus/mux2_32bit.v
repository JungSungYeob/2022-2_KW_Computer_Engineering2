module mux2_32bit(en,a,b,y);//2-to-1 mux 32bits
//set input output
	input en;
	input [31:0]a,b;
	output [31:0]y;
	//assign y
	assign y=((en==1'b0)?a:b);
endmodule
