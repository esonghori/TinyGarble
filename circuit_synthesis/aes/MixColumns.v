module xtime (
	output [7:0] y,
	input [7:0] x
	);
	
	wire [7:0] w;
	assign w = x << 1;
	//MUX MUX_1(.A(w), .B(w ^ 8'h1B), .S(x[7]), .O(y));
	/*MUX
		#(
			.N(8)
		)
		MUX_1
		(
			.A(w),
			.B(w ^ 8'h1B),
			.S(x[7]),
			.O(y)
		);*/
	assign y = x[7]? w ^ 8'h1B : w;
	

endmodule


module MixColumns(
x,
z);

	input [127:0] x;
	output [127:0] z;


 /* function [7:0] xtime;
    input [7:0] a;
    begin
      xtime = (a & 8'h80) ? ((a << 1) ^ 8'h1B) : (a << 1);
    end
  endfunction */
 
  generate 
  genvar i;
  for (i = 0; i < 4; i = i + 1) begin: gen_loop_enc
  
		wire[7:0] a0, a1, a2, a3, temp;
		wire[7:0] b0, b1, b2, b3;
		wire[7:0] c0, c1, c2, c3;

		assign a0 = x[8*(4*i+1)-1:8*(4*i+0)];
		assign a1 = x[8*(4*i+2)-1:8*(4*i+1)];
		assign a2 = x[8*(4*i+3)-1:8*(4*i+2)];
		assign a3 = x[8*(4*i+4)-1:8*(4*i+3)];
		assign temp = a0 ^ a1 ^ a2 ^ a3;
		
		xtime xtime_0(c0, a0 ^ a1);	
		xtime xtime_1(c1, a1 ^ a2);	
		xtime xtime_2(c2, a2 ^ a3);	
		xtime xtime_3(c3, a3 ^ a0);
		
		assign b0 = a0 ^ temp ^ c0;
		assign b1 = a1 ^ temp ^ c1;
		assign b2 = a2 ^ temp ^ c2;
		assign b3 = a3 ^ temp ^ c3;

		assign z[8*(4*i+1)-1:8*(4*i+0)] = b0;
		assign z[8*(4*i+2)-1:8*(4*i+1)] = b1;
		assign z[8*(4*i+3)-1:8*(4*i+2)] = b2;
		assign z[8*(4*i+4)-1:8*(4*i+3)] = b3;

  end
  endgenerate


endmodule

