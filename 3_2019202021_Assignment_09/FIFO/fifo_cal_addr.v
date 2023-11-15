module fifo_cal_addr(state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);//fifo calculate address module
//set input output
	input [2:0]state, head, tail;
	input [3:0]data_count;
	
	output we, re;
	output [2:0]next_head, next_tail;
	output [3:0]next_data_count;
	//set reg for use always@
	reg we, re;
	reg [2:0]next_head, next_tail;
	reg [3:0]next_data_count;
	
	//set states/ 
	parameter INIT=3'b000;
	parameter WRITE = 3'b001;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b011;
	parameter RD_ERROR = 3'b100;
	parameter NO_OP = 3'b101;
	
	always@(state or data_count)
		begin
			case(state)//execute by case
				INIT://if INIT state, set all 0
					begin
						next_head		<=1'b0; 
						next_tail		<=1'b0;
						next_data_count<=1'b0;
						we 				<=1'b0;
						re 				<=1'b0;
					end
				WRITE: //if WRITE state, increase tail and data_count;
					begin
						next_head		<=head;
						next_tail		<=tail+3'b1;
						next_data_count<=data_count+4'b1;
						we 				<=1'b1;
						re 				<=1'b0;
					end
				WR_ERROR: //if WR_ERROR state, no change
					begin
						next_head		<=head;
						next_tail		<=tail;
						next_data_count<=data_count;
						we 				<=1'b0;
						re 				<=1'b0;
					end
				READ: //if READ state, increase head and decrease data_count
					begin
						next_head		<=head+3'b1;
						next_tail		<=tail;
						next_data_count<=data_count-4'b1;
						we 				<=1'b0;
						re 				<=1'b1;
					end
				RD_ERROR://if RD_ERROR state, no change
					begin
						next_head		<=head;
						next_tail		<=tail;
						next_data_count<=data_count;
						we 				<=1'b0;
						re 				<=1'b0;
					end
				NO_OP: //if NO_OP state, no change
					begin
						next_head		<=head;
						next_tail		<=tail;
						next_data_count<=data_count;
						we 				<=1'b0;
						re 				<=1'b0;
					end
				default://if nothing match
					begin
						next_head		<=3'bx;
						next_tail		<=3'bx;
						next_data_count<=4'bx;
						we 				<=1'bx;
						re 				<=1'bx;
					end
			endcase
		end
endmodule
