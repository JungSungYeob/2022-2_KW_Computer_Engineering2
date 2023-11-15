`timescale 1ns/100ps
module tb_fifo_ns();//fifo_ns testbench module
//set reg and wire
	reg tb_wr_en, tb_rd_en;
	reg [2:0]tb_state;
	reg [3:0] tb_data_count;
	
	wire [2:0] tb_next_state;


	//instance fifo to use testbench
	fifo_ns U0_fifo_ns(.wr_en(tb_wr_en),.rd_en(tb_rd_en),.state(tb_state),.data_count(tb_data_count),.next_state(tb_next_state));
	
	
	initial
		begin
		//all reset
		tb_wr_en=0; tb_rd_en=0; tb_state=3'b0; tb_data_count=4'b0;
			#10;
		//INIT
		tb_wr_en=1; tb_rd_en=0; tb_state=3'b000;
			#10;
		tb_wr_en=0; tb_rd_en=1; tb_state=3'b000;
			#10
		//WRITE
		tb_wr_en=1; tb_rd_en=0; tb_state=3'b001;
			#10;
		tb_wr_en=0; tb_rd_en=1; tb_state=3'b001;
			#10
		//WR_ERROR
		tb_wr_en=1; tb_rd_en=0; tb_state=3'b010;
			#10;
		tb_wr_en=0; tb_rd_en=1; tb_state=3'b010;
			#10
		//READ
		tb_wr_en=1; tb_rd_en=0; tb_state=3'b011;
			#10;
		tb_wr_en=0; tb_rd_en=1; tb_state=3'b011;
			#10
		//RD_ERROR
		tb_wr_en=1; tb_rd_en=0; tb_state=3'b100;
			#10;
		tb_wr_en=0; tb_rd_en=1; tb_state=3'b100;
			#10
		//NO_OP
		tb_wr_en=1; tb_rd_en=0; tb_state=3'b101;
			#10;
		tb_wr_en=0; tb_rd_en=1; tb_state=3'b101;
			#10
		//default
		tb_wr_en=0; tb_rd_en=0;
			#30 $stop;
		end
	
endmodule
