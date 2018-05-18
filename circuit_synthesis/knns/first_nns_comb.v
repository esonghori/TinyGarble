module first_nns_comb
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

	input [W-1:0] g_input;
	input [W*N-1:0] e_input;
	output [W-1:0] o;

	wire [W-1:0] DBi[N-1:0];
	wire [LOGW-1:0] dist[N-1:0];

	wire [W-1:0] min_val[N-1:0];
	wire [LOGW-1:0] min_dist[N-1:0];
	wire gt_dist[N-1:1];


	genvar i;
	
	generate
	for (i=0;i<N;i=i+1)
	begin:D_ASN
		assign DBi[i] = e_input[W*(i+1)-1:W*i];
	end
	endgenerate

	generate
	for (i=0;i<N;i=i+1)
	begin:dist_inst
		COUNT
		#(
			.N(W)
		)
		COUNT_
		(
			.A(g_input ^ DBi[i]),
			.S(dist[i])
		);
	end
	endgenerate

	assign min_val[0] 	= DBi[0];
	assign min_dist[0]	= dist[0];

	generate
	for (i=1;i<N;i=i+1)
	begin:comp_inst
		COMP
		#(
			.N(LOGW)
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
			.N(W)
		)
		MUX_1
		(
			.A(DBi[i]),
			.B(min_val[i-1]),
			.S(gt_dist[i]),
			.O(min_val[i])
		);
		
		MUX
		#(
			.N(LOGW)
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

	assign o = min_val[N-1];


endmodule
