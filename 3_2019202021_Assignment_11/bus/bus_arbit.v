module bus_arbit(clk, reset_n, m0_req, m1_req, grant);//bus_arbit module
//set input output
	input clk, reset_n;
	input m0_req, m1_req;
	output reg grant;
	//declare reg
	reg state;
	reg n_state;
	//set FSM state
	parameter m0_grant=1'b0;
	parameter m1_grant=1'b1;
	//rising edge of clk or falling edge of reset_n
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n==1'b0)//if reset_n==0 all reset
			state<=m0_grant;
		else
			state<=n_state; //goto next state
	end
	
	always@(m0_req or m1_req or state)
	begin
		case({m0_req,m1_req,state})//case of FSM next
			{1'b0,1'b0,m0_grant}: n_state<=m0_grant;
			{1'b1,1'b0,m0_grant}: n_state<=m0_grant;
			{1'b1,1'b1,m0_grant}: n_state<=m0_grant;
			{1'b0,1'b1,m0_grant}: n_state<=m1_grant;
			
			{1'b0,1'b0,m1_grant}: n_state<=m0_grant;
			{1'b1,1'b0,m1_grant}: n_state<=m0_grant;
			{1'b0,1'b1,m1_grant}: n_state<=m1_grant;
			{1'b1,1'b1,m1_grant}: n_state<=m1_grant;
			
			default : n_state <=1'b0;//else 
		endcase
	end
	//output for grant at each state
	always@(m0_req or m1_req or state)
	begin
		case(state)
			m0_grant: grant<=state;
			m1_grant: grant<=state;
			default: grant<=1'b0;
		endcase
	end
	
endmodule

			
	