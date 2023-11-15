module ALUwMUL(clk,reset_n,S_sel,S_wr,S_addr,S_din,S_dout);
input clk, reset_n;
	input S_sel, S_wr;
	input [7:0]S_addr;
	input [31:0]S_din;
	output[31:0]S_dout;
	
	reg [31:0] operandA, operandB, opcode, opstart, opclear;
	wire [31:0]result1, result2;
	wire [63:0]re;
	reg[2:0] state;
	wire [31:0] opdone;
	/*
	CAL U0_cal(clk, reset_n, opcode, opstart,opclear,operandA,operandB,re,opdone); //cal done
	assign S_dout = re[31:0];
	
	parameter IDLE = 3'b000;
	parameter LOAD = 3'b001;
	parameter CALC = 3'b010;
	parameter SAVE = 3'b011;
	parameter END = 3'b100;
	
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 1'b0)
		begin
			state<=3'b0;
			opcode<=32'b0;
			opstart<=32'b0;
			opclear<=32'b0;
			operandA<=32'b0;
			operandB<=32'b0;
		
		end
		
		//read
		else if(S_wr==1'b0&&S_sel==1'b1)
		begin
			case(S_addr)
			
			8'h0: operandA<=S_din;
			8'h1: operandB<=S_dout;
			endcase
		end
		
		else if(opstart[0]==1'b1&&state IDLE)
		begin
			state<=LOAD;
		end
		
		else if(opstart[0]==1'b1)
		begin
			case(state)
			IDLE: state<=IDLE;
			
			LOAD:
			begin
				opclear <= 1'b0;
				opstart <=	1'b1;
				state <= CALC;
			end
			CALC:
			begin
				if(opcode==32'hD)
				begin
					if(opdone=32'b11)
						state<=SAVE;
					else
						state<=CALC
				end
				
				state<=SAVE;
			end
			
			SAVE:
				opstart<=32'b0;
				
				
						
			
			
			
		
		end
	
	end
	
	*/
endmodule
