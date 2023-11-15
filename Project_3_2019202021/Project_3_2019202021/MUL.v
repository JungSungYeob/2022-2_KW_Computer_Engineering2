module MUL(clk, reset_n,multiplier,multiplicand,op_start,op_clear,op_done,result);
//set input output
	input clk, reset_n;
	input [31:0]multiplier, multiplicand;
	input op_start, op_clear;
	
	output op_done;
	output reg [63:0]result;
	//declare reg and wire
	reg[1:0]state;
	reg[5:0]cnt;
	
	wire[1:0]n_state;
	wire[5:0]n_cnt;
	wire[63:0]n_result;
	//set state name 2bit
	parameter INIT = 2'b00;
	parameter CAL = 2'b01;
	parameter DONE = 2'b10;
	//rising edge at clk, falling edge reset_n
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n==0) 
			begin
				state<=2'b00; //goto INIT
				cnt<=6'b0; // reset count
				result<=64'h0;//reset result
			end
		else
			begin
				state<=n_state;//state goto next state
				cnt<=n_cnt;//count goto next count
				result<=n_result;//result goto next result
			end
	end
	//instance of multiplier_ns and multiplier_out
	multiplier_ns U0_multiplier_ns (.op_start(op_start), .op_clear(op_clear), .state(state), .cnt(cnt), .n_state(n_state));
	multiplier_out U1_multiplier_out(.clk(clk), .reset_n(reset_n), .multiplier(multiplier), .multiplicand(multiplicand), .state(state), .cnt(cnt), .result(result), .op_done(op_done),.n_cnt(n_cnt), .n_result(n_result));
	
	
endmodule

module multiplier_ns(op_start, op_clear, state,cnt, n_state);
//set input output
	input op_start, op_clear;
	input [1:0] state;
	input [5:0] cnt;
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
				else if(cnt==6'b011111)//if cnt==63 goto DONE
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

module multiplier_out (clk, reset_n, multiplier, multiplicand, state, cnt, result, op_done,n_cnt, n_result);
//set input output
	input clk, reset_n;
	input [31:0]multiplier, multiplicand;
	input [1:0]state;
	input [5:0]cnt;
	input [63:0]result;
	
	output reg op_done;
	output reg [5:0]n_cnt;
	output reg [63:0]n_result;
	//declare wire and reg
	wire[31:0] inv_mul;
	wire[31:0] result_add, result_sub;
	wire [1:0] en;
	reg [63:0] tmp;
	
	reg sign, n_sign;
	//set state 2bit
	parameter INIT = 2'b00;
	parameter CAL = 2'b01;
	parameter DONE = 2'b10;
	//when rising edge of clk or falling egde of reset_n
	always@(posedge clk or negedge reset_n)
	begin
		if(~reset_n)
			sign=0;
		else
			sign <= n_sign;
	end
	//prepare for calculate
	//if add
	cla32 U0_cla64(.a(result[63:32]),.b(multiplicand),.ci(1'b0),.s(result_add),.co());
	//if sub
	assign inv_mul=~multiplicand;
	cla32 U2_cla64(.a(result[63:32]),.b(inv_mul),.ci(1'b1),.s(result_sub),.co());
	
	assign en[1] = result[0];
	assign en[0] = sign;
	//output
	always@(multiplier,multiplicand,state,cnt,result,n_result,result_add, result_sub, sign)
	begin
		case(state)
			INIT://when INIT reset all of value
				begin
					op_done<=0;
					n_result[63:32]<=64'h00000000;
					n_result[31:0]<=multiplier;
					n_cnt <= 6'b000000;
					n_sign<=0;
					op_done<=0;
				end
			CAL:
				begin
					case(en)//x(i) and x(i-1)
						2'b00://shift only
							begin
								n_sign=result[0];
								n_result = {n_result[63],n_result[63:1]};
							end
						2'b01://add and shift
							begin
								n_result[63:32] = result_add;
								n_result[31:0] = result[31:0];
								n_sign=result[0];
								n_result = {n_result[63],n_result[63:1]};
							end
						2'b10://sub and shift
							begin
								n_result[63:32] = result_sub;
								n_result[31:0] = result[31:0];
								n_sign=result[0];
								n_result = {n_result[63],n_result[63:1]};
								
							end
						2'b11://shift only
							begin
								n_sign=result[0];
								n_result = {n_result[63],n_result[63:1]};
								
							end
						default:
							n_result <= 64'hx;
					endcase
					n_cnt<=cnt+1'b1;//cnt++
					op_done<=0;
				end
			DONE:
				begin
					op_done<=1;//set op_done flag
					n_result<=result;//result
					n_cnt<=cnt;//count
				end
				
			default://when error
				begin
					n_result<=64'hx;
					n_cnt<=5'bx;
					op_done=1'bx;
				end
		endcase
	end
endmodule
