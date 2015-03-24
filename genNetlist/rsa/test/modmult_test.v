module modmult_test();


	parameter N 	= 8;
    parameter CC 	= N;

	reg 			clk;
	reg 			rst;
	reg 			start;
	reg 	[N-1:0]	x;
	reg 	[N-1:0]	y;
	reg 	[N-1:0]	n;

	wire 	[N-1:0]	o;

    modmult
	#(
		.N(N),
		.CC(CC)
	)
	UUT
	(
		.clk(clk),
		.rst(rst),
		.start(start),
		.x(x),
		.y(y),
		.n(n),
		.o(o)
	);

	integer i;
	wire 	[2*N-1:0] 	xy;
	assign xy = x*y;
	
	initial
	begin
		x = 'd45;
		y = 'd37;
		n = 'd107;
		clk = 0;
		rst = 0;
		start = 0;
		#1;
		rst = 1;
		#1;
		@(negedge clk);
		start = 1;
		rst = 0;
		@(negedge clk);
		start = 0;
		for(i=0;i<CC-2;i=i+1)
			@(negedge clk);
		if(o == (xy)%n)
			$display("(%d*%d) mod %d == %d\n Correct!\n", x, y, n, o);
		else
			$display("(%d*%d) mod %d == %d != %d\n Error!\n", x, y, n, o, (xy)%n);
   		@(negedge clk);
		$stop;
	end

 	always  #5  clk=~clk; 

endmodule

