module cal_flags32(op,result,co_add,co_prev_add,c,n,z,v);
	//set input opcode and 32bits result
	input [2:0] op;
	input [31:0] result;
	//set input co_add co_prev_add
	input co_add, co_prev_add;
	//set output c,n,z,v
	output c,n,z,v;
	
	//assign c,n,z,v
	assign c = (op[2:1] != 2'b11)? 1'b0:co_add;
	assign n = result[31];
	assign z = (result == 32'b0)? 1'b1 :1'b0;
	assign v = (op[2:1] != 2'b11) ? 1'b0 :co_add^co_prev_add;
	
endmodule
