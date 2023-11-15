`timescale 1ns/100ps

module tb_ALU;
	reg[31:0] tb_a,tb_b;
	reg[3:0] tb_op;
	
	wire [31:0] tb_result;
	
	wire [31:0] tb_opdone;
	
	ALU U0_ALU(.a(tb_a),.b(tb_b),.op(tb_op),.result(tb_result),.opdone(tb_opdone));
	
	initial
	begin
		tb_a=32'h3; tb_b=32'h5; tb_op=4'b0000;
			#10;
		tb_op=4'b0001;
			#10;
		tb_op=4'b0010;
			#10;
		tb_op=4'b0011;
			#10;
		tb_op=4'b0100;
			#10;
		tb_op=4'b0101;
			#10;
		tb_op=4'b0110;
			#10;
		tb_op=4'b0111;
			#10;
		tb_op=4'b1000;
			#10;
		tb_op=4'b1001;
			#10;
		tb_op=4'b1010;
			#10;
		tb_op=4'b1011;
			#10;
		tb_op=4'b1100;
			#10;
		tb_op=5'b1101;
			#10;
	
	end
		
endmodule







