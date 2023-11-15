module _dff_r_(clk, reset_n, d, q);//asynchronous d flipflop resettable
	input clk, reset_n, d;//set input clk, reset_n, d
	output q; //set output q;
	reg q; //declare reg q;
	
	//set clock rising edge or reset_n falling edge
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n==0)
			q<=1'b0; //nonblocking
		else
			q<=d;
	end
	
endmodule
