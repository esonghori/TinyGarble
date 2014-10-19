module modmult
#(
	parameter N 	= 8, //number of bits
	parameter CC	= N/2  //number of clock cycle 
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

	assign zin[0] 	= (start)?0:zreg;
	assign xin 		= (start)?x:xreg;


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
	
	input 		[N+1:0]	zin;
	output reg 	[N+1:0]	zout;

	reg 	[N+1:0]	z1;
	reg 	[N+1:0]	z2;
	reg 	[N+1:0]	z3; 

	always@(*)
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

endmodule
