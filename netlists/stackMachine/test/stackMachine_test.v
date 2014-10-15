`timescale 1ns / 1ps


module stackMachine_test();


	parameter N=8;
	parameter S=8;

	reg clk, rst;

	reg [N-1:0] x;
	reg [2:0] opcode;

	wire [N-1:0] o;



	stackMachine #(
	.N(N),
	.S(S)
	)
	UUT
	(
		.clk(clk),
		.rst(rst),
		.x(x),
		.opcode(opcode),
		.o(o)
	);

	//compute 2+4*5+6
	initial
	begin
		clk = 0;
		rst = 1;
		x = 0;
		opcode = 0;
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		rst = 0;
		x = 2;
		opcode = 4;//push
		@(negedge clk);
		x = 4;
		opcode = 4;//push
		@(negedge clk);
		x = 5;
		opcode = 4;//push
		@(negedge clk);
		opcode = 3;//mult		
		@(negedge clk);
		x = 6;
		opcode = 4;//push
		@(negedge clk);
		opcode = 1;//add
		@(negedge clk);
		opcode = 1;//add
		@(negedge clk);
		if (o !== 2+4*5+6)
        begin 
          $display("Error"); 
          $finish; 
        end
        $display("Good.");
		$finish;
	end

 	always  #5  clk=~clk; 

endmodule
