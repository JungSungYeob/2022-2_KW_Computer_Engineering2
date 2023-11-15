module ram(clk,cen,wen,addr,din,dout);
//set input and output
	input clk;
	input cen, wen;
	input [4:0] addr;
	input [31:0] din;
	output reg [31:0] dout;
	//declare mem
	reg[31:0] mem [0:31];
	//set integer i to use memory initialization
	integer i;
	
	initial
	begin
	//memory initialization
	for(i=0;i<32'b0;i=i+1)
		begin
			mem[i]=i;//set mem[i]=i;
		end
	end
	
	always@(posedge clk)
	begin
	//read/write performance
		if(cen==1'b0)//if cen==0 dout<=32'b0
			dout<=32'b0;
		else if(cen==1'b1&&wen==1'b0)//if only cen ==1 read memory
			dout<=mem[addr];
		else if(cen==1'b1&&wen==1'b1)//if both cen and wen ==1 write memory
			begin
				dout<=32'b0;
				mem[addr]<=din;
			end
	end
	
endmodule
