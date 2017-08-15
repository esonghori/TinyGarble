module first_nns_seq_td
#
(
	parameter W = 15
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
	output [2*W-1:0] o;
	
	wire [W-1:0] x1, y1, x2, y2;
	wire [2*W-1:0] min_val_out;
	
	assign x1 = e_input[2*W-1:W];
	assign y1 = e_input[W-1:0];
	assign x2 = g_input[2*W-1:W];
	assign y2 = g_input[W-1:0];
	assign min_val_out = o;

	wire [W+1:0] dist;

	wire [2*W-1:0] min_val;
	wire [W+1:0] min_dist;
	wire gt_dist;

	reg [2*W-1:0] min_val_reg;
	reg [W+1:0] min_dist_reg;


	taxicab_distance
	#(
		.N(W)
	)
	taxicab_distance_
	(
		.x1(x1), .y1(y1), .x2(x2), .y2(y2),
		.dist(dist)
	);


	COMP
	#(
		.N(W+2)
	)
	COMP_
	(
		.A(min_dist_reg),
		.B(dist),
		.O(gt_dist)
	);

	MUX
	#(
		.N(2*W)
	)
	MUX_1
	(
		.A(e_input),
		.B(min_val_reg),
		.S(gt_dist),
		.O(min_val)
	);
	
	MUX
	#(
		.N(W+2)
	)
	MUX_2
	(
		.A(dist),
		.B(min_dist_reg),
		.S(gt_dist),
		.O(min_dist)
	);
	//assign min_val = (gt_dist)? e_input	:min_val_reg;
	//assign min_dist =  (gt_dist)? dist	:min_dist_reg;

	assign o = min_val;


	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			min_val_reg <=  0;
			min_dist_reg <= {(W+2){1'b1}};		
		end
		else 
		begin
			min_val_reg <= min_val;
			min_dist_reg <= min_dist;
		end
	end



endmodule
