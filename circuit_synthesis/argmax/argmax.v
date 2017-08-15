module argmax
#(
  parameter N=10, // number of inputs
  parameter M=32  // input bit-width
)
(
  in,
  max,
  ind
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

  localparam S = log2(N);

  input [M*N-1:0] in;
  output [M-1:0] max;
  output [S-1:0] ind;

  wire [M-1:0] max_i [N-1:0];
  wire [S-1:0] ind_i [N-1:0];
  wire greater [N-1:0];

  assign greater[0] = 0;
  assign max_i[0] = in[M-1:0];
  assign ind_i[0] = 0;

  genvar g;
  generate
  for (g=1;g<N;g=g+1) begin:S1
    assign greater[g] = (max_i[g-1] > in[(g+1)*M-1:g*M]);
    assign max_i[g] = (greater[g]) ? max_i[g-1]: in[(g+1)*M-1:g*M];
    assign ind_i[g] = (greater[g]) ? ind_i[g-1]: g;
  end
  endgenerate

  assign max = max_i[N-1];
  assign ind = ind_i[N-1];

endmodule
