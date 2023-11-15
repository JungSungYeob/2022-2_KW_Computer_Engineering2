`timescale 1ns/100ps //set timescale

module tb_rca4;
	//set reg tb_a, tb_b, tb_ci to use RCA4 testbench
	reg[3:0]tb_a;
	reg[3:0]tb_b;
	reg tb_ci;
	//set wire tb_s, tb_co, tb_result to use RCA4 testbench
	wire[3:0] tb_s;
	wire tb_co;
	//tb_result has set because of overflow by carryout
	wire [4:0]tb_result;
	//set testbench of RCA module
	rca4 U0_rca(.a(tb_a),.b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));
	
	initial
	
	begin //start testbench of RCA
	
		tb_a=4'b0; tb_b=4'b0; tb_ci = 0;//a=0000,b=0000,ci=0
	#10;
		tb_a=4'b0001; tb_b=4'b0001; tb_ci = 0; //a=0001,b=0001,ci=0
	#10;
		tb_a=4'b1001; tb_b=4'b0110; tb_ci = 0; //a=1001,b=0110,ci=0
	#10;
		tb_a=4'b1111; tb_b=4'b1111; tb_ci = 0; //a=1111,b=1111,ci=0
	#10;
		tb_ci =1;//a=1111,b=1111,ci=1
	#10;
	end
		//for checking output wave result of {co+s} by 5bit tb_result
		assign tb_result = {tb_co, tb_s};
		
endmodule
		