`timescale 1ns/100ps
module tb_fifo_cal_addr();//fifo_cal_addr testbench module
	//set reg and wire
	reg [2:0]tb_state, tb_head, tb_tail;
	reg [3:0]tb_data_count;
	
	wire tb_we, tb_re;
	wire [2:0]tb_next_head, tb_next_tail;
	wire [3:0]tb_next_data_count;
	//instance fifo_cal_addr to use testbench
	fifo_cal_addr U0_fifo_cal_addr(.state(tb_state),.head(tb_head),.tail(tb_tail),.data_count(tb_data_count),.we(tb_we),.re(tb_re),
											.next_head(tb_next_head),.next_tail(tb_next_tail),.next_data_count(tb_next_data_count));
	
	initial
		begin
		tb_state=3'b0;tb_head=3'b0; tb_tail=3'b0; tb_data_count =4'b0;
			#10;
		//INIT
		tb_state=3'b000;
			#10;
		//WRITE
		tb_state=3'b001;
			#10;
		//WR_ERROR
		tb_state=3'b010;
			#10;
		//READ
		tb_state=3'b011;tb_data_count=4'b0010;
			#10;
		//RD_ERROR
		tb_state=3'b100;
			#10;
		//NO_OP
		tb_state=3'b101;
			#10;
			#30; $stop;
		end
endmodule
