module _dff_3_r(clk,reset_n,d,q); // 3bit d-flipflop for state, head, tail
//set input output
	input clk,reset_n;
	input [2:0] d;
	output [2:0] q;
	//set reg for use always@
	reg [2:0] q;

	//asynchronous rising edge of clk, or falling edge reset_n
	always@(posedge clk or negedge reset_n)
		begin
				if(reset_n==1'b0)//if reset_n(negative) is unset
					q<=3'b0;//reset
				else
					q<=d;//q = d;
		end
		
endmodule
	
	 
	 
module _dff_4_r(clk,reset_n,d,q);//4bit d-flipflop for data_count
//set input output
	input clk,reset_n;
	input [3:0] d;
	output [3:0] q;
	//set reg for use always@
	reg [3:0] q;

	//asynchronous rising edge of clk, or falling edge of reset_n
	always@(posedge clk or negedge reset_n)
		begin
				if(reset_n==1'b0)//if reset_n(negative) is unset
					q<=4'b0;//reset
				else	
					q<=d;//q = d;
		end
	
endmodule
	
	

module _dff_32_r(clk,reset_n,d,q);//32bit flipflop for d_out
//set input output
	input clk,reset_n;
	input [31:0] d;
	output [31:0] q;
	//set reg for use always@
	reg [31:0] q;

	//async nege reset or pose clk
	always@(posedge clk or negedge reset_n)
		begin
				if(reset_n==1'b0)//if reset_n(negative)is unset
					q<=32'b0;//reset
				else	
					q<=d;// q= d;
		end
	
endmodule
	