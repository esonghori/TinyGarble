`include "../defined.vh"


module PC_Next
( 
	clk,
	rst,
	pc_new,
	take_branch,
	opcode25_0,
	pc_source,
	pc_current,
	pc_plus4
);

	input 			clk;
	input 			rst;
	input 	[31:2] 	pc_new;
	input 			take_branch;
	input 	[25:0] 	opcode25_0;
	input 	[1:0] 	pc_source;
	output 	[31:2] 	pc_current;
	output 	[31:2] 	pc_plus4;


	reg		[31:2]	pc;
	reg 	[31:2] 	pc_future;
	
	assign pc_current=pc;
	

	assign pc_plus4=pc+1;
	/*ADD 
	#(
		.N(30)
	)
	ADD_1
	(
		.A(pc),
		.B(30'b1),
		.CI(1'b0),
		.S(pc_plus4),
		.CO()
	);*/

	wire	[31:2]	pc_jump;
	
	assign pc_jump = pc+{{14{opcode25_0[15]}},opcode25_0[15:0]};
	/*ADD 
	#(
		.N(30)
	)
	ADD_2
	(
		.A(pc),
		.B({{14{opcode25_0[15]}},opcode25_0[15:0]}),
		.CI(1'b0),
		.S(pc_jump),
		.CO()
	);*/

	always@(*)
	begin
		pc_future<=pc_plus4;
		case(pc_source)
		`FROM_INC4:
			pc_future<=pc_plus4;
		`FROM_OPCODE25_0:
			pc_future<={pc[31:28],opcode25_0};
		`FROM_BRANCH:
			pc_future<=(take_branch)?pc_jump:pc_plus4;
		`FROM_LBRANCH:
			pc_future<=pc_new;
		default:
			pc_future<=pc_plus4;
		endcase
	end
	
	
	
	always@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			pc<=30'b0;
		end
		else 
		begin
			pc<=pc_future;
		end
	end
endmodule