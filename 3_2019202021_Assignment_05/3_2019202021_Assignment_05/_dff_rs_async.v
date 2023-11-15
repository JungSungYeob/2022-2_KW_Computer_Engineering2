module _dff_rs_async(clk, set_n, reset_n, d, q); //asynchronous reset/set d-flipflop
	//set input clk, set_n, reset_n, d and output q;
	input clk, set_n, reset_n, d;
	output q;
	//declare regiser q;
	reg q;
	//set clk rising edge or set_n, reset_n falling edge
	always@(posedge clk or negedge set_n or negedge reset_n)
	begin
		if(reset_n ==0) // if reset_n ==0, q<=0 schedule
			q<= 1'b0;
		else if(set_n==0) //if set_n ==0, q<=1 schedule
			q<=1'b1;
		else //else q<=d schedule
			q<=d; 
	end
	
endmodule
