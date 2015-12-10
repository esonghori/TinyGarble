
module non_secret_test_N8 ( clk, rst, g_input, e_input, o );
  input [7:0] g_input;
  input [7:0] e_input;
  output [7:0] o;
  input clk, rst;
  wire   sel, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65;

  DFF sel_reg ( .D(n2), .CLK(clk), .RST(rst), .I(1'b0), .Q(sel) );
  MUX U5 ( .IN0(g_input[1]), .IN1(n60), .SEL(n61), .F(n51) );
  MUX U6 ( .IN0(n3), .IN1(n38), .SEL(sel), .F(o[4]) );
  IV U7 ( .A(n37), .Z(n3) );
  MUX U8 ( .IN0(n57), .IN1(e_input[1]), .SEL(n59), .F(n49) );
  MUX U9 ( .IN0(g_input[2]), .IN1(n51), .SEL(n52), .F(n41) );
  MUX U10 ( .IN0(n4), .IN1(n16), .SEL(n17), .F(n14) );
  IV U11 ( .A(g_input[6]), .Z(n4) );
  XNOR U12 ( .A(n29), .B(g_input[5]), .Z(n6) );
  MUX U13 ( .IN0(g_input[2]), .IN1(n5), .SEL(n50), .F(n39) );
  IV U14 ( .A(n49), .Z(n5) );
  XNOR U15 ( .A(n41), .B(e_input[3]), .Z(n44) );
  MUX U16 ( .IN0(n6), .IN1(n30), .SEL(sel), .F(o[5]) );
  MUX U17 ( .IN0(g_input[3]), .IN1(n39), .SEL(n40), .F(n31) );
  XNOR U18 ( .A(n51), .B(e_input[2]), .Z(n52) );
  XNOR U19 ( .A(n26), .B(e_input[5]), .Z(n29) );
  XNOR U20 ( .A(n17), .B(g_input[6]), .Z(n7) );
  MUX U21 ( .IN0(g_input[4]), .IN1(n31), .SEL(n32), .F(n22) );
  XNOR U22 ( .A(n33), .B(e_input[4]), .Z(n36) );
  MUX U23 ( .IN0(n7), .IN1(n21), .SEL(sel), .F(o[6]) );
  XNOR U24 ( .A(n8), .B(n9), .Z(o[7]) );
  AND U25 ( .A(n10), .B(sel), .Z(n8) );
  XOR U26 ( .A(n11), .B(n12), .Z(n10) );
  XOR U27 ( .A(n9), .B(n13), .Z(n12) );
  XOR U28 ( .A(n14), .B(n15), .Z(n9) );
  XOR U29 ( .A(n18), .B(n15), .Z(n11) );
  XOR U30 ( .A(g_input[7]), .B(e_input[7]), .Z(n15) );
  ANDN U31 ( .A(n19), .B(n20), .Z(n18) );
  XOR U32 ( .A(n13), .B(g_input[6]), .Z(n19) );
  XNOR U33 ( .A(g_input[6]), .B(n20), .Z(n21) );
  XOR U34 ( .A(n13), .B(e_input[6]), .Z(n20) );
  XOR U35 ( .A(n22), .B(n23), .Z(n13) );
  ANDN U36 ( .A(n24), .B(n25), .Z(n23) );
  XOR U37 ( .A(n22), .B(g_input[5]), .Z(n24) );
  XOR U38 ( .A(n16), .B(e_input[6]), .Z(n17) );
  XNOR U39 ( .A(n26), .B(n27), .Z(n16) );
  ANDN U40 ( .A(n28), .B(n29), .Z(n27) );
  XOR U41 ( .A(g_input[5]), .B(n26), .Z(n28) );
  XNOR U42 ( .A(g_input[5]), .B(n25), .Z(n30) );
  XOR U43 ( .A(n22), .B(e_input[5]), .Z(n25) );
  XOR U44 ( .A(n33), .B(n34), .Z(n26) );
  ANDN U45 ( .A(n35), .B(n36), .Z(n34) );
  XOR U46 ( .A(g_input[4]), .B(n33), .Z(n35) );
  XNOR U47 ( .A(g_input[4]), .B(n32), .Z(n38) );
  XOR U48 ( .A(n31), .B(e_input[4]), .Z(n32) );
  XOR U49 ( .A(n36), .B(g_input[4]), .Z(n37) );
  XOR U50 ( .A(n41), .B(n42), .Z(n33) );
  ANDN U51 ( .A(n43), .B(n44), .Z(n42) );
  XOR U52 ( .A(g_input[3]), .B(n41), .Z(n43) );
  XNOR U53 ( .A(n45), .B(n46), .Z(o[3]) );
  AND U54 ( .A(n47), .B(sel), .Z(n45) );
  XNOR U55 ( .A(n46), .B(n48), .Z(n47) );
  XNOR U56 ( .A(g_input[3]), .B(n40), .Z(n48) );
  XOR U57 ( .A(n39), .B(e_input[3]), .Z(n40) );
  XOR U58 ( .A(n44), .B(g_input[3]), .Z(n46) );
  XNOR U59 ( .A(n53), .B(n54), .Z(o[2]) );
  AND U60 ( .A(n55), .B(sel), .Z(n53) );
  XNOR U61 ( .A(n54), .B(n56), .Z(n55) );
  XNOR U62 ( .A(g_input[2]), .B(n50), .Z(n56) );
  XNOR U63 ( .A(n49), .B(e_input[2]), .Z(n50) );
  XNOR U64 ( .A(n57), .B(g_input[1]), .Z(n59) );
  XOR U65 ( .A(n52), .B(g_input[2]), .Z(n54) );
  XNOR U66 ( .A(n62), .B(n63), .Z(o[1]) );
  AND U67 ( .A(n64), .B(sel), .Z(n62) );
  XNOR U68 ( .A(n63), .B(n65), .Z(n64) );
  XNOR U69 ( .A(g_input[1]), .B(n58), .Z(n65) );
  XNOR U70 ( .A(n57), .B(e_input[1]), .Z(n58) );
  ANDN U71 ( .A(e_input[0]), .B(g_input[0]), .Z(n57) );
  XOR U72 ( .A(n61), .B(g_input[1]), .Z(n63) );
  XNOR U73 ( .A(n60), .B(e_input[1]), .Z(n61) );
  AND U74 ( .A(e_input[0]), .B(g_input[0]), .Z(n60) );
  XOR U75 ( .A(g_input[0]), .B(e_input[0]), .Z(o[0]) );
  IV U76 ( .A(sel), .Z(n2) );
endmodule

