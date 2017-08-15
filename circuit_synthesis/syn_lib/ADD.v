`timescale 1ns / 1ps

module ADD #(parameter N = 8, M = N)( // N >= M
  input [N-1:0] A,
  input [M-1:0] B,
  input CI,
  output CO,
  output [N-1:0] S
);

  wire [N-1:0] BB;
  generate
    if (N > M) begin: FA_IF
      assign BB = {{(N-M){1'b0}}, B};
    end else begin: FA_IF_N
      assign BB = B;
    end
  endgenerate
  

  wire C[N:0];

  assign C[0] = CI;
  assign CO = C[N];
  
  genvar g;
  genvar h;
  
  localparam MAX_LOOP = 512;
  
  generate
  if(N < MAX_LOOP) begin : FA_IF2
    for(g=0;g<N;g=g+1) begin: FAINST
      FA FA_ (
        .A(A[g]), 
        .B(BB[g]), 
        .CI(C[g]), 
        .S(S[g]), 
        .CO(C[g+1])
      );
    end
  end else begin: FA_IF2_N
    for(h=0;h<N/MAX_LOOP;h=h+1) begin: FA_INST_0
      for(g=0;g<MAX_LOOP;g=g+1) begin: FA_INST_1
        FA FA_ (
          .A(A[h*MAX_LOOP + g]), 
          .B(BB[h*MAX_LOOP + g]), 
          .CI(C[h*MAX_LOOP + g]), 
          .S(S[h*MAX_LOOP + g]), 
          .CO(C[h*MAX_LOOP + g +1])
        );
      end
    end
    for(g=(N/MAX_LOOP)*MAX_LOOP;g <N;g=g+1) begin:FA_INST_1
      FA FA_ (
        .A(A[g]), 
        .B(BB[g]), 
        .CI(C[g]), 
        .S(S[g]), 
        .CO(C[g+1])
      );
    end
  end
  endgenerate

endmodule

