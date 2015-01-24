
module first_nns_seq_W7 ( clk, rst, q, DB, min_val_out );
  input [6:0] q;
  input [6:0] DB;
  output [6:0] min_val_out;
  input clk, rst;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62;
  wire   [2:0] min_dist_reg;
  wire   [6:0] min_val_reg;
  wire   [2:0] min_dist;

  DFF \min_dist_reg_reg[0]  ( .D(min_dist[0]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[0]) );
  DFF \min_dist_reg_reg[1]  ( .D(min_dist[1]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[1]) );
  DFF \min_dist_reg_reg[2]  ( .D(min_dist[2]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[2]) );
  DFF \min_val_reg_reg[0]  ( .D(min_val_out[0]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[0]) );
  DFF \min_val_reg_reg[1]  ( .D(min_val_out[1]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[1]) );
  DFF \min_val_reg_reg[2]  ( .D(min_val_out[2]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[2]) );
  DFF \min_val_reg_reg[3]  ( .D(min_val_out[3]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[3]) );
  DFF \min_val_reg_reg[4]  ( .D(min_val_out[4]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[4]) );
  DFF \min_val_reg_reg[5]  ( .D(min_val_out[5]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[5]) );
  DFF \min_val_reg_reg[6]  ( .D(min_val_out[6]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[6]) );
  XOR U13 ( .A(DB[6]), .B(n11), .Z(min_val_out[6]) );
  AND U14 ( .A(n12), .B(n13), .Z(n11) );
  XOR U15 ( .A(min_val_reg[6]), .B(DB[6]), .Z(n13) );
  XOR U16 ( .A(DB[5]), .B(n14), .Z(min_val_out[5]) );
  AND U17 ( .A(n12), .B(n15), .Z(n14) );
  XOR U18 ( .A(min_val_reg[5]), .B(DB[5]), .Z(n15) );
  XOR U19 ( .A(DB[4]), .B(n16), .Z(min_val_out[4]) );
  AND U20 ( .A(n12), .B(n17), .Z(n16) );
  XOR U21 ( .A(min_val_reg[4]), .B(DB[4]), .Z(n17) );
  XOR U22 ( .A(DB[3]), .B(n18), .Z(min_val_out[3]) );
  AND U23 ( .A(n12), .B(n19), .Z(n18) );
  XOR U24 ( .A(min_val_reg[3]), .B(DB[3]), .Z(n19) );
  XOR U25 ( .A(DB[2]), .B(n20), .Z(min_val_out[2]) );
  AND U26 ( .A(n12), .B(n21), .Z(n20) );
  XOR U27 ( .A(min_val_reg[2]), .B(DB[2]), .Z(n21) );
  XOR U28 ( .A(DB[1]), .B(n22), .Z(min_val_out[1]) );
  AND U29 ( .A(n12), .B(n23), .Z(n22) );
  XOR U30 ( .A(min_val_reg[1]), .B(DB[1]), .Z(n23) );
  XOR U31 ( .A(DB[0]), .B(n24), .Z(min_val_out[0]) );
  AND U32 ( .A(n12), .B(n25), .Z(n24) );
  XOR U33 ( .A(min_val_reg[0]), .B(DB[0]), .Z(n25) );
  XOR U34 ( .A(n26), .B(n27), .Z(min_dist[2]) );
  AND U35 ( .A(n12), .B(n28), .Z(n26) );
  XOR U36 ( .A(min_dist_reg[2]), .B(n27), .Z(n28) );
  XNOR U37 ( .A(n29), .B(n30), .Z(min_dist[1]) );
  AND U38 ( .A(n12), .B(n31), .Z(n29) );
  XNOR U39 ( .A(min_dist_reg[1]), .B(n30), .Z(n31) );
  XNOR U40 ( .A(n32), .B(n33), .Z(min_dist[0]) );
  AND U41 ( .A(n12), .B(n34), .Z(n32) );
  XNOR U42 ( .A(min_dist_reg[0]), .B(n33), .Z(n34) );
  XOR U43 ( .A(n35), .B(n36), .Z(n12) );
  AND U44 ( .A(n37), .B(n38), .Z(n35) );
  XNOR U45 ( .A(n36), .B(n27), .Z(n38) );
  XNOR U46 ( .A(n39), .B(n40), .Z(n27) );
  ANDN U47 ( .B(n41), .A(n42), .Z(n39) );
  XOR U48 ( .A(n40), .B(n43), .Z(n41) );
  XOR U49 ( .A(min_dist_reg[2]), .B(n36), .Z(n37) );
  XOR U50 ( .A(n44), .B(n45), .Z(n36) );
  NAND U51 ( .A(n46), .B(n47), .Z(n45) );
  XNOR U52 ( .A(n44), .B(n30), .Z(n47) );
  XOR U53 ( .A(n48), .B(n43), .Z(n30) );
  XOR U54 ( .A(q[4]), .B(n49), .Z(n43) );
  NAND U55 ( .A(n50), .B(n51), .Z(n49) );
  XOR U56 ( .A(q[6]), .B(q[4]), .Z(n50) );
  IV U57 ( .A(n42), .Z(n48) );
  XNOR U58 ( .A(n40), .B(n52), .Z(n42) );
  XOR U59 ( .A(q[1]), .B(n53), .Z(n52) );
  NAND U60 ( .A(n54), .B(n55), .Z(n53) );
  XNOR U61 ( .A(q[3]), .B(n56), .Z(n54) );
  IV U62 ( .A(q[1]), .Z(n56) );
  XOR U63 ( .A(q[0]), .B(n57), .Z(n40) );
  NANDN U64 ( .A(n58), .B(n59), .Z(n57) );
  XNOR U65 ( .A(q[0]), .B(n60), .Z(n59) );
  XNOR U66 ( .A(min_dist_reg[1]), .B(n44), .Z(n46) );
  NOR U67 ( .A(n33), .B(min_dist_reg[0]), .Z(n44) );
  XOR U68 ( .A(n61), .B(n60), .Z(n33) );
  XNOR U69 ( .A(n51), .B(q[6]), .Z(n60) );
  XOR U70 ( .A(q[5]), .B(q[4]), .Z(n51) );
  IV U71 ( .A(n58), .Z(n61) );
  XOR U72 ( .A(n55), .B(n62), .Z(n58) );
  XNOR U73 ( .A(q[3]), .B(q[0]), .Z(n62) );
  XOR U74 ( .A(q[2]), .B(q[1]), .Z(n55) );
endmodule

