`timescale 1ns/100ps
module tb_3_to_8_decoder;
//set reg and wire
	reg [2:0] tb_d;
	wire [7:0] tb_q;
	//instance _3_to _8_decoder
	_3_to_8_decoder U0_3_to_8_decoder(.d(tb_d),.q(tb_q));
	//testbench
	initial
	begin
	tb_d=3'b000;//if 000
		#10;
	tb_d=3'b001;//if 001
		#10;
	tb_d=3'b010;//if 010
		#10;
	tb_d=3'b011;//if 011
		#10;
	tb_d=3'b100;//if 100
		#10;
	tb_d=3'b101;//if 101
		#10;
	tb_d=3'b110;//if 110
		#10;
	tb_d=3'b111;//if 111
		#10;
	end
endmodule
