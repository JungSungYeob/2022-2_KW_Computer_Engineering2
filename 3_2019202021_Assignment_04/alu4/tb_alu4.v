`timescale 1ns/100ps

module tb_alu4;
//set clk, reset, 4bits tb_a, tb_b, result_expected, 3bits tb_op
	reg clk, reset;
	reg[3:0] tb_a,tb_b, result_expected;
	reg[2:0] tb_op;
	
	//set 4bits vectornum, error
	reg[3:0] vectornum, errors;
	//15bits testvectors (4+4+3+4)
	reg[14:0] testvectors[10000:0]; 
	//declare wire 4bits tb_result
	wire [3:0] tb_result;
	//declare c,n,z,v
	wire tb_c, tb_n, tb_z, tb_v;
	
	alu4 U0_alu4(.a(tb_a),.b(tb_b),.op(tb_op),.result(tb_result)
						,.c(tb_c),.n(tb_n),.z(tb_z),.v(tb_v));
	

	always
		begin
			clk =1;#5; clk=0;#5; //each 5clk
		end
		
		initial
			begin
				$readmemb("./../../tvalu4.tv",testvectors);//read tv file
				vectornum =0; errors =0;
				reset =1;#27 reset =0;
			end
			
	always @(posedge clk)
		begin
			#1;{tb_a, tb_b, tb_op, result_expected} =testvectors[vectornum];
		end
		
	always @(negedge clk)
		if (~reset) begin
			if(tb_result !==result_expected) begin
				$display("Error: inputs = %b, %b, %b",tb_a,tb_b,tb_op);
				$display("outputs = %b (%b expected)",tb_result,result_expected);
				
				errors = errors +1;
			end
	
		vectornum = vectornum+1;
		if(testvectors[vectornum]===15'bx) begin
			$display("%d tests completed with %d errors",vectornum,errors);
			$stop;
		end
	end
endmodule







