`timescale 1ns/100ps
module tb_fifo(); //fifo testbench module
   
	//set reg and wire
	reg  tb_clk,tb_reset_n, tb_rd_en, tb_wr_en;
   reg  [31:0] tb_d_in;
   wire [31:0] tb_d_out;
   wire tb_empty,tb_full,tb_wr_ack,tb_wr_err,tb_rd_ack,tb_rd_err;
   wire [3:0]tb_data_count;
	
	parameter STEP = 10; //set step 10
	
  //instance fifo to use testbench
   fifo U0_fifo(.clk(tb_clk),.reset_n(tb_reset_n),.rd_en(tb_rd_en),.wr_en(tb_wr_en),.d_in(tb_d_in),.d_out(tb_d_out),
.full(tb_full),.empty(tb_empty),.wr_ack(tb_wr_ack),.wr_err(tb_wr_err),.rd_ack(tb_rd_ack),.rd_err(tb_rd_err),.data_count(tb_data_count));

	//every half of STEP clk change
   always #(STEP/2) tb_clk = ~tb_clk;
   
   initial
      begin
      tb_clk = 0; tb_reset_n = 0; tb_rd_en = 0; tb_wr_en = 0; tb_d_in = 32'h00000000;		
			#12
		tb_reset_n = 1;
			#10
		//Write data (enqueue)
      tb_rd_en = 1;
			#10   
		tb_rd_en = 0; tb_wr_en = 1; tb_d_in = 32'h00000001;
			#10   
		tb_d_in = 32'h00000020;
			#10
		tb_d_in = 32'h00000300;
			#10
		tb_d_in = 32'h00004000;
			#10   
		tb_d_in = 32'h00050000;
			#10
		tb_d_in = 32'h00600000;
			#10
		tb_d_in = 32'h07000000;
			#10
		tb_d_in = 32'h80000000;
			#10
		tb_d_in = 32'hFFFFFFFF; //full of write enable
			#10
		
		//read date
      tb_wr_en = 0;
			#10
		tb_rd_en = 1;
			#40
		//Write data
      tb_rd_en = 0; tb_wr_en =1;
			#10;
		tb_d_in = 32'hCCCCCCCC;
			#10;
		//read data
      tb_wr_en = 0; tb_rd_en = 1;
			#20;
		//if all of Operation 0
		tb_rd_en = 0;
			#10;
		//read data
		tb_rd_en = 1;
			#50   $stop;
      end
endmodule
