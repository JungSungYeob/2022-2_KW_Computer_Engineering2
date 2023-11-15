module _3_to_8_decoder(d,q);//module of 3to8 decoder
//set input output
	input [2:0]d;
	output reg[7:0] q;
	
	always@(d) begin
		case(d)//3bit input 8bit output
			3'b000: q=8'b00000001;
			3'b001: q=8'b00000010;
			3'b010: q=8'b00000100;
			3'b011: q=8'b00001000;
			3'b100: q=8'b00010000;
			3'b101: q=8'b00100000;
			3'b110: q=8'b01000000;
			3'b111: q=8'b10000000;
			default : q=8'hx; //else
		endcase
	end
endmodule

module write_operation(Addr,we,wEn);//write enable module
//set input and output
	input we;
	input [2:0] Addr;
	output[7:0] wEn;
	//declare wire
	wire [7:0] w_a;
	//instance of _3_to_8_decoder
	_3_to_8_decoder U0_3_to_8_decoder(.d(Addr),.q(w_a));
	//instance of _and2
	_and2 U1_and2(.a(we),.b(w_a[0]),.y(wEn[0]));
	_and2 U2_and2(.a(we),.b(w_a[1]),.y(wEn[1]));
	_and2 U3_and2(.a(we),.b(w_a[2]),.y(wEn[2]));
	_and2 U4_and2(.a(we),.b(w_a[3]),.y(wEn[3]));
	_and2 U5_and2(.a(we),.b(w_a[4]),.y(wEn[4]));
	_and2 U6_and2(.a(we),.b(w_a[5]),.y(wEn[5]));
	_and2 U7_and2(.a(we),.b(w_a[6]),.y(wEn[6]));
	_and2 U8_and2(.a(we),.b(w_a[7]),.y(wEn[7]));
endmodule
