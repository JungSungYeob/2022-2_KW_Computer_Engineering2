module mux2_8bit(en,a,b,y);//2-to-1 mux 8bits
//set input output
	input en;
	input [7:0]a,b;
	output [7:0]y;
	//assign y
	assign y=((en==1'b0)?a:b);
endmodule
