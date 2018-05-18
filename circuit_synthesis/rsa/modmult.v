module modmult
#(
	parameter N 	= 8, //number of bits
	parameter CC	= N  //number of clock cycle 
)
(
	clk,
	rst,
	start,
	x,
	y,
	n,
	o 	// o = x*y mode n
);

	input			clk;
	input			rst;
	input 			start;
	input 	[N-1:0]	x;
	input 	[N-1:0]	y;
	input 	[N-1:0]	n;

	output 	[N-1:0]	o;

	reg 	[N-1:0]	xreg;


	wire 	[N-1:0]	xin;
	reg 	[N+1:0]	zreg;
	wire 	[N+1:0]	zin[N/CC-1:0];
	wire 	[N+1:0]	zout[N/CC-1:0];


	assign o = zout[N/CC-1][N-1:0];

	/*MUX 
	#(
		.N(N+2)
	)
	MUX_1
	(
		.A({(N+2){1'b0}}),
		.B(zreg),
		.S(start),
		.O(zin[0])
	);
	
	MUX 
	#(
		.N(N)
	)
	MUX_2
	(
		.A(x),
		.B(xreg),
		.S(start),
		.O(xin)
	);*/


	//assign zin[0] 	= (start)?0:zreg;
	//assign xin 		= (start)?x:xreg;

	assign zin[0] 	= zreg;
	assign xin 		= xreg;


	genvar g;

	generate
	for(g=1;g<N/CC;g=g+1)
	begin:ASSZIN
		assign zin[g] = zout[g-1];
	end
	endgenerate

	generate
	for(g=0;g<N/CC;g=g+1)
	begin:MODMULT_STEP
		modmult_step 
		#(
			.N(N)
		)
		modmult_step_
		(
			.xregN_1(xin[N-1-g]),
			.y(y),
			.n(n),
			.zin(zin[g]),
			.zout(zout[g])
		);
	end
	endgenerate

	generate
	if(CC>1)
		always@(posedge clk or posedge rst)
		begin
			if(rst)
			begin
				zreg <= 0;
				xreg <= 0;
			end
			else if(start)
			begin
				zreg <= 0;
				xreg <= x;
			end
			else
			begin
				zreg <= zout[N/CC-1];
				xreg <= {xin[N-1-N/CC:0], {N/CC{1'b0}}};
			end
		end
	else
		always@(*)
		begin
			zreg <= 0;
			xreg <= x;	
		end
	endgenerate

endmodule


module modmult_step
#(
	parameter N 	= 4 //number of bits
)
(
	xregN_1,
	y,
	n,
	zin,
	zout
);
	input 	xregN_1; //last bit of X
	input 	[N-1:0]	y;
	input 	[N-1:0]	n;
	
	input 			[N+1:0]	zin;
	output /*reg*/ 	[N+1:0]	zout;

/*
	reg 	[N+1:0]	z1;
	reg 	[N+1:0]	z2;
	reg 	[N+1:0]	z3; 
*/

	wire 	[N+1:0]	y_ext;
	wire 	[N+1:0]	n_ext;

	wire 	[N+1:0]	z1, z2, z3;
	wire 	[N+1:0]	w1, w2, w3;


	wire c1, c2, c2p;


	assign y_ext = {2'b0, y};
	assign n_ext = {2'b0, n};



	assign z1 = {zin[N:0], 1'b0};



	//assign w1 = (xregN_1)?y_ext:{(N+1){1'b0}};
	//assign w2 = (c1)?n_ext:{(N+1){1'b0}};
	//assign w3 = (c2p)?n_ext:{(N+1){1'b0}}
	

	MUX 
	#(
		.N(N+2)
	)
	MUX_1
	(
		.A(y_ext),
		.B({(N+2){1'b0}}),
		.S(xregN_1),
		.O(w1)
	);	

	MUX 
	#(
		.N(N+2)
	)
	MUX_2
	(
		.A(n_ext),
		.B({(N+2){1'b0}}),
		.S(c1),
		.O(w2)
	);	


	MUX 
	#(
		.N(N+2)
	)
	MUX_3
	(
		.A(n_ext),
		.B({(N+2){1'b0}}),
		.S(c2p),
		.O(w3)
	);	




	ADD 
	#(
		.N(N+2)
	)
	ADD_1
	(
		.A(z1),
		.B(w1),
		.CI(1'b0),
		.S(z2),
		.CO()
	);
	
	
	COMP
	#(
		.N(N+2)
	)
	COMP_1
	(
		.A(z2),
		.B(n_ext), 
		.O(c1)
	);

	SUB 
	#(
		.N(N+2)
	)
	SUB_1
	(
		.A(z2),
		.B(w2),
		.S(z3),
		.CO()
	);

	COMP
	#(
		.N(N+2)
	)
	COMP_2
	(
		.A(n_ext),
		.B(z3), 
		.O(c2)
	);

	assign c2p = ~c2;

	SUB 
	#(
		.N(N+2)
	)
	SUB_2
	(
		.A(z3),
		.B(w3),
		.S(zout),
		.CO()
	);


/*	always@(*)
	begin
		z1 = {zin[N:0], 1'b0};  // zin = 2*zin + x[i]*y
		if(xregN_1)
			z2 = z1 + y;
		else
			z2 = z1;

		if(z2 > n) 
			z3 = z2 - n;
		else
			z3 = z2;

		if(z3 >= n) 
			zout = z3 - n;
		else 
			zout = z3;
	end
*/

endmodule

