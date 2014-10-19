module modexp_2N_NN
#(
	parameter N 	= 8, //number of bits
	parameter CC	= 2*N*N  //2*N to 2*N*N
)
(
	clk,
	rst,
	m,
	e,
	n,
	c 	// c = m^e mode n 
);

	input			clk;
	input			rst;
	input 	[N-1:0]	m;
	input 	[N-1:0]	e;
	input 	[N-1:0]	n;

	output 	[N-1:0]	c;


	reg		init;
	reg 	first_one;
	reg		mul_pow;
	
	reg		[CC/(2*N)-1:0] start_reg;	
	reg 	[N-1:0]	ereg; 
	reg	 	[N-1:0]	creg; 
	
	wire	[CC/(2*N)-1:0] start_in;
	wire	[CC/(2*N)-1:0] start_in_shift;
	wire 	[N-1:0]	ein; 
	
	wire 	[N-1:0] y;	
	wire 	[N-1:0] x;
	wire 	[N-1:0] o;


	assign start_in = (init)?start_reg:1'b1;
	assign ein = (init)?ereg:e;
	assign c = (ein[N-1])?o:creg;


	generate
	if(CC/(2*N) > 1)
	begin
		assign start_in_shift = {start_in[CC/(2*N)-2:0] , start_in[CC/(2*N)-1]};
	end
	else
	begin
		assign start_in_shift = {start_in[CC/(2*N)-1]};
	end	
	endgenerate

	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			init <= 0;
			creg <= 0;
			ereg  <= 0;
			first_one <= 0;
			mul_pow <= 0;
			start_reg <= 0;
		end
		else
		begin
			init <= 1;
		
		
			start_reg <= start_in_shift;
		
		
			if(start_in[CC/(2*N)-1])
				mul_pow <= ~mul_pow;
		
			if(~init)
			begin
				ereg <= e;
				creg <= m;
			end
			else if(start_in[CC/(2*N)-1])
			begin
				if(ein[N-1] & mul_pow)
				begin
					first_one <= 1;
				end
		
				if(first_one & ein[N-1] & mul_pow)
				begin
					creg <= o;
				end
				else if(first_one & ~mul_pow)
				begin
					creg <= o;
				end
				
				if(mul_pow)
					ereg <= {ein[N-2:0], 1'b0};
			end
		end
	end


	assign x = (init)?creg:m;
	assign y = (mul_pow)?m:(init)?creg:m;


    modmult
	#(
		.N(N),
		.CC(CC/(2*N))
	)
	modmult_1
	(
		.clk(clk),
		.rst(rst),
		.start(start_in[0]),
		.x(x),
		.y(y),
		.n(n),
		.o(o)
	);

endmodule
