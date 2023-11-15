module rca4(a,b,ci,co,s);

	//set 4-bit input a,b
	input [3:0]a;
	input [3:0]b;
	//set input ci
	input ci;
	//set ouput co
	output co;
	//set 4-bit output s
	output [3:0]s;
	
	//set 3-bit wire c to use inside rca4 module
	wire [2:0]c;
	//make RCA structure chaining four Full_adder module from U0_fa ~ U3_fa
	//this have to chain from co to next Full_adder ci
	fa U0_fa (a[0],b[0],ci,c[0],s[0]);
	fa U1_fa (a[1],b[1],c[0],c[1],s[1]);
	fa U2_fa (a[2],b[2],c[1],c[2],s[2]);
	fa U3_fa (a[3],b[3],c[2],co,s[3]);

endmodule	
	