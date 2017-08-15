`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// IN THE NAME OF GOD
// Company: Rice University
// Engineer: M. S. Riazi
// 
// Create Date:    	12:19:33 02/18/2015 
// Design Name: 		Stable Matching
// Module Name:    	mainModule 
// Project Name: 		stableMatching
// Target Devices: 	no device
// Tool versions: 	14.6
// Description: 		
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module stable_match_seq
#(
	parameter Kr =10,
	parameter Ks =10,
	parameter S  =10,
	parameter R  =10
)
(
	clk,
	rst,
	rPref,     	// reviewers preferences, 	linear input of Matrix of R*Kr*log(S) 
	sPref,		// suitors preferences, 	linear input of Matrix of S*Ks*log(R)
	matchList,
	finish,
	sIsMatchWire
);
	
	//------------------------------- Functions
	function integer log2;
		input [31:0] value;
		reg [31:0] temp;
	begin
		temp = value - 1;
		for (log2=0; temp>0; log2=log2+1)
			temp = temp>>1;
	end
	endfunction
	
	//------------------------------- Local Parameters 
	localparam logS = log2(S);
	localparam logR = log2(R);
	localparam logKs = log2(Ks);
	localparam logKr = log2(Kr);
	localparam SRounded = 2**logS;
	
	//------------------------------- I/O
	input wire clk,rst;
	
	input wire [R*Kr*logS-1:0] rPref;
	input wire [S*Ks*logR-1:0] sPref;
	
	output wire [R*logS-1:0] matchList;
	output wire finish;
	output wire [S-1:0] 	sIsMatchWire;  // just for transferring information to the testBench
	//------------------------------- Local wires
	wire [logS-1:0] rPrefMatrix [R-1:0][Kr-1:0];
	wire [logR-1:0] sPrefMatrix [S-1:0][Ks-1:0];
	wire [Kr-1:0] s1Compare,s2Compare;
	wire [Kr-1:0] wireXOR1,wireAND1,wireAND2,wireOR1;
	wire better;
	wire [log2(Ks+1)-1:0] pcS;
	wire [logS-1:0] s1;
	wire [logS-1:0] s2;
	wire propose;
	wire [logR-1:0] r;
	wire [SRounded-1:0] canPropose;
	wire [SRounded-1:0] encoderInput;
	wire [SRounded-1:0] encoderOR1;
	wire [logS-1:0] encoderOutput;
	
	//------------------------------- Local Regs
	reg [log2(Ks+1)-1:0] pc [S-1:0]; //proposal counts
	reg [logR-1:0] sInMatch [S-1:0];
	reg [S-1:0] 	sIsMatch;
	reg [S-1:0] 	sIsRunning;
	reg [R-1:0] 	rIsMatch;
	reg [logS-1:0] sIndex;
	reg [logS-1:0] s;
	reg [logS-1:0] matchListMatrix [R-1:0]; 
	reg finishAND;	
	
	//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Generate Part
	genvar i,j;
	
	generate  //[0]
		for (i=0;i<R;i=i+1)begin : rPref_asgn1
			for (j=0;j<Kr;j=j+1) begin : rPref_asgn2
				assign rPrefMatrix [i][j] = rPref [logS*Kr*i + logS*(j+1) -1 : logS*Kr*i + logS*j];
			end
		end
	endgenerate 
	
	generate //[0]
		for (i=0;i<S;i=i+1)begin : sPref_asgn1
			for (j=0;j<Ks;j=j+1) begin : sPref_asgn2
				assign sPrefMatrix [i][j] = sPref [logR*Ks*i + logR*(j+1) -1 : logR*Ks*i + logR*j];
			end
		end
	endgenerate 
	
	generate //[0]
		for (i=0;i<R;i=i+1)begin : matchList_asgn1
			assign matchList [logS*(i+1) -1    : logS*i   ] = matchListMatrix [i] ;
		end
	endgenerate 

	generate //[1] & [2]
		for (i=0;i<Kr;i=i+1)begin : s1_and_s2_Compare
			assign s1Compare[i]= ~|(s1^rPrefMatrix [r][i]) ;  	// [1]  
			assign s2Compare[i]= ~|(s2^rPrefMatrix [r][i]) ;		// [1]
			
			assign wireXOR1 [i] = s1Compare [i] ^ s2Compare [i];		// [2]
			if (i==0) begin
				assign wireOR1 [i] = wireXOR1[i];
				assign wireAND1 [i] = wireOR1[i];
			end else begin
				assign wireOR1 [i] = wireXOR1[i] | wireOR1[i-1];
				assign wireAND1 [i] = ~wireOR1 [i-1] & wireXOR1[i];
			end
			
			assign wireAND2 [i] = wireAND1 [i] & s2Compare[i];
		end
	endgenerate 
	
	
	assign better = | wireAND2 ; // [2]
	assign s1=matchListMatrix[r];
	assign pcS=pc[s];
	assign s2=s;
	assign finish=finishAND;
	assign propose= |pcS & ~sIsMatch[s];
	assign r=sPrefMatrix[s][Ks-pcS];
	assign sIsMatchWire = sIsMatch;
	

	
	generate // choose who to propose next 
		for (i=0;i<SRounded;i=i+1) begin :propose_asgn
			if (i<S) begin
				assign canPropose[i] = |pc[i] & ~sIsMatch[i] & ~sIsRunning[i];
			end else begin
				assign canPropose[i] = 0;
			end
			if (i==0) begin
				assign encoderOR1[i] = canPropose[i];
				assign encoderInput[i] = encoderOR1[i];
			end else begin
				assign encoderOR1[i] = encoderOR1[i-1] | canPropose[i];
				assign encoderInput[i] = ~encoderOR1[i-1] & canPropose[i];
			end
		end
	endgenerate
	
	encoder 
	#(.logS(logS))
	ENCODER
	(.in(encoderInput),
	.out(encoderOutput));
	

	
	//--------------------------------------------------------------------------------------------- ALGORITHM 
	integer k;
	always@(posedge clk or posedge rst) begin
		if(rst) begin
			s<=0;
			sIsRunning<=1;
			for (k=0;k<R;k=k+1) begin :always_line3
				rIsMatch[k]<=1'b0;
				matchListMatrix[k]<=0;
			end	
			for (k=0;k<S;k=k+1) begin :always_line
					pc[k]<=Ks;
					sIsMatch[k]<=1'b0;
					sInMatch[k]<=0;
			end	
		end else begin
			if (propose) begin // if s can propose
				pc[s] <= pc[s]-1; // will lost one propose
				if (rIsMatch[r]==0) begin
					matchListMatrix[r]<=s;// assign them together
					sInMatch [s] <= r;
					sIsMatch [s] <= 1'b1;
					rIsMatch [r] <= 1'b1;
				end else begin // if r is already matched 
					if	(better) begin
						matchListMatrix[r]<=s;// assign them together
						sInMatch [s] <= r;
						sIsMatch [s] <= 1'b1;
						sIsMatch [s1] <= 1'b0;						
					end
				end
			end
			
			sIsRunning[s]<=0;
			
			if (encoderInput[encoderOutput] ==1 ) begin
				sIsRunning[encoderOutput]<=1;
				s<=encoderOutput;
			end
			
		end
	end
	//###################################################################### Combinational Part
	
	always@(*) begin
		finishAND=0;
		for (k=0;k<S;k=k+1) begin
			finishAND=finishAND&      ~|pc[k];
		end
	end
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ MACROS
	
endmodule
