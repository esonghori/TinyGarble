module modexp_1_N
#(
	parameter N 	= 8, //number of bits
	parameter CC	= N  //1 to N cc
)
(
  clk,
  rst,
  g_input, // {m}
  e_input, // {n, e}  
  o   // o = m^e mode n 
);

  input     clk;
  input     rst;
  input   [N-1:0]   g_input;
  input   [2*N-1:0] e_input;
  output [N-1:0]    o;

  wire  [N-1:0] e;
  wire  [N-1:0] n;

  assign e = e_input[N-1:0];
  assign n = e_input[2*N-1:N];


	reg 	init;
	reg 	first_one;
	reg 	[N-1:0]	ereg; 
	reg	 	[N-1:0]	creg; 

	wire 	[N-1:0] ein;
	
	wire 	[N-1:0] cin		[N/CC-1:0];
	wire 	[N-1:0] cout1	[N/CC-1:0];
	wire 	[N-1:0] cout2	[N/CC-1:0];


	wire keep_1	[N/CC-1:0];
	wire keep_2	[N/CC-1:0];
	
	genvar i;
	
	assign cin[0] = creg;
	assign ein = (init)?ereg:e;
	
	assign c = (ein[N-N/CC])?cout2[N/CC-1]:cout1[N/CC-1];
	
	generate 
	for(i=0;i<N/CC;i=i+1)
	begin:ASSKEEP1
		if(i > 0)
			assign keep_1[i] = (first_one | (|ein[N-1:N-i]));
		else
			assign keep_1[i] = first_one;
	end
	endgenerate
	
	generate 
	for(i=0;i<N/CC;i=i+1)
	begin:ASSKEEP2
		if(i > 0)
			assign keep_2[i] = (first_one | (|ein[N-1:N-i])) & ein[N-1-i];
		else
			assign keep_2[i] = first_one & ein[N-1-i];
	end
	endgenerate


	generate 
	if(CC>1)
	begin
		always@(posedge clk or posedge rst)
		begin
			if(rst)
			begin
				init <= 0;
				creg <= 0;
				ereg  <= 0;
				first_one <= 0;
			end
			else
			begin
				init <= 1;
				
				
				if(|ein[N-1:N-N/CC])
					first_one <= 1;
		
				if(keep_2[N/CC-1])
				begin
					creg <= cout2[N/CC-1];		
				end
				else if(keep_1[N/CC-1])
				begin
					creg <= cout1[N/CC-1];
				end
				else
				begin
					creg <= g_input;
				end
			
				ereg <= {ein[N-N/CC:0], {N/CC{1'b0}}};
			end
		end
	end
	else
	begin
		always@(*)
		begin
			init <= 1;
			creg <= g_input;
			ereg  <= e;	
			first_one <= 0;
		end
	end
	endgenerate

	
	generate 
	for(i=1;i<N/CC;i=i+1)
	begin:ASSCIN
		assign cin[i] = (keep_2[i-1])?cout2[i-1]:(keep_1[i-1])?cout1[i-1]:g_input;
	end
	endgenerate
	
	generate 
	for(i=0;i<N/CC;i=i+1)
	begin:MODMULT1
		modmult
		#(
			.N(N),
			.CC(1)
		)
		modmult_1
		(
			.clk(clk),
			.rst(rst),
			.start(1'b1),
			.x(cin[i]),
			.y(cin[i]),
			.n(n),
			.o(cout1[i])
		);
	end
	endgenerate

	generate 
	for(i=0;i<N/CC;i=i+1)
	begin:MODMULT2
		modmult
		#(
			.N(N),
			.CC(1)
		)
		modmult_2
		(
			.clk(clk),
			.rst(rst),
			.x(cout1[i]),
			.start(1'b1),
			.y(g_input),
			.n(n),
			.o(cout2[i])
		);
	end
	endgenerate
endmodule
