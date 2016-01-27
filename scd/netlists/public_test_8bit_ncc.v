
module public_test_N8 ( clk, rst, p_init, g_init, e_init, p_input, g_input, 
        e_input, o );
  input [7:0] p_init;
  input [7:0] g_init;
  input [7:0] e_init;
  input [7:0] p_input;
  input [7:0] g_input;
  input [7:0] e_input;
  output [7:0] o;
  input clk, rst;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32;
  wire   [7:0] p_reg;
  wire   [7:0] g_reg;
  wire   [7:0] e_reg;

  DFF \g_reg_reg[7]  ( .D(N8), .CLK(clk), .RST(rst), .I(g_init[7]), .Q(
        g_reg[7]) );
  DFF \g_reg_reg[6]  ( .D(N9), .CLK(clk), .RST(rst), .I(g_init[6]), .Q(
        g_reg[6]) );
  DFF \g_reg_reg[5]  ( .D(N10), .CLK(clk), .RST(rst), .I(g_init[5]), .Q(
        g_reg[5]) );
  DFF \g_reg_reg[4]  ( .D(N11), .CLK(clk), .RST(rst), .I(g_init[4]), .Q(
        g_reg[4]) );
  DFF \g_reg_reg[3]  ( .D(N12), .CLK(clk), .RST(rst), .I(g_init[3]), .Q(
        g_reg[3]) );
  DFF \g_reg_reg[2]  ( .D(N13), .CLK(clk), .RST(rst), .I(g_init[2]), .Q(
        g_reg[2]) );
  DFF \g_reg_reg[1]  ( .D(N14), .CLK(clk), .RST(rst), .I(g_init[1]), .Q(
        g_reg[1]) );
  DFF \g_reg_reg[0]  ( .D(N15), .CLK(clk), .RST(rst), .I(g_init[0]), .Q(
        g_reg[0]) );
  DFF \e_reg_reg[7]  ( .D(N16), .CLK(clk), .RST(rst), .I(e_init[7]), .Q(
        e_reg[7]) );
  DFF \e_reg_reg[6]  ( .D(N17), .CLK(clk), .RST(rst), .I(e_init[6]), .Q(
        e_reg[6]) );
  DFF \e_reg_reg[5]  ( .D(N18), .CLK(clk), .RST(rst), .I(e_init[5]), .Q(
        e_reg[5]) );
  DFF \e_reg_reg[4]  ( .D(N19), .CLK(clk), .RST(rst), .I(e_init[4]), .Q(
        e_reg[4]) );
  DFF \e_reg_reg[3]  ( .D(N20), .CLK(clk), .RST(rst), .I(e_init[3]), .Q(
        e_reg[3]) );
  DFF \e_reg_reg[2]  ( .D(N21), .CLK(clk), .RST(rst), .I(e_init[2]), .Q(
        e_reg[2]) );
  DFF \e_reg_reg[1]  ( .D(N22), .CLK(clk), .RST(rst), .I(e_init[1]), .Q(
        e_reg[1]) );
  DFF \e_reg_reg[0]  ( .D(N23), .CLK(clk), .RST(rst), .I(e_init[0]), .Q(
        e_reg[0]) );
  DFF \p_reg_reg[7]  ( .D(N0), .CLK(clk), .RST(rst), .I(p_init[7]), .Q(
        p_reg[7]) );
  DFF \p_reg_reg[6]  ( .D(N1), .CLK(clk), .RST(rst), .I(p_init[6]), .Q(
        p_reg[6]) );
  DFF \p_reg_reg[5]  ( .D(N2), .CLK(clk), .RST(rst), .I(p_init[5]), .Q(
        p_reg[5]) );
  DFF \p_reg_reg[4]  ( .D(N3), .CLK(clk), .RST(rst), .I(p_init[4]), .Q(
        p_reg[4]) );
  DFF \p_reg_reg[3]  ( .D(N4), .CLK(clk), .RST(rst), .I(p_init[3]), .Q(
        p_reg[3]) );
  DFF \p_reg_reg[2]  ( .D(N5), .CLK(clk), .RST(rst), .I(p_init[2]), .Q(
        p_reg[2]) );
  DFF \p_reg_reg[1]  ( .D(N6), .CLK(clk), .RST(rst), .I(p_init[1]), .Q(
        p_reg[1]) );
  DFF \p_reg_reg[0]  ( .D(N7), .CLK(clk), .RST(rst), .I(p_init[0]), .Q(
        p_reg[0]) );
  XOR U27 ( .A(g_reg[7]), .B(e_reg[7]), .Z(n32) );
  XOR U28 ( .A(p_reg[7]), .B(p_input[7]), .Z(n31) );
  XOR U29 ( .A(g_input[7]), .B(e_input[7]), .Z(n30) );
  XOR U30 ( .A(n32), .B(n31), .Z(n29) );
  XOR U31 ( .A(n30), .B(n29), .Z(o[7]) );
  XOR U32 ( .A(g_reg[6]), .B(e_reg[6]), .Z(n28) );
  XOR U33 ( .A(p_reg[6]), .B(p_input[6]), .Z(n27) );
  XOR U34 ( .A(g_input[6]), .B(e_input[6]), .Z(n26) );
  XOR U35 ( .A(n28), .B(n27), .Z(n25) );
  XOR U36 ( .A(n26), .B(n25), .Z(o[6]) );
  XOR U37 ( .A(g_reg[5]), .B(e_reg[5]), .Z(n24) );
  XOR U38 ( .A(p_reg[5]), .B(p_input[5]), .Z(n23) );
  XOR U39 ( .A(g_input[5]), .B(e_input[5]), .Z(n22) );
  XOR U40 ( .A(n24), .B(n23), .Z(n21) );
  XOR U41 ( .A(n22), .B(n21), .Z(o[5]) );
  XOR U42 ( .A(g_reg[4]), .B(e_reg[4]), .Z(n20) );
  XOR U43 ( .A(p_reg[4]), .B(p_input[4]), .Z(n19) );
  XOR U44 ( .A(g_input[4]), .B(e_input[4]), .Z(n18) );
  XOR U45 ( .A(n20), .B(n19), .Z(n17) );
  XOR U46 ( .A(n18), .B(n17), .Z(o[4]) );
  XOR U47 ( .A(g_reg[3]), .B(e_reg[3]), .Z(n16) );
  XOR U48 ( .A(p_reg[3]), .B(p_input[3]), .Z(n15) );
  XOR U49 ( .A(g_input[3]), .B(e_input[3]), .Z(n14) );
  XOR U50 ( .A(n16), .B(n15), .Z(n13) );
  XOR U51 ( .A(n14), .B(n13), .Z(o[3]) );
  XOR U52 ( .A(g_reg[2]), .B(e_reg[2]), .Z(n12) );
  XOR U53 ( .A(p_reg[2]), .B(p_input[2]), .Z(n11) );
  XOR U54 ( .A(g_input[2]), .B(e_input[2]), .Z(n10) );
  XOR U55 ( .A(n12), .B(n11), .Z(n9) );
  XOR U56 ( .A(n10), .B(n9), .Z(o[2]) );
  XOR U57 ( .A(g_reg[1]), .B(e_reg[1]), .Z(n8) );
  XOR U58 ( .A(p_reg[1]), .B(p_input[1]), .Z(n7) );
  XOR U59 ( .A(g_input[1]), .B(e_input[1]), .Z(n6) );
  XOR U60 ( .A(n8), .B(n7), .Z(n5) );
  XOR U61 ( .A(n6), .B(n5), .Z(o[1]) );
  XOR U62 ( .A(g_reg[0]), .B(e_reg[0]), .Z(n4) );
  XOR U63 ( .A(p_reg[0]), .B(p_input[0]), .Z(n3) );
  XOR U64 ( .A(g_input[0]), .B(e_input[0]), .Z(n2) );
  XOR U65 ( .A(n4), .B(n3), .Z(n1) );
  XOR U66 ( .A(n2), .B(n1), .Z(o[0]) );
  XOR U67 ( .A(g_reg[6]), .B(g_input[6]), .Z(N9) );
  XOR U68 ( .A(g_reg[7]), .B(g_input[7]), .Z(N8) );
  XOR U69 ( .A(p_reg[0]), .B(p_input[0]), .Z(N7) );
  XOR U70 ( .A(p_reg[1]), .B(p_input[1]), .Z(N6) );
  XOR U71 ( .A(p_reg[2]), .B(p_input[2]), .Z(N5) );
  XOR U72 ( .A(p_reg[3]), .B(p_input[3]), .Z(N4) );
  XOR U73 ( .A(p_reg[4]), .B(p_input[4]), .Z(N3) );
  XOR U74 ( .A(e_reg[0]), .B(e_input[0]), .Z(N23) );
  XOR U75 ( .A(e_reg[1]), .B(e_input[1]), .Z(N22) );
  XOR U76 ( .A(e_reg[2]), .B(e_input[2]), .Z(N21) );
  XOR U77 ( .A(e_reg[3]), .B(e_input[3]), .Z(N20) );
  XOR U78 ( .A(p_reg[5]), .B(p_input[5]), .Z(N2) );
  XOR U79 ( .A(e_reg[4]), .B(e_input[4]), .Z(N19) );
  XOR U80 ( .A(e_reg[5]), .B(e_input[5]), .Z(N18) );
  XOR U81 ( .A(e_reg[6]), .B(e_input[6]), .Z(N17) );
  XOR U82 ( .A(e_reg[7]), .B(e_input[7]), .Z(N16) );
  XOR U83 ( .A(g_reg[0]), .B(g_input[0]), .Z(N15) );
  XOR U84 ( .A(g_reg[1]), .B(g_input[1]), .Z(N14) );
  XOR U85 ( .A(g_reg[2]), .B(g_input[2]), .Z(N13) );
  XOR U86 ( .A(g_reg[3]), .B(g_input[3]), .Z(N12) );
  XOR U87 ( .A(g_reg[4]), .B(g_input[4]), .Z(N11) );
  XOR U88 ( .A(g_reg[5]), .B(g_input[5]), .Z(N10) );
  XOR U89 ( .A(p_reg[6]), .B(p_input[6]), .Z(N1) );
  XOR U90 ( .A(p_reg[7]), .B(p_input[7]), .Z(N0) );
endmodule

