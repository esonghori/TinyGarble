module KeyExpansionSeq
(
  key,
  counter,
  nextKey 
);

  localparam            NR = 10;

  input     [127:0]          key;
  input     [3:0]            counter;
  output    [127:0]          nextKey;


  wire      [31:0]           w[3:0];
  wire      [31:0]           wNext[3:0];

  wire      [31:0]           t;
  wire      [7:0]            RCon[NR:0];
  wire      [31:0]           rotWord;
  wire      [31:0]           Q;
  wire      [95:0]           unused;


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
  assign RCon[10] = 8'h00;


  genvar i;

  generate 
  for(i=0;i<4;i=i+1) begin:EXPANDKEY
    assign w[i] = (counter<10)?key[32*(i+1)-1:32*i]:32'b0;
    assign nextKey[32*(i+1)-1:32*i] = wNext[i];
  end
  endgenerate


  generate 
  for(i=0;i<4;i=i+1) begin:NR_W
    if(i==0) begin:FIRST
      assign wNext[i] = w[i] ^ t;
    end else begin:THEN
      assign wNext[i] = w[i] ^ wNext[i-1];
    end
  end
  endgenerate


  
  assign rotWord = {w[3][7:0], w[3][31:8]};
  SubBytes a(.x({rotWord, 96'b0}), .z({Q, unused}));
  assign t = {Q[31:8], RCon[counter] ^ Q[7:0]};
  

endmodule


