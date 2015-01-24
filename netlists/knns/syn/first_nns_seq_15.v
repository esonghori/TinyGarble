
module first_nns_seq_W15 ( clk, rst, q, DB, min_val_out );
  input [14:0] q;
  input [14:0] DB;
  output [14:0] min_val_out;
  input clk, rst;
  wire   n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136;
  wire   [3:0] min_dist_reg;
  wire   [14:0] min_val_reg;
  wire   [3:0] min_dist;

  DFF \min_dist_reg_reg[0]  ( .D(min_dist[0]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[0]) );
  DFF \min_dist_reg_reg[1]  ( .D(min_dist[1]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[1]) );
  DFF \min_dist_reg_reg[2]  ( .D(min_dist[2]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[2]) );
  DFF \min_dist_reg_reg[3]  ( .D(min_dist[3]), .CLK(clk), .RST(rst), .I(1'b1), 
        .Q(min_dist_reg[3]) );
  DFF \min_val_reg_reg[0]  ( .D(min_val_out[0]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[0]) );
  DFF \min_val_reg_reg[1]  ( .D(min_val_out[1]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[1]) );
  DFF \min_val_reg_reg[2]  ( .D(min_val_out[2]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[2]) );
  DFF \min_val_reg_reg[3]  ( .D(min_val_out[3]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[3]) );
  DFF \min_val_reg_reg[4]  ( .D(min_val_out[4]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[4]) );
  DFF \min_val_reg_reg[5]  ( .D(min_val_out[5]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[5]) );
  DFF \min_val_reg_reg[6]  ( .D(min_val_out[6]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[6]) );
  DFF \min_val_reg_reg[7]  ( .D(min_val_out[7]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[7]) );
  DFF \min_val_reg_reg[8]  ( .D(min_val_out[8]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[8]) );
  DFF \min_val_reg_reg[9]  ( .D(min_val_out[9]), .CLK(clk), .RST(rst), .I(1'b0), .Q(min_val_reg[9]) );
  DFF \min_val_reg_reg[10]  ( .D(min_val_out[10]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[10]) );
  DFF \min_val_reg_reg[11]  ( .D(min_val_out[11]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[11]) );
  DFF \min_val_reg_reg[12]  ( .D(min_val_out[12]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[12]) );
  DFF \min_val_reg_reg[13]  ( .D(min_val_out[13]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[13]) );
  DFF \min_val_reg_reg[14]  ( .D(min_val_out[14]), .CLK(clk), .RST(rst), .I(
        1'b0), .Q(min_val_reg[14]) );
  XOR U22 ( .A(DB[9]), .B(n20), .Z(min_val_out[9]) );
  AND U23 ( .A(n21), .B(n22), .Z(n20) );
  XOR U24 ( .A(min_val_reg[9]), .B(DB[9]), .Z(n22) );
  XOR U25 ( .A(DB[8]), .B(n23), .Z(min_val_out[8]) );
  AND U26 ( .A(n21), .B(n24), .Z(n23) );
  XOR U27 ( .A(min_val_reg[8]), .B(DB[8]), .Z(n24) );
  XOR U28 ( .A(DB[7]), .B(n25), .Z(min_val_out[7]) );
  AND U29 ( .A(n21), .B(n26), .Z(n25) );
  XOR U30 ( .A(min_val_reg[7]), .B(DB[7]), .Z(n26) );
  XOR U31 ( .A(DB[6]), .B(n27), .Z(min_val_out[6]) );
  AND U32 ( .A(n21), .B(n28), .Z(n27) );
  XOR U33 ( .A(min_val_reg[6]), .B(DB[6]), .Z(n28) );
  XOR U34 ( .A(DB[5]), .B(n29), .Z(min_val_out[5]) );
  AND U35 ( .A(n21), .B(n30), .Z(n29) );
  XOR U36 ( .A(min_val_reg[5]), .B(DB[5]), .Z(n30) );
  XOR U37 ( .A(DB[4]), .B(n31), .Z(min_val_out[4]) );
  AND U38 ( .A(n21), .B(n32), .Z(n31) );
  XOR U39 ( .A(min_val_reg[4]), .B(DB[4]), .Z(n32) );
  XOR U40 ( .A(DB[3]), .B(n33), .Z(min_val_out[3]) );
  AND U41 ( .A(n21), .B(n34), .Z(n33) );
  XOR U42 ( .A(min_val_reg[3]), .B(DB[3]), .Z(n34) );
  XOR U43 ( .A(DB[2]), .B(n35), .Z(min_val_out[2]) );
  AND U44 ( .A(n21), .B(n36), .Z(n35) );
  XOR U45 ( .A(min_val_reg[2]), .B(DB[2]), .Z(n36) );
  XOR U46 ( .A(DB[1]), .B(n37), .Z(min_val_out[1]) );
  AND U47 ( .A(n21), .B(n38), .Z(n37) );
  XOR U48 ( .A(min_val_reg[1]), .B(DB[1]), .Z(n38) );
  XOR U49 ( .A(DB[14]), .B(n39), .Z(min_val_out[14]) );
  AND U50 ( .A(n21), .B(n40), .Z(n39) );
  XOR U51 ( .A(min_val_reg[14]), .B(DB[14]), .Z(n40) );
  XOR U52 ( .A(DB[13]), .B(n41), .Z(min_val_out[13]) );
  AND U53 ( .A(n21), .B(n42), .Z(n41) );
  XOR U54 ( .A(min_val_reg[13]), .B(DB[13]), .Z(n42) );
  XOR U55 ( .A(DB[12]), .B(n43), .Z(min_val_out[12]) );
  AND U56 ( .A(n21), .B(n44), .Z(n43) );
  XOR U57 ( .A(min_val_reg[12]), .B(DB[12]), .Z(n44) );
  XOR U58 ( .A(DB[11]), .B(n45), .Z(min_val_out[11]) );
  AND U59 ( .A(n21), .B(n46), .Z(n45) );
  XOR U60 ( .A(min_val_reg[11]), .B(DB[11]), .Z(n46) );
  XOR U61 ( .A(DB[10]), .B(n47), .Z(min_val_out[10]) );
  AND U62 ( .A(n21), .B(n48), .Z(n47) );
  XOR U63 ( .A(min_val_reg[10]), .B(DB[10]), .Z(n48) );
  XOR U64 ( .A(DB[0]), .B(n49), .Z(min_val_out[0]) );
  AND U65 ( .A(n21), .B(n50), .Z(n49) );
  XOR U66 ( .A(min_val_reg[0]), .B(DB[0]), .Z(n50) );
  XOR U67 ( .A(n51), .B(n52), .Z(min_dist[3]) );
  AND U68 ( .A(n21), .B(n53), .Z(n51) );
  XOR U69 ( .A(min_dist_reg[3]), .B(n52), .Z(n53) );
  XNOR U70 ( .A(n54), .B(n55), .Z(min_dist[2]) );
  AND U71 ( .A(n21), .B(n56), .Z(n54) );
  XNOR U72 ( .A(min_dist_reg[2]), .B(n55), .Z(n56) );
  XNOR U73 ( .A(n57), .B(n58), .Z(min_dist[1]) );
  AND U74 ( .A(n21), .B(n59), .Z(n57) );
  XNOR U75 ( .A(min_dist_reg[1]), .B(n58), .Z(n59) );
  XNOR U76 ( .A(n60), .B(n61), .Z(min_dist[0]) );
  AND U77 ( .A(n21), .B(n62), .Z(n60) );
  XNOR U78 ( .A(min_dist_reg[0]), .B(n61), .Z(n62) );
  XNOR U79 ( .A(n63), .B(n64), .Z(n21) );
  AND U80 ( .A(n65), .B(n66), .Z(n63) );
  XNOR U81 ( .A(n67), .B(n52), .Z(n66) );
  XNOR U82 ( .A(n68), .B(n69), .Z(n52) );
  ANDN U83 ( .B(n70), .A(n71), .Z(n68) );
  XOR U84 ( .A(n69), .B(n72), .Z(n70) );
  XNOR U85 ( .A(min_dist_reg[3]), .B(n64), .Z(n65) );
  IV U86 ( .A(n67), .Z(n64) );
  XOR U87 ( .A(n73), .B(n74), .Z(n67) );
  AND U88 ( .A(n75), .B(n76), .Z(n73) );
  XOR U89 ( .A(n74), .B(n55), .Z(n76) );
  XOR U90 ( .A(n77), .B(n72), .Z(n55) );
  XOR U91 ( .A(n78), .B(n79), .Z(n72) );
  ANDN U92 ( .B(n80), .A(n81), .Z(n78) );
  XOR U93 ( .A(n79), .B(n82), .Z(n80) );
  IV U94 ( .A(n71), .Z(n77) );
  XOR U95 ( .A(n83), .B(n84), .Z(n71) );
  XOR U96 ( .A(n85), .B(n86), .Z(n84) );
  ANDN U97 ( .B(n87), .A(n88), .Z(n85) );
  XOR U98 ( .A(n89), .B(n86), .Z(n87) );
  IV U99 ( .A(n69), .Z(n83) );
  XOR U100 ( .A(n90), .B(n91), .Z(n69) );
  ANDN U101 ( .B(n92), .A(n93), .Z(n90) );
  XOR U102 ( .A(n91), .B(n94), .Z(n92) );
  XOR U103 ( .A(min_dist_reg[2]), .B(n74), .Z(n75) );
  XOR U104 ( .A(n95), .B(n96), .Z(n74) );
  NAND U105 ( .A(n97), .B(n98), .Z(n96) );
  XNOR U106 ( .A(n95), .B(n58), .Z(n98) );
  XOR U107 ( .A(n99), .B(n94), .Z(n58) );
  XOR U108 ( .A(n100), .B(n82), .Z(n94) );
  XOR U109 ( .A(q[12]), .B(n101), .Z(n82) );
  NAND U110 ( .A(n102), .B(n103), .Z(n101) );
  XOR U111 ( .A(q[14]), .B(q[12]), .Z(n102) );
  IV U112 ( .A(n81), .Z(n100) );
  XNOR U113 ( .A(n79), .B(n104), .Z(n81) );
  XOR U114 ( .A(q[9]), .B(n105), .Z(n104) );
  NAND U115 ( .A(n106), .B(n107), .Z(n105) );
  XNOR U116 ( .A(n108), .B(q[11]), .Z(n106) );
  IV U117 ( .A(q[9]), .Z(n108) );
  XOR U118 ( .A(q[8]), .B(n109), .Z(n79) );
  NANDN U119 ( .A(n110), .B(n111), .Z(n109) );
  XNOR U120 ( .A(q[8]), .B(n112), .Z(n111) );
  IV U121 ( .A(n93), .Z(n99) );
  XOR U122 ( .A(n113), .B(n114), .Z(n93) );
  XNOR U123 ( .A(n89), .B(n91), .Z(n114) );
  XOR U124 ( .A(q[0]), .B(n115), .Z(n91) );
  NANDN U125 ( .A(n116), .B(n117), .Z(n115) );
  XNOR U126 ( .A(q[0]), .B(n118), .Z(n117) );
  XOR U127 ( .A(q[5]), .B(n119), .Z(n89) );
  NAND U128 ( .A(n120), .B(n121), .Z(n119) );
  XOR U129 ( .A(q[7]), .B(q[5]), .Z(n120) );
  IV U130 ( .A(n88), .Z(n113) );
  XNOR U131 ( .A(n86), .B(n122), .Z(n88) );
  XOR U132 ( .A(q[2]), .B(n123), .Z(n122) );
  NAND U133 ( .A(n124), .B(n125), .Z(n123) );
  XNOR U134 ( .A(q[4]), .B(n126), .Z(n124) );
  IV U135 ( .A(q[2]), .Z(n126) );
  XOR U136 ( .A(q[1]), .B(n127), .Z(n86) );
  NANDN U137 ( .A(n128), .B(n129), .Z(n127) );
  XNOR U138 ( .A(q[1]), .B(n130), .Z(n129) );
  XNOR U139 ( .A(min_dist_reg[1]), .B(n95), .Z(n97) );
  NOR U140 ( .A(n61), .B(min_dist_reg[0]), .Z(n95) );
  XOR U141 ( .A(n131), .B(n118), .Z(n61) );
  XOR U142 ( .A(n132), .B(n112), .Z(n118) );
  XNOR U143 ( .A(n103), .B(q[14]), .Z(n112) );
  XOR U144 ( .A(q[13]), .B(q[12]), .Z(n103) );
  IV U145 ( .A(n110), .Z(n132) );
  XOR U146 ( .A(n107), .B(n133), .Z(n110) );
  XNOR U147 ( .A(q[8]), .B(q[11]), .Z(n133) );
  XOR U148 ( .A(q[10]), .B(q[9]), .Z(n107) );
  IV U149 ( .A(n116), .Z(n131) );
  XOR U150 ( .A(n134), .B(n135), .Z(n116) );
  XOR U151 ( .A(q[0]), .B(n130), .Z(n135) );
  XNOR U152 ( .A(n121), .B(q[7]), .Z(n130) );
  XOR U153 ( .A(q[6]), .B(q[5]), .Z(n121) );
  IV U154 ( .A(n128), .Z(n134) );
  XOR U155 ( .A(n125), .B(n136), .Z(n128) );
  XNOR U156 ( .A(q[4]), .B(q[1]), .Z(n136) );
  XOR U157 ( .A(q[3]), .B(q[2]), .Z(n125) );
endmodule

