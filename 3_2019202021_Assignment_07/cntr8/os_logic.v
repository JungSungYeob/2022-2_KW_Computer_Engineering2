module os_logic(state,d_in,d_out);
//set input output
	input [2:0] state;
	input [7:0] d_in;
	output [7:0] d_out;
	//declare wire reg
	wire [7:0] d_inc, d_dec;
	reg [7:0] d_out;
	//set opcode
	parameter IDLE_STATE = 3'b000;
	parameter LOAD_STATE = 3'b001;
	parameter INC_STATE = 3'b010;
	parameter INC2_STATE = 3'b011;
	parameter DEC_STATE = 3'b100;
	parameter DEC2_STATE = 3'b101;
	//always state
	always@(state)
	begin
		case(state)//eachcase
		//nonblocking
			IDLE_STATE: 
				d_out <= 8'b0000_0000;
			LOAD_STATE: 
				d_out <=d_in;
			INC_STATE:
				d_out <= d_inc;
	      INC2_STATE:
				d_out <=d_inc;
	      DEC_STATE :
				d_out <= d_dec;
         DEC2_STATE:
				d_out <= d_dec;
				
			default:
				d_out <=8'bx;
		endcase
	end
	
	//get value
	cla8 U0_inc(.a(d_out),.b(8'b0000_0001),.ci(1'b0),.s(d_inc),.co());
	cla8 U1_inc(.a(d_out),.b(8'b1111_1110),.ci(1'b1),.s(d_dec),.co());
	
endmodule
