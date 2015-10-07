`timescale 1ns / 1ps

 module square_root_comb #(parameter N = 8, M = 16)(
	input 			[N-1:0]		A,
	output			[N/2-1:0]	O
	);
	
				wire	[N/2-1:0]	Y[0:M];
				wire	[N/2-1:0]	Y0[0:M];
	
	assign Y[0] = {1'b1,{(N/2-1){1'b0}}};
	assign Y0[0] = {1'b1,{(N/2-1){1'b0}}};
	
	assign O = Y[M];
	
	genvar gv;
	generate
	for (gv = 0; gv < M; gv = gv + 1)
	begin: sqr_rt
		squar_root_unit #(.N(N)) squar_root_unit(
			.x(A),
			.y_in(Y[gv]), 
			.y0_in(Y0[gv]),
			.y(Y[gv+1]), 
			.y0(Y0[gv+1])
);
	end
	endgenerate
	
	
endmodule


module squar_root_unit #(parameter N = 8)(
	input		[N-1:0]		x,
	input	[N/2-1:0]	y_in, y0_in,
	output	[N/2-1:0]	y, y0
);

	wire 						t;
	wire		[N/2-1:0]	y_min_y0, y_mid;
	wire		[N-1:0]		y_sqr;
	wire		[1:0]		temp;
	
	//assign	y_sqr = y_in * y_in;
	MULT #(.N(N/2), .M(N/2)) MULT1 (.A(y_in), .B(y_in), .O(y_sqr));
	//assign 	t = (y_sqr > x) ? 1 : 0;
	COMP #(.N(N)) COMP1 (.A(x), .B(y_sqr), .O(t));
	//assign	y_min_y0 = y_in - y0_in;
	SUB_ #(.N(N/2), .M(N/2)) SUB1 (.A(y_in), .B(y0_in), .O({temp[0], y_min_y0}));
	//assign 	y_mid = t? y_min_y0 : y_in;
	MUX #(.N(N/2)) MUX1 (.A(y_min_y0), .B(y_in), .S(t), .O(y_mid));
	assign 	y0 = y0_in >> 1;
	//assign 	y = y_mid + y0;
	ADD_ #(.N(N/2), .M(N/2)) ADD1 (.A(y_mid), .B(y0), .O({temp[1],y}));
	

endmodule
