`timescale 1ns / 1ps
// synopsys template
module sum
#(
	parameter N=8,
	parameter CC=1
)
( 
	clk,
	rst,
	a,
	b,
	c
);
	input clk, rst;
	input  [N/CC-1:0] a;
	input  [N/CC-1:0] b;
	output [N/CC-1:0] c;
	

	reg carry_on; 
	wire carry_on_d;


	generate
	if(CC>1)
	begin
		always@(posedge clk or posedge rst)
		begin
			if(rst)
				carry_on <= 0;
			else
				carry_on <= carry_on_d;
		end
	end
	endgenerate

	generate
	if(CC>1)
	begin
		//assign {carry_on_d, c} = a + b + carry_on;
		ADD 
		#(
			.N(N/CC)
		)
		ADD_
		(
			.a(a),
			.b(b),
			.ci(carry_on),
			.s(c),
			.co(carry_on_d)
		);
	end
	else
	begin
		//assign c = a + b;
		ADD 
		#(
			.N(N/CC)
		)
		ADD_
		(
			.a(a),
			.b(b),
			.ci(1'b0),
			.s(c),
			.co()
		);
	end
	endgenerate
endmodule


module ADD
#(
	parameter N=8
)
(
	a,
	b,
	ci,
	s, 
	co
);

	input [N-1:0] a;
	input [N-1:0] b;
	input ci;
	output co;
	output [N-1:0] s;

	wire c[N:0];

	assign c[0] = ci;
	assign co = c[N];
	
	genvar g;
	
	generate
	for(g=0;g<N;g=g+1)
	begin:FAINST
		FA
		FA_
		(
			.a(a[g]), 
			.b(b[g]), 
			.ci(c[g]), 
			.s(s[g]), 
			.co(c[g+1])
		);
	end
	endgenerate

endmodule


module FA
( 
	a,
	b,
	ci,
	s,
	co
);

	input a;
	input b;
	input ci;
	output co;
	output s;

	wire n1, n2, n3;
	
	
	XOR U1 ( .A(a), .B(ci), .Z(n1) );
	XOR U2 ( .A(b), .B(ci), .Z(n2) );
	AND U3 ( .A(n1), .B(n2), .Z(n3) );
	XOR U4 ( .A(n1), .B(b), .Z(s) );
	XOR U5 ( .A(n3), .B(ci), .Z(co) );
	
	//assign n1 = a^ci;
	//assign n2 = b^ci;
	//assign n3 = n1&n2;
	//assign s  = n1^b;
	//assign co = n3^ci;
	
	
endmodule
