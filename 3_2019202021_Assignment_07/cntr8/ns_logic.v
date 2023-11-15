module ns_logic(load, inc,state,next_state);
//set input output
	input load,inc;
	input[2:0] state;
	output [2:0] next_state;
	reg [2:0] next_state;
	//set opcode
	parameter IDLE_STATE = 3'b000;
	parameter LOAD_STATE = 3'b001;
	parameter INC_STATE = 3'b010;
	parameter INC2_STATE = 3'b011;
	parameter DEC_STATE = 3'b100;
	parameter DEC2_STATE = 3'b101;
	//always load inc state
	always@(load,inc,state)
	begin
		case(state) // each case 
		//link state by FSM
		IDLE_STATE:
			begin
				if(load==1'b1)
					next_state <= LOAD_STATE;
				else if(inc ==1'b1)
					next_state <= INC_STATE;
				else if(inc== 1'b0)
					next_state <= DEC_STATE;
				else
					next_state <= 3'bx;
			end
		
		LOAD_STATE:
			begin
				if(load==1'b1)
					next_state <= LOAD_STATE;
				else if(inc ==1'b1)
					next_state <= INC_STATE;
				else if(inc== 1'b0)
					next_state <= DEC_STATE;
				else
					next_state <= 3'bx;
			end
		
		INC_STATE:
			begin
				if(load==1'b1)
					next_state <= LOAD_STATE;
				else if(inc ==1'b1)
					next_state <= INC2_STATE;
				else if(inc== 1'b0)
					next_state <= DEC_STATE;
				else
					next_state <= 3'bx;
			end
			
		INC2_STATE:
			begin
				if(load==1'b1)
					next_state <= LOAD_STATE;
				else if(inc ==1'b1)
					next_state <= INC_STATE;
				else if(inc== 1'b0)
					next_state <= DEC_STATE;
				else
					next_state <= 3'bx;
			end
			
		DEC_STATE:
			begin
				if(load==1'b1)
					next_state <= LOAD_STATE;
				else if(inc ==1'b1)
					next_state <= INC_STATE;
				else if(inc== 1'b0)
					next_state <= DEC2_STATE;
				else
					next_state <= 3'bx;
			end
		
		DEC2_STATE:
			begin
				if(load==1'b1)
					next_state <= LOAD_STATE;
				else if(inc ==1'b1)
					next_state <= INC_STATE;
				else if(inc== 1'b0)
					next_state <= DEC_STATE;
				else
					next_state <= 3'bx;
			end
		
		default:
			next_state <=3'bx;
		endcase
	end
	
endmodule

			