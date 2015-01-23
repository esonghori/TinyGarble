
module modmult_step_N16_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80;

  IV U1 ( .A(n79), .Z(n1) );
  IV U2 ( .A(A[1]), .Z(n2) );
  XNOR U3 ( .A(n3), .B(n4), .Z(DIFF[9]) );
  XOR U4 ( .A(B[9]), .B(A[9]), .Z(n4) );
  XOR U5 ( .A(n5), .B(n6), .Z(DIFF[8]) );
  XOR U6 ( .A(B[8]), .B(A[8]), .Z(n6) );
  XOR U7 ( .A(n7), .B(n8), .Z(DIFF[7]) );
  XOR U8 ( .A(B[7]), .B(A[7]), .Z(n8) );
  XOR U9 ( .A(n9), .B(n10), .Z(DIFF[6]) );
  XOR U10 ( .A(B[6]), .B(A[6]), .Z(n10) );
  XOR U11 ( .A(n11), .B(n12), .Z(DIFF[5]) );
  XOR U12 ( .A(B[5]), .B(A[5]), .Z(n12) );
  XOR U13 ( .A(n13), .B(n14), .Z(DIFF[4]) );
  XOR U14 ( .A(B[4]), .B(A[4]), .Z(n14) );
  XOR U15 ( .A(n15), .B(n16), .Z(DIFF[3]) );
  XOR U16 ( .A(B[3]), .B(A[3]), .Z(n16) );
  XOR U17 ( .A(n17), .B(n18), .Z(DIFF[2]) );
  XOR U18 ( .A(B[2]), .B(A[2]), .Z(n18) );
  XOR U19 ( .A(n1), .B(n19), .Z(DIFF[1]) );
  XOR U20 ( .A(B[1]), .B(A[1]), .Z(n19) );
  XOR U21 ( .A(A[17]), .B(n20), .Z(DIFF[17]) );
  ANDN U22 ( .B(n21), .A(A[16]), .Z(n20) );
  XOR U23 ( .A(A[16]), .B(n21), .Z(DIFF[16]) );
  AND U24 ( .A(n22), .B(n23), .Z(n21) );
  NANDN U25 ( .A(B[15]), .B(n24), .Z(n23) );
  NANDN U26 ( .A(A[15]), .B(n25), .Z(n24) );
  NANDN U27 ( .A(n25), .B(A[15]), .Z(n22) );
  XOR U28 ( .A(n25), .B(n26), .Z(DIFF[15]) );
  XOR U29 ( .A(B[15]), .B(A[15]), .Z(n26) );
  AND U30 ( .A(n27), .B(n28), .Z(n25) );
  NANDN U31 ( .A(B[14]), .B(n29), .Z(n28) );
  NANDN U32 ( .A(A[14]), .B(n30), .Z(n29) );
  NANDN U33 ( .A(n30), .B(A[14]), .Z(n27) );
  XOR U34 ( .A(n30), .B(n31), .Z(DIFF[14]) );
  XOR U35 ( .A(B[14]), .B(A[14]), .Z(n31) );
  AND U36 ( .A(n32), .B(n33), .Z(n30) );
  NANDN U37 ( .A(B[13]), .B(n34), .Z(n33) );
  NANDN U38 ( .A(A[13]), .B(n35), .Z(n34) );
  NANDN U39 ( .A(n35), .B(A[13]), .Z(n32) );
  XOR U40 ( .A(n35), .B(n36), .Z(DIFF[13]) );
  XOR U41 ( .A(B[13]), .B(A[13]), .Z(n36) );
  AND U42 ( .A(n37), .B(n38), .Z(n35) );
  NANDN U43 ( .A(B[12]), .B(n39), .Z(n38) );
  NANDN U44 ( .A(A[12]), .B(n40), .Z(n39) );
  NANDN U45 ( .A(n40), .B(A[12]), .Z(n37) );
  XOR U46 ( .A(n40), .B(n41), .Z(DIFF[12]) );
  XOR U47 ( .A(B[12]), .B(A[12]), .Z(n41) );
  AND U48 ( .A(n42), .B(n43), .Z(n40) );
  NANDN U49 ( .A(B[11]), .B(n44), .Z(n43) );
  NANDN U50 ( .A(A[11]), .B(n45), .Z(n44) );
  NANDN U51 ( .A(n45), .B(A[11]), .Z(n42) );
  XOR U52 ( .A(n45), .B(n46), .Z(DIFF[11]) );
  XOR U53 ( .A(B[11]), .B(A[11]), .Z(n46) );
  AND U54 ( .A(n47), .B(n48), .Z(n45) );
  NANDN U55 ( .A(B[10]), .B(n49), .Z(n48) );
  NANDN U56 ( .A(A[10]), .B(n50), .Z(n49) );
  NANDN U57 ( .A(n50), .B(A[10]), .Z(n47) );
  XOR U58 ( .A(n50), .B(n51), .Z(DIFF[10]) );
  XOR U59 ( .A(B[10]), .B(A[10]), .Z(n51) );
  AND U60 ( .A(n52), .B(n53), .Z(n50) );
  NANDN U61 ( .A(B[9]), .B(n54), .Z(n53) );
  OR U62 ( .A(n3), .B(A[9]), .Z(n54) );
  NAND U63 ( .A(A[9]), .B(n3), .Z(n52) );
  NAND U64 ( .A(n55), .B(n56), .Z(n3) );
  NANDN U65 ( .A(B[8]), .B(n57), .Z(n56) );
  NANDN U66 ( .A(A[8]), .B(n5), .Z(n57) );
  NANDN U67 ( .A(n5), .B(A[8]), .Z(n55) );
  AND U68 ( .A(n58), .B(n59), .Z(n5) );
  NANDN U69 ( .A(B[7]), .B(n60), .Z(n59) );
  NANDN U70 ( .A(A[7]), .B(n7), .Z(n60) );
  NANDN U71 ( .A(n7), .B(A[7]), .Z(n58) );
  AND U72 ( .A(n61), .B(n62), .Z(n7) );
  NANDN U73 ( .A(B[6]), .B(n63), .Z(n62) );
  NANDN U74 ( .A(A[6]), .B(n9), .Z(n63) );
  NANDN U75 ( .A(n9), .B(A[6]), .Z(n61) );
  AND U76 ( .A(n64), .B(n65), .Z(n9) );
  NANDN U77 ( .A(B[5]), .B(n66), .Z(n65) );
  NANDN U78 ( .A(A[5]), .B(n11), .Z(n66) );
  NANDN U79 ( .A(n11), .B(A[5]), .Z(n64) );
  AND U80 ( .A(n67), .B(n68), .Z(n11) );
  NANDN U81 ( .A(B[4]), .B(n69), .Z(n68) );
  NANDN U82 ( .A(A[4]), .B(n13), .Z(n69) );
  NANDN U83 ( .A(n13), .B(A[4]), .Z(n67) );
  AND U84 ( .A(n70), .B(n71), .Z(n13) );
  NANDN U85 ( .A(B[3]), .B(n72), .Z(n71) );
  NANDN U86 ( .A(A[3]), .B(n15), .Z(n72) );
  NANDN U87 ( .A(n15), .B(A[3]), .Z(n70) );
  AND U88 ( .A(n73), .B(n74), .Z(n15) );
  NANDN U89 ( .A(B[2]), .B(n75), .Z(n74) );
  NANDN U90 ( .A(A[2]), .B(n17), .Z(n75) );
  NANDN U91 ( .A(n17), .B(A[2]), .Z(n73) );
  AND U92 ( .A(n76), .B(n77), .Z(n17) );
  NANDN U93 ( .A(B[1]), .B(n78), .Z(n77) );
  NAND U94 ( .A(n1), .B(n2), .Z(n78) );
  NAND U95 ( .A(A[1]), .B(n79), .Z(n76) );
  NAND U96 ( .A(n79), .B(n80), .Z(DIFF[0]) );
  NANDN U97 ( .A(B[0]), .B(A[0]), .Z(n80) );
  NANDN U98 ( .A(A[0]), .B(B[0]), .Z(n79) );
endmodule


module modmult_step_N16_DW01_cmp2_0 ( A, B, LEQ, TC, LT_LE, GE_GT );
  input [17:0] A;
  input [17:0] B;
  input LEQ, TC;
  output LT_LE, GE_GT;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;

  NAND U1 ( .A(n1), .B(n2), .Z(LT_LE) );
  NOR U2 ( .A(B[17]), .B(B[16]), .Z(n2) );
  AND U3 ( .A(n3), .B(n4), .Z(n1) );
  NAND U4 ( .A(n5), .B(n6), .Z(n4) );
  NANDN U5 ( .A(B[15]), .B(A[15]), .Z(n6) );
  NAND U6 ( .A(n7), .B(n8), .Z(n5) );
  NANDN U7 ( .A(A[14]), .B(B[14]), .Z(n8) );
  NAND U8 ( .A(n9), .B(n10), .Z(n7) );
  NANDN U9 ( .A(B[14]), .B(A[14]), .Z(n10) );
  AND U10 ( .A(n11), .B(n12), .Z(n9) );
  NAND U11 ( .A(n13), .B(n14), .Z(n12) );
  NANDN U12 ( .A(A[13]), .B(B[13]), .Z(n14) );
  AND U13 ( .A(n15), .B(n16), .Z(n13) );
  NANDN U14 ( .A(A[12]), .B(B[12]), .Z(n16) );
  NAND U15 ( .A(n17), .B(n18), .Z(n15) );
  NANDN U16 ( .A(B[12]), .B(A[12]), .Z(n18) );
  AND U17 ( .A(n19), .B(n20), .Z(n17) );
  NAND U18 ( .A(n21), .B(n22), .Z(n20) );
  NANDN U19 ( .A(A[11]), .B(B[11]), .Z(n22) );
  AND U20 ( .A(n23), .B(n24), .Z(n21) );
  NANDN U21 ( .A(A[10]), .B(B[10]), .Z(n24) );
  NAND U22 ( .A(n25), .B(n26), .Z(n23) );
  NANDN U23 ( .A(B[9]), .B(A[9]), .Z(n26) );
  AND U24 ( .A(n27), .B(n28), .Z(n25) );
  NAND U25 ( .A(n29), .B(n30), .Z(n28) );
  NANDN U26 ( .A(A[9]), .B(B[9]), .Z(n30) );
  AND U27 ( .A(n31), .B(n32), .Z(n29) );
  NANDN U28 ( .A(A[8]), .B(B[8]), .Z(n32) );
  NAND U29 ( .A(n33), .B(n34), .Z(n31) );
  NANDN U30 ( .A(B[8]), .B(A[8]), .Z(n34) );
  AND U31 ( .A(n35), .B(n36), .Z(n33) );
  NAND U32 ( .A(n37), .B(n38), .Z(n36) );
  NANDN U33 ( .A(A[7]), .B(B[7]), .Z(n38) );
  AND U34 ( .A(n39), .B(n40), .Z(n37) );
  NANDN U35 ( .A(A[6]), .B(B[6]), .Z(n40) );
  NAND U36 ( .A(n41), .B(n42), .Z(n39) );
  NANDN U37 ( .A(B[6]), .B(A[6]), .Z(n42) );
  AND U38 ( .A(n43), .B(n44), .Z(n41) );
  NAND U39 ( .A(n45), .B(n46), .Z(n44) );
  NANDN U40 ( .A(A[5]), .B(B[5]), .Z(n46) );
  AND U41 ( .A(n47), .B(n48), .Z(n45) );
  NANDN U42 ( .A(A[4]), .B(B[4]), .Z(n48) );
  NAND U43 ( .A(n49), .B(n50), .Z(n47) );
  NANDN U44 ( .A(B[4]), .B(A[4]), .Z(n50) );
  AND U45 ( .A(n51), .B(n52), .Z(n49) );
  NAND U46 ( .A(n53), .B(n54), .Z(n52) );
  NANDN U47 ( .A(A[3]), .B(B[3]), .Z(n54) );
  AND U48 ( .A(n55), .B(n56), .Z(n53) );
  NANDN U49 ( .A(A[2]), .B(B[2]), .Z(n56) );
  NAND U50 ( .A(n57), .B(n58), .Z(n55) );
  NANDN U51 ( .A(B[2]), .B(A[2]), .Z(n58) );
  AND U52 ( .A(n59), .B(n60), .Z(n57) );
  NAND U53 ( .A(n61), .B(A[0]), .Z(n60) );
  ANDN U54 ( .B(n62), .A(B[0]), .Z(n61) );
  NANDN U55 ( .A(A[1]), .B(B[1]), .Z(n62) );
  NANDN U56 ( .A(B[1]), .B(A[1]), .Z(n59) );
  NANDN U57 ( .A(B[3]), .B(A[3]), .Z(n51) );
  NANDN U58 ( .A(B[5]), .B(A[5]), .Z(n43) );
  NANDN U59 ( .A(B[7]), .B(A[7]), .Z(n35) );
  NANDN U60 ( .A(B[10]), .B(A[10]), .Z(n27) );
  NANDN U61 ( .A(B[11]), .B(A[11]), .Z(n19) );
  NANDN U62 ( .A(B[13]), .B(A[13]), .Z(n11) );
  NANDN U63 ( .A(A[15]), .B(B[15]), .Z(n3) );
endmodule


module modmult_step_N16_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80;

  IV U1 ( .A(A[1]), .Z(n1) );
  IV U2 ( .A(n79), .Z(n2) );
  XNOR U3 ( .A(n3), .B(n4), .Z(DIFF[9]) );
  XOR U4 ( .A(B[9]), .B(A[9]), .Z(n4) );
  XOR U5 ( .A(n5), .B(n6), .Z(DIFF[8]) );
  XOR U6 ( .A(B[8]), .B(A[8]), .Z(n6) );
  XOR U7 ( .A(n7), .B(n8), .Z(DIFF[7]) );
  XOR U8 ( .A(B[7]), .B(A[7]), .Z(n8) );
  XOR U9 ( .A(n9), .B(n10), .Z(DIFF[6]) );
  XOR U10 ( .A(B[6]), .B(A[6]), .Z(n10) );
  XOR U11 ( .A(n11), .B(n12), .Z(DIFF[5]) );
  XOR U12 ( .A(B[5]), .B(A[5]), .Z(n12) );
  XOR U13 ( .A(n13), .B(n14), .Z(DIFF[4]) );
  XOR U14 ( .A(B[4]), .B(A[4]), .Z(n14) );
  XOR U15 ( .A(n15), .B(n16), .Z(DIFF[3]) );
  XOR U16 ( .A(B[3]), .B(A[3]), .Z(n16) );
  XOR U17 ( .A(n17), .B(n18), .Z(DIFF[2]) );
  XOR U18 ( .A(B[2]), .B(A[2]), .Z(n18) );
  XOR U19 ( .A(n2), .B(n19), .Z(DIFF[1]) );
  XOR U20 ( .A(B[1]), .B(A[1]), .Z(n19) );
  XOR U21 ( .A(A[17]), .B(n20), .Z(DIFF[17]) );
  ANDN U22 ( .B(n21), .A(A[16]), .Z(n20) );
  XOR U23 ( .A(A[16]), .B(n21), .Z(DIFF[16]) );
  AND U24 ( .A(n22), .B(n23), .Z(n21) );
  NANDN U25 ( .A(B[15]), .B(n24), .Z(n23) );
  NANDN U26 ( .A(A[15]), .B(n25), .Z(n24) );
  NANDN U27 ( .A(n25), .B(A[15]), .Z(n22) );
  XOR U28 ( .A(n25), .B(n26), .Z(DIFF[15]) );
  XOR U29 ( .A(B[15]), .B(A[15]), .Z(n26) );
  AND U30 ( .A(n27), .B(n28), .Z(n25) );
  NANDN U31 ( .A(B[14]), .B(n29), .Z(n28) );
  NANDN U32 ( .A(A[14]), .B(n30), .Z(n29) );
  NANDN U33 ( .A(n30), .B(A[14]), .Z(n27) );
  XOR U34 ( .A(n30), .B(n31), .Z(DIFF[14]) );
  XOR U35 ( .A(B[14]), .B(A[14]), .Z(n31) );
  AND U36 ( .A(n32), .B(n33), .Z(n30) );
  NANDN U37 ( .A(B[13]), .B(n34), .Z(n33) );
  NANDN U38 ( .A(A[13]), .B(n35), .Z(n34) );
  NANDN U39 ( .A(n35), .B(A[13]), .Z(n32) );
  XOR U40 ( .A(n35), .B(n36), .Z(DIFF[13]) );
  XOR U41 ( .A(B[13]), .B(A[13]), .Z(n36) );
  AND U42 ( .A(n37), .B(n38), .Z(n35) );
  NANDN U43 ( .A(B[12]), .B(n39), .Z(n38) );
  NANDN U44 ( .A(A[12]), .B(n40), .Z(n39) );
  NANDN U45 ( .A(n40), .B(A[12]), .Z(n37) );
  XOR U46 ( .A(n40), .B(n41), .Z(DIFF[12]) );
  XOR U47 ( .A(B[12]), .B(A[12]), .Z(n41) );
  AND U48 ( .A(n42), .B(n43), .Z(n40) );
  NANDN U49 ( .A(B[11]), .B(n44), .Z(n43) );
  NANDN U50 ( .A(A[11]), .B(n45), .Z(n44) );
  NANDN U51 ( .A(n45), .B(A[11]), .Z(n42) );
  XOR U52 ( .A(n45), .B(n46), .Z(DIFF[11]) );
  XOR U53 ( .A(B[11]), .B(A[11]), .Z(n46) );
  AND U54 ( .A(n47), .B(n48), .Z(n45) );
  NANDN U55 ( .A(B[10]), .B(n49), .Z(n48) );
  NANDN U56 ( .A(A[10]), .B(n50), .Z(n49) );
  NANDN U57 ( .A(n50), .B(A[10]), .Z(n47) );
  XOR U58 ( .A(n50), .B(n51), .Z(DIFF[10]) );
  XOR U59 ( .A(B[10]), .B(A[10]), .Z(n51) );
  AND U60 ( .A(n52), .B(n53), .Z(n50) );
  NANDN U61 ( .A(B[9]), .B(n54), .Z(n53) );
  OR U62 ( .A(n3), .B(A[9]), .Z(n54) );
  NAND U63 ( .A(A[9]), .B(n3), .Z(n52) );
  NAND U64 ( .A(n55), .B(n56), .Z(n3) );
  NANDN U65 ( .A(B[8]), .B(n57), .Z(n56) );
  NANDN U66 ( .A(A[8]), .B(n5), .Z(n57) );
  NANDN U67 ( .A(n5), .B(A[8]), .Z(n55) );
  AND U68 ( .A(n58), .B(n59), .Z(n5) );
  NANDN U69 ( .A(B[7]), .B(n60), .Z(n59) );
  NANDN U70 ( .A(A[7]), .B(n7), .Z(n60) );
  NANDN U71 ( .A(n7), .B(A[7]), .Z(n58) );
  AND U72 ( .A(n61), .B(n62), .Z(n7) );
  NANDN U73 ( .A(B[6]), .B(n63), .Z(n62) );
  NANDN U74 ( .A(A[6]), .B(n9), .Z(n63) );
  NANDN U75 ( .A(n9), .B(A[6]), .Z(n61) );
  AND U76 ( .A(n64), .B(n65), .Z(n9) );
  NANDN U77 ( .A(B[5]), .B(n66), .Z(n65) );
  NANDN U78 ( .A(A[5]), .B(n11), .Z(n66) );
  NANDN U79 ( .A(n11), .B(A[5]), .Z(n64) );
  AND U80 ( .A(n67), .B(n68), .Z(n11) );
  NANDN U81 ( .A(B[4]), .B(n69), .Z(n68) );
  NANDN U82 ( .A(A[4]), .B(n13), .Z(n69) );
  NANDN U83 ( .A(n13), .B(A[4]), .Z(n67) );
  AND U84 ( .A(n70), .B(n71), .Z(n13) );
  NANDN U85 ( .A(B[3]), .B(n72), .Z(n71) );
  NANDN U86 ( .A(A[3]), .B(n15), .Z(n72) );
  NANDN U87 ( .A(n15), .B(A[3]), .Z(n70) );
  AND U88 ( .A(n73), .B(n74), .Z(n15) );
  NANDN U89 ( .A(B[2]), .B(n75), .Z(n74) );
  NANDN U90 ( .A(A[2]), .B(n17), .Z(n75) );
  NANDN U91 ( .A(n17), .B(A[2]), .Z(n73) );
  AND U92 ( .A(n76), .B(n77), .Z(n17) );
  NANDN U93 ( .A(B[1]), .B(n78), .Z(n77) );
  NAND U94 ( .A(n2), .B(n1), .Z(n78) );
  NAND U95 ( .A(A[1]), .B(n79), .Z(n76) );
  NAND U96 ( .A(n79), .B(n80), .Z(DIFF[0]) );
  NANDN U97 ( .A(B[0]), .B(A[0]), .Z(n80) );
  NANDN U98 ( .A(A[0]), .B(B[0]), .Z(n79) );
endmodule


module modmult_step_N16_DW01_cmp2_1 ( A, B, LEQ, TC, LT_LE, GE_GT );
  input [17:0] A;
  input [17:0] B;
  input LEQ, TC;
  output LT_LE, GE_GT;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62;

  NAND U1 ( .A(n1), .B(n2), .Z(LT_LE) );
  NOR U2 ( .A(B[17]), .B(B[16]), .Z(n2) );
  AND U3 ( .A(n3), .B(n4), .Z(n1) );
  NAND U4 ( .A(n5), .B(n6), .Z(n4) );
  NANDN U5 ( .A(B[15]), .B(A[15]), .Z(n6) );
  NAND U6 ( .A(n7), .B(n8), .Z(n5) );
  NANDN U7 ( .A(A[14]), .B(B[14]), .Z(n8) );
  NAND U8 ( .A(n9), .B(n10), .Z(n7) );
  NANDN U9 ( .A(B[14]), .B(A[14]), .Z(n10) );
  AND U10 ( .A(n11), .B(n12), .Z(n9) );
  NAND U11 ( .A(n13), .B(n14), .Z(n12) );
  NANDN U12 ( .A(A[13]), .B(B[13]), .Z(n14) );
  AND U13 ( .A(n15), .B(n16), .Z(n13) );
  NANDN U14 ( .A(A[12]), .B(B[12]), .Z(n16) );
  NAND U15 ( .A(n17), .B(n18), .Z(n15) );
  NANDN U16 ( .A(B[12]), .B(A[12]), .Z(n18) );
  AND U17 ( .A(n19), .B(n20), .Z(n17) );
  NAND U18 ( .A(n21), .B(n22), .Z(n20) );
  NANDN U19 ( .A(A[11]), .B(B[11]), .Z(n22) );
  AND U20 ( .A(n23), .B(n24), .Z(n21) );
  NANDN U21 ( .A(A[10]), .B(B[10]), .Z(n24) );
  NAND U22 ( .A(n25), .B(n26), .Z(n23) );
  NANDN U23 ( .A(B[9]), .B(A[9]), .Z(n26) );
  AND U24 ( .A(n27), .B(n28), .Z(n25) );
  NAND U25 ( .A(n29), .B(n30), .Z(n28) );
  NANDN U26 ( .A(A[9]), .B(B[9]), .Z(n30) );
  AND U27 ( .A(n31), .B(n32), .Z(n29) );
  NANDN U28 ( .A(A[8]), .B(B[8]), .Z(n32) );
  NAND U29 ( .A(n33), .B(n34), .Z(n31) );
  NANDN U30 ( .A(B[8]), .B(A[8]), .Z(n34) );
  AND U31 ( .A(n35), .B(n36), .Z(n33) );
  NAND U32 ( .A(n37), .B(n38), .Z(n36) );
  NANDN U33 ( .A(A[7]), .B(B[7]), .Z(n38) );
  AND U34 ( .A(n39), .B(n40), .Z(n37) );
  NANDN U35 ( .A(A[6]), .B(B[6]), .Z(n40) );
  NAND U36 ( .A(n41), .B(n42), .Z(n39) );
  NANDN U37 ( .A(B[6]), .B(A[6]), .Z(n42) );
  AND U38 ( .A(n43), .B(n44), .Z(n41) );
  NAND U39 ( .A(n45), .B(n46), .Z(n44) );
  NANDN U40 ( .A(A[5]), .B(B[5]), .Z(n46) );
  AND U41 ( .A(n47), .B(n48), .Z(n45) );
  NANDN U42 ( .A(A[4]), .B(B[4]), .Z(n48) );
  NAND U43 ( .A(n49), .B(n50), .Z(n47) );
  NANDN U44 ( .A(B[4]), .B(A[4]), .Z(n50) );
  AND U45 ( .A(n51), .B(n52), .Z(n49) );
  NAND U46 ( .A(n53), .B(n54), .Z(n52) );
  NANDN U47 ( .A(A[3]), .B(B[3]), .Z(n54) );
  AND U48 ( .A(n55), .B(n56), .Z(n53) );
  NANDN U49 ( .A(A[2]), .B(B[2]), .Z(n56) );
  NAND U50 ( .A(n57), .B(n58), .Z(n55) );
  NANDN U51 ( .A(B[2]), .B(A[2]), .Z(n58) );
  AND U52 ( .A(n59), .B(n60), .Z(n57) );
  NANDN U53 ( .A(B[1]), .B(n61), .Z(n60) );
  NANDN U54 ( .A(A[1]), .B(n62), .Z(n61) );
  NANDN U55 ( .A(n62), .B(A[1]), .Z(n59) );
  ANDN U56 ( .B(B[0]), .A(A[0]), .Z(n62) );
  NANDN U57 ( .A(B[3]), .B(A[3]), .Z(n51) );
  NANDN U58 ( .A(B[5]), .B(A[5]), .Z(n43) );
  NANDN U59 ( .A(B[7]), .B(A[7]), .Z(n35) );
  NANDN U60 ( .A(B[10]), .B(A[10]), .Z(n27) );
  NANDN U61 ( .A(B[11]), .B(A[11]), .Z(n19) );
  NANDN U62 ( .A(B[13]), .B(A[13]), .Z(n11) );
  NANDN U63 ( .A(A[15]), .B(B[15]), .Z(n3) );
endmodule


module modmult_step_N16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  XNOR U1 ( .A(n1), .B(n2), .Z(SUM[9]) );
  XNOR U2 ( .A(B[9]), .B(A[9]), .Z(n2) );
  XOR U3 ( .A(n3), .B(n4), .Z(SUM[8]) );
  XNOR U4 ( .A(B[8]), .B(A[8]), .Z(n4) );
  XOR U5 ( .A(n5), .B(n6), .Z(SUM[7]) );
  XNOR U6 ( .A(B[7]), .B(A[7]), .Z(n6) );
  XOR U7 ( .A(n7), .B(n8), .Z(SUM[6]) );
  XNOR U8 ( .A(B[6]), .B(A[6]), .Z(n8) );
  XOR U9 ( .A(n9), .B(n10), .Z(SUM[5]) );
  XNOR U10 ( .A(B[5]), .B(A[5]), .Z(n10) );
  XOR U11 ( .A(n11), .B(n12), .Z(SUM[4]) );
  XNOR U12 ( .A(B[4]), .B(A[4]), .Z(n12) );
  XOR U13 ( .A(n13), .B(n14), .Z(SUM[3]) );
  XNOR U14 ( .A(B[3]), .B(A[3]), .Z(n14) );
  XOR U15 ( .A(n15), .B(n16), .Z(SUM[2]) );
  XOR U16 ( .A(B[2]), .B(A[2]), .Z(n16) );
  XOR U17 ( .A(B[1]), .B(A[1]), .Z(SUM[1]) );
  XOR U18 ( .A(A[17]), .B(n17), .Z(SUM[17]) );
  AND U19 ( .A(A[16]), .B(n18), .Z(n17) );
  XOR U20 ( .A(A[16]), .B(n18), .Z(SUM[16]) );
  NAND U21 ( .A(n19), .B(n20), .Z(n18) );
  NAND U22 ( .A(B[15]), .B(n21), .Z(n20) );
  NANDN U23 ( .A(A[15]), .B(n22), .Z(n21) );
  NANDN U24 ( .A(n22), .B(A[15]), .Z(n19) );
  XOR U25 ( .A(n22), .B(n23), .Z(SUM[15]) );
  XNOR U26 ( .A(B[15]), .B(A[15]), .Z(n23) );
  AND U27 ( .A(n24), .B(n25), .Z(n22) );
  NAND U28 ( .A(B[14]), .B(n26), .Z(n25) );
  NANDN U29 ( .A(A[14]), .B(n27), .Z(n26) );
  NANDN U30 ( .A(n27), .B(A[14]), .Z(n24) );
  XOR U31 ( .A(n27), .B(n28), .Z(SUM[14]) );
  XNOR U32 ( .A(B[14]), .B(A[14]), .Z(n28) );
  AND U33 ( .A(n29), .B(n30), .Z(n27) );
  NAND U34 ( .A(B[13]), .B(n31), .Z(n30) );
  NANDN U35 ( .A(A[13]), .B(n32), .Z(n31) );
  NANDN U36 ( .A(n32), .B(A[13]), .Z(n29) );
  XOR U37 ( .A(n32), .B(n33), .Z(SUM[13]) );
  XNOR U38 ( .A(B[13]), .B(A[13]), .Z(n33) );
  AND U39 ( .A(n34), .B(n35), .Z(n32) );
  NAND U40 ( .A(B[12]), .B(n36), .Z(n35) );
  NANDN U41 ( .A(A[12]), .B(n37), .Z(n36) );
  NANDN U42 ( .A(n37), .B(A[12]), .Z(n34) );
  XOR U43 ( .A(n37), .B(n38), .Z(SUM[12]) );
  XNOR U44 ( .A(B[12]), .B(A[12]), .Z(n38) );
  AND U45 ( .A(n39), .B(n40), .Z(n37) );
  NAND U46 ( .A(B[11]), .B(n41), .Z(n40) );
  NANDN U47 ( .A(A[11]), .B(n42), .Z(n41) );
  NANDN U48 ( .A(n42), .B(A[11]), .Z(n39) );
  XOR U49 ( .A(n42), .B(n43), .Z(SUM[11]) );
  XNOR U50 ( .A(B[11]), .B(A[11]), .Z(n43) );
  AND U51 ( .A(n44), .B(n45), .Z(n42) );
  NAND U52 ( .A(B[10]), .B(n46), .Z(n45) );
  NANDN U53 ( .A(A[10]), .B(n47), .Z(n46) );
  NANDN U54 ( .A(n47), .B(A[10]), .Z(n44) );
  XOR U55 ( .A(n47), .B(n48), .Z(SUM[10]) );
  XNOR U56 ( .A(B[10]), .B(A[10]), .Z(n48) );
  AND U57 ( .A(n49), .B(n50), .Z(n47) );
  NAND U58 ( .A(B[9]), .B(n51), .Z(n50) );
  OR U59 ( .A(n1), .B(A[9]), .Z(n51) );
  NAND U60 ( .A(A[9]), .B(n1), .Z(n49) );
  NAND U61 ( .A(n52), .B(n53), .Z(n1) );
  NAND U62 ( .A(B[8]), .B(n54), .Z(n53) );
  NANDN U63 ( .A(A[8]), .B(n3), .Z(n54) );
  NANDN U64 ( .A(n3), .B(A[8]), .Z(n52) );
  AND U65 ( .A(n55), .B(n56), .Z(n3) );
  NAND U66 ( .A(B[7]), .B(n57), .Z(n56) );
  NANDN U67 ( .A(A[7]), .B(n5), .Z(n57) );
  NANDN U68 ( .A(n5), .B(A[7]), .Z(n55) );
  AND U69 ( .A(n58), .B(n59), .Z(n5) );
  NAND U70 ( .A(B[6]), .B(n60), .Z(n59) );
  NANDN U71 ( .A(A[6]), .B(n7), .Z(n60) );
  NANDN U72 ( .A(n7), .B(A[6]), .Z(n58) );
  AND U73 ( .A(n61), .B(n62), .Z(n7) );
  NAND U74 ( .A(B[5]), .B(n63), .Z(n62) );
  NANDN U75 ( .A(A[5]), .B(n9), .Z(n63) );
  NANDN U76 ( .A(n9), .B(A[5]), .Z(n61) );
  AND U77 ( .A(n64), .B(n65), .Z(n9) );
  NAND U78 ( .A(B[4]), .B(n66), .Z(n65) );
  NANDN U79 ( .A(A[4]), .B(n11), .Z(n66) );
  NANDN U80 ( .A(n11), .B(A[4]), .Z(n64) );
  AND U81 ( .A(n67), .B(n68), .Z(n11) );
  NAND U82 ( .A(B[3]), .B(n69), .Z(n68) );
  NANDN U83 ( .A(A[3]), .B(n13), .Z(n69) );
  NANDN U84 ( .A(n13), .B(A[3]), .Z(n67) );
  AND U85 ( .A(n70), .B(n71), .Z(n13) );
  NAND U86 ( .A(B[2]), .B(n72), .Z(n71) );
  OR U87 ( .A(n15), .B(A[2]), .Z(n72) );
  NAND U88 ( .A(A[2]), .B(n15), .Z(n70) );
  AND U89 ( .A(B[1]), .B(A[1]), .Z(n15) );
endmodule


module modmult_step_N16 ( xregN_1, y, n, zin, zout );
  input [15:0] y;
  input [15:0] n;
  input [17:0] zin;
  output [17:0] zout;
  input xregN_1;
  wire   N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18,
         N19, N20, N21, N22, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33,
         N34, N35, N36, N37, N38, N39, N40, N41, N60, N59, N58, N57, N56, N55,
         N54, N53, N52, N51, N50, N49, N48, N47, N46, N45, N42, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n17, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78;
  wire   [17:0] z2;
  wire   [17:0] z3;

  modmult_step_N16_DW01_sub_0 sub_129_aco ( .A(z3), .B({1'b0, 1'b0, N60, N59, 
        N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45}), 
        .CI(1'b0), .DIFF(zout) );
  modmult_step_N16_DW01_cmp2_0 gte_128 ( .A({1'b0, 1'b0, n}), .B(z3), .LEQ(
        1'b1), .TC(1'b0), .LT_LE(N42) );
  modmult_step_N16_DW01_sub_1 sub_124 ( .A(z2), .B({1'b0, 1'b0, n}), .CI(1'b0), 
        .DIFF({N41, N40, N39, N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, 
        N28, N27, N26, N25, N24}) );
  modmult_step_N16_DW01_cmp2_1 gt_123 ( .A({1'b0, 1'b0, n}), .B(z2), .LEQ(1'b0), .TC(1'b0), .LT_LE(N22) );
  modmult_step_N16_DW01_add_0 add_119 ( .A({zin[16:0], 1'b0}), .B({1'b0, 1'b0, 
        y}), .CI(1'b0), .SUM({N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, 
        N11, N10, N9, N8, N7, N6, N5, N4}) );
  NAND U4 ( .A(n1), .B(n2), .Z(z3[9]) );
  NANDN U5 ( .A(N22), .B(z2[9]), .Z(n2) );
  NANDN U6 ( .A(n3), .B(N33), .Z(n1) );
  NAND U7 ( .A(n4), .B(n5), .Z(z3[8]) );
  NANDN U8 ( .A(N22), .B(z2[8]), .Z(n5) );
  NANDN U9 ( .A(n3), .B(N32), .Z(n4) );
  NAND U10 ( .A(n6), .B(n7), .Z(z3[7]) );
  NANDN U11 ( .A(N22), .B(z2[7]), .Z(n7) );
  NANDN U17 ( .A(n3), .B(N31), .Z(n6) );
  NAND U18 ( .A(n8), .B(n9), .Z(z3[6]) );
  NANDN U19 ( .A(N22), .B(z2[6]), .Z(n9) );
  NANDN U20 ( .A(n3), .B(N30), .Z(n8) );
  NAND U21 ( .A(n10), .B(n11), .Z(z3[5]) );
  NANDN U22 ( .A(N22), .B(z2[5]), .Z(n11) );
  NANDN U23 ( .A(n3), .B(N29), .Z(n10) );
  NAND U24 ( .A(n12), .B(n13), .Z(z3[4]) );
  NANDN U25 ( .A(N22), .B(z2[4]), .Z(n13) );
  NANDN U26 ( .A(n3), .B(N28), .Z(n12) );
  NAND U27 ( .A(n14), .B(n17), .Z(z3[3]) );
  NANDN U28 ( .A(N22), .B(z2[3]), .Z(n17) );
  NANDN U29 ( .A(n3), .B(N27), .Z(n14) );
  NAND U30 ( .A(n23), .B(n24), .Z(z3[2]) );
  NANDN U31 ( .A(N22), .B(z2[2]), .Z(n24) );
  NANDN U32 ( .A(n3), .B(N26), .Z(n23) );
  NAND U33 ( .A(n25), .B(n26), .Z(z3[1]) );
  NANDN U34 ( .A(N22), .B(z2[1]), .Z(n26) );
  NANDN U35 ( .A(n3), .B(N25), .Z(n25) );
  NAND U36 ( .A(n27), .B(n28), .Z(z3[17]) );
  NANDN U37 ( .A(N22), .B(z2[17]), .Z(n28) );
  NANDN U38 ( .A(n3), .B(N41), .Z(n27) );
  NAND U39 ( .A(n29), .B(n30), .Z(z3[16]) );
  NANDN U40 ( .A(N22), .B(z2[16]), .Z(n30) );
  NANDN U41 ( .A(n3), .B(N40), .Z(n29) );
  NAND U42 ( .A(n31), .B(n32), .Z(z3[15]) );
  NANDN U43 ( .A(N22), .B(z2[15]), .Z(n32) );
  NANDN U44 ( .A(n3), .B(N39), .Z(n31) );
  NAND U45 ( .A(n33), .B(n34), .Z(z3[14]) );
  NANDN U46 ( .A(N22), .B(z2[14]), .Z(n34) );
  NANDN U47 ( .A(n3), .B(N38), .Z(n33) );
  NAND U48 ( .A(n35), .B(n36), .Z(z3[13]) );
  NANDN U49 ( .A(N22), .B(z2[13]), .Z(n36) );
  NANDN U50 ( .A(n3), .B(N37), .Z(n35) );
  NAND U51 ( .A(n37), .B(n38), .Z(z3[12]) );
  NANDN U52 ( .A(N22), .B(z2[12]), .Z(n38) );
  NANDN U53 ( .A(n3), .B(N36), .Z(n37) );
  NAND U54 ( .A(n39), .B(n40), .Z(z3[11]) );
  NANDN U55 ( .A(N22), .B(z2[11]), .Z(n40) );
  NANDN U56 ( .A(n3), .B(N35), .Z(n39) );
  NAND U57 ( .A(n41), .B(n42), .Z(z3[10]) );
  NANDN U58 ( .A(N22), .B(z2[10]), .Z(n42) );
  NANDN U59 ( .A(n3), .B(N34), .Z(n41) );
  NAND U60 ( .A(n43), .B(n44), .Z(z3[0]) );
  NANDN U61 ( .A(N22), .B(z2[0]), .Z(n44) );
  NANDN U62 ( .A(n3), .B(N24), .Z(n43) );
  IV U63 ( .A(N22), .Z(n3) );
  NAND U64 ( .A(n45), .B(n46), .Z(z2[9]) );
  NANDN U65 ( .A(xregN_1), .B(zin[8]), .Z(n46) );
  NAND U66 ( .A(N13), .B(xregN_1), .Z(n45) );
  NAND U67 ( .A(n47), .B(n48), .Z(z2[8]) );
  NANDN U68 ( .A(xregN_1), .B(zin[7]), .Z(n48) );
  NAND U69 ( .A(N12), .B(xregN_1), .Z(n47) );
  NAND U70 ( .A(n49), .B(n50), .Z(z2[7]) );
  NANDN U71 ( .A(xregN_1), .B(zin[6]), .Z(n50) );
  NAND U72 ( .A(N11), .B(xregN_1), .Z(n49) );
  NAND U73 ( .A(n51), .B(n52), .Z(z2[6]) );
  NANDN U74 ( .A(xregN_1), .B(zin[5]), .Z(n52) );
  NAND U75 ( .A(N10), .B(xregN_1), .Z(n51) );
  NAND U76 ( .A(n53), .B(n54), .Z(z2[5]) );
  NANDN U77 ( .A(xregN_1), .B(zin[4]), .Z(n54) );
  NAND U78 ( .A(N9), .B(xregN_1), .Z(n53) );
  NAND U79 ( .A(n55), .B(n56), .Z(z2[4]) );
  NANDN U80 ( .A(xregN_1), .B(zin[3]), .Z(n56) );
  NAND U81 ( .A(N8), .B(xregN_1), .Z(n55) );
  NAND U82 ( .A(n57), .B(n58), .Z(z2[3]) );
  NANDN U83 ( .A(xregN_1), .B(zin[2]), .Z(n58) );
  NAND U84 ( .A(N7), .B(xregN_1), .Z(n57) );
  NAND U85 ( .A(n59), .B(n60), .Z(z2[2]) );
  NANDN U86 ( .A(xregN_1), .B(zin[1]), .Z(n60) );
  NAND U87 ( .A(N6), .B(xregN_1), .Z(n59) );
  NAND U88 ( .A(n61), .B(n62), .Z(z2[1]) );
  NANDN U89 ( .A(xregN_1), .B(zin[0]), .Z(n62) );
  NAND U90 ( .A(N5), .B(xregN_1), .Z(n61) );
  NAND U91 ( .A(n63), .B(n64), .Z(z2[17]) );
  NANDN U92 ( .A(xregN_1), .B(zin[16]), .Z(n64) );
  NAND U93 ( .A(N21), .B(xregN_1), .Z(n63) );
  NAND U94 ( .A(n65), .B(n66), .Z(z2[16]) );
  NANDN U95 ( .A(xregN_1), .B(zin[15]), .Z(n66) );
  NAND U96 ( .A(N20), .B(xregN_1), .Z(n65) );
  NAND U97 ( .A(n67), .B(n68), .Z(z2[15]) );
  NANDN U98 ( .A(xregN_1), .B(zin[14]), .Z(n68) );
  NAND U99 ( .A(N19), .B(xregN_1), .Z(n67) );
  NAND U100 ( .A(n69), .B(n70), .Z(z2[14]) );
  NANDN U101 ( .A(xregN_1), .B(zin[13]), .Z(n70) );
  NAND U102 ( .A(N18), .B(xregN_1), .Z(n69) );
  NAND U103 ( .A(n71), .B(n72), .Z(z2[13]) );
  NANDN U104 ( .A(xregN_1), .B(zin[12]), .Z(n72) );
  NAND U105 ( .A(N17), .B(xregN_1), .Z(n71) );
  NAND U106 ( .A(n73), .B(n74), .Z(z2[12]) );
  NANDN U107 ( .A(xregN_1), .B(zin[11]), .Z(n74) );
  NAND U108 ( .A(N16), .B(xregN_1), .Z(n73) );
  NAND U109 ( .A(n75), .B(n76), .Z(z2[11]) );
  NANDN U110 ( .A(xregN_1), .B(zin[10]), .Z(n76) );
  NAND U111 ( .A(N15), .B(xregN_1), .Z(n75) );
  NAND U112 ( .A(n77), .B(n78), .Z(z2[10]) );
  NANDN U113 ( .A(xregN_1), .B(zin[9]), .Z(n78) );
  NAND U114 ( .A(N14), .B(xregN_1), .Z(n77) );
  AND U115 ( .A(N4), .B(xregN_1), .Z(z2[0]) );
  AND U116 ( .A(n[15]), .B(N42), .Z(N60) );
  AND U117 ( .A(n[14]), .B(N42), .Z(N59) );
  AND U118 ( .A(n[13]), .B(N42), .Z(N58) );
  AND U119 ( .A(n[12]), .B(N42), .Z(N57) );
  AND U120 ( .A(n[11]), .B(N42), .Z(N56) );
  AND U121 ( .A(n[10]), .B(N42), .Z(N55) );
  AND U122 ( .A(n[9]), .B(N42), .Z(N54) );
  AND U123 ( .A(n[8]), .B(N42), .Z(N53) );
  AND U124 ( .A(n[7]), .B(N42), .Z(N52) );
  AND U125 ( .A(n[6]), .B(N42), .Z(N51) );
  AND U126 ( .A(n[5]), .B(N42), .Z(N50) );
  AND U127 ( .A(n[4]), .B(N42), .Z(N49) );
  AND U128 ( .A(n[3]), .B(N42), .Z(N48) );
  AND U129 ( .A(n[2]), .B(N42), .Z(N47) );
  AND U130 ( .A(n[1]), .B(N42), .Z(N46) );
  AND U131 ( .A(n[0]), .B(N42), .Z(N45) );
endmodule


module modmult_N16_CC16 ( clk, rst, start, x, y, n, o );
  input [15:0] x;
  input [15:0] y;
  input [15:0] n;
  output [15:0] o;
  input clk, rst, start;
  wire   \zout[0][17] , \zout[0][16] , \zin[0][17] , \zin[0][16] ,
         \zin[0][15] , \zin[0][14] , \zin[0][13] , \zin[0][12] , \zin[0][11] ,
         \zin[0][10] , \zin[0][9] , \zin[0][8] , \zin[0][7] , \zin[0][6] ,
         \zin[0][5] , \zin[0][4] , \zin[0][3] , \zin[0][2] , \zin[0][1] ,
         \zin[0][0] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31;
  wire   [17:0] zreg;
  wire   [15:0] xin;
  wire   [15:0] xreg;

  DFF \xreg_reg[1]  ( .D(n31), .CLK(clk), .RST(rst), .Q(xreg[1]) );
  DFF \xreg_reg[2]  ( .D(xin[1]), .CLK(clk), .RST(rst), .Q(xreg[2]) );
  DFF \xreg_reg[3]  ( .D(xin[2]), .CLK(clk), .RST(rst), .Q(xreg[3]) );
  DFF \xreg_reg[4]  ( .D(xin[3]), .CLK(clk), .RST(rst), .Q(xreg[4]) );
  DFF \xreg_reg[5]  ( .D(xin[4]), .CLK(clk), .RST(rst), .Q(xreg[5]) );
  DFF \xreg_reg[6]  ( .D(xin[5]), .CLK(clk), .RST(rst), .Q(xreg[6]) );
  DFF \xreg_reg[7]  ( .D(xin[6]), .CLK(clk), .RST(rst), .Q(xreg[7]) );
  DFF \xreg_reg[8]  ( .D(xin[7]), .CLK(clk), .RST(rst), .Q(xreg[8]) );
  DFF \xreg_reg[9]  ( .D(xin[8]), .CLK(clk), .RST(rst), .Q(xreg[9]) );
  DFF \xreg_reg[10]  ( .D(xin[9]), .CLK(clk), .RST(rst), .Q(xreg[10]) );
  DFF \xreg_reg[11]  ( .D(xin[10]), .CLK(clk), .RST(rst), .Q(xreg[11]) );
  DFF \xreg_reg[12]  ( .D(xin[11]), .CLK(clk), .RST(rst), .Q(xreg[12]) );
  DFF \xreg_reg[13]  ( .D(xin[12]), .CLK(clk), .RST(rst), .Q(xreg[13]) );
  DFF \xreg_reg[14]  ( .D(xin[13]), .CLK(clk), .RST(rst), .Q(xreg[14]) );
  DFF \xreg_reg[15]  ( .D(xin[14]), .CLK(clk), .RST(rst), .Q(xreg[15]) );
  DFF \zreg_reg[0]  ( .D(o[0]), .CLK(clk), .RST(rst), .Q(zreg[0]) );
  DFF \zreg_reg[1]  ( .D(o[1]), .CLK(clk), .RST(rst), .Q(zreg[1]) );
  DFF \zreg_reg[2]  ( .D(o[2]), .CLK(clk), .RST(rst), .Q(zreg[2]) );
  DFF \zreg_reg[3]  ( .D(o[3]), .CLK(clk), .RST(rst), .Q(zreg[3]) );
  DFF \zreg_reg[4]  ( .D(o[4]), .CLK(clk), .RST(rst), .Q(zreg[4]) );
  DFF \zreg_reg[5]  ( .D(o[5]), .CLK(clk), .RST(rst), .Q(zreg[5]) );
  DFF \zreg_reg[6]  ( .D(o[6]), .CLK(clk), .RST(rst), .Q(zreg[6]) );
  DFF \zreg_reg[7]  ( .D(o[7]), .CLK(clk), .RST(rst), .Q(zreg[7]) );
  DFF \zreg_reg[8]  ( .D(o[8]), .CLK(clk), .RST(rst), .Q(zreg[8]) );
  DFF \zreg_reg[9]  ( .D(o[9]), .CLK(clk), .RST(rst), .Q(zreg[9]) );
  DFF \zreg_reg[10]  ( .D(o[10]), .CLK(clk), .RST(rst), .Q(zreg[10]) );
  DFF \zreg_reg[11]  ( .D(o[11]), .CLK(clk), .RST(rst), .Q(zreg[11]) );
  DFF \zreg_reg[12]  ( .D(o[12]), .CLK(clk), .RST(rst), .Q(zreg[12]) );
  DFF \zreg_reg[13]  ( .D(o[13]), .CLK(clk), .RST(rst), .Q(zreg[13]) );
  DFF \zreg_reg[14]  ( .D(o[14]), .CLK(clk), .RST(rst), .Q(zreg[14]) );
  DFF \zreg_reg[15]  ( .D(o[15]), .CLK(clk), .RST(rst), .Q(zreg[15]) );
  DFF \zreg_reg[16]  ( .D(\zout[0][16] ), .CLK(clk), .RST(rst), .Q(zreg[16])
         );
  DFF \zreg_reg[17]  ( .D(\zout[0][17] ), .CLK(clk), .RST(rst), .Q(zreg[17])
         );
  modmult_step_N16 \MODMULT_STEP[0].modmult_step_  ( .xregN_1(xin[15]), .y(y), 
        .n(n), .zin({\zin[0][17] , \zin[0][16] , \zin[0][15] , \zin[0][14] , 
        \zin[0][13] , \zin[0][12] , \zin[0][11] , \zin[0][10] , \zin[0][9] , 
        \zin[0][8] , \zin[0][7] , \zin[0][6] , \zin[0][5] , \zin[0][4] , 
        \zin[0][3] , \zin[0][2] , \zin[0][1] , \zin[0][0] }), .zout({
        \zout[0][17] , \zout[0][16] , o}) );
  ANDN U3 ( .B(zreg[9]), .A(start), .Z(\zin[0][9] ) );
  ANDN U4 ( .B(zreg[8]), .A(start), .Z(\zin[0][8] ) );
  ANDN U5 ( .B(zreg[7]), .A(start), .Z(\zin[0][7] ) );
  ANDN U6 ( .B(zreg[6]), .A(start), .Z(\zin[0][6] ) );
  ANDN U7 ( .B(zreg[5]), .A(start), .Z(\zin[0][5] ) );
  ANDN U8 ( .B(zreg[4]), .A(start), .Z(\zin[0][4] ) );
  ANDN U9 ( .B(zreg[3]), .A(start), .Z(\zin[0][3] ) );
  ANDN U10 ( .B(zreg[2]), .A(start), .Z(\zin[0][2] ) );
  ANDN U11 ( .B(zreg[1]), .A(start), .Z(\zin[0][1] ) );
  ANDN U12 ( .B(zreg[17]), .A(start), .Z(\zin[0][17] ) );
  ANDN U13 ( .B(zreg[16]), .A(start), .Z(\zin[0][16] ) );
  ANDN U14 ( .B(zreg[15]), .A(start), .Z(\zin[0][15] ) );
  ANDN U15 ( .B(zreg[14]), .A(start), .Z(\zin[0][14] ) );
  ANDN U16 ( .B(zreg[13]), .A(start), .Z(\zin[0][13] ) );
  ANDN U17 ( .B(zreg[12]), .A(start), .Z(\zin[0][12] ) );
  ANDN U18 ( .B(zreg[11]), .A(start), .Z(\zin[0][11] ) );
  ANDN U19 ( .B(zreg[10]), .A(start), .Z(\zin[0][10] ) );
  ANDN U20 ( .B(zreg[0]), .A(start), .Z(\zin[0][0] ) );
  NAND U21 ( .A(n1), .B(n2), .Z(xin[9]) );
  NANDN U22 ( .A(start), .B(xreg[9]), .Z(n2) );
  NAND U23 ( .A(x[9]), .B(start), .Z(n1) );
  NAND U24 ( .A(n3), .B(n4), .Z(xin[8]) );
  NANDN U25 ( .A(start), .B(xreg[8]), .Z(n4) );
  NAND U26 ( .A(x[8]), .B(start), .Z(n3) );
  NAND U27 ( .A(n5), .B(n6), .Z(xin[7]) );
  NANDN U28 ( .A(start), .B(xreg[7]), .Z(n6) );
  NAND U29 ( .A(x[7]), .B(start), .Z(n5) );
  NAND U30 ( .A(n7), .B(n8), .Z(xin[6]) );
  NANDN U31 ( .A(start), .B(xreg[6]), .Z(n8) );
  NAND U32 ( .A(x[6]), .B(start), .Z(n7) );
  NAND U33 ( .A(n9), .B(n10), .Z(xin[5]) );
  NANDN U34 ( .A(start), .B(xreg[5]), .Z(n10) );
  NAND U35 ( .A(x[5]), .B(start), .Z(n9) );
  NAND U36 ( .A(n11), .B(n12), .Z(xin[4]) );
  NANDN U37 ( .A(start), .B(xreg[4]), .Z(n12) );
  NAND U38 ( .A(x[4]), .B(start), .Z(n11) );
  NAND U39 ( .A(n13), .B(n14), .Z(xin[3]) );
  NANDN U40 ( .A(start), .B(xreg[3]), .Z(n14) );
  NAND U41 ( .A(x[3]), .B(start), .Z(n13) );
  NAND U42 ( .A(n15), .B(n16), .Z(xin[2]) );
  NANDN U43 ( .A(start), .B(xreg[2]), .Z(n16) );
  NAND U44 ( .A(x[2]), .B(start), .Z(n15) );
  NAND U45 ( .A(n17), .B(n18), .Z(xin[1]) );
  NANDN U46 ( .A(start), .B(xreg[1]), .Z(n18) );
  NAND U47 ( .A(x[1]), .B(start), .Z(n17) );
  NAND U48 ( .A(n19), .B(n20), .Z(xin[15]) );
  NANDN U49 ( .A(start), .B(xreg[15]), .Z(n20) );
  NAND U50 ( .A(x[15]), .B(start), .Z(n19) );
  NAND U51 ( .A(n21), .B(n22), .Z(xin[14]) );
  NANDN U52 ( .A(start), .B(xreg[14]), .Z(n22) );
  NAND U53 ( .A(x[14]), .B(start), .Z(n21) );
  NAND U54 ( .A(n23), .B(n24), .Z(xin[13]) );
  NANDN U55 ( .A(start), .B(xreg[13]), .Z(n24) );
  NAND U56 ( .A(x[13]), .B(start), .Z(n23) );
  NAND U57 ( .A(n25), .B(n26), .Z(xin[12]) );
  NANDN U58 ( .A(start), .B(xreg[12]), .Z(n26) );
  NAND U59 ( .A(x[12]), .B(start), .Z(n25) );
  NAND U60 ( .A(n27), .B(n28), .Z(xin[11]) );
  NANDN U61 ( .A(start), .B(xreg[11]), .Z(n28) );
  NAND U62 ( .A(x[11]), .B(start), .Z(n27) );
  NAND U63 ( .A(n29), .B(n30), .Z(xin[10]) );
  NANDN U64 ( .A(start), .B(xreg[10]), .Z(n30) );
  NAND U65 ( .A(x[10]), .B(start), .Z(n29) );
  AND U66 ( .A(x[0]), .B(start), .Z(n31) );
endmodule


module modexp_2N_NN_N16_CC512 ( clk, rst, m, e, n, c );
  input [15:0] m;
  input [15:0] e;
  input [15:0] n;
  output [15:0] c;
  input clk, rst;
  wire   init, mul_pow, first_one, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481;
  wire   [15:0] start_in;
  wire   [15:0] start_reg;
  wire   [15:0] ereg;
  wire   [15:0] o;
  wire   [15:0] creg;
  wire   [15:0] x;
  wire   [15:0] y;

  DFF init_reg ( .D(1'b1), .CLK(clk), .RST(rst), .Q(init) );
  DFF \start_reg_reg[0]  ( .D(n481), .CLK(clk), .RST(rst), .Q(start_reg[0]) );
  DFF \start_reg_reg[1]  ( .D(start_in[0]), .CLK(clk), .RST(rst), .Q(
        start_reg[1]) );
  DFF \start_reg_reg[2]  ( .D(start_in[1]), .CLK(clk), .RST(rst), .Q(
        start_reg[2]) );
  DFF \start_reg_reg[3]  ( .D(start_in[2]), .CLK(clk), .RST(rst), .Q(
        start_reg[3]) );
  DFF \start_reg_reg[4]  ( .D(start_in[3]), .CLK(clk), .RST(rst), .Q(
        start_reg[4]) );
  DFF \start_reg_reg[5]  ( .D(start_in[4]), .CLK(clk), .RST(rst), .Q(
        start_reg[5]) );
  DFF \start_reg_reg[6]  ( .D(start_in[5]), .CLK(clk), .RST(rst), .Q(
        start_reg[6]) );
  DFF \start_reg_reg[7]  ( .D(start_in[6]), .CLK(clk), .RST(rst), .Q(
        start_reg[7]) );
  DFF \start_reg_reg[8]  ( .D(start_in[7]), .CLK(clk), .RST(rst), .Q(
        start_reg[8]) );
  DFF \start_reg_reg[9]  ( .D(start_in[8]), .CLK(clk), .RST(rst), .Q(
        start_reg[9]) );
  DFF \start_reg_reg[10]  ( .D(start_in[9]), .CLK(clk), .RST(rst), .Q(
        start_reg[10]) );
  DFF \start_reg_reg[11]  ( .D(start_in[10]), .CLK(clk), .RST(rst), .Q(
        start_reg[11]) );
  DFF \start_reg_reg[12]  ( .D(start_in[11]), .CLK(clk), .RST(rst), .Q(
        start_reg[12]) );
  DFF \start_reg_reg[13]  ( .D(start_in[12]), .CLK(clk), .RST(rst), .Q(
        start_reg[13]) );
  DFF \start_reg_reg[14]  ( .D(start_in[13]), .CLK(clk), .RST(rst), .Q(
        start_reg[14]) );
  DFF \start_reg_reg[15]  ( .D(start_in[14]), .CLK(clk), .RST(rst), .Q(
        start_reg[15]) );
  DFF mul_pow_reg ( .D(n257), .CLK(clk), .RST(rst), .Q(mul_pow) );
  DFF \ereg_reg[0]  ( .D(n256), .CLK(clk), .RST(rst), .Q(ereg[0]) );
  DFF \ereg_reg[1]  ( .D(n255), .CLK(clk), .RST(rst), .Q(ereg[1]) );
  DFF \ereg_reg[2]  ( .D(n254), .CLK(clk), .RST(rst), .Q(ereg[2]) );
  DFF \ereg_reg[3]  ( .D(n253), .CLK(clk), .RST(rst), .Q(ereg[3]) );
  DFF \ereg_reg[4]  ( .D(n252), .CLK(clk), .RST(rst), .Q(ereg[4]) );
  DFF \ereg_reg[5]  ( .D(n251), .CLK(clk), .RST(rst), .Q(ereg[5]) );
  DFF \ereg_reg[6]  ( .D(n250), .CLK(clk), .RST(rst), .Q(ereg[6]) );
  DFF \ereg_reg[7]  ( .D(n249), .CLK(clk), .RST(rst), .Q(ereg[7]) );
  DFF \ereg_reg[8]  ( .D(n248), .CLK(clk), .RST(rst), .Q(ereg[8]) );
  DFF \ereg_reg[9]  ( .D(n247), .CLK(clk), .RST(rst), .Q(ereg[9]) );
  DFF \ereg_reg[10]  ( .D(n246), .CLK(clk), .RST(rst), .Q(ereg[10]) );
  DFF \ereg_reg[11]  ( .D(n245), .CLK(clk), .RST(rst), .Q(ereg[11]) );
  DFF \ereg_reg[12]  ( .D(n244), .CLK(clk), .RST(rst), .Q(ereg[12]) );
  DFF \ereg_reg[13]  ( .D(n243), .CLK(clk), .RST(rst), .Q(ereg[13]) );
  DFF \ereg_reg[14]  ( .D(n242), .CLK(clk), .RST(rst), .Q(ereg[14]) );
  DFF \ereg_reg[15]  ( .D(n241), .CLK(clk), .RST(rst), .Q(ereg[15]) );
  DFF first_one_reg ( .D(n224), .CLK(clk), .RST(rst), .Q(first_one) );
  DFF \creg_reg[0]  ( .D(n239), .CLK(clk), .RST(rst), .Q(creg[0]) );
  DFF \creg_reg[1]  ( .D(n238), .CLK(clk), .RST(rst), .Q(creg[1]) );
  DFF \creg_reg[2]  ( .D(n237), .CLK(clk), .RST(rst), .Q(creg[2]) );
  DFF \creg_reg[3]  ( .D(n236), .CLK(clk), .RST(rst), .Q(creg[3]) );
  DFF \creg_reg[4]  ( .D(n235), .CLK(clk), .RST(rst), .Q(creg[4]) );
  DFF \creg_reg[5]  ( .D(n234), .CLK(clk), .RST(rst), .Q(creg[5]) );
  DFF \creg_reg[6]  ( .D(n233), .CLK(clk), .RST(rst), .Q(creg[6]) );
  DFF \creg_reg[7]  ( .D(n232), .CLK(clk), .RST(rst), .Q(creg[7]) );
  DFF \creg_reg[8]  ( .D(n231), .CLK(clk), .RST(rst), .Q(creg[8]) );
  DFF \creg_reg[9]  ( .D(n230), .CLK(clk), .RST(rst), .Q(creg[9]) );
  DFF \creg_reg[10]  ( .D(n229), .CLK(clk), .RST(rst), .Q(creg[10]) );
  DFF \creg_reg[11]  ( .D(n228), .CLK(clk), .RST(rst), .Q(creg[11]) );
  DFF \creg_reg[12]  ( .D(n227), .CLK(clk), .RST(rst), .Q(creg[12]) );
  DFF \creg_reg[13]  ( .D(n226), .CLK(clk), .RST(rst), .Q(creg[13]) );
  DFF \creg_reg[14]  ( .D(n225), .CLK(clk), .RST(rst), .Q(creg[14]) );
  DFF \creg_reg[15]  ( .D(n240), .CLK(clk), .RST(rst), .Q(creg[15]) );
  modmult_N16_CC16 modmult_1 ( .clk(clk), .rst(rst), .start(start_in[0]), .x(x), .y(y), .n(n), .o(o) );
  NAND U324 ( .A(n258), .B(n259), .Z(y[9]) );
  NAND U325 ( .A(n260), .B(m[9]), .Z(n259) );
  NAND U326 ( .A(n261), .B(creg[9]), .Z(n258) );
  NAND U327 ( .A(n262), .B(n263), .Z(y[8]) );
  NAND U328 ( .A(n260), .B(m[8]), .Z(n263) );
  NAND U329 ( .A(n261), .B(creg[8]), .Z(n262) );
  NAND U330 ( .A(n264), .B(n265), .Z(y[7]) );
  NAND U331 ( .A(n260), .B(m[7]), .Z(n265) );
  NAND U332 ( .A(n261), .B(creg[7]), .Z(n264) );
  NAND U333 ( .A(n266), .B(n267), .Z(y[6]) );
  NAND U334 ( .A(n260), .B(m[6]), .Z(n267) );
  NAND U335 ( .A(n261), .B(creg[6]), .Z(n266) );
  NAND U336 ( .A(n268), .B(n269), .Z(y[5]) );
  NAND U337 ( .A(n260), .B(m[5]), .Z(n269) );
  NAND U338 ( .A(n261), .B(creg[5]), .Z(n268) );
  NAND U339 ( .A(n270), .B(n271), .Z(y[4]) );
  NAND U340 ( .A(n260), .B(m[4]), .Z(n271) );
  NAND U341 ( .A(n261), .B(creg[4]), .Z(n270) );
  NAND U342 ( .A(n272), .B(n273), .Z(y[3]) );
  NAND U343 ( .A(n260), .B(m[3]), .Z(n273) );
  NAND U344 ( .A(n261), .B(creg[3]), .Z(n272) );
  NAND U345 ( .A(n274), .B(n275), .Z(y[2]) );
  NAND U346 ( .A(n260), .B(m[2]), .Z(n275) );
  NAND U347 ( .A(n261), .B(creg[2]), .Z(n274) );
  NAND U348 ( .A(n276), .B(n277), .Z(y[1]) );
  NAND U349 ( .A(n260), .B(m[1]), .Z(n277) );
  NAND U350 ( .A(n261), .B(creg[1]), .Z(n276) );
  NAND U351 ( .A(n278), .B(n279), .Z(y[15]) );
  NAND U352 ( .A(n260), .B(m[15]), .Z(n279) );
  NAND U353 ( .A(n261), .B(creg[15]), .Z(n278) );
  NAND U354 ( .A(n280), .B(n281), .Z(y[14]) );
  NAND U355 ( .A(n260), .B(m[14]), .Z(n281) );
  NAND U356 ( .A(n261), .B(creg[14]), .Z(n280) );
  NAND U357 ( .A(n282), .B(n283), .Z(y[13]) );
  NAND U358 ( .A(n260), .B(m[13]), .Z(n283) );
  NAND U359 ( .A(n261), .B(creg[13]), .Z(n282) );
  NAND U360 ( .A(n284), .B(n285), .Z(y[12]) );
  NAND U361 ( .A(n260), .B(m[12]), .Z(n285) );
  NAND U362 ( .A(n261), .B(creg[12]), .Z(n284) );
  NAND U363 ( .A(n286), .B(n287), .Z(y[11]) );
  NAND U364 ( .A(n260), .B(m[11]), .Z(n287) );
  NAND U365 ( .A(n261), .B(creg[11]), .Z(n286) );
  NAND U366 ( .A(n288), .B(n289), .Z(y[10]) );
  NAND U367 ( .A(n260), .B(m[10]), .Z(n289) );
  NAND U368 ( .A(n261), .B(creg[10]), .Z(n288) );
  NAND U369 ( .A(n290), .B(n291), .Z(y[0]) );
  NAND U370 ( .A(n260), .B(m[0]), .Z(n291) );
  NAND U371 ( .A(n261), .B(creg[0]), .Z(n290) );
  IV U372 ( .A(n260), .Z(n261) );
  NAND U373 ( .A(n292), .B(n293), .Z(x[9]) );
  NAND U374 ( .A(creg[9]), .B(init), .Z(n292) );
  NAND U375 ( .A(n294), .B(n295), .Z(x[8]) );
  NAND U376 ( .A(creg[8]), .B(init), .Z(n294) );
  NAND U377 ( .A(n296), .B(n297), .Z(x[7]) );
  NAND U378 ( .A(creg[7]), .B(init), .Z(n296) );
  NAND U379 ( .A(n298), .B(n299), .Z(x[6]) );
  NAND U380 ( .A(creg[6]), .B(init), .Z(n298) );
  NAND U381 ( .A(n300), .B(n301), .Z(x[5]) );
  NAND U382 ( .A(creg[5]), .B(init), .Z(n300) );
  NAND U383 ( .A(n302), .B(n303), .Z(x[4]) );
  NAND U384 ( .A(creg[4]), .B(init), .Z(n302) );
  NAND U385 ( .A(n304), .B(n305), .Z(x[3]) );
  NAND U386 ( .A(creg[3]), .B(init), .Z(n304) );
  NAND U387 ( .A(n306), .B(n307), .Z(x[2]) );
  NAND U388 ( .A(creg[2]), .B(init), .Z(n306) );
  NAND U389 ( .A(n308), .B(n309), .Z(x[1]) );
  NAND U390 ( .A(creg[1]), .B(init), .Z(n308) );
  NAND U391 ( .A(n310), .B(n311), .Z(x[15]) );
  NAND U392 ( .A(creg[15]), .B(init), .Z(n310) );
  NAND U393 ( .A(n312), .B(n313), .Z(x[14]) );
  NAND U394 ( .A(creg[14]), .B(init), .Z(n312) );
  NAND U395 ( .A(n314), .B(n315), .Z(x[13]) );
  NAND U396 ( .A(creg[13]), .B(init), .Z(n314) );
  NAND U397 ( .A(n316), .B(n317), .Z(x[12]) );
  NAND U398 ( .A(creg[12]), .B(init), .Z(n316) );
  NAND U399 ( .A(n318), .B(n319), .Z(x[11]) );
  NAND U400 ( .A(creg[11]), .B(init), .Z(n318) );
  NAND U401 ( .A(n320), .B(n321), .Z(x[10]) );
  NAND U402 ( .A(creg[10]), .B(init), .Z(n320) );
  NAND U403 ( .A(n322), .B(n323), .Z(x[0]) );
  NAND U404 ( .A(creg[0]), .B(init), .Z(n322) );
  AND U405 ( .A(start_reg[9]), .B(init), .Z(start_in[9]) );
  AND U406 ( .A(start_reg[8]), .B(init), .Z(start_in[8]) );
  AND U407 ( .A(start_reg[7]), .B(init), .Z(start_in[7]) );
  AND U408 ( .A(start_reg[6]), .B(init), .Z(start_in[6]) );
  AND U409 ( .A(start_reg[5]), .B(init), .Z(start_in[5]) );
  AND U410 ( .A(start_reg[4]), .B(init), .Z(start_in[4]) );
  AND U411 ( .A(start_reg[3]), .B(init), .Z(start_in[3]) );
  AND U412 ( .A(start_reg[2]), .B(init), .Z(start_in[2]) );
  AND U413 ( .A(start_reg[1]), .B(init), .Z(start_in[1]) );
  AND U414 ( .A(start_reg[14]), .B(init), .Z(start_in[14]) );
  AND U415 ( .A(start_reg[13]), .B(init), .Z(start_in[13]) );
  AND U416 ( .A(start_reg[12]), .B(init), .Z(start_in[12]) );
  AND U417 ( .A(start_reg[11]), .B(init), .Z(start_in[11]) );
  AND U418 ( .A(start_reg[10]), .B(init), .Z(start_in[10]) );
  NANDN U419 ( .A(start_reg[0]), .B(init), .Z(start_in[0]) );
  XOR U420 ( .A(mul_pow), .B(n481), .Z(n257) );
  NAND U421 ( .A(n324), .B(n325), .Z(n256) );
  NANDN U422 ( .A(n326), .B(ereg[0]), .Z(n325) );
  NANDN U423 ( .A(init), .B(e[0]), .Z(n324) );
  NAND U424 ( .A(n327), .B(n328), .Z(n255) );
  NANDN U425 ( .A(init), .B(e[1]), .Z(n328) );
  AND U426 ( .A(n329), .B(n330), .Z(n327) );
  NAND U427 ( .A(n331), .B(ereg[0]), .Z(n330) );
  NANDN U428 ( .A(n326), .B(ereg[1]), .Z(n329) );
  NAND U429 ( .A(n332), .B(n333), .Z(n254) );
  NANDN U430 ( .A(init), .B(e[2]), .Z(n333) );
  AND U431 ( .A(n334), .B(n335), .Z(n332) );
  NAND U432 ( .A(ereg[1]), .B(n331), .Z(n335) );
  NANDN U433 ( .A(n326), .B(ereg[2]), .Z(n334) );
  NAND U434 ( .A(n336), .B(n337), .Z(n253) );
  NANDN U435 ( .A(init), .B(e[3]), .Z(n337) );
  AND U436 ( .A(n338), .B(n339), .Z(n336) );
  NAND U437 ( .A(ereg[2]), .B(n331), .Z(n339) );
  NANDN U438 ( .A(n326), .B(ereg[3]), .Z(n338) );
  NAND U439 ( .A(n340), .B(n341), .Z(n252) );
  NANDN U440 ( .A(init), .B(e[4]), .Z(n341) );
  AND U441 ( .A(n342), .B(n343), .Z(n340) );
  NAND U442 ( .A(ereg[3]), .B(n331), .Z(n343) );
  NANDN U443 ( .A(n326), .B(ereg[4]), .Z(n342) );
  NAND U444 ( .A(n344), .B(n345), .Z(n251) );
  NANDN U445 ( .A(init), .B(e[5]), .Z(n345) );
  AND U446 ( .A(n346), .B(n347), .Z(n344) );
  NAND U447 ( .A(ereg[4]), .B(n331), .Z(n347) );
  NANDN U448 ( .A(n326), .B(ereg[5]), .Z(n346) );
  NAND U449 ( .A(n348), .B(n349), .Z(n250) );
  NANDN U450 ( .A(init), .B(e[6]), .Z(n349) );
  AND U451 ( .A(n350), .B(n351), .Z(n348) );
  NAND U452 ( .A(ereg[5]), .B(n331), .Z(n351) );
  NANDN U453 ( .A(n326), .B(ereg[6]), .Z(n350) );
  NAND U454 ( .A(n352), .B(n353), .Z(n249) );
  NANDN U455 ( .A(init), .B(e[7]), .Z(n353) );
  AND U456 ( .A(n354), .B(n355), .Z(n352) );
  NAND U457 ( .A(ereg[6]), .B(n331), .Z(n355) );
  NANDN U458 ( .A(n326), .B(ereg[7]), .Z(n354) );
  NAND U459 ( .A(n356), .B(n357), .Z(n248) );
  NANDN U460 ( .A(init), .B(e[8]), .Z(n357) );
  AND U461 ( .A(n358), .B(n359), .Z(n356) );
  NAND U462 ( .A(ereg[7]), .B(n331), .Z(n359) );
  NANDN U463 ( .A(n326), .B(ereg[8]), .Z(n358) );
  NAND U464 ( .A(n360), .B(n361), .Z(n247) );
  NANDN U465 ( .A(init), .B(e[9]), .Z(n361) );
  AND U466 ( .A(n362), .B(n363), .Z(n360) );
  NAND U467 ( .A(ereg[8]), .B(n331), .Z(n363) );
  NANDN U468 ( .A(n326), .B(ereg[9]), .Z(n362) );
  NAND U469 ( .A(n364), .B(n365), .Z(n246) );
  NANDN U470 ( .A(init), .B(e[10]), .Z(n365) );
  AND U471 ( .A(n366), .B(n367), .Z(n364) );
  NAND U472 ( .A(ereg[9]), .B(n331), .Z(n367) );
  NANDN U473 ( .A(n326), .B(ereg[10]), .Z(n366) );
  NAND U474 ( .A(n368), .B(n369), .Z(n245) );
  NANDN U475 ( .A(init), .B(e[11]), .Z(n369) );
  AND U476 ( .A(n370), .B(n371), .Z(n368) );
  NAND U477 ( .A(ereg[10]), .B(n331), .Z(n371) );
  NANDN U478 ( .A(n326), .B(ereg[11]), .Z(n370) );
  NAND U479 ( .A(n372), .B(n373), .Z(n244) );
  NANDN U480 ( .A(init), .B(e[12]), .Z(n373) );
  AND U481 ( .A(n374), .B(n375), .Z(n372) );
  NAND U482 ( .A(ereg[11]), .B(n331), .Z(n375) );
  NANDN U483 ( .A(n326), .B(ereg[12]), .Z(n374) );
  NAND U484 ( .A(n376), .B(n377), .Z(n243) );
  NANDN U485 ( .A(init), .B(e[13]), .Z(n377) );
  AND U486 ( .A(n378), .B(n379), .Z(n376) );
  NAND U487 ( .A(ereg[12]), .B(n331), .Z(n379) );
  NANDN U488 ( .A(n326), .B(ereg[13]), .Z(n378) );
  NAND U489 ( .A(n380), .B(n381), .Z(n242) );
  NANDN U490 ( .A(init), .B(e[14]), .Z(n381) );
  AND U491 ( .A(n382), .B(n383), .Z(n380) );
  NAND U492 ( .A(ereg[13]), .B(n331), .Z(n383) );
  NANDN U493 ( .A(n326), .B(ereg[14]), .Z(n382) );
  NAND U494 ( .A(n384), .B(n385), .Z(n241) );
  NANDN U495 ( .A(init), .B(e[15]), .Z(n385) );
  AND U496 ( .A(n386), .B(n387), .Z(n384) );
  NAND U497 ( .A(ereg[14]), .B(n331), .Z(n387) );
  ANDN U498 ( .B(n326), .A(n388), .Z(n331) );
  NANDN U499 ( .A(n326), .B(ereg[15]), .Z(n386) );
  AND U500 ( .A(n389), .B(n260), .Z(n326) );
  NANDN U501 ( .A(mul_pow), .B(init), .Z(n260) );
  NAND U502 ( .A(n388), .B(init), .Z(n389) );
  NAND U503 ( .A(n390), .B(n311), .Z(n240) );
  NANDN U504 ( .A(init), .B(m[15]), .Z(n311) );
  AND U505 ( .A(n391), .B(n392), .Z(n390) );
  NAND U506 ( .A(o[15]), .B(n393), .Z(n392) );
  NANDN U507 ( .A(n394), .B(creg[15]), .Z(n391) );
  NAND U508 ( .A(n395), .B(n323), .Z(n239) );
  NANDN U509 ( .A(init), .B(m[0]), .Z(n323) );
  AND U510 ( .A(n396), .B(n397), .Z(n395) );
  NAND U511 ( .A(o[0]), .B(n393), .Z(n397) );
  NANDN U512 ( .A(n394), .B(creg[0]), .Z(n396) );
  NAND U513 ( .A(n398), .B(n309), .Z(n238) );
  NANDN U514 ( .A(init), .B(m[1]), .Z(n309) );
  AND U515 ( .A(n399), .B(n400), .Z(n398) );
  NAND U516 ( .A(o[1]), .B(n393), .Z(n400) );
  NANDN U517 ( .A(n394), .B(creg[1]), .Z(n399) );
  NAND U518 ( .A(n401), .B(n307), .Z(n237) );
  NANDN U519 ( .A(init), .B(m[2]), .Z(n307) );
  AND U520 ( .A(n402), .B(n403), .Z(n401) );
  NAND U521 ( .A(o[2]), .B(n393), .Z(n403) );
  NANDN U522 ( .A(n394), .B(creg[2]), .Z(n402) );
  NAND U523 ( .A(n404), .B(n305), .Z(n236) );
  NANDN U524 ( .A(init), .B(m[3]), .Z(n305) );
  AND U525 ( .A(n405), .B(n406), .Z(n404) );
  NAND U526 ( .A(o[3]), .B(n393), .Z(n406) );
  NANDN U527 ( .A(n394), .B(creg[3]), .Z(n405) );
  NAND U528 ( .A(n407), .B(n303), .Z(n235) );
  NANDN U529 ( .A(init), .B(m[4]), .Z(n303) );
  AND U530 ( .A(n408), .B(n409), .Z(n407) );
  NAND U531 ( .A(o[4]), .B(n393), .Z(n409) );
  NANDN U532 ( .A(n394), .B(creg[4]), .Z(n408) );
  NAND U533 ( .A(n410), .B(n301), .Z(n234) );
  NANDN U534 ( .A(init), .B(m[5]), .Z(n301) );
  AND U535 ( .A(n411), .B(n412), .Z(n410) );
  NAND U536 ( .A(o[5]), .B(n393), .Z(n412) );
  NANDN U537 ( .A(n394), .B(creg[5]), .Z(n411) );
  NAND U538 ( .A(n413), .B(n299), .Z(n233) );
  NANDN U539 ( .A(init), .B(m[6]), .Z(n299) );
  AND U540 ( .A(n414), .B(n415), .Z(n413) );
  NAND U541 ( .A(o[6]), .B(n393), .Z(n415) );
  NANDN U542 ( .A(n394), .B(creg[6]), .Z(n414) );
  NAND U543 ( .A(n416), .B(n297), .Z(n232) );
  NANDN U544 ( .A(init), .B(m[7]), .Z(n297) );
  AND U545 ( .A(n417), .B(n418), .Z(n416) );
  NAND U546 ( .A(o[7]), .B(n393), .Z(n418) );
  NANDN U547 ( .A(n394), .B(creg[7]), .Z(n417) );
  NAND U548 ( .A(n419), .B(n295), .Z(n231) );
  NANDN U549 ( .A(init), .B(m[8]), .Z(n295) );
  AND U550 ( .A(n420), .B(n421), .Z(n419) );
  NAND U551 ( .A(o[8]), .B(n393), .Z(n421) );
  NANDN U552 ( .A(n394), .B(creg[8]), .Z(n420) );
  NAND U553 ( .A(n422), .B(n293), .Z(n230) );
  NANDN U554 ( .A(init), .B(m[9]), .Z(n293) );
  AND U555 ( .A(n423), .B(n424), .Z(n422) );
  NAND U556 ( .A(o[9]), .B(n393), .Z(n424) );
  NANDN U557 ( .A(n394), .B(creg[9]), .Z(n423) );
  NAND U558 ( .A(n425), .B(n321), .Z(n229) );
  NANDN U559 ( .A(init), .B(m[10]), .Z(n321) );
  AND U560 ( .A(n426), .B(n427), .Z(n425) );
  NAND U561 ( .A(o[10]), .B(n393), .Z(n427) );
  NANDN U562 ( .A(n394), .B(creg[10]), .Z(n426) );
  NAND U563 ( .A(n428), .B(n319), .Z(n228) );
  NANDN U564 ( .A(init), .B(m[11]), .Z(n319) );
  AND U565 ( .A(n429), .B(n430), .Z(n428) );
  NAND U566 ( .A(o[11]), .B(n393), .Z(n430) );
  NANDN U567 ( .A(n394), .B(creg[11]), .Z(n429) );
  NAND U568 ( .A(n431), .B(n317), .Z(n227) );
  NANDN U569 ( .A(init), .B(m[12]), .Z(n317) );
  AND U570 ( .A(n432), .B(n433), .Z(n431) );
  NAND U571 ( .A(o[12]), .B(n393), .Z(n433) );
  NANDN U572 ( .A(n394), .B(creg[12]), .Z(n432) );
  NAND U573 ( .A(n434), .B(n315), .Z(n226) );
  NANDN U574 ( .A(init), .B(m[13]), .Z(n315) );
  AND U575 ( .A(n435), .B(n436), .Z(n434) );
  NAND U576 ( .A(o[13]), .B(n393), .Z(n436) );
  NANDN U577 ( .A(n394), .B(creg[13]), .Z(n435) );
  NAND U578 ( .A(n437), .B(n313), .Z(n225) );
  NANDN U579 ( .A(init), .B(m[14]), .Z(n313) );
  AND U580 ( .A(n438), .B(n439), .Z(n437) );
  NAND U581 ( .A(o[14]), .B(n393), .Z(n439) );
  ANDN U582 ( .B(n394), .A(n388), .Z(n393) );
  NANDN U583 ( .A(n394), .B(creg[14]), .Z(n438) );
  NAND U584 ( .A(init), .B(n440), .Z(n394) );
  NAND U585 ( .A(first_one), .B(n441), .Z(n440) );
  AND U586 ( .A(n442), .B(n481), .Z(n441) );
  NAND U587 ( .A(n443), .B(mul_pow), .Z(n442) );
  NANDN U588 ( .A(first_one), .B(n444), .Z(n224) );
  NAND U589 ( .A(n445), .B(ereg[15]), .Z(n444) );
  AND U590 ( .A(mul_pow), .B(n481), .Z(n445) );
  IV U591 ( .A(n388), .Z(n481) );
  NAND U592 ( .A(start_reg[15]), .B(init), .Z(n388) );
  NAND U593 ( .A(n446), .B(n447), .Z(c[9]) );
  NAND U594 ( .A(n448), .B(o[9]), .Z(n447) );
  NAND U595 ( .A(n443), .B(creg[9]), .Z(n446) );
  NAND U596 ( .A(n449), .B(n450), .Z(c[8]) );
  NAND U597 ( .A(n448), .B(o[8]), .Z(n450) );
  NAND U598 ( .A(n443), .B(creg[8]), .Z(n449) );
  NAND U599 ( .A(n451), .B(n452), .Z(c[7]) );
  NAND U600 ( .A(n448), .B(o[7]), .Z(n452) );
  NAND U601 ( .A(n443), .B(creg[7]), .Z(n451) );
  NAND U602 ( .A(n453), .B(n454), .Z(c[6]) );
  NAND U603 ( .A(n448), .B(o[6]), .Z(n454) );
  NAND U604 ( .A(n443), .B(creg[6]), .Z(n453) );
  NAND U605 ( .A(n455), .B(n456), .Z(c[5]) );
  NAND U606 ( .A(n448), .B(o[5]), .Z(n456) );
  NAND U607 ( .A(n443), .B(creg[5]), .Z(n455) );
  NAND U608 ( .A(n457), .B(n458), .Z(c[4]) );
  NAND U609 ( .A(n448), .B(o[4]), .Z(n458) );
  NAND U610 ( .A(n443), .B(creg[4]), .Z(n457) );
  NAND U611 ( .A(n459), .B(n460), .Z(c[3]) );
  NAND U612 ( .A(n448), .B(o[3]), .Z(n460) );
  NAND U613 ( .A(n443), .B(creg[3]), .Z(n459) );
  NAND U614 ( .A(n461), .B(n462), .Z(c[2]) );
  NAND U615 ( .A(n448), .B(o[2]), .Z(n462) );
  NAND U616 ( .A(n443), .B(creg[2]), .Z(n461) );
  NAND U617 ( .A(n463), .B(n464), .Z(c[1]) );
  NAND U618 ( .A(n448), .B(o[1]), .Z(n464) );
  NAND U619 ( .A(n443), .B(creg[1]), .Z(n463) );
  NAND U620 ( .A(n465), .B(n466), .Z(c[15]) );
  NAND U621 ( .A(n448), .B(o[15]), .Z(n466) );
  NAND U622 ( .A(n443), .B(creg[15]), .Z(n465) );
  NAND U623 ( .A(n467), .B(n468), .Z(c[14]) );
  NAND U624 ( .A(n448), .B(o[14]), .Z(n468) );
  NAND U625 ( .A(n443), .B(creg[14]), .Z(n467) );
  NAND U626 ( .A(n469), .B(n470), .Z(c[13]) );
  NAND U627 ( .A(n448), .B(o[13]), .Z(n470) );
  NAND U628 ( .A(n443), .B(creg[13]), .Z(n469) );
  NAND U629 ( .A(n471), .B(n472), .Z(c[12]) );
  NAND U630 ( .A(n448), .B(o[12]), .Z(n472) );
  NAND U631 ( .A(n443), .B(creg[12]), .Z(n471) );
  NAND U632 ( .A(n473), .B(n474), .Z(c[11]) );
  NAND U633 ( .A(n448), .B(o[11]), .Z(n474) );
  NAND U634 ( .A(n443), .B(creg[11]), .Z(n473) );
  NAND U635 ( .A(n475), .B(n476), .Z(c[10]) );
  NAND U636 ( .A(n448), .B(o[10]), .Z(n476) );
  NAND U637 ( .A(n443), .B(creg[10]), .Z(n475) );
  NAND U638 ( .A(n477), .B(n478), .Z(c[0]) );
  NAND U639 ( .A(n448), .B(o[0]), .Z(n478) );
  IV U640 ( .A(n443), .Z(n448) );
  NAND U641 ( .A(n443), .B(creg[0]), .Z(n477) );
  NAND U642 ( .A(n479), .B(n480), .Z(n443) );
  NANDN U643 ( .A(ereg[15]), .B(init), .Z(n480) );
  OR U644 ( .A(init), .B(e[15]), .Z(n479) );
endmodule

