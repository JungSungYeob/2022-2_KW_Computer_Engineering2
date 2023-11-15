module multiplier_out (clk, reset_n, multiplier, multiplicand, state, cnt, result, op_done,n_cnt, n_result);
//set input output
	input clk, reset_n;
	input [63:0]multiplier, multiplicand;
	input [1:0]state;
	input [6:0]cnt;
	input [127:0]result;
	
	output reg op_done;
	output reg [6:0]n_cnt;
	output reg [127:0]n_result;
	//declare wire and reg
	wire[63:0] inv_mul;
	wire[63:0] result_add, result_sub;
	
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
	cla64 U0_cla64(.a(result[127:64]),.b(multiplicand),.ci(1'b0),.s(result_add),.co());
	//if sub
	assign inv_mul=~multiplicand;
	cla64 U2_cla64(.a(result[127:64]),.b(inv_mul),.ci(1'b1),.s(result_sub),.co());
	
	//output
	always@(multiplier,multiplicand,state,cnt,result,n_result,result_add, result_sub, sign)
	begin
		case(state)
			INIT://when INIT reset all of value
				begin
					op_done<=0;
					n_result[127:64]<=64'h0000000000000000;
					n_result[63:0]<=multiplier;
					n_cnt <= 7'b0000000;
					n_sign<=0;
					op_done<=0;
				end
			CAL:
				begin
					case({result[0],sign})//x(i) and x(i-1)
						2'b00://shift only
							begin
								n_sign=result[0];
								n_result = {n_result[127],n_result[127:1]};
							end
						2'b01://add and shift
							begin
								n_result[127:64] = result_add;
								n_result[63:0] = result[63:0];
								n_sign=result[0];
								n_result = {n_result[127],n_result[127:1]};
							end
						2'b10://sub and shift
							begin
								n_result[127:64] = result_sub;
								n_result[63:0] = result[63:0];
								n_sign=result[0];
								n_result = {n_result[127],n_result[127:1]};
							end
						2'b11://shift only
							begin
								n_sign=result[0];
								n_result = {n_result[127],n_result[127:1]};
							end
						default:
							n_result <= 128'hx;
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
					n_result<=128'hx;
					n_cnt<=6'bx;
					op_done=1'bx;
				end
		endcase
	end
endmodule
			
					
							
								
	