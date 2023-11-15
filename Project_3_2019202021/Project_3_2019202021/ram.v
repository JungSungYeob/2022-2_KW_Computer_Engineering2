module ram(clk,cen,wen,S_addr,S_din,S_dout);
//set input and output
	input clk;
	input cen, wen;
	input [4:0] S_addr;
	input [31:0] S_din;
	output reg [31:0] S_dout;
	//declare mem
	reg[31:0] mem [0:31];
	//set integer i to use memory initialization
	integer i;
	
	initial
	begin
	//memory initialization
	for(i=0;i<32;i=i+1)
		begin
			mem[i][31:0]=0;//set mem[i]=i;
		end
	end
	
	always@(posedge clk)
	begin
	//read/write performance
		if(cen==1'b0)//if cen==0 dout<=32'b0
			S_dout<=32'b0;
		else if(cen==1'b1&&wen==1'b0)//if only cen ==1 read memory
			S_dout<=mem[S_addr];
		else if(cen==1'b1&&wen==1'b1)//if both cen and wen ==1 write memory
			begin
				S_dout<=32'b0;
				mem[S_addr]<=S_din;
			end
	end
	
endmodule
