module BUS(clk, reset_n, M_req, M_wr, M_addr, M_dout, S0_dout, S1_dout, M_grant, M_din, S0_sel, S1_sel, S_addr, S_wr, S_din);
	input clk, reset_n;
	input M_req, M_wr;
	input [7:0]M_addr;
	input [31:0]M_dout;
	input [31:0]S0_dout;
	input [31:0]S1_dout;
	output M_grant;
	output [31:0]M_din;
	output S0_sel, S1_sel;
	output [7:0]S_addr;
	output S_wr;
	output [31:0]S_din;
	
	wire grant;
	
	reg[1:0] en;
	
	assign grant=M_req;
	assign M_grant=M_req;
	
	mux2 U0_mux2(.en(grant),.a(1'b0),.b(M_wr),.y(S_wr));
	mux2_8bit U1_mux2_8bit(.en(grant),.a(8'b0),.b(M_addr),.y(S_addr));
	mux2_32bit U2_mux2_32bit(.en(grant),.a(32'b0),.b(M_dout),.y(S_din));
	
	bus_addr U3_bus_addr(.address(S_addr),.s0_sel(S0_sel),.s1_sel(S1_sel));
	
	//d-flipflop for mux3 en
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n==1'b0)//if(reset_n==0)
			en<=2'b00;//all reset
		else
			begin
			en[1]<=S0_sel;
			en[0]<=S1_sel;
			end//else en<=slave0 & slave1
	end
	
	mux3_32bit U4_mux3_32bit(.en(en),.a(32'h0),.b(S1_dout),.c(S0_dout),.y(M_din));
	
endmodule
	
	
module bus_addr(address, s0_sel, s1_sel);//bus_addr module
//set input output
	input [7:0]address;
	output reg s0_sel, s1_sel;
	//seperate by address 
	always@(address)
	begin
		if((address>=8'h00) && (address<8'h20))//0x00<addr<0x1F
			{s0_sel, s1_sel} = 2'b10;
		else if((address>=8'h30)&&(address<8'h40))//0x20<addr<0x3F
			{s0_sel, s1_sel} = 2'b01;
		else
			{s0_sel, s1_sel} = 2'b00;
	end
endmodule
