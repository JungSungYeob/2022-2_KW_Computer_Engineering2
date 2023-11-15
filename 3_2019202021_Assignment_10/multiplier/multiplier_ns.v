module multiplier_ns(op_start, op_clear, state,cnt, n_state);
//set input output
	input op_start, op_clear;
	input [1:0] state;
	input [6:0] cnt;
	output reg [1:0] n_state;
	//set state 2bit
	parameter INIT = 2'b00;
	parameter CAL =2'b01;
	parameter DONE = 2'b10;
	
	always@(op_start, op_clear, state, cnt)
	begin
		case(state)//compare state
			INIT://when INIT state
				if(op_clear==1)//if clear goto INIT
					n_state <= INIT;
				else if(op_start==1)//if op_clear==0 and op_start set goto CAL
					n_state<=CAL;
				else
					n_state <=INIT;//else goto INIT
			
			CAL://when CAL state
				if(op_clear==1)//if clear goto INIT
					n_state <= INIT;
				else if(cnt==7'b0111111)//if cnt==63 goto DONE
					n_state <=DONE;
				else//else return to cal
					n_state <=CAL;
			DONE://when DONE state
				if(op_clear==1)//if clear goto INIT
					n_state <= INIT;
				else//else return to DONE
					n_state <=DONE;
			default:
				n_state <=2'bx;//else
		endcase
	end
endmodule
