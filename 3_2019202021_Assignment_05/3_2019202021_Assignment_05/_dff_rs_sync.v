module _dff_rs_sync(clk, set_n, reset_n, d, q); //synchronous reset/set d-flipflop
	//set input clk, set_n, reset_n , d
	input clk, set_n, reset_n, d;
	//set output q
	output q;
	//declare reg q;
	reg q;
	
	
	//set clock at rising edege
	always@(posedge clk)
	begin
		if(reset_n==0) // if reset_n==0, q<=0 schedule
			q<=1'b0;
		else if(set_n==0) // if set_n==0, q<=1 schedule
			q<=1'b1;
		else //else, q<=d schedule
			q<=d;
	end
	
endmodule
