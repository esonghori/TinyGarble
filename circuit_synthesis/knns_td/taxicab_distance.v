module taxicab_distance #(parameter N = 32)(
	input [N-1:0] x1, y1, x2, y2,
	output [N+1:0] dist
);

wire signed [N:0] dist_x12, dist_x21, dist_xabs, dist_y12, dist_y21, dist_yabs;

/*SUB_1 #(.N(N)) diff_x12 (.A(x1), .B(x2), .S(dist_x12[N-1:0]), .CO(dist_x12[N]));
SUB_1 #(.N(N)) diff_x21 (.A(x2), .B(x1), .S(dist_x21[N-1:0]), .CO(dist_x21[N]));*/

SUB_1 #(.N(N)) diff_x12 (.A(x1), .B(x2), .D(dist_x12));
SUB_1 #(.N(N)) diff_x21 (.A(x2), .B(x1), .D(dist_x21));

MUX #(.N(N+1)) abs_x (.A(dist_x12), .B(dist_x21), .S(dist_x12[N]), .O(dist_xabs));

/*SUB_1 #(.N(N)) diff_y12 (.A(y1), .B(y2), .S(dist_y12[N-1:0]), .CO(dist_y12[N]));
SUB_1 #(.N(N)) diff_y21 (.A(y2), .B(y1), .S(dist_y21[N-1:0]), .CO(dist_y21[N]));*/

SUB_1 #(.N(N)) diff_y12 (.A(y1), .B(y2), .D(dist_y12));
SUB_1 #(.N(N)) diff_y21 (.A(y2), .B(y1), .D(dist_y21));

MUX #(.N(N+1)) abs_y (.A(dist_y12), .B(dist_y21), .S(dist_y12[N]), .O(dist_yabs));

ADD #(.N(N+1))t_d (.A(dist_xabs), .B(dist_yabs), .CI(1'b0), .S(dist[N:0]), .CO(dist[N+1]));

endmodule 

module SUB_1 #(parameter N = 32)(
	input [N-1:0] A, B,
	output [N:0] D
);

wire CO;
assign D[N] = ~CO;

ADD
#(
	.N(N)
)
ADD_
(
	.A(A),
	.B(~B),
	.CI(1'b1),
	.S(D[N-1:0]), 
	.CO(CO)
);

endmodule 