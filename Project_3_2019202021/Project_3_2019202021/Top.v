module Top(clk, reset_n, M_req, M_wr, M_addr, M_dout,M_grant, M_din);
	input clk, reset_n;
	input M_req, M_wr;
	input [7:0] M_addr;
	input [31:0] M_dout;
	output M_grant;
	output [31:0] M_din;
	
	wire S_wr, S0_sel,S1_sel;
	wire [7:0] S_addr;
	wire [31:0] S0_dout, S1_dout;
	wire [31:0] S_din;
	
	
	
	BUS U0_BUS(.clk(clk),.reset_n(reset_n),.M_req(M_req),.M_wr(M_wr),.M_addr(M_addr),.M_dout(M_dout),.S0_dout(S0_dout),.S1_dout(S1_dout)
				,.M_grant(M_grant),.M_din(M_din),.S0_sel(S0_sel),.S1_sel(S1_sel),.S_addr(S_addr), .S_wr(S_wr), .S_din(S_din));
	
	ALUwMUL U2_ALUwMUL(.clk(clk),.reset_n(reset_n),.S_sel(S1_sel),.S_wr(S_wr),.S_addr(S_addr),.S_din(S_din),.S_dout(S1_dout));
				
	ram U1_ram(.clk(clk),.cen(S0_sel),.wen(S_wr),.S_addr(S_addr),.S_din(S_din),.S_dout(S0_dout));
	
	endmodule
	