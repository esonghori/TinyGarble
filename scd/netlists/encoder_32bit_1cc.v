
module encoder_logS5 ( g_input, e_input, o );
  input [15:0] g_input;
  input [15:0] e_input;
  output [4:0] o;
  wire   \encoder0/encoder0/encoder0/encoder0/o1[0] ,
         \encoder0/encoder0/encoder0/encoder0/o0[0] ,
         \encoder0/encoder1/encoder1/encoder1/o1[0] ,
         \encoder0/encoder1/encoder1/encoder1/o0[0] ,
         \encoder0/encoder1/encoder1/encoder0/o1[0] ,
         \encoder0/encoder1/encoder1/encoder0/o0[0] ,
         \encoder0/encoder1/encoder0/encoder1/o1[0] ,
         \encoder0/encoder1/encoder0/encoder1/o0[0] ,
         \encoder0/encoder1/encoder0/encoder0/o1[0] ,
         \encoder0/encoder1/encoder0/encoder0/o0[0] ,
         \encoder0/encoder0/encoder1/encoder1/o1[0] ,
         \encoder0/encoder0/encoder1/encoder1/o0[0] ,
         \encoder0/encoder0/encoder1/encoder0/o1[0] ,
         \encoder0/encoder0/encoder1/encoder0/o0[0] ,
         \encoder0/encoder0/encoder0/encoder1/o1[0] ,
         \encoder0/encoder0/encoder0/encoder1/o0[0] , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52;
  assign \encoder0/encoder0/encoder0/encoder0/o1[0]  = g_input[3];
  assign \encoder0/encoder0/encoder0/encoder0/o0[0]  = g_input[1];
  assign \encoder0/encoder1/encoder1/encoder1/o1[0]  = e_input[15];
  assign \encoder0/encoder1/encoder1/encoder1/o0[0]  = e_input[13];
  assign \encoder0/encoder1/encoder1/encoder0/o1[0]  = e_input[11];
  assign \encoder0/encoder1/encoder1/encoder0/o0[0]  = e_input[9];
  assign \encoder0/encoder1/encoder0/encoder1/o1[0]  = e_input[7];
  assign \encoder0/encoder1/encoder0/encoder1/o0[0]  = e_input[5];
  assign \encoder0/encoder1/encoder0/encoder0/o1[0]  = e_input[3];
  assign \encoder0/encoder1/encoder0/encoder0/o0[0]  = e_input[1];
  assign \encoder0/encoder0/encoder1/encoder1/o1[0]  = g_input[15];
  assign \encoder0/encoder0/encoder1/encoder1/o0[0]  = g_input[13];
  assign \encoder0/encoder0/encoder1/encoder0/o1[0]  = g_input[11];
  assign \encoder0/encoder0/encoder1/encoder0/o0[0]  = g_input[9];
  assign \encoder0/encoder0/encoder0/encoder1/o1[0]  = g_input[7];
  assign \encoder0/encoder0/encoder0/encoder1/o0[0]  = g_input[5];

  NOR U1 ( .A(\encoder0/encoder1/encoder1/encoder0/o1[0] ), .B(
        \encoder0/encoder1/encoder1/encoder1/o1[0] ), .Z(n39) );
  NOR U2 ( .A(\encoder0/encoder1/encoder0/encoder0/o1[0] ), .B(
        \encoder0/encoder1/encoder0/encoder1/o1[0] ), .Z(n38) );
  NOR U3 ( .A(\encoder0/encoder0/encoder1/encoder0/o1[0] ), .B(
        \encoder0/encoder0/encoder1/encoder1/o1[0] ), .Z(n43) );
  NOR U4 ( .A(\encoder0/encoder0/encoder0/encoder1/o1[0] ), .B(
        \encoder0/encoder0/encoder0/encoder0/o1[0] ), .Z(n42) );
  NAND U5 ( .A(n1), .B(n2), .Z(o[4]) );
  AND U6 ( .A(n3), .B(n4), .Z(n1) );
  AND U7 ( .A(n5), .B(n6), .Z(n4) );
  NOR U8 ( .A(e_input[8]), .B(e_input[6]), .Z(n6) );
  NOR U9 ( .A(e_input[4]), .B(e_input[2]), .Z(n5) );
  AND U10 ( .A(n7), .B(n8), .Z(n3) );
  NOR U11 ( .A(e_input[10]), .B(e_input[0]), .Z(n7) );
  NAND U12 ( .A(n9), .B(n10), .Z(o[3]) );
  AND U13 ( .A(n11), .B(n12), .Z(n10) );
  AND U14 ( .A(n13), .B(n14), .Z(n12) );
  NOR U15 ( .A(g_input[14]), .B(g_input[8]), .Z(n14) );
  NOR U16 ( .A(g_input[12]), .B(g_input[10]), .Z(n13) );
  AND U17 ( .A(n15), .B(n16), .Z(n9) );
  AND U18 ( .A(n17), .B(n18), .Z(n15) );
  NOR U19 ( .A(e_input[14]), .B(e_input[8]), .Z(n18) );
  NOR U20 ( .A(e_input[12]), .B(e_input[10]), .Z(n17) );
  NAND U21 ( .A(n19), .B(n20), .Z(o[2]) );
  AND U22 ( .A(n21), .B(n22), .Z(n20) );
  AND U23 ( .A(n23), .B(n24), .Z(n22) );
  NOR U24 ( .A(g_input[6]), .B(g_input[4]), .Z(n24) );
  NOR U25 ( .A(g_input[14]), .B(g_input[12]), .Z(n23) );
  AND U26 ( .A(n25), .B(n26), .Z(n21) );
  AND U27 ( .A(n27), .B(n28), .Z(n19) );
  AND U28 ( .A(n29), .B(n30), .Z(n28) );
  AND U29 ( .A(n8), .B(n31), .Z(n27) );
  NOR U30 ( .A(e_input[6]), .B(e_input[4]), .Z(n31) );
  NOR U31 ( .A(e_input[14]), .B(e_input[12]), .Z(n8) );
  NAND U32 ( .A(n32), .B(n33), .Z(o[1]) );
  AND U33 ( .A(n34), .B(n35), .Z(n33) );
  AND U34 ( .A(n36), .B(n37), .Z(n35) );
  NOR U35 ( .A(g_input[6]), .B(g_input[2]), .Z(n37) );
  NOR U36 ( .A(g_input[14]), .B(g_input[10]), .Z(n36) );
  AND U37 ( .A(n38), .B(n39), .Z(n34) );
  AND U38 ( .A(n40), .B(n41), .Z(n32) );
  AND U39 ( .A(n42), .B(n43), .Z(n41) );
  AND U40 ( .A(n44), .B(n45), .Z(n40) );
  NOR U41 ( .A(e_input[6]), .B(e_input[2]), .Z(n45) );
  NOR U42 ( .A(e_input[14]), .B(e_input[10]), .Z(n44) );
  NAND U43 ( .A(n46), .B(n2), .Z(o[0]) );
  AND U44 ( .A(n47), .B(n11), .Z(n2) );
  AND U45 ( .A(n48), .B(n26), .Z(n11) );
  NOR U46 ( .A(\encoder0/encoder1/encoder1/encoder1/o1[0] ), .B(
        \encoder0/encoder1/encoder1/encoder1/o0[0] ), .Z(n26) );
  NOR U47 ( .A(\encoder0/encoder1/encoder1/encoder0/o1[0] ), .B(
        \encoder0/encoder1/encoder1/encoder0/o0[0] ), .Z(n48) );
  AND U48 ( .A(n49), .B(n25), .Z(n47) );
  NOR U49 ( .A(\encoder0/encoder1/encoder0/encoder1/o1[0] ), .B(
        \encoder0/encoder1/encoder0/encoder1/o0[0] ), .Z(n25) );
  NOR U50 ( .A(\encoder0/encoder1/encoder0/encoder0/o1[0] ), .B(
        \encoder0/encoder1/encoder0/encoder0/o0[0] ), .Z(n49) );
  AND U51 ( .A(n50), .B(n16), .Z(n46) );
  AND U52 ( .A(n51), .B(n30), .Z(n16) );
  NOR U53 ( .A(\encoder0/encoder0/encoder1/encoder1/o1[0] ), .B(
        \encoder0/encoder0/encoder1/encoder1/o0[0] ), .Z(n30) );
  NOR U54 ( .A(\encoder0/encoder0/encoder1/encoder0/o1[0] ), .B(
        \encoder0/encoder0/encoder1/encoder0/o0[0] ), .Z(n51) );
  AND U55 ( .A(n52), .B(n29), .Z(n50) );
  NOR U56 ( .A(\encoder0/encoder0/encoder0/encoder1/o1[0] ), .B(
        \encoder0/encoder0/encoder0/encoder1/o0[0] ), .Z(n29) );
  NOR U57 ( .A(\encoder0/encoder0/encoder0/encoder0/o1[0] ), .B(
        \encoder0/encoder0/encoder0/encoder0/o0[0] ), .Z(n52) );
endmodule

