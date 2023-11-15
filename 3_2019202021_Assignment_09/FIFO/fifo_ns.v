module fifo_ns(wr_en, rd_en, state, data_count, next_state); //fifo next state module
	//set input output
	input wr_en, rd_en;
	input [2:0]state;
	input [3:0] data_count;
	
	output [2:0] next_state;
	//set reg to use always@
	reg[2:0] next_state;
	
	//set states/ 
	parameter INIT=3'b000;
	parameter WRITE = 3'b001;
	parameter WR_ERROR = 3'b010;
	parameter READ = 3'b011;
	parameter RD_ERROR = 3'b100;
	parameter NO_OP = 3'b101;
	
	
	
	
	always@(wr_en or rd_en or state or data_count)
		begin
			case({state,wr_en,rd_en})
				{INIT, 1'b1, 1'b0}://when INIT state, wr_enable set
					next_state<=WRITE;
				{INIT, 1'b0, 1'b1}://when INIT state, rd_enable set
					next_state<=RD_ERROR;
					
				{WRITE, 1'b1, 1'b0}://when WRITE state, wr_enable set
					begin if(data_count===4'b1000) //if full
						next_state<=WR_ERROR;//write error
					else
						next_state<=WRITE; // write
					end
				{WRITE, 1'b0 ,1'b1}://when WRITE state, rd_enable set
					next_state<=READ;//go to read
					
				{WR_ERROR, 1'b1, 1'b0}://when WR_ERROR state, wr_enable set
					next_state<=WR_ERROR;//go to wr_error
				{WR_ERROR, 1'b0 ,1'b1}://when WR_ERROR_state rd_enable set
					next_state<=READ;//go to read
					
				{READ, 1'b1, 1'b0}://when READ state, wr_enable set
					next_state<=WRITE;//go to WRITE
				{READ, 1'b0, 1'b1}://when READ state, rd_enable set
					begin if(data_count==4'b0000)//if empty
						next_state<=RD_ERROR;//goto rd_error
					else
						next_state<=READ;//goto read;
					end
					
				{RD_ERROR, 1'b1, 1'b0}://when RD_ERROR state, wr_enable set
					next_state<=WRITE;//goto WRITE
				{RD_ERROR, 1'b0, 1'b1}://when RD_ERROR state, rd_enable set
					next_state<=RD_ERROR;//goto RD_ERROR
					
				{NO_OP, 1'b1, 1'b0}://when NO_OP, wr_enable set
					begin if(data_count==4'b1000)//if full
						next_state<=WR_ERROR;//goto WR_ERROR
					else
						next_state<=WRITE;//goto WRITE
					end
				{NO_OP, 1'b0, 1'b1}://When NO_OP rd_enable set
					begin if(data_count==4'b0000)//if empty
						next_state<=RD_ERROR;//goto RD_ERROR
					else
						next_state <= READ;//goto READ
					end
				default next_state<=NO_OP;//default = NO_OP
			endcase
		end
endmodule
