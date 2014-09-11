`timescale 1ns / 1ps

module matrixMultSeqTest();

	parameter N=3;
	parameter M=32;
	reg clk, rst;
	
	reg[M*N*N-1:0] x;
	reg[M*N*N-1:0] y;
	wire[M*N*N-1:0] o;


	matrixMultSeq UTT
	#(
	.N(N),
	.M(M)
	)
	(
		.clk(clk),
		.rst(rst),
		.x(x),
		.y(y),
		.o(o)
	);

	initial
	begin
		clk=0;
		rst=1;
		x = $random;
		y = $random;
		@(negedge clk);
		@(negedge clk);
		rst=0;
		for(i=0;i<N*N;i=i+1)
			@(negedge clk);
		$stop;
	end

	always #5 clk = !clk;
endmodule

