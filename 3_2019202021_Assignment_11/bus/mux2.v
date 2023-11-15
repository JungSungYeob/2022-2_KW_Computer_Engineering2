module mux2(en,a,b,y);//2-to-1 mux 1bit
//set input output
	input en, a,b;
	output y;
	//assign y
	assign y=((en==1'b0)?a:b);
endmodule
