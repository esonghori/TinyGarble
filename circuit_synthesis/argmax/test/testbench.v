module testbench();

  parameter S = 5; // 32 number
  parameter M = 8; // of 8-bit int

  reg [M-1:0] ini [2**S-1:0];
  wire [(2**S)*M-1:0] in;
  wire [M-1:0] max;
  wire [S-1:0] ind;

  argmax
  #(
    .S(S),
    .M(M)
  )
  uut
  (
    .in(in),
    .max(max),
    .ind(ind)
  );


  genvar i;
  generate
  for(i=0;i<2**S;i=i+1) begin:TEST_GEN1
    assign in[(i+1)*M-1:i*M] = ini[i];
  end
  endgenerate

  integer j;
  initial begin
    $display("S = %d, M = %d", S, M);
    for(j=0;j<2**S;j=j+1) begin
      ini[j] = $urandom%100;
      $display("ini[%d] = %d",j ,ini[j]);
    end
    #10
    $display("max = %d, ind = %d", max, ind);
    $finish;
  end


endmodule
