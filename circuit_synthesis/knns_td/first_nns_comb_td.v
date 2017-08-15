module first_nns_comb_td
#
(
	parameter W = 15,
	parameter N =  32
)
(
	g_input,
	e_input,
	o
);

	function integer log2;
		input [31:0] value;
		reg [31:0] temp;
	begin
		temp = value;
		for (log2=0; temp>0; log2=log2+1)
			temp = temp>>1;
	end
	endfunction

	localparam LOGW = log2(W);

	input [2*W-1:0] g_input;
	input [2*W*N-1:0] e_input;
	output [2*W-1:0] o;
	
	wire [W-1:0] x1[N-1:0]; 
	wire [W-1:0] y1[N-1:0]; 
	wire [W-1:0] x2, y2;
	wire [2*W-1:0] min_val_out;
	
	assign x2 = g_input[2*W-1:W];
	assign y2 = g_input[W-1:0];
	assign min_val_out = o;

	//wire [2*W-1:0] DBi[N-1:0];
	wire [W+1:0] dist[N-1:0];

	wire [W-1:0] min_val_x[N-1:0];
	wire [W-1:0] min_val_y[N-1:0];
	wire [W+1:0] min_dist[N-1:0];
	wire gt_dist[N-1:1];


	genvar i;
	
	generate
	for (i=0;i<N;i=i+1)
	begin:D_ASN
		//assign DBi[i] = e_input[2*W*(i+1)-1:2*W*i];
		assign x1[i] = e_input[2*W*(i+1)-1:2*W*(i+1)-W];
		assign y1[i] = e_input[2*W*(i+1)-W-1:2*W*i];
	end
	endgenerate

	generate
	for (i=0;i<N;i=i+1)
	begin:dist_inst
		taxicab_distance
		#(
			.N(W)
		)
		taxicab_distance_
		(
			.x1(x1[i]), .y1(y1[i]), .x2(x2), .y2(y2),
			.dist(dist[i])
		);
	end
	endgenerate

	assign min_val_x[0]	= x1[0];
	assign min_val_y[0]	= y1[0];
	assign min_dist[0]	= dist[0];

	generate
	for (i=1;i<N;i=i+1)
	begin:comp_inst
		COMP
		#(
			.N(W+2)
		)
		COMP_
		(
			.A(min_dist[i-1]),
			.B(dist[i]),
			.O(gt_dist[i])
		);
	end
	endgenerate

	generate
	for (i=1;i<N;i=i+1)
	begin:mux_inst
		MUX
		#(
			.N(2*W)
		)
		MUX_1
		(
			//.A(DBi[i]),
			.A({x1[i], y1[i]}),
			.B({min_val_x[i-1], min_val_y[i-1]}),
			.S(gt_dist[i]),
			.O({min_val_x[i], min_val_y[i]})
		);
		
		MUX
		#(
			.N(W+2)
		)
		MUX_2
		(
			.A(dist[i]),
			.B(min_dist[i-1]),
			.S(gt_dist[i]),
			.O(min_dist[i])
		);
		//assign min_val[i] = (gt_dist[i])? DBi[i]	:min_val[i-1];
		//assign min_dist[i] =  (gt_dist[i])? dist[i]	:min_dist[i-1];
	end
	endgenerate

	assign o = {min_val_x[N-1], min_val_y[N-1]};


endmodule
