module mux3_32bit(en,a,b,c,y);//3-to-1 mux 32bits
//set input output
	input [1:0]en;
	input [31:0]a,b,c;
	output [31:0]y;
	//assign y
	assign y=(en==2'b00)?a:((en==2'b01)?b:((en==2'b10)?c:32'b0));
endmodule