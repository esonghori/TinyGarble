module KeyExpansion
(
  key,
  expandedKey
);

  localparam NR = 10;

  input     [127:0]          key;
  output    [128*(NR+1)-1:0] expandedKey;


  wire      [31:0]           w[4*(NR+1)-1:0];
  wire      [31:0]           t[NR-1:0];
  wire      [7:0]            RCon[NR-1:0];
  wire      [31:0]           rotWord[NR-1:0];
  wire      [31:0]           Q[NR-1:0];
  wire      [95:0]           unused[NR-1:0];


  assign RCon[0] = 8'h01;
  assign RCon[1] = 8'h02;
  assign RCon[2] = 8'h04;
  assign RCon[3] = 8'h08;
  assign RCon[4] = 8'h10;
  assign RCon[5] = 8'h20;
  assign RCon[6] = 8'h40;
  assign RCon[7] = 8'h80;
  assign RCon[8] = 8'h1b;
  assign RCon[9] = 8'h36;


  genvar i;

  generate 
  for(i=0;i<4*(NR+1);i=i+1)
  begin:EXPANDKEY
    assign expandedKey[32*(i+1)-1:32*i] = w[i];
  end
  endgenerate


  generate 
  for(i=0;i<4*(NR+1);i=i+1) begin:NR_W
    if(i<4) begin:INITIAL
      assign w[i] = key[32*(i+1)-1:32*i];
    end else begin:NEXT
      if(i%4==0) begin:FIRST
        assign w[i] = w[i-4] ^ t[i/4-1];
      end else begin:THEN
        assign w[i] = w[i-1] ^ w[i-4];
      end
    end
  end
  endgenerate


  generate 
  for(i=0;i<NR;i=i+1) begin:COREKEY
    assign rotWord[i] = {w[4+4*i-1][7:0], w[4+i*4-1][31:8]};
    SubBytes a(.x({rotWord[i], 96'b0}), .z({Q[i], unused[i]}));
    assign t[i] = {Q[i][31:8], RCon[i] ^ Q[i][7:0]};
  end
  endgenerate


endmodule


