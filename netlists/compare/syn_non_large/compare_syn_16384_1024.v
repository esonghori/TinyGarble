
module compare_N16384_CC1024 ( clk, rst, x, y, g, e );
  input [15:0] x;
  input [15:0] y;
  input clk, rst;
  output g, e;
  wire   ebreg, n4, n5, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89;

  DFF ebreg_reg ( .D(n5), .CLK(clk), .RST(rst), .Q(ebreg) );
  DFF greg_reg ( .D(n4), .CLK(clk), .RST(rst), .Q(g) );
  IV U10 ( .A(ebreg), .Z(e) );
  NANDN U11 ( .A(y[14]), .B(x[14]), .Z(n79) );
  NANDN U12 ( .A(y[8]), .B(x[8]), .Z(n45) );
  ANDN U13 ( .B(x[10]), .A(y[10]), .Z(n42) );
  ANDN U14 ( .B(n45), .A(n42), .Z(n8) );
  AND U15 ( .A(n79), .B(n8), .Z(n9) );
  NANDN U16 ( .A(y[12]), .B(x[12]), .Z(n40) );
  NAND U17 ( .A(n9), .B(n40), .Z(n13) );
  NANDN U18 ( .A(y[6]), .B(x[6]), .Z(n47) );
  NANDN U19 ( .A(y[0]), .B(x[0]), .Z(n50) );
  NANDN U20 ( .A(y[4]), .B(x[4]), .Z(n49) );
  AND U21 ( .A(n50), .B(n49), .Z(n10) );
  AND U22 ( .A(n47), .B(n10), .Z(n11) );
  NANDN U23 ( .A(y[2]), .B(x[2]), .Z(n55) );
  NAND U24 ( .A(n11), .B(n55), .Z(n12) );
  NOR U25 ( .A(n13), .B(n12), .Z(n25) );
  XNOR U26 ( .A(y[13]), .B(x[13]), .Z(n15) );
  NANDN U27 ( .A(x[12]), .B(y[12]), .Z(n14) );
  NAND U28 ( .A(n15), .B(n14), .Z(n77) );
  XNOR U29 ( .A(y[9]), .B(x[9]), .Z(n17) );
  NANDN U30 ( .A(x[8]), .B(y[8]), .Z(n16) );
  NAND U31 ( .A(n17), .B(n16), .Z(n69) );
  XNOR U32 ( .A(y[11]), .B(x[11]), .Z(n19) );
  NANDN U33 ( .A(x[10]), .B(y[10]), .Z(n18) );
  NAND U34 ( .A(n19), .B(n18), .Z(n73) );
  NOR U35 ( .A(n69), .B(n73), .Z(n22) );
  XNOR U36 ( .A(y[15]), .B(x[15]), .Z(n21) );
  NANDN U37 ( .A(x[14]), .B(y[14]), .Z(n20) );
  NAND U38 ( .A(n21), .B(n20), .Z(n83) );
  ANDN U39 ( .B(n22), .A(n83), .Z(n23) );
  NANDN U40 ( .A(n77), .B(n23), .Z(n24) );
  ANDN U41 ( .B(n25), .A(n24), .Z(n38) );
  XNOR U42 ( .A(y[7]), .B(x[7]), .Z(n27) );
  NANDN U43 ( .A(x[6]), .B(y[6]), .Z(n26) );
  NAND U44 ( .A(n27), .B(n26), .Z(n65) );
  XNOR U45 ( .A(y[3]), .B(x[3]), .Z(n29) );
  NANDN U46 ( .A(x[2]), .B(y[2]), .Z(n28) );
  NAND U47 ( .A(n29), .B(n28), .Z(n57) );
  XNOR U48 ( .A(y[5]), .B(x[5]), .Z(n31) );
  NANDN U49 ( .A(x[4]), .B(y[4]), .Z(n30) );
  NAND U50 ( .A(n31), .B(n30), .Z(n61) );
  NOR U51 ( .A(n57), .B(n61), .Z(n35) );
  XNOR U52 ( .A(y[1]), .B(x[1]), .Z(n33) );
  NANDN U53 ( .A(x[0]), .B(y[0]), .Z(n32) );
  NAND U54 ( .A(n33), .B(n32), .Z(n34) );
  ANDN U55 ( .B(n35), .A(n34), .Z(n36) );
  NANDN U56 ( .A(n65), .B(n36), .Z(n37) );
  ANDN U57 ( .B(n38), .A(n37), .Z(n39) );
  NAND U58 ( .A(e), .B(n39), .Z(n5) );
  NANDN U59 ( .A(n39), .B(e), .Z(n87) );
  ANDN U60 ( .B(x[15]), .A(y[15]), .Z(n85) );
  ANDN U61 ( .B(x[13]), .A(y[13]), .Z(n81) );
  NANDN U62 ( .A(y[11]), .B(x[11]), .Z(n41) );
  AND U63 ( .A(n41), .B(n40), .Z(n75) );
  NANDN U64 ( .A(y[9]), .B(x[9]), .Z(n43) );
  ANDN U65 ( .B(n43), .A(n42), .Z(n71) );
  NANDN U66 ( .A(y[7]), .B(x[7]), .Z(n44) );
  AND U67 ( .A(n45), .B(n44), .Z(n67) );
  NANDN U68 ( .A(y[5]), .B(x[5]), .Z(n46) );
  AND U69 ( .A(n47), .B(n46), .Z(n63) );
  NANDN U70 ( .A(y[3]), .B(x[3]), .Z(n48) );
  AND U71 ( .A(n49), .B(n48), .Z(n59) );
  NANDN U72 ( .A(x[1]), .B(n50), .Z(n53) );
  XNOR U73 ( .A(n50), .B(x[1]), .Z(n51) );
  NAND U74 ( .A(n51), .B(y[1]), .Z(n52) );
  NAND U75 ( .A(n53), .B(n52), .Z(n54) );
  AND U76 ( .A(n55), .B(n54), .Z(n56) );
  OR U77 ( .A(n57), .B(n56), .Z(n58) );
  AND U78 ( .A(n59), .B(n58), .Z(n60) );
  OR U79 ( .A(n61), .B(n60), .Z(n62) );
  AND U80 ( .A(n63), .B(n62), .Z(n64) );
  OR U81 ( .A(n65), .B(n64), .Z(n66) );
  AND U82 ( .A(n67), .B(n66), .Z(n68) );
  OR U83 ( .A(n69), .B(n68), .Z(n70) );
  AND U84 ( .A(n71), .B(n70), .Z(n72) );
  OR U85 ( .A(n73), .B(n72), .Z(n74) );
  AND U86 ( .A(n75), .B(n74), .Z(n76) );
  OR U87 ( .A(n77), .B(n76), .Z(n78) );
  AND U88 ( .A(n79), .B(n78), .Z(n80) );
  NANDN U89 ( .A(n81), .B(n80), .Z(n82) );
  NANDN U90 ( .A(n83), .B(n82), .Z(n84) );
  NANDN U91 ( .A(n85), .B(n84), .Z(n86) );
  NANDN U92 ( .A(n87), .B(n86), .Z(n89) );
  NAND U93 ( .A(n87), .B(g), .Z(n88) );
  NAND U94 ( .A(n89), .B(n88), .Z(n4) );
endmodule

