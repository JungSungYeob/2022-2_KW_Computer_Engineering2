module fifo_out(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);//fifo output module
//set input output
	input [2:0]state;
	input [3:0]data_count;
	
	output full, empty, wr_ack, wr_err, rd_ack, rd_err;
	//set reg to use always@
	reg full, empty, wr_ack, wr_err, rd_ack, rd_err;
	
	//set states/ 
	parameter INIT=3'b000;
	parameter WRITE = 3'b001;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b011;
	parameter RD_ERROR = 3'b100;
	parameter NO_OP = 3'b101;
	
	always@(state or data_count)
		begin
			if(data_count==4'b0)//if empty
				begin
					full<=1'b0;
					empty<=1'b1;//set empty
				end
			else if(data_count==4'b1000)//if full
				begin
					full<=1'b1;//set full
					empty<=1'b0;
				end
			else//if nothing
				begin
					full<=1'b0;
					empty<=1'b0;
				end
		end
	
	always@(state or data_count)
		begin 
			case(state)
				INIT://if INIT state, nothing change
					begin
						wr_ack<=1'b0;
						wr_err<=1'b0;
						rd_ack<=1'b0;
						rd_err<=1'b0;
					end
				WRITE: //if WRITE state, set wr_ack
					begin
						wr_ack<=1'b1;
						wr_err<=1'b0;
						rd_ack<=1'b0;
						rd_err<=1'b0;
					end
				WR_ERROR://if WR_ERROR state, set wr_err 
					begin
						wr_ack<=1'b0;
						wr_err<=1'b1;
						rd_ack<=1'b0;
						rd_err<=1'b0;
					end
				READ://if READ state, set rd_ack
					begin
						wr_ack<=1'b0;
						wr_err<=1'b0;
						rd_ack<=1'b1;
						rd_err<=1'b0;
					end
				RD_ERROR://if RD_ERROR state, set rd_err
					begin
						wr_ack<=1'b0;
						wr_err<=1'b0;
						rd_ack<=1'b0;
						rd_err<=1'b1;
					end
				NO_OP://if NO_OP state, nothing change
					begin
						wr_ack<=1'b0;
						wr_err<=1'b0;
						rd_ack<=1'b0;
						rd_err<=1'b0;
					end
				default://if nothing match, set all dump
					begin
						wr_ack<=1'bx;
						wr_err<=1'bx;
						rd_ack<=1'bx;
						rd_err<=1'bx;
					end
			endcase
		end
endmodule
