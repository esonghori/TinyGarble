module modexp_test_2N_NN();


	parameter N 	= 8;
    parameter CC 	= 2*N*N;

	reg clk;
	reg rst1;
	reg rst2;

	reg 	[N-1:0]	m;

	reg 	[N-1:0]	e;
	reg 	[N-1:0]	d;
	reg 	[N-1:0]	n;

	wire 	[N-1:0]	c;
	reg 	[N-1:0]	creg;
	wire 	[N-1:0] mout;

	function [N-1:0] modexp_f;
		input [N-1:0] m;
		input [N-1:0] e;
		input [N-1:0] n;
		reg  [2*N-1:0] mm;
		integer i, start;
		begin
			$display("modexp_f: m =%d e =%d n=%d", m, e, n);
			start = -1;
			for(i=N-1;i>=0;i=i-1)
			begin
				if(e[i] && start == -1)
				begin
					start = i;
				end
			end
			
			modexp_f = m;
			$display("%d", modexp_f);
			for(i=start-1;i>=0;i=i-1)
			begin
				mm = modexp_f;
				mm = mm*mm;
				modexp_f = mm%n;
				$display("%d", modexp_f);
				if(e[i])
				begin
					mm = modexp_f;
					mm = mm * m;
					modexp_f = mm%n;
					$display("* %d", modexp_f);
				end
			end
		end
	endfunction



    modexp
	#(
		.N(N),
		.CC(CC)
	)
	UUT1
	(
		.clk(clk),
		.rst(rst1),
		.m(m),
		.e(e),
		.n(n),
		.c(c)
	);


    modexp
	#(
		.N(N),
		.CC(CC)
	)
	UUT2
	(
		.clk(clk),
		.rst(rst2),
		.m(creg),
		.e(d),
		.n(n),
		.c(mout)
	);


	integer i;
	
	initial
	begin
		m = 'd57;


		
		//e = 'd11;
		//e = 8'b1111_1111;
		//e = 8'b0011_1100;
		e = 8'b1000_0001;
		d = 'd35;
		n = 'd221;

		creg = 0;
		
		$display("m = %d", m);
		$display("e = %d", e);
		$display("d = %d", d);
		$display("n = %d", n);

		clk = 0;
		rst1 = 1;
		rst2 = 1;
		@(negedge clk);
		rst1 = 0;

		for(i=0;i<CC-1;i=i+1)
			@(negedge clk);
		$display("c = %d, modexp_f = %d", c, modexp_f(m,e,n));
		$display("------------");

		creg = c;

		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		rst1 = 1;
		rst2 = 0;


		for(i=0;i<CC-1;i=i+1)
			@(negedge clk);
		$display("mout = %d, modexp_f = %d", mout, modexp_f(creg,d,n));
		if(mout == m)
			$display("Correct!", mout);
		else
			$display("Error!", mout);
   		@(negedge clk);
   		rst2 = 1;
		$stop;
	end

 	always  #5  clk=~clk; 



endmodule

