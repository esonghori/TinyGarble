module first_nns_seq
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
	input [W-1:0] g_input;
	input [W-1:0] e_input;
	output [W-1:0] o;

	wire [LOGW-1:0] dist;

	wire [W-1:0] min_val;
	wire [LOGW-1:0] min_dist;
	wire gt_dist;

	reg [W-1:0] min_val_reg;
	reg [LOGW-1:0] min_dist_reg;


	COUNT
	#(
		.N(W)
	)
	COUNT_
	(
		.A(g_input ^ DBi),
		.S(dist)
	);


	COMP
	#(
		.N(LOGW)
	)
	COMP_
	(
		.A(min_dist_reg),
		.B(dist),
		.O(gt_dist)
	);

	MUX
	#(
		.N(W)
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
		.N(LOGW)
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
			min_dist_reg <= {LOGW{1'b1}};		
		end
		else 
		begin
			min_val_reg <= min_val;
			min_dist_reg <= min_dist;
		end
	end



endmodule
