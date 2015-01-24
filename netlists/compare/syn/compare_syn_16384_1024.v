
module compare_N16384_CC1024 ( clk, rst, x, y, g );
  input [15:0] x;
  input [15:0] y;
  input clk, rst;
  output g;
  wire   ci, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80;

  DFF ci_reg ( .D(g), .CLK(clk), .RST(rst), .I(1'b1), .Q(ci) );
  XOR U20 ( .A(y[3]), .B(n67), .Z(n68) );
  XOR U21 ( .A(y[7]), .B(n51), .Z(n52) );
  XOR U22 ( .A(y[11]), .B(n35), .Z(n36) );
  XOR U23 ( .A(y[4]), .B(n63), .Z(n64) );
  XOR U24 ( .A(y[8]), .B(n47), .Z(n48) );
  XOR U25 ( .A(y[12]), .B(n31), .Z(n32) );
  XOR U26 ( .A(y[5]), .B(n59), .Z(n60) );
  XOR U27 ( .A(y[9]), .B(n43), .Z(n44) );
  XOR U28 ( .A(y[13]), .B(n27), .Z(n28) );
  XOR U29 ( .A(y[2]), .B(n71), .Z(n72) );
  XOR U30 ( .A(y[6]), .B(n55), .Z(n56) );
  XOR U31 ( .A(y[10]), .B(n39), .Z(n40) );
  XOR U32 ( .A(y[14]), .B(n23), .Z(n24) );
  XOR U33 ( .A(n18), .B(n19), .Z(g) );
  AND U34 ( .A(n20), .B(n21), .Z(n18) );
  XOR U35 ( .A(x[15]), .B(n19), .Z(n21) );
  XNOR U36 ( .A(y[15]), .B(n19), .Z(n20) );
  XNOR U37 ( .A(n22), .B(n23), .Z(n19) );
  AND U38 ( .A(n24), .B(n25), .Z(n22) );
  XNOR U39 ( .A(x[14]), .B(n23), .Z(n25) );
  XOR U40 ( .A(n26), .B(n27), .Z(n23) );
  AND U41 ( .A(n28), .B(n29), .Z(n26) );
  XNOR U42 ( .A(x[13]), .B(n27), .Z(n29) );
  XOR U43 ( .A(n30), .B(n31), .Z(n27) );
  AND U44 ( .A(n32), .B(n33), .Z(n30) );
  XNOR U45 ( .A(x[12]), .B(n31), .Z(n33) );
  XOR U46 ( .A(n34), .B(n35), .Z(n31) );
  AND U47 ( .A(n36), .B(n37), .Z(n34) );
  XNOR U48 ( .A(x[11]), .B(n35), .Z(n37) );
  XOR U49 ( .A(n38), .B(n39), .Z(n35) );
  AND U50 ( .A(n40), .B(n41), .Z(n38) );
  XNOR U51 ( .A(x[10]), .B(n39), .Z(n41) );
  XOR U52 ( .A(n42), .B(n43), .Z(n39) );
  AND U53 ( .A(n44), .B(n45), .Z(n42) );
  XNOR U54 ( .A(x[9]), .B(n43), .Z(n45) );
  XOR U55 ( .A(n46), .B(n47), .Z(n43) );
  AND U56 ( .A(n48), .B(n49), .Z(n46) );
  XNOR U57 ( .A(x[8]), .B(n47), .Z(n49) );
  XOR U58 ( .A(n50), .B(n51), .Z(n47) );
  AND U59 ( .A(n52), .B(n53), .Z(n50) );
  XNOR U60 ( .A(x[7]), .B(n51), .Z(n53) );
  XOR U61 ( .A(n54), .B(n55), .Z(n51) );
  AND U62 ( .A(n56), .B(n57), .Z(n54) );
  XNOR U63 ( .A(x[6]), .B(n55), .Z(n57) );
  XOR U64 ( .A(n58), .B(n59), .Z(n55) );
  AND U65 ( .A(n60), .B(n61), .Z(n58) );
  XNOR U66 ( .A(x[5]), .B(n59), .Z(n61) );
  XOR U67 ( .A(n62), .B(n63), .Z(n59) );
  AND U68 ( .A(n64), .B(n65), .Z(n62) );
  XNOR U69 ( .A(x[4]), .B(n63), .Z(n65) );
  XOR U70 ( .A(n66), .B(n67), .Z(n63) );
  AND U71 ( .A(n68), .B(n69), .Z(n66) );
  XNOR U72 ( .A(x[3]), .B(n67), .Z(n69) );
  XOR U73 ( .A(n70), .B(n71), .Z(n67) );
  AND U74 ( .A(n72), .B(n73), .Z(n70) );
  XNOR U75 ( .A(x[2]), .B(n71), .Z(n73) );
  XOR U76 ( .A(n74), .B(n75), .Z(n71) );
  AND U77 ( .A(n76), .B(n77), .Z(n74) );
  XNOR U78 ( .A(x[1]), .B(n75), .Z(n77) );
  XOR U79 ( .A(y[1]), .B(n75), .Z(n76) );
  XOR U80 ( .A(ci), .B(n78), .Z(n75) );
  NANDN U81 ( .A(n79), .B(n80), .Z(n78) );
  XOR U82 ( .A(x[0]), .B(ci), .Z(n80) );
  XOR U83 ( .A(y[0]), .B(ci), .Z(n79) );
endmodule

