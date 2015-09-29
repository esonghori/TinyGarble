module sha3_test();

	reg clk;
	reg rst;

    reg		[575:0]		in;
    wire 	[1599:0]	out;

    parameter CC = 6;
	sha3_seq #(.CC(CC))UUT(clk, rst, in, out);

	integer i;
	initial
	begin
		clk = 0;
		rst = 1;
		in = 576'h933e63aa2ca8f246c9c9cb75fbff5e345c41b285030a19243bb6edac7b3e595f65a04004217e2f818b63a9a54294f96cd012e70c5f7f7e8f998b57997cf4ecddea49b42d459db0c1;
		@(negedge clk);
		rst = 0;
		for(i=0;i<CC;i=i+1)
			@(negedge clk);
        $display("out = %h", out);
   			@(negedge clk);
		$finish;
	end

 	always  #5  clk=~clk; 

endmodule

