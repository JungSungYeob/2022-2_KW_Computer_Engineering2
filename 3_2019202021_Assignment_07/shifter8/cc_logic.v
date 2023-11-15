module cc_logic(op,shamt,d_in,d_out,d_next);
//set input output and reg
	input [2:0] op;
	input [1:0] shamt;
	input [7:0] d_in, d_out;
	output [7:0] d_next;
	reg [7:0] d_next;
	
	wire [7:0] d_lsl, d_lsr, d_asr;
	//set opcode 
	parameter NOP = 	3'b000;
	parameter LOAD = 	3'b001;
	parameter LSL = 	3'b010;
	parameter LSR = 	3'b011;
	parameter ASR = 	3'b100;
	//always op shamt d_in d_out d_lsl d_lsr d_asr
	always@(op,shamt,d_in,d_out,d_lsl,d_lsr,d_asr)
	begin
		case(op)//each case
		NOP :d_next<=d_out;
	   LOAD:d_next<=d_in;
      LSL :d_next<=d_lsl;
      LSR :d_next<=d_lsr;
      ASR :d_next<=d_asr;
		default: d_next<=8'bx;//else return NULL
		endcase
	end
	//get value
	LSL8 U0_LSL8(.d_in(d_out),.shamt(shamt),.d_out(d_lsl));
	LSR8 U1_LSR8(.d_in(d_out),.shamt(shamt),.d_out(d_lsr));
	ASR8 U2_ASR8(.d_in(d_out),.shamt(shamt),.d_out(d_asr));
	
endmodule
