
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
         n89, n90;

  DFF ebreg_reg ( .D(n5), .CLK(clk), .RST(rst), .Q(ebreg) );
  DFF greg_reg ( .D(n4), .CLK(clk), .RST(rst), .Q(g) );
  XOR U10 ( .A(n78), .B(y[1]), .Z(n8) );
  ANDN U11 ( .B(n8), .A(x[1]), .Z(n9) );
  NAND U12 ( .A(n78), .B(y[1]), .Z(n10) );
  NANDN U13 ( .A(n9), .B(n10), .Z(n11) );
  ANDN U14 ( .B(n11), .A(n79), .Z(n12) );
  NANDN U15 ( .A(y[3]), .B(x[3]), .Z(n13) );
  NANDN U16 ( .A(n12), .B(n80), .Z(n14) );
  NAND U17 ( .A(n13), .B(n14), .Z(n15) );
  OR U18 ( .A(n81), .B(n15), .Z(n16) );
  ANDN U19 ( .B(n16), .A(n76), .Z(n17) );
  NOR U20 ( .A(n82), .B(n17), .Z(n18) );
  NANDN U21 ( .A(y[5]), .B(x[5]), .Z(n19) );
  AND U22 ( .A(n18), .B(n19), .Z(n20) );
  OR U23 ( .A(n75), .B(n20), .Z(n21) );
  NANDN U24 ( .A(y[7]), .B(x[7]), .Z(n22) );
  AND U25 ( .A(n21), .B(n22), .Z(n23) );
  NANDN U26 ( .A(n83), .B(n23), .Z(n24) );
  NAND U27 ( .A(n84), .B(n24), .Z(n85) );
  AND U28 ( .A(e), .B(n90), .Z(n25) );
  ANDN U29 ( .B(n85), .A(n86), .Z(n26) );
  NANDN U30 ( .A(y[9]), .B(x[9]), .Z(n27) );
  AND U31 ( .A(n26), .B(n27), .Z(n28) );
  OR U32 ( .A(n74), .B(n28), .Z(n29) );
  ANDN U33 ( .B(n29), .A(n87), .Z(n30) );
  NANDN U34 ( .A(y[11]), .B(x[11]), .Z(n31) );
  NAND U35 ( .A(n30), .B(n31), .Z(n32) );
  AND U36 ( .A(n88), .B(n32), .Z(n33) );
  NOR U37 ( .A(n89), .B(n33), .Z(n34) );
  NANDN U38 ( .A(y[13]), .B(x[13]), .Z(n35) );
  NAND U39 ( .A(n34), .B(n35), .Z(n36) );
  NANDN U40 ( .A(n73), .B(n36), .Z(n37) );
  NANDN U41 ( .A(y[15]), .B(x[15]), .Z(n38) );
  NAND U42 ( .A(n37), .B(n38), .Z(n39) );
  NAND U43 ( .A(n39), .B(n25), .Z(n40) );
  NANDN U44 ( .A(n25), .B(g), .Z(n41) );
  NAND U45 ( .A(n40), .B(n41), .Z(n4) );
  IV U46 ( .A(ebreg), .Z(e) );
  XNOR U47 ( .A(y[7]), .B(x[7]), .Z(n43) );
  NANDN U48 ( .A(x[6]), .B(y[6]), .Z(n42) );
  NAND U49 ( .A(n43), .B(n42), .Z(n75) );
  XNOR U50 ( .A(y[3]), .B(x[3]), .Z(n45) );
  NANDN U51 ( .A(x[2]), .B(y[2]), .Z(n44) );
  AND U52 ( .A(n45), .B(n44), .Z(n80) );
  XNOR U53 ( .A(y[5]), .B(x[5]), .Z(n47) );
  NANDN U54 ( .A(x[4]), .B(y[4]), .Z(n46) );
  NAND U55 ( .A(n47), .B(n46), .Z(n76) );
  ANDN U56 ( .B(n80), .A(n76), .Z(n51) );
  XNOR U57 ( .A(y[1]), .B(x[1]), .Z(n49) );
  NANDN U58 ( .A(x[0]), .B(y[0]), .Z(n48) );
  NAND U59 ( .A(n49), .B(n48), .Z(n50) );
  ANDN U60 ( .B(n51), .A(n50), .Z(n52) );
  NANDN U61 ( .A(n75), .B(n52), .Z(n72) );
  XNOR U62 ( .A(x[9]), .B(y[9]), .Z(n54) );
  NANDN U63 ( .A(x[8]), .B(y[8]), .Z(n53) );
  AND U64 ( .A(n54), .B(n53), .Z(n84) );
  XNOR U65 ( .A(x[11]), .B(y[11]), .Z(n56) );
  NANDN U66 ( .A(x[10]), .B(y[10]), .Z(n55) );
  NAND U67 ( .A(n56), .B(n55), .Z(n74) );
  ANDN U68 ( .B(n84), .A(n74), .Z(n70) );
  ANDN U69 ( .B(x[12]), .A(y[12]), .Z(n87) );
  ANDN U70 ( .B(x[8]), .A(y[8]), .Z(n83) );
  ANDN U71 ( .B(x[10]), .A(y[10]), .Z(n86) );
  NOR U72 ( .A(n83), .B(n86), .Z(n57) );
  ANDN U73 ( .B(x[14]), .A(y[14]), .Z(n89) );
  ANDN U74 ( .B(n57), .A(n89), .Z(n58) );
  NANDN U75 ( .A(n87), .B(n58), .Z(n68) );
  XNOR U76 ( .A(x[13]), .B(y[13]), .Z(n60) );
  NANDN U77 ( .A(x[12]), .B(y[12]), .Z(n59) );
  AND U78 ( .A(n60), .B(n59), .Z(n88) );
  XNOR U79 ( .A(x[15]), .B(y[15]), .Z(n62) );
  NANDN U80 ( .A(x[14]), .B(y[14]), .Z(n61) );
  NAND U81 ( .A(n62), .B(n61), .Z(n73) );
  ANDN U82 ( .B(n88), .A(n73), .Z(n66) );
  ANDN U83 ( .B(x[2]), .A(y[2]), .Z(n79) );
  ANDN U84 ( .B(x[0]), .A(y[0]), .Z(n77) );
  ANDN U85 ( .B(x[4]), .A(y[4]), .Z(n81) );
  NOR U86 ( .A(n77), .B(n81), .Z(n63) );
  ANDN U87 ( .B(x[6]), .A(y[6]), .Z(n82) );
  ANDN U88 ( .B(n63), .A(n82), .Z(n64) );
  NANDN U89 ( .A(n79), .B(n64), .Z(n65) );
  ANDN U90 ( .B(n66), .A(n65), .Z(n67) );
  NANDN U91 ( .A(n68), .B(n67), .Z(n69) );
  ANDN U92 ( .B(n70), .A(n69), .Z(n71) );
  NANDN U93 ( .A(n72), .B(n71), .Z(n90) );
  NANDN U94 ( .A(n90), .B(e), .Z(n5) );
  IV U95 ( .A(n77), .Z(n78) );
endmodule

