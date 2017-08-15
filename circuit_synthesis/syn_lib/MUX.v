`timescale 1ns / 1ps

module MUX #(parameter N=8)(
	input [N-1:0] A,
	input [N-1:0] B,
	input S,
	output [N-1:0] O
);

	genvar g,h;
	
	localparam MAX_LOOP = 512;
	
	generate
	if(N < MAX_LOOP)	begin : IF1
		for(g=0;g<N;g=g+1)
		begin:FAINST
			assign O[g] = (((A[g]^B[g])&S)^A[g]);
		end
	end	else	begin : IF1_N
		for(h=0;h<N/MAX_LOOP;h=h+1)
		begin:FA_INST_0
			for(g=0;g<MAX_LOOP;g=g+1)
			begin:FA_INST_1
				assign O[h*MAX_LOOP + g] = (((A[h*MAX_LOOP + g]^B[h*MAX_LOOP + g])&S)^A[h*MAX_LOOP + g]);
			end
		end
		for(g=(N/MAX_LOOP)*MAX_LOOP;g <N;g=g+1)
		begin:FA_INST_1
			assign O[g] = (((A[g]^B[g])&S)^A[g]);
		end
	end
	endgenerate


endmodule

