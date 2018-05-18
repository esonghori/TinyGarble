`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:29:19 07/23/2015
// Design Name:   knns_seq
// Project Name:  kNNS_TD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: knns_seq
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module knns_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] x1;
	reg [31:0] y1;
	reg [31:0] x2;
	reg [31:0] y2;

	// Outputs
	wire [639:0] min_val_out;

	// Instantiate the Unit Under Test (UUT)
	k_nns_seq_td uut (
		.clk(clk), 
		.rst(rst), 
		.x1(x1), 
		.y1(y1), 
		.x2(x2), 
		.y2(y2), 
		.min_val_out(min_val_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		x1 = 0;
		y1 = 0;
		x2 = 10;
		y2 = 10;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		rst = 1;
		#130;
		rst = 0;
		#20;
		
		x1 = 10;
		y1 = 5;
		x2 = 10;
		y2 = 4;
		#100;
		x2 = 11;
		y2 = 5;
		#100;
		x2 = 11;
		y2 = 5;
		#100;
		x2 = 18;
		y2 = 5;
		#100;
		x2 = 12;
		y2 = 5;
		#100;
		x2 = 14;
		y2 = 25;
		#100;
		x2 = 15;
		y2 = 25;
		#100;
		x2 = 10;
		y2 = 6;
		#100;
		x2 = 10;
		y2 = 7;
		#100;
		x2 = 10;
		y2 = 18;
		#100;
		x2 = 10;
		y2 = 19;
		#100;
		x2 = 20;
		y2 = 10;
		#100;
		x2 = 10;
		y2 = 7;
		#100;
		x2 = 9;
		y2 = 4;
		#100;
		x2 = 10;
		y2 = 4;
		#100;
		x2 = 25;
		y2 = 10;
		#100;
		x2 = 10;
		y2 = 24;
		#100;
		x2 = 11;
		y2 = 5;
		#100;
		x2 = 19;
		y2 = 5;
	end
	
	always begin
		#50;
		clk = ~clk;
	end
	
	always @ (posedge clk) begin
	end
      
endmodule

