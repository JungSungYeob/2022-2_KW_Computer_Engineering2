module cal_flags4(op,result,co_add,c3_add,c,n,z,v);
	input [2:0] op;
	input[3:0] result;
	input co_add,c3_add;
	output c,n,z,v;

	//assign c,n,z,v 
	assign c = (op[2:1] != 2'b11) ? 1'b0 : co_add;//if opcode is not 11x return 0 else return co_add
	
	assign n = result[3]; // MSB bit
	
	assign z = (result == 4'b0)? 1'b1 : 1'b0; //if all bit zero return 0 else return 1
	
	assign v = (op[2:1] != 2'b11) ? 1'b0 : (co_add^c3_add);//if opcode is not 11x return 0 else  return c0_add^c3_add
	
endmodule
