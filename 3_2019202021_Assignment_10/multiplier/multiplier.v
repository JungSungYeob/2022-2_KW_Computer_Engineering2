module multiplier(clk, reset_n,multiplier,multiplicand,op_start,op_clear,op_done,result);
//set input output
	input clk, reset_n;
	input [63:0]multiplier, multiplicand;
	input op_start, op_clear;
	
	output op_done;
	output reg [127:0]result;
	//declare reg and wire
	reg[1:0]state;
	reg[6:0]cnt;
	
	wire[1:0]n_state;
	wire[6:0]n_cnt;
	wire[127:0]n_result;
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
				cnt<=7'b0; // reset count
				result<=128'h0;//reset result
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
