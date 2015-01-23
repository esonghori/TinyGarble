
module compare_N16384_CC8192 ( clk, rst, x, y, g, e );
  input [1:0] x;
  input [1:0] y;
  input clk, rst;
  output g, e;
  wire   ebreg, n15, n16, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31;

  DFF ebreg_reg ( .D(n16), .CLK(clk), .RST(rst), .Q(ebreg) );
  DFF greg_reg ( .D(n15), .CLK(clk), .RST(rst), .Q(g) );
  NANDN U20 ( .A(y[1]), .B(x[1]), .Z(n18) );
  OR U21 ( .A(n18), .B(ebreg), .Z(n23) );
  ANDN U22 ( .B(y[1]), .A(x[1]), .Z(n24) );
  IV U23 ( .A(ebreg), .Z(e) );
  NAND U24 ( .A(e), .B(x[0]), .Z(n19) );
  NANDN U25 ( .A(g), .B(n19), .Z(n20) );
  ANDN U26 ( .B(n20), .A(y[0]), .Z(n21) );
  NANDN U27 ( .A(n24), .B(n21), .Z(n22) );
  AND U28 ( .A(n23), .B(n22), .Z(n28) );
  NANDN U29 ( .A(n24), .B(x[0]), .Z(n25) );
  NAND U30 ( .A(e), .B(n25), .Z(n26) );
  NAND U31 ( .A(g), .B(n26), .Z(n27) );
  NAND U32 ( .A(n28), .B(n27), .Z(n15) );
  XNOR U33 ( .A(x[0]), .B(y[0]), .Z(n30) );
  XNOR U34 ( .A(x[1]), .B(y[1]), .Z(n29) );
  AND U35 ( .A(n30), .B(n29), .Z(n31) );
  NAND U36 ( .A(e), .B(n31), .Z(n16) );
endmodule

