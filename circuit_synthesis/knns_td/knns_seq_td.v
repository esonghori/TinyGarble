module knns_seq
#
(
	parameter W = 32,
	parameter K = 10
)
(
	clk,
	rst,
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

	input clk;
	input rst;
	input [2*W-1:0] g_input, e_input;
	output [2*W*K-1:0] o;

	wire [W-1:0] x1, y1, x2, y2;
	wire [2*W*K-1:0] min_val_out;
	
	assign x1 = e_input[2*W-1:W];
	assign y1 = e_input[W-1:0];
	assign x2 = g_input[2*W-1:W];
	assign y2 = g_input[W-1:0];
	assign min_val_out = o;

	wire [W+1:0] dist;

	wire [2*W-1:0] min_val [K-1:0];
	wire [W+1:0] min_dist [K-1:0];
	
	reg [2*W-1:0] min_val_reg [K-1:0];
	reg [W+1:0] min_dist_reg [K-1:0];
	
	wire gt_dist_1 [K-1:0];
	wire gt_dist_2 [K-1:0];


	wire [W-1:0] local_min_val_x  [K:0];
	wire [W-1:0] local_min_val_y  [K:0];
	wire [W+1:0] local_min_dist [K:0];


	genvar i;
	
	generate
	for (i=0;i<K;i=i+1)
	begin:D_ASN
		assign min_val_out[2*W*(i+1)-1:2*W*i] = min_val[i];
	end
	endgenerate

	taxicab_distance
	#(
		.N(W)
	)
	taxicab_distance_
	(
		.x1(x1), .y1(y1), .x2(x2), .y2(y2),
		.dist(dist)
	);


	generate
	for (i=0;i<K;i=i+1)
	begin:COMP_ASN
		COMP
		#(
			.N(W+2)
		)
		COMP_1
		(
			.A(min_dist_reg[i]),
			.B(local_min_dist[i+1]),
			.O(gt_dist_1[i])
		);

		if(i>0)
		begin
			COMP
			#(
				.N(W+2)
			)
			COMP_2
			(
				.A(min_dist_reg[i-1]),
				.B(local_min_dist[i]),
				.O(gt_dist_2[i])
			);	
		end
		else 
		begin
			assign gt_dist_2[i] = 0;
		end
	end
	endgenerate



	generate
	for (i=0;i<K;i=i+1)
	begin:MUX_ASN
		MUX
		#(
			.N(W+2)
		)
		MUX_1
		(
			.A(min_dist_reg[i]),
			.B(local_min_dist[i+1]),
			.S(gt_dist_1[i]),
			.O(local_min_dist[i])
		);
		
		if(i>0)
		begin
			MUX
			#(
				.N(W+2)
			)
			MUX_2
			(
				.A(local_min_dist[i]),
				.B(min_dist_reg[i-1]),
				.S(gt_dist_2[i]),
				.O(min_dist[i])
			);
		end
		else 
		begin
			assign min_dist[i] = local_min_dist[i];
		end


		MUX
		#(
			.N(2*W)
		)
		MUX_3
		(
			.A(min_val_reg[i]),
			.B({local_min_val_x[i+1], local_min_val_y[i+1]}),
			.S(gt_dist_1[i]),
			.O({local_min_val_x[i], local_min_val_y[i]})
		);
		
		if(i>0)
		begin
			MUX
			#(
				.N(2*W)
			)
			MUX_4
			(
				.A({local_min_val_x[i], local_min_val_y[i]}),
				.B(min_val_reg[i-1]),
				.S(gt_dist_2[i]),
				.O(min_val[i])
			);
		end
		else 
		begin
			assign min_val[i] = {local_min_val_x[i], local_min_val_y[i]};
		end

	end
	endgenerate

	assign local_min_dist[K] = dist;
	assign local_min_val_x[K] = x2;
	assign local_min_val_y[K] = y2;





	integer j;
	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			for(j=0;j<K;j=j+1)
			begin
				min_val_reg[j] <=  0;
				min_dist_reg[j] <= {(W+2){1'b1}};		
			end
		end
		else 
		begin
			for(j=0;j<K;j=j+1)
			begin
				min_val_reg[j] <= min_val[j];
				min_dist_reg[j] <= min_dist[j];
			end
		end
	end



endmodule
