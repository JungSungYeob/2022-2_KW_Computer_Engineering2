module fifo(clk,reset_n, rd_en, wr_en, d_in, d_out, full, empty,
				wr_ack, wr_err, rd_ack, rd_err, data_count); //fifo module
	//set input output			
	input clk, reset_n, rd_en, wr_en;
	input [31:0] d_in;
		
	output [31:0]d_out;
	output full, empty, wr_ack, wr_err, rd_ack, rd_err;
	output [3:0] data_count;
	//set wire for submodule	
	wire [2:0]head, next_head, tail, next_tail;
	wire [2:0]state,next_state;
	wire [3:0]next_data_count;
	wire we, re;
	wire [31:0]mux_data, ff_data;
	//instance fifo_ns module
	fifo_ns U0_fifo_ns(.wr_en(wr_en),.rd_en(rd_en),.state(state),.data_count(data_count),.next_state(next_state));
	//instance fifo_cal_addr module	
	fifo_cal_addr U1_fifo_cal_addr(.state(next_state),.head(head),.tail(tail),.data_count(data_count),
													.we(we),.re(re),.next_head(next_head),.next_tail(next_tail),.next_data_count(next_data_count));
	//instance d-flipflop 3bit module and 4bit module	for state, head, tail, and data_count										
	_dff_3_r U2_dff_3_r(.clk(clk),.reset_n(reset_n),.d(next_state),.q(state));
	_dff_3_r U3_dff_3_r(.clk(clk),.reset_n(reset_n),.d(next_head),.q(head));
	_dff_3_r U4_dff_3_r(.clk(clk),.reset_n(reset_n),.d(next_tail),.q(tail));
	_dff_4_r U5_dff_4_r(.clk(clk),.reset_n(reset_n),.d(next_data_count),.q(data_count));
	//instance fifo_out module 	
	fifo_out U6_fifo_out(.state(state),.data_count(data_count),.full(full),.empty(empty),
									.wr_ack(wr_ack),.wr_err(wr_err),.rd_ack(rd_ack),.rd_err(rd_err));
	//instance Register_file module for mux_data
	Register_file U7_Register_file(.clk(clk),.reset_n(reset_n),.wAddr(tail),.wData(d_in),
												.we(we),.rAddr(head),.rData(mux_data));
	//instance mx2_32 module for ff_data
	mx2_32bits U8_mx2_32(.d0(32'h0),.d1(mux_data),.s(re),.y(ff_data));
	//instance dff_32_r for d_out
	_dff_32_r U9_dff_32_r(.clk(clk),.reset_n(reset_n),.d(ff_data),.q(d_out));
endmodule
	