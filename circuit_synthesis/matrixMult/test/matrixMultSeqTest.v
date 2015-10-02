`timescale 1ns / 1ps

module matrixMultSeqTest();

	parameter N=3;
	parameter M=32;
	reg clk, rst;
	
	reg[M*N*N-1:0] x;
	reg[M*N*N-1:0] y;
	wire[M*N*N-1:0] o;


	matrixMultSeq 
	#(
	.N(N),
	.M(M)
	)
	UTT
	(
		.clk(clk),
		.x(x),
		.y(y),
		.o(o)
	);

  integer i;
	initial
	begin
		clk=0;
	  x = {N*N*M/32{$random}};
	  y = {N*N*M/32{$random}};
		for(i=0;i<N*N*N;i=i+1)
			@(negedge clk);
		$stop;
	end

  initial 
    $monitor($time,"o = %x",o); 

	always #5 clk = !clk;
endmodule

