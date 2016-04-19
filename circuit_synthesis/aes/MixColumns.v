module MixColumns(
x,
z);

	input [127:0] x;
	output reg [127:0] z;


  function [7:0] xtime;
    input [7:0] a;
    begin
      xtime = (a & 8'h80) ? ((a << 1) ^ 8'h1B) : (a << 1);
    end
  endfunction
 
  generate 
  genvar i;
  for (i = 0; i < 4; i = i + 1) begin: gen_loop_enc
    always @(x)
    begin: enc_colMix
      reg[7:0] a0, a1, a2, a3, temp;
			reg[7:0] b0, b1, b2, b3;

      a0 = x[8*(4*i+1)-1:8*(4*i+0)];
      a1 = x[8*(4*i+2)-1:8*(4*i+1)];
      a2 = x[8*(4*i+3)-1:8*(4*i+2)];
      a3 = x[8*(4*i+4)-1:8*(4*i+3)];
      temp = a0 ^ a1 ^ a2 ^ a3;

			b0 = a0 ^ temp ^ xtime(a0 ^ a1);
			b1 = a1 ^ temp ^ xtime(a1 ^ a2);
			b2 = a2 ^ temp ^ xtime(a2 ^ a3);
			b3 = a3 ^ temp ^ xtime(a3 ^ a0);

      z[8*(4*i+1)-1:8*(4*i+0)] = b0;
      z[8*(4*i+2)-1:8*(4*i+1)] = b1;
      z[8*(4*i+3)-1:8*(4*i+2)] = b2;
      z[8*(4*i+4)-1:8*(4*i+3)] = b3;
    end
  end
  endgenerate


endmodule

