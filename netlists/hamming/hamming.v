`timescale 1ns / 1ps

module hamming
#(
	parameter N=8,
	parameter CC=1
)
(
	clk,
	rst,
	x,
	y,
	o
);
	localparam M = N/CC; 

	input clk;
	input rst;
	input[M-1:0] x;
	input[M-1:0] y;
	output[log2(N)-1:0] o;

	function integer log2;
		input [31:0] value;
		reg [31:0] temp;
	begin
		temp = value;
		for (log2=0; temp>0; log2=log2+1)
			temp = temp>>1;
	end
	endfunction




	reg[log2(N)-1:0] oglobal;
	wire [log2(M):0] olocal [log2(M):0][(2**(log2(M)))-1:0];
	wire[M-1:0] xy;
	

	assign xy = x^y;

	genvar i,j,k;
	
	localparam LOG2_LOOP_MAX = 9;
	localparam LOOP_MAX = 2**LOG2_LOOP_MAX;
	
	generate
	for(i=0;i<log2(M);i=i+1)
	begin:L1
		if((log2(M)-i-1)>LOG2_LOOP_MAX)
		begin
			for(j=0;j<2**(log2(M)-i-1-LOG2_LOOP_MAX);j=j+1)
			begin:L22
				for(k=0;k<LOOP_MAX;k=k+1)
				begin:L23
			 		//assign olocal[i+1][(j*LOOP_MAX +k)][i+1:0] = olocal[i][2*(j*LOOP_MAX +k)][i:0] + olocal[i][2*(j*LOOP_MAX +k)+1][i:0];
			 		ADD
			 		#(
			 			.N(i+1)
			 		)
			 		ADD_
			 		(
			 			.A(olocal[i][2*(j*LOOP_MAX +k)][i:0]),
			 			.B(olocal[i][2*(j*LOOP_MAX +k)+1][i:0]),
			 			.CI(1'b0),
			 			.S(olocal[i+1][(j*LOOP_MAX +k)][i:0]),
			 			.CO(olocal[i+1][(j*LOOP_MAX +k)][i+1])
			 		
			 		);
			 	end	
			end
		end
		else
		begin
			for(j=0;j<2**(log2(M)-i-1);j=j+1)
			begin:L2
		 		//assign olocal[i+1][j][i+1:0] = olocal[i][2*j][i:0] + olocal[i][2*j+1][i:0];
		 		ADD
		 		#(
		 			.N(i+1)
		 		)
		 		ADD_
		 		(
		 			.A(olocal[i][2*j][i:0]),
		 			.B(olocal[i][2*j+1][i:0]),
		 			.CI(1'b0),
		 			.S(olocal[i+1][j][i:0]),
		 			.CO(olocal[i+1][j][i+1])
		 		
		 		);
		 	end
	 	end
	end
	endgenerate


	
	generate
	if(log2(M) > LOG2_LOOP_MAX)
	begin
		for(i=0;i<2**(log2(M)-LOG2_LOOP_MAX);i=i+1)
		begin:L33
			for(k=0;k<LOOP_MAX;k=k+1)
			begin:L3
				 if((i*LOOP_MAX + k)<M)
				  	assign olocal[0][i*LOOP_MAX + k][0] = xy[i];
				else
					assign olocal[0][i*LOOP_MAX + k][0] = 1'b0;
			end
		end
	end
	else
	begin
		for(i=0;i<2**(log2(M));i=i+1)
		begin:L34
			 if(i<M)
			  	assign olocal[0][i][0] = xy[i];
			else
				assign olocal[0][i][0] = 1'b0;
		end
	end
	endgenerate



	generate
	if(CC>1)
	begin
	    //assign o = oglobal + olocal[log2(M)-1][0][log2(M)-1:0];
	    ADD
 		#(
 			.N(log2(N))
 		)
 		ADD_
 		(
 			.A(oglobal),
 			.B({{(log2(N) - log2(M)){1'b0}},olocal[log2(M)-1][0][log2(M)-1:0]}),
 			.CI(1'b0),
 			.S(o),
 			.CO()
 		);
		always@(posedge clk or posedge rst)
		begin
			if(rst)
			begin
				oglobal <= 0;
			end
			else
			begin
				oglobal <= o;
			end
		end
	end
	else
	begin
	  assign o = olocal[log2(M)][0][log2(M)-1:0];
		always@(*)
		begin
			oglobal <= 'b0;
		end
	end
	endgenerate

	

endmodule


