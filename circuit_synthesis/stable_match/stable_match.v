`timescale 1ps / 1ps

module stable_match
#(
  parameter Kw =8,
  parameter Km =8,
  parameter M  =8,
  parameter W  =8
)
(
  clk,
  rst,
  g_input,
  e_input,
  o
);

  function integer log2;
    input [31:0] value;
    reg [31:0] temp;
  begin
    temp = value - 1;
    for (log2=0; temp>0; log2=log2+1)
      temp = temp>>1;
  end
  endfunction

  localparam logM = log2(M);
  localparam logW = log2(W);
  localparam logKm = log2(Km);
  localparam logKw = log2(Kw);

  localparam state_select_m=0;
  localparam state_select_w=2;
  localparam state_wait_w = 3;
  localparam state_do_proposal = 4;

  input clk,rst;

  input [M*logKw+Km*logW-1:0] g_input;
  input [M*logKw+Km*logW-1:0] e_input;
  output [W*logM-1:0] o;

  wire [M*logKw-1:0] wPref_rev;
  wire [Km*logW-1:0] mPref;
  wire [W*logM-1:0] matchList;

  wire [logKm-1:0]   mPrefMatrix_raddr;
  wire [logW-1:0]    mPrefMatrix_rdata;
  wire [logM-1:0] pc_addr;
  wire [logKm:0]  pc_wdata;
  wire pc_wen;
  wire [logKm:0]  pc_rdata;
  wire [logW-1:0] wIsMatch_addr;
  wire wIsMatch_wdata;
  wire wIsMatch_wen;
  wire wIsMatch_rdata;
  wire [logW-1:0] matchListMatrix_addr;
  wire [logM:0] matchListMatrix_wdata;
  wire matchListMatrix_wen;
  wire [logM:0] matchListMatrix_rdata;

  wire [logM-1:0]   wPref_rev_Matrix_raddr1;
  wire [logKw-1:0]  wPref_rev_Matrix_rdata1;
  wire [logM-1:0]   wPref_rev_Matrix_raddr2;
  wire [logKw-1:0]  wPref_rev_Matrix_rdata2;

  wire [logM-1:0] mIsMatch_waddr1;
  wire mIsMatch_wdata1;
  wire mIsMatch_wen1;
  wire [logM-1:0] mIsMatch_waddr2;
  wire mIsMatch_wdata2;
  wire mIsMatch_wen2;
  wire [logM-1:0] mIsMatch_raddr;
  wire mIsMatch_rdata;

  wire [logM-1:0] mIndex;
  wire [logW-1:0] wIndex;
  wire [2:0] state;
  wire [logM-1:0] m;
  wire [logW-1:0] w;

 wire [M*logKw+Km*logW-1:0] input_xors;
 assign input_xors = g_input^e_input;
 assign wPref_rev = input_xors[M*logKw-1:0];
 assign mPref = input_xors[M*logKw+Km*logW-1:M*logKw];
 assign o = matchList;

  MPrefMatrix
  #(
    .Kw(Kw),
    .Km(Km),
    .M(M),
    .W(W)
  )
  MPrefMatrix_
  (
    .mPref(mPref),
    .raddr(mPrefMatrix_raddr),
    .rdata(mPrefMatrix_rdata)
  );

  WPref_rev_Matrix
  #(
      .Kw(Kw),
      .Km(Km),
      .M(M),
      .W(W)
  )
  WPref_rev_Matrix_
  (
    .wPref_rev(wPref_rev),
    .raddr1(wPref_rev_Matrix_raddr1),
    .rdata1(wPref_rev_Matrix_rdata1),
    .raddr2(wPref_rev_Matrix_raddr2),
    .rdata2(wPref_rev_Matrix_rdata2)
  );

  PC
  #(
    .Kw(Kw),
    .Km(Km),
    .M(M),
    .W(W)
  )
  PC_
  (
    .clk(clk),
    .rst(rst),
    .addr(pc_addr),
    .wdata(pc_wdata),
    .wen(pc_wen),
    .rdata(pc_rdata)
  );

  MIsMatch
  #(
    .Kw(Kw),
    .Km(Km),
    .M(M),
    .W(W)
  )
  MIsMatch_
  (
    .clk(clk),
    .rst(rst),
    .waddr1(mIsMatch_waddr1),
    .wdata1(mIsMatch_wdata1),
    .wen1(mIsMatch_wen1),
    .waddr2(mIsMatch_waddr2),
    .wdata2(mIsMatch_wdata2),
    .wen2(mIsMatch_wen2),
    .raddr(mIsMatch_raddr),
    .rdata(mIsMatch_rdata)
  );

  WIsMatch
  #(
    .Kw(Kw),
    .Km(Km),
    .M(M),
    .W(W)
  )
  WIsMatch_
  (
    .clk(clk),
    .rst(rst),
    .addr(wIsMatch_addr),
    .wdata(wIsMatch_wdata),
    .wen(wIsMatch_wen),
    .rdata(wIsMatch_rdata)
  );

  MatchListMatrix
  #(
    .Kw(Kw),
    .Km(Km),
    .M(M),
    .W(W)
  )
  MatchListMatrix_
  (
    .clk(clk),
    .rst(rst),
    .addr(matchListMatrix_addr),
    .wdata(matchListMatrix_wdata),
    .wen(matchListMatrix_wen),
    .rdata(matchListMatrix_rdata),
    .matchList(matchList)
  );

  stable_match_core
  #(
    .Kw(Kw),
    .Km(Km),
    .M(M),
    .W(W)
  )
  stable_match_core_
  (
    .clk(clk),
    .rst(rst),
    .state(state),
    .mIndex(mIndex),
    .wIndex(wIndex),
    .m(m),
    .w(w),
    .mPrefMatrix_raddr(mPrefMatrix_raddr),
    .mPrefMatrix_rdata(mPrefMatrix_rdata),
    .pc_addr(pc_addr),
    .pc_wdata(pc_wdata),
    .pc_wen(pc_wen),
    .pc_rdata(pc_rdata),
    .wIsMatch_addr(wIsMatch_addr),
    .wIsMatch_wdata(wIsMatch_wdata),
    .wIsMatch_wen(wIsMatch_wen),
    .wIsMatch_rdata(wIsMatch_rdata),
    .matchListMatrix_addr(matchListMatrix_addr),
    .matchListMatrix_wdata(matchListMatrix_wdata),
    .matchListMatrix_wen(matchListMatrix_wen),
    .matchListMatrix_rdata(matchListMatrix_rdata),
    .wPref_rev_Matrix_raddr1(wPref_rev_Matrix_raddr1),
    .wPref_rev_Matrix_rdata1(wPref_rev_Matrix_rdata1),
    .wPref_rev_Matrix_raddr2(wPref_rev_Matrix_raddr2),
    .wPref_rev_Matrix_rdata2(wPref_rev_Matrix_rdata2),
    .mIsMatch_waddr1(mIsMatch_waddr1),
    .mIsMatch_wdata1(mIsMatch_wdata1),
    .mIsMatch_wen1(mIsMatch_wen1),
    .mIsMatch_waddr2(mIsMatch_waddr2),
    .mIsMatch_wdata2(mIsMatch_wdata2),
    .mIsMatch_wen2(mIsMatch_wen2),
    .mIsMatch_raddr(mIsMatch_raddr),
    .mIsMatch_rdata(mIsMatch_rdata)
  );

endmodule

module stable_match_core
#(
  parameter Kw =8,
  parameter Km =8,
  parameter M  =8,
  parameter W  =8
)
(
  clk,
  rst,
  state,
  mIndex,
  wIndex,
  m,
  w,
  mPrefMatrix_raddr,
  mPrefMatrix_rdata,
  pc_addr,
  pc_wdata,
  pc_wen,
  pc_rdata,
  wIsMatch_addr,
  wIsMatch_wdata,
  wIsMatch_wen,
  wIsMatch_rdata,
  matchListMatrix_addr,
  matchListMatrix_wdata,
  matchListMatrix_wen,
  matchListMatrix_rdata,
  wPref_rev_Matrix_raddr1,
  wPref_rev_Matrix_rdata1,
  wPref_rev_Matrix_raddr2,
  wPref_rev_Matrix_rdata2,
  mIsMatch_waddr1,
  mIsMatch_wdata1,
  mIsMatch_wen1,
  mIsMatch_waddr2,
  mIsMatch_wdata2,
  mIsMatch_wen2,
  mIsMatch_raddr,
  mIsMatch_rdata
);

  function integer log2;
    input [31:0] value;
    reg [31:0] temp;
  begin
    temp = value - 1;
    for (log2=0; temp>0; log2=log2+1)
      temp = temp>>1;
  end
  endfunction

  localparam logM = log2(M);
  localparam logW = log2(W);
  localparam logKm = log2(Km);
  localparam logKw = log2(Kw);

  localparam state_select_m=0;
  localparam state_select_w=2;
  localparam state_wait_w = 3;
  localparam state_do_proposal = 4;


  input clk,rst;
  output reg [logM-1:0] mIndex;
  output reg [logW-1:0] wIndex;
  output reg [2:0] state;
  output reg [logM-1:0] m;
  output reg [logW-1:0] w;


  output [logKm-1:0] mPrefMatrix_raddr;
  input [logW-1:0]   mPrefMatrix_rdata;
  output [logM-1:0]  pc_addr;
  output [logKm:0]   pc_wdata;
  output pc_wen;
  input [logKm:0]  pc_rdata;
  output [logW-1:0] wIsMatch_addr;
  output wIsMatch_wdata;
  output wIsMatch_wen;
  input wIsMatch_rdata;
  output [logW-1:0] matchListMatrix_addr;
  output [logM:0] matchListMatrix_wdata;
  output matchListMatrix_wen;
  input [logM:0] matchListMatrix_rdata;
  output [logM-1:0]   wPref_rev_Matrix_raddr1;
  input [logKw-1:0]  wPref_rev_Matrix_rdata1;
  output [logM-1:0]   wPref_rev_Matrix_raddr2;
  input [logKw-1:0]  wPref_rev_Matrix_rdata2;
  output [logM-1:0] mIsMatch_waddr1;
  output mIsMatch_wdata1;
  output mIsMatch_wen1;
  output [logM-1:0] mIsMatch_waddr2;
  output mIsMatch_wdata2;
  output mIsMatch_wen2;
  output [logM-1:0] mIsMatch_raddr;
  input mIsMatch_rdata;

  reg [2:0] nState;

  wire [logKm:0] pc_mIndex;
  wire [logM-1:0] m_assigned;
  wire better;
  wire propose;
  wire can_propose;

  assign m_assigned = matchListMatrix_rdata;
  assign better = (wPref_rev_Matrix_rdata1 < wPref_rev_Matrix_rdata2);
  assign can_propose = |pc_mIndex & ~mIsMatch_rdata;
  assign mPrefMatrix_raddr = Km-pc_mIndex;

  assign pc_addr = mIndex;
  assign pc_wdata = pc_mIndex-1;
  assign pc_wen = state==state_select_m && can_propose;
  assign pc_mIndex = pc_rdata;

  assign mIsMatch_waddr1 = m;
  assign mIsMatch_wdata1 = 1'b1;
  assign mIsMatch_wen1 = (state==state_do_proposal) &&
    (wIsMatch_rdata==0 || (wIsMatch_rdata!=0 && better));
  assign mIsMatch_waddr2 = m_assigned;
  assign mIsMatch_wdata2 = 1'b0;
  assign mIsMatch_wen2 = (state==state_do_proposal) &&
    (wIsMatch_rdata!=0 && better);
  assign mIsMatch_raddr = mIndex;

  assign wIsMatch_addr = w;
  assign wIsMatch_wdata = 1'b1;
  assign wIsMatch_wen = state==state_do_proposal && wIsMatch_rdata;

  assign matchListMatrix_addr = w;
  assign matchListMatrix_wdata = m;
  assign matchListMatrix_wen = (state==state_do_proposal) &&
    (wIsMatch_rdata==0 || (wIsMatch_rdata!=0 && better));

  assign wPref_rev_Matrix_raddr1 = m;
  assign wPref_rev_Matrix_raddr2 = m_assigned;


  always@(*) begin
    nState = state_select_m;
    case (state)
      state_select_m: begin
        if(can_propose)
          nState = state_wait_w;
        else
          nState = state_select_m;
      end
      state_wait_w: begin
        if (wIndex + 1 == w) begin
          nState=state_do_proposal;
        end else begin
          nState=state_wait_w;
        end
      end
      state_do_proposal: begin
        nState=state_select_m;
      end
      default: begin
        nState=state_select_m;
      end
    endcase
  end

  integer k;
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      m<=0;
      w<=0;
      mIndex<=0;
      wIndex<=0;
      state<=state_select_m;
    end else begin
      state <= nState;
      mIndex <= (mIndex+1);
      wIndex <= (wIndex+1);

      if (state==state_select_m) begin
        m <= mIndex;
        w <= mPrefMatrix_rdata;
      end
    end
  end

endmodule


module MPrefMatrix
#(
  parameter Kw =8,
  parameter Km =8,
  parameter M  =8,
  parameter W  =8
)
(
  mPref,
  raddr,
  rdata
);

  function integer log2;
    input [31:0] value;
    reg [31:0] temp;
  begin
    temp = value - 1;
    for (log2=0; temp>0; log2=log2+1)
      temp = temp>>1;
  end
  endfunction

  localparam logM = log2(M);
  localparam logW = log2(W);
  localparam logKm = log2(Km);
  localparam logKw = log2(Kw);

  input   [Km*logW-1:0] mPref;
  input   [logKm-1:0]   raddr;
  output  [logW-1:0]    rdata;


  wire [logW-1:0] mPrefMatrix [Km-1:0]; // nlogn = 7n

  genvar j;
  generate
    for (j=0;j<Km;j=j+1) begin : mPref_asgn2
      assign mPrefMatrix [j] = mPref [logW*(j+1)-1:logW*j];
    end
  endgenerate

  assign rdata = mPrefMatrix[raddr];

endmodule


module WPref_rev_Matrix
#(
  parameter Kw =8,
  parameter Km =8,
  parameter M  =8,
  parameter W  =8
)
(
  wPref_rev,
  raddr1,
  rdata1,
  raddr2,
  rdata2
);

  function integer log2;
    input [31:0] value;
    reg [31:0] temp;
  begin
    temp = value - 1;
    for (log2=0; temp>0; log2=log2+1)
      temp = temp>>1;
  end
  endfunction

  localparam logM = log2(M);
  localparam logW = log2(W);
  localparam logKm = log2(Km);
  localparam logKw = log2(Kw);

  input [M*logKw-1:0] wPref_rev;
  input   [logM-1:0]   raddr1;
  output  [logKw-1:0]  rdata1;
  input   [logM-1:0]   raddr2;
  output  [logKw-1:0]  rdata2;

  wire [logKw-1:0] wPref_rev_Matrix [M-1:0]; // 2nlogn = 14n

  genvar j;
  generate
    for (j=0;j<Kw;j=j+1) begin : wPref_rev_asgn2
      assign wPref_rev_Matrix [j] = wPref_rev [logM*(j+1)-1:logM*j];
    end
  endgenerate

  assign rdata1 = wPref_rev_Matrix[raddr1];
  assign rdata2 = wPref_rev_Matrix[raddr2];

endmodule

module PC
#(
  parameter Kw =8,
  parameter Km =8,
  parameter M  =8,
  parameter W  =8
)
(
  clk,
  rst,
  addr,
  wdata,
  wen,
  rdata
);

  function integer log2;
    input [31:0] value;
    reg [31:0] temp;
  begin
    temp = value - 1;
    for (log2=0; temp>0; log2=log2+1)
      temp = temp>>1;
  end
  endfunction

  localparam logM = log2(M);
  localparam logW = log2(W);
  localparam logKm = log2(Km);
  localparam logKw = log2(Kw);

  input clk,rst;
  input [logM-1:0] addr;
  input [logKm:0] wdata;
  input wen;
  output [logKm:0] rdata;

  reg [logKm:0] pc [M-1:0]; // 2*nlogn + n = 15n

  integer k;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      for (k=0;k<M;k=k+1) begin :always_line
        pc[k] <= Km;
      end
    end
    else if (wen) begin
      pc[addr] <= wdata;
    end
  end

  assign rdata = pc[addr];

endmodule

module MIsMatch
#(
  parameter Kw =8,
  parameter Km =8,
  parameter M  =8,
  parameter W  =8
)
(
  clk,
  rst,
  waddr1,
  wdata1,
  wen1,
  waddr2,
  wdata2,
  wen2,
  raddr,
  rdata
);

  function integer log2;
    input [31:0] value;
    reg [31:0] temp;
  begin
    temp = value - 1;
    for (log2=0; temp>0; log2=log2+1)
      temp = temp>>1;
  end
  endfunction

  localparam logM = log2(M);
  localparam logW = log2(W);
  localparam logKm = log2(Km);
  localparam logKw = log2(Kw);

  input clk,rst;

  input [logM-1:0] waddr1;
  input wdata1;
  input wen1;
  input [logM-1:0] waddr2;
  input wdata2;
  input wen2;
  input [logM-1:0] raddr;
  output rdata;


  reg [M-1:0] mIsMatch; // 7n

  integer k;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      for (k=0;k<M;k=k+1) begin :always_line
        mIsMatch[k] <= 1'b0;
      end
    end else if (wen1) begin
      mIsMatch[waddr1] <= wdata1;
    end else if (wen2) begin
      mIsMatch[waddr2] <= wdata2;
    end
  end

  assign rdata = mIsMatch[raddr];

endmodule

module WIsMatch
#(
  parameter Kw =8,
  parameter Km =8,
  parameter M  =8,
  parameter W  =8
)
(
  clk,
  rst,
  addr,
  wdata,
  wen,
  rdata
);

  function integer log2;
    input [31:0] value;
    reg [31:0] temp;
  begin
    temp = value - 1;
    for (log2=0; temp>0; log2=log2+1)
      temp = temp>>1;
  end
  endfunction

  localparam logM = log2(M);
  localparam logW = log2(W);
  localparam logKm = log2(Km);
  localparam logKw = log2(Kw);

  input clk,rst;
  input [logW-1:0] addr;
  input wdata;
  input wen;
  output rdata;

  reg wIsMatch[W-1:0]; // 3n

  integer k;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      for (k=0;k<W;k=k+1) begin :always_line
        wIsMatch[k] <= 1'b0;
      end
    end
    else if (wen) begin
      wIsMatch[addr] <= wdata;
    end
  end

  assign rdata = wIsMatch[addr];

endmodule

module MatchListMatrix
#(
  parameter Kw =8,
  parameter Km =8,
  parameter M  =8,
  parameter W  =8
)
(
  clk,
  rst,
  addr,
  wdata,
  wen,
  rdata,
  matchList
);

  function integer log2;
    input [31:0] value;
    reg [31:0] temp;
  begin
    temp = value - 1;
    for (log2=0; temp>0; log2=log2+1)
      temp = temp>>1;
  end
  endfunction

  localparam logM = log2(M);
  localparam logW = log2(W);
  localparam logKm = log2(Km);
  localparam logKw = log2(Kw);

  input clk,rst;
  input [logW-1:0] addr;
  input [logM:0] wdata;
  input wen;
  output [logM:0] rdata;
  output [W*logM-1:0] matchList;

  reg [logM-1:0] matchListMatrix [W-1:0]; // 2*nlogn + n = 15n

  integer k;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      for (k=0;k<M;k=k+1) begin :always_line
        matchListMatrix[k] <= Km;
      end
    end
    else if (wen) begin
      matchListMatrix[addr] <= wdata;
    end
  end

  assign rdata = matchListMatrix[addr];

  genvar i;
  generate
    for (i=0;i<W;i=i+1)begin : matchList_asgn1
      assign matchList [logM*(i+1)-1:logM*i] = matchListMatrix [i] ;
    end
  endgenerate


endmodule
