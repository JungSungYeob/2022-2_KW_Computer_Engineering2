`timescale 1ns/100ps
module tb_fifo_out();
	reg [2:0]tb_state;
	reg [3:0]tb_data_count;
	
	wire tb_full, tb_empty, tb_wr_ack, tb_wr_err, tb_rd_ack, tb_rd_err;
	
	fifo_out U0_fifo_out(.state(tb_state),.data_count(tb_data_count),.full(tb_full),.empty(tb_empty),.wr_ack(tb_wr_ack),.wr_err(tb_wr_err),.rd_ack(tb_rd_ack),.rd_err(tb_rd_err));
	
	initial
		begin
		//check full empty operation
			tb_state=3'b0; tb_data_count=4'b0;
				#10;
			tb_data_count =4'b1000;
				#10;
			tb_data_count= 4'b0;
			//check state
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
			tb_state=3'b011;
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
				