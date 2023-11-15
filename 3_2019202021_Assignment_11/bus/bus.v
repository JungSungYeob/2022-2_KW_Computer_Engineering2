module bus(clk, reset_n, m0_req, m0_wr, m0_address, m0_dout, m1_req, m1_wr, m1_address, m1_dout, s0_dout, s1_dout, m0_grant, m1_grant,
				m_din, s0_sel, s1_sel, s_address, s_wr, s_din);//bus module
	//set input output 
	input clk, reset_n;
	input m0_req, m0_wr;
	input [7:0]m0_address;
	input [31:0]m0_dout;
	input m1_req, m1_wr;
	input [7:0]m1_address;
	input [31:0]m1_dout;
	input [31:0]s0_dout, s1_dout;
	output m0_grant, m1_grant;
	output [31:0]m_din;
	output s0_sel, s1_sel;
	output [7:0]s_address;
	output s_wr;
	output [31:0]s_din;
	//declare wire
	wire grant;
	//declare reg 2bit en for get mux3 en
	reg [1:0] en;
	//instance of bus_arbit for FSM
	bus_arbit U0_arbit(.clk(clk),.reset_n(reset_n),.m0_req(m0_req),.m1_req(m1_req),.grant(grant));
	//assign m0_grant and m1_grant
	assign m0_grant=(grant==1'b0)?1'b1:1'b0;
	assign m1_grant=(grant==1'b1)?1'b1:1'b0;
	
	//instance of mux2 and mux2_8bit and mux2_32bit
	mux2 U1_mux2(.en(grant),.a(m0_wr),.b(m1_wr),.y(s_wr));
	mux2_8bit U2_mux2_8bit(.en(grant),.a(m0_address),.b(m1_address),.y(s_address));
	mux2_32bit U3_mux2_32bit(.en(grant),.a(m0_dout),.b(m1_dout),.y(s_din));
	
	//instance of bus_addr to get slave location
	bus_addr U4_bus_addr(.address(s_address),.s0_sel(s0_sel),.s1_sel(s1_sel));
	//d-flipflop for mux3 en
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n==1'b0)//if(reset_n==0)
			en<=2'b00;//all reset
		else
			en<={s0_sel,s1_sel};//else en<=slave0 & slave1
	end
//instance of mux3_32bit 
	mux3_32bit U5_mux3_32bit(.en(en),.a(32'h0),.b(s1_dout),.c(s0_dout),.y(m_din));
	
endmodule
