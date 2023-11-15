module bus_addr(address, s0_sel, s1_sel);//bus_addr module
//set input output
	input [7:0]address;
	output reg s0_sel, s1_sel;
	//seperate by address 
	always@(address)
	begin
		if((address>=8'h00) && (address<8'h20))//0x00<addr<0x1F
			{s0_sel, s1_sel} = 2'b10;
		else if((address>=8'h20)&&(address<8'h40))//0x20<addr<0x3F
			{s0_sel, s1_sel} = 2'b01;
		else
			{s0_sel, s1_sel} = 2'b00;
	end
endmodule
