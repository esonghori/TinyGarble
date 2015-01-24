
module stackMachine_N8 ( clk, rst, x, opcode, o );
  input [7:0] x;
  input [2:0] opcode;
  output [7:0] o;
  input clk, rst;
  wire   \stack[7][7] , \stack[7][6] , \stack[7][5] , \stack[7][4] ,
         \stack[7][3] , \stack[7][2] , \stack[7][1] , \stack[7][0] ,
         \stack[6][7] , \stack[6][6] , \stack[6][5] , \stack[6][4] ,
         \stack[6][3] , \stack[6][2] , \stack[6][1] , \stack[6][0] ,
         \stack[5][7] , \stack[5][6] , \stack[5][5] , \stack[5][4] ,
         \stack[5][3] , \stack[5][2] , \stack[5][1] , \stack[5][0] ,
         \stack[4][7] , \stack[4][6] , \stack[4][5] , \stack[4][4] ,
         \stack[4][3] , \stack[4][2] , \stack[4][1] , \stack[4][0] ,
         \stack[3][7] , \stack[3][6] , \stack[3][5] , \stack[3][4] ,
         \stack[3][3] , \stack[3][2] , \stack[3][1] , \stack[3][0] ,
         \stack[2][7] , \stack[2][6] , \stack[2][5] , \stack[2][4] ,
         \stack[2][3] , \stack[2][2] , \stack[2][1] , \stack[2][0] ,
         \stack[1][7] , \stack[1][6] , \stack[1][5] , \stack[1][4] ,
         \stack[1][3] , \stack[1][2] , \stack[1][1] , \stack[1][0] ,
         \stack[0][7] , \stack[0][6] , \stack[0][5] , \stack[0][4] ,
         \stack[0][3] , \stack[0][2] , \stack[0][1] , \stack[0][0] , n573,
         n580, n587, n596, n605, n614, n623, n632, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n892, n893, n894, n895, n896, n897, n898, n899, n900,
         n901, n902, n903, n904, n905, n906, n907, n908, n909, n910, n911,
         n912, n913, n914, n915, n916, n917, n918, n919, n920, n921, n922,
         n923, n924, n925, n926, n927, n928, n929, n930, n931, n932, n933,
         n934, n935, n936, n937, n938, n939, n940, n941, n942, n943, n944,
         n945, n946, n947, n948, n949, n950, n951, n952, n953, n954, n955,
         n956, n957, n958, n959, n960, n961, n962, n963, n964, n965, n966,
         n967, n968, n969, n970, n971, n972, n973, n974, n975, n976, n977,
         n978, n979, n980, n981, n982, n983, n984, n985, n986, n987, n988,
         n989, n990, n991, n992, n993, n994, n995, n996, n997, n998, n999,
         n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009,
         n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019,
         n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029,
         n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039,
         n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049,
         n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059,
         n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069,
         n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079,
         n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089,
         n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099,
         n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109,
         n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119,
         n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129,
         n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139,
         n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149,
         n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159,
         n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169,
         n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179,
         n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189,
         n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199,
         n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209,
         n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219,
         n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229,
         n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239,
         n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249,
         n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259,
         n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269,
         n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279,
         n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289,
         n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299,
         n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309,
         n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319,
         n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329,
         n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339,
         n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349,
         n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359,
         n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369,
         n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378, n1379,
         n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389,
         n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399,
         n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409,
         n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419,
         n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429,
         n1430, n1431, n1432, n1433, n1434;

  DFF \stack_reg[0][0]  ( .D(n699), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][0] ) );
  DFF \stack_reg[1][0]  ( .D(n691), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][0] ) );
  DFF \stack_reg[0][7]  ( .D(n692), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][7] ) );
  DFF \stack_reg[1][7]  ( .D(n684), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][7] ) );
  DFF \stack_reg[0][1]  ( .D(n698), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][1] ) );
  DFF \stack_reg[1][1]  ( .D(n690), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][1] ) );
  DFF \stack_reg[2][1]  ( .D(n682), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][1] ) );
  DFF \stack_reg[3][1]  ( .D(n674), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][1] ) );
  DFF \stack_reg[4][1]  ( .D(n666), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][1] ) );
  DFF \stack_reg[5][1]  ( .D(n658), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][1] ) );
  DFF \stack_reg[6][1]  ( .D(n650), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][1] ) );
  DFF \stack_reg[7][1]  ( .D(n632), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][1] ) );
  DFF \stack_reg[0][2]  ( .D(n697), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][2] ) );
  DFF \stack_reg[1][2]  ( .D(n689), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][2] ) );
  DFF \stack_reg[2][2]  ( .D(n681), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][2] ) );
  DFF \stack_reg[3][2]  ( .D(n673), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][2] ) );
  DFF \stack_reg[4][2]  ( .D(n665), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][2] ) );
  DFF \stack_reg[5][2]  ( .D(n657), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][2] ) );
  DFF \stack_reg[6][2]  ( .D(n649), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][2] ) );
  DFF \stack_reg[7][2]  ( .D(n623), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][2] ) );
  DFF \stack_reg[0][3]  ( .D(n696), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][3] ) );
  DFF \stack_reg[1][3]  ( .D(n688), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][3] ) );
  DFF \stack_reg[2][3]  ( .D(n680), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][3] ) );
  DFF \stack_reg[3][3]  ( .D(n672), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][3] ) );
  DFF \stack_reg[4][3]  ( .D(n664), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][3] ) );
  DFF \stack_reg[5][3]  ( .D(n656), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][3] ) );
  DFF \stack_reg[6][3]  ( .D(n648), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][3] ) );
  DFF \stack_reg[7][3]  ( .D(n614), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][3] ) );
  DFF \stack_reg[0][4]  ( .D(n695), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][4] ) );
  DFF \stack_reg[1][4]  ( .D(n687), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][4] ) );
  DFF \stack_reg[2][4]  ( .D(n679), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][4] ) );
  DFF \stack_reg[3][4]  ( .D(n671), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][4] ) );
  DFF \stack_reg[4][4]  ( .D(n663), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][4] ) );
  DFF \stack_reg[5][4]  ( .D(n655), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][4] ) );
  DFF \stack_reg[6][4]  ( .D(n647), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][4] ) );
  DFF \stack_reg[7][4]  ( .D(n605), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][4] ) );
  DFF \stack_reg[0][5]  ( .D(n694), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][5] ) );
  DFF \stack_reg[1][5]  ( .D(n686), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][5] ) );
  DFF \stack_reg[2][5]  ( .D(n678), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][5] ) );
  DFF \stack_reg[3][5]  ( .D(n670), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][5] ) );
  DFF \stack_reg[4][5]  ( .D(n662), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][5] ) );
  DFF \stack_reg[5][5]  ( .D(n654), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][5] ) );
  DFF \stack_reg[6][5]  ( .D(n646), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][5] ) );
  DFF \stack_reg[7][5]  ( .D(n596), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][5] ) );
  DFF \stack_reg[0][6]  ( .D(n693), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[0][6] ) );
  DFF \stack_reg[1][6]  ( .D(n685), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[1][6] ) );
  DFF \stack_reg[2][6]  ( .D(n677), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][6] ) );
  DFF \stack_reg[3][6]  ( .D(n669), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][6] ) );
  DFF \stack_reg[4][6]  ( .D(n661), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][6] ) );
  DFF \stack_reg[5][6]  ( .D(n653), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][6] ) );
  DFF \stack_reg[6][6]  ( .D(n645), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][6] ) );
  DFF \stack_reg[7][6]  ( .D(n587), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][6] ) );
  DFF \stack_reg[2][7]  ( .D(n676), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][7] ) );
  DFF \stack_reg[3][7]  ( .D(n668), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][7] ) );
  DFF \stack_reg[4][7]  ( .D(n660), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][7] ) );
  DFF \stack_reg[5][7]  ( .D(n652), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][7] ) );
  DFF \stack_reg[6][7]  ( .D(n644), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][7] ) );
  DFF \stack_reg[7][7]  ( .D(n580), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][7] ) );
  DFF \stack_reg[2][0]  ( .D(n683), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[2][0] ) );
  DFF \stack_reg[3][0]  ( .D(n675), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[3][0] ) );
  DFF \stack_reg[4][0]  ( .D(n667), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[4][0] ) );
  DFF \stack_reg[5][0]  ( .D(n659), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[5][0] ) );
  DFF \stack_reg[6][0]  ( .D(n651), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[6][0] ) );
  DFF \stack_reg[7][0]  ( .D(n573), .CLK(clk), .RST(rst), .I(1'b0), .Q(
        \stack[7][0] ) );
  OR U704 ( .A(\stack[1][6] ), .B(\stack[0][6] ), .Z(n879) );
  OR U705 ( .A(n921), .B(n920), .Z(n923) );
  OR U706 ( .A(n941), .B(n940), .Z(n943) );
  NANDN U707 ( .A(\stack[0][3] ), .B(n811), .Z(n810) );
  XNOR U708 ( .A(n928), .B(n1020), .Z(n946) );
  XNOR U709 ( .A(\stack[1][7] ), .B(\stack[0][7] ), .Z(n900) );
  NANDN U710 ( .A(\stack[0][2] ), .B(n788), .Z(n787) );
  NANDN U711 ( .A(n931), .B(n930), .Z(n926) );
  NANDN U712 ( .A(n947), .B(n946), .Z(n949) );
  OR U713 ( .A(\stack[0][7] ), .B(\stack[1][7] ), .Z(n1034) );
  NANDN U714 ( .A(n700), .B(n701), .Z(o[7]) );
  NANDN U715 ( .A(n702), .B(n703), .Z(n701) );
  NANDN U716 ( .A(n704), .B(n705), .Z(o[6]) );
  NANDN U717 ( .A(n706), .B(n703), .Z(n705) );
  NANDN U718 ( .A(n707), .B(n708), .Z(o[5]) );
  NANDN U719 ( .A(n709), .B(n703), .Z(n708) );
  NANDN U720 ( .A(n710), .B(n711), .Z(o[4]) );
  NANDN U721 ( .A(n712), .B(n703), .Z(n711) );
  NANDN U722 ( .A(n713), .B(n714), .Z(o[3]) );
  NANDN U723 ( .A(n715), .B(n703), .Z(n714) );
  NANDN U724 ( .A(n716), .B(n717), .Z(o[2]) );
  NANDN U725 ( .A(n718), .B(n703), .Z(n717) );
  NANDN U726 ( .A(n719), .B(n720), .Z(o[1]) );
  NANDN U727 ( .A(n721), .B(n703), .Z(n720) );
  NANDN U728 ( .A(n722), .B(n723), .Z(o[0]) );
  NANDN U729 ( .A(n724), .B(n703), .Z(n723) );
  NAND U730 ( .A(n725), .B(n726), .Z(n699) );
  NANDN U731 ( .A(n727), .B(\stack[0][0] ), .Z(n726) );
  ANDN U732 ( .B(n728), .A(n722), .Z(n725) );
  ANDN U733 ( .B(x[0]), .A(n703), .Z(n722) );
  NANDN U734 ( .A(n724), .B(n729), .Z(n728) );
  AND U735 ( .A(n730), .B(n731), .Z(n724) );
  AND U736 ( .A(n732), .B(n733), .Z(n731) );
  NAND U737 ( .A(n734), .B(n735), .Z(n733) );
  AND U738 ( .A(\stack[0][0] ), .B(\stack[1][0] ), .Z(n734) );
  AND U739 ( .A(n736), .B(n737), .Z(n732) );
  NAND U740 ( .A(\stack[1][0] ), .B(n738), .Z(n737) );
  ANDN U741 ( .B(\stack[0][0] ), .A(n739), .Z(n738) );
  NAND U742 ( .A(n740), .B(n741), .Z(n736) );
  NAND U743 ( .A(n742), .B(n743), .Z(n740) );
  AND U744 ( .A(n744), .B(n745), .Z(n730) );
  NANDN U745 ( .A(n746), .B(\stack[0][0] ), .Z(n745) );
  XOR U746 ( .A(n747), .B(n748), .Z(n744) );
  XNOR U747 ( .A(n749), .B(n750), .Z(n748) );
  NAND U748 ( .A(n751), .B(n752), .Z(n698) );
  NANDN U749 ( .A(n727), .B(\stack[0][1] ), .Z(n752) );
  ANDN U750 ( .B(n753), .A(n719), .Z(n751) );
  ANDN U751 ( .B(x[1]), .A(n703), .Z(n719) );
  NANDN U752 ( .A(n721), .B(n729), .Z(n753) );
  AND U753 ( .A(n754), .B(n755), .Z(n721) );
  AND U754 ( .A(n756), .B(n757), .Z(n755) );
  NAND U755 ( .A(n758), .B(n735), .Z(n757) );
  XOR U756 ( .A(n759), .B(n760), .Z(n758) );
  AND U757 ( .A(n761), .B(n762), .Z(n756) );
  NAND U758 ( .A(\stack[1][1] ), .B(n763), .Z(n762) );
  ANDN U759 ( .B(\stack[0][1] ), .A(n739), .Z(n763) );
  NAND U760 ( .A(n764), .B(n741), .Z(n761) );
  NANDN U761 ( .A(\stack[0][1] ), .B(n765), .Z(n764) );
  AND U762 ( .A(n766), .B(n767), .Z(n754) );
  NANDN U763 ( .A(n746), .B(\stack[0][1] ), .Z(n767) );
  XNOR U764 ( .A(n768), .B(n769), .Z(n766) );
  XNOR U765 ( .A(n770), .B(n771), .Z(n769) );
  NAND U766 ( .A(n772), .B(n773), .Z(n697) );
  NANDN U767 ( .A(n727), .B(\stack[0][2] ), .Z(n773) );
  ANDN U768 ( .B(n774), .A(n716), .Z(n772) );
  ANDN U769 ( .B(x[2]), .A(n703), .Z(n716) );
  NANDN U770 ( .A(n718), .B(n729), .Z(n774) );
  AND U771 ( .A(n775), .B(n776), .Z(n718) );
  AND U772 ( .A(n777), .B(n778), .Z(n776) );
  NAND U773 ( .A(n779), .B(n735), .Z(n778) );
  XNOR U774 ( .A(n780), .B(n781), .Z(n779) );
  XNOR U775 ( .A(n782), .B(n783), .Z(n781) );
  AND U776 ( .A(n784), .B(n785), .Z(n777) );
  NAND U777 ( .A(\stack[0][2] ), .B(n786), .Z(n785) );
  ANDN U778 ( .B(\stack[1][2] ), .A(n739), .Z(n786) );
  NAND U779 ( .A(n787), .B(n741), .Z(n784) );
  AND U780 ( .A(n789), .B(n790), .Z(n775) );
  NANDN U781 ( .A(n746), .B(\stack[0][2] ), .Z(n790) );
  XNOR U782 ( .A(n791), .B(n792), .Z(n789) );
  XNOR U783 ( .A(n793), .B(n794), .Z(n792) );
  NAND U784 ( .A(n795), .B(n796), .Z(n696) );
  NANDN U785 ( .A(n727), .B(\stack[0][3] ), .Z(n796) );
  ANDN U786 ( .B(n797), .A(n713), .Z(n795) );
  ANDN U787 ( .B(x[3]), .A(n703), .Z(n713) );
  NANDN U788 ( .A(n715), .B(n729), .Z(n797) );
  AND U789 ( .A(n798), .B(n799), .Z(n715) );
  AND U790 ( .A(n800), .B(n801), .Z(n799) );
  NAND U791 ( .A(n802), .B(n735), .Z(n801) );
  XOR U792 ( .A(n803), .B(n804), .Z(n802) );
  XNOR U793 ( .A(n805), .B(n806), .Z(n804) );
  AND U794 ( .A(n807), .B(n808), .Z(n800) );
  NAND U795 ( .A(\stack[1][3] ), .B(n809), .Z(n808) );
  ANDN U796 ( .B(\stack[0][3] ), .A(n739), .Z(n809) );
  NAND U797 ( .A(n810), .B(n741), .Z(n807) );
  AND U798 ( .A(n812), .B(n813), .Z(n798) );
  NANDN U799 ( .A(n746), .B(\stack[0][3] ), .Z(n813) );
  XNOR U800 ( .A(n814), .B(n815), .Z(n812) );
  XNOR U801 ( .A(n816), .B(n817), .Z(n815) );
  NAND U802 ( .A(n818), .B(n819), .Z(n695) );
  NANDN U803 ( .A(n727), .B(\stack[0][4] ), .Z(n819) );
  ANDN U804 ( .B(n820), .A(n710), .Z(n818) );
  ANDN U805 ( .B(x[4]), .A(n703), .Z(n710) );
  NANDN U806 ( .A(n712), .B(n729), .Z(n820) );
  AND U807 ( .A(n821), .B(n822), .Z(n712) );
  AND U808 ( .A(n823), .B(n824), .Z(n822) );
  NAND U809 ( .A(n825), .B(n735), .Z(n824) );
  XOR U810 ( .A(n826), .B(n827), .Z(n825) );
  XOR U811 ( .A(n828), .B(n829), .Z(n827) );
  AND U812 ( .A(n830), .B(n831), .Z(n823) );
  NAND U813 ( .A(n832), .B(\stack[1][4] ), .Z(n831) );
  ANDN U814 ( .B(\stack[0][4] ), .A(n739), .Z(n832) );
  NAND U815 ( .A(n833), .B(n741), .Z(n830) );
  NANDN U816 ( .A(\stack[1][4] ), .B(n834), .Z(n833) );
  AND U817 ( .A(n835), .B(n836), .Z(n821) );
  NANDN U818 ( .A(n746), .B(\stack[0][4] ), .Z(n836) );
  XNOR U819 ( .A(n837), .B(n838), .Z(n835) );
  XNOR U820 ( .A(n839), .B(n840), .Z(n838) );
  NAND U821 ( .A(n841), .B(n842), .Z(n694) );
  NANDN U822 ( .A(n727), .B(\stack[0][5] ), .Z(n842) );
  ANDN U823 ( .B(n843), .A(n707), .Z(n841) );
  ANDN U824 ( .B(x[5]), .A(n703), .Z(n707) );
  NANDN U825 ( .A(n709), .B(n729), .Z(n843) );
  AND U826 ( .A(n844), .B(n845), .Z(n709) );
  AND U827 ( .A(n846), .B(n847), .Z(n845) );
  NAND U828 ( .A(n848), .B(n735), .Z(n847) );
  XOR U829 ( .A(n849), .B(n850), .Z(n848) );
  XNOR U830 ( .A(n851), .B(n852), .Z(n850) );
  AND U831 ( .A(n853), .B(n854), .Z(n846) );
  NAND U832 ( .A(\stack[0][5] ), .B(n855), .Z(n854) );
  ANDN U833 ( .B(\stack[1][5] ), .A(n739), .Z(n855) );
  NAND U834 ( .A(n856), .B(n741), .Z(n853) );
  NANDN U835 ( .A(\stack[1][5] ), .B(n857), .Z(n856) );
  AND U836 ( .A(n858), .B(n859), .Z(n844) );
  NANDN U837 ( .A(n746), .B(\stack[0][5] ), .Z(n859) );
  XNOR U838 ( .A(n860), .B(n861), .Z(n858) );
  XNOR U839 ( .A(n862), .B(n863), .Z(n861) );
  NAND U840 ( .A(n864), .B(n865), .Z(n693) );
  NANDN U841 ( .A(n727), .B(\stack[0][6] ), .Z(n865) );
  ANDN U842 ( .B(n866), .A(n704), .Z(n864) );
  ANDN U843 ( .B(x[6]), .A(n703), .Z(n704) );
  NANDN U844 ( .A(n706), .B(n729), .Z(n866) );
  AND U845 ( .A(n867), .B(n868), .Z(n706) );
  AND U846 ( .A(n869), .B(n870), .Z(n868) );
  NAND U847 ( .A(n871), .B(n735), .Z(n870) );
  XOR U848 ( .A(n872), .B(n873), .Z(n871) );
  XNOR U849 ( .A(n874), .B(n875), .Z(n873) );
  AND U850 ( .A(n876), .B(n877), .Z(n869) );
  NAND U851 ( .A(\stack[0][6] ), .B(n878), .Z(n877) );
  ANDN U852 ( .B(\stack[1][6] ), .A(n739), .Z(n878) );
  NAND U853 ( .A(n879), .B(n741), .Z(n876) );
  AND U854 ( .A(n880), .B(n881), .Z(n867) );
  NANDN U855 ( .A(n746), .B(\stack[0][6] ), .Z(n881) );
  XOR U856 ( .A(n882), .B(n883), .Z(n880) );
  XOR U857 ( .A(n884), .B(n885), .Z(n883) );
  NAND U858 ( .A(n886), .B(n887), .Z(n692) );
  NANDN U859 ( .A(n727), .B(\stack[0][7] ), .Z(n887) );
  NANDN U860 ( .A(n888), .B(n889), .Z(n727) );
  AND U861 ( .A(n890), .B(n703), .Z(n889) );
  ANDN U862 ( .B(n891), .A(n700), .Z(n886) );
  ANDN U863 ( .B(x[7]), .A(n703), .Z(n700) );
  NANDN U864 ( .A(n702), .B(n729), .Z(n891) );
  NANDN U865 ( .A(n888), .B(n890), .Z(n729) );
  AND U866 ( .A(n892), .B(n893), .Z(n702) );
  AND U867 ( .A(n894), .B(n895), .Z(n893) );
  NAND U868 ( .A(n896), .B(n735), .Z(n895) );
  AND U869 ( .A(n897), .B(n898), .Z(n896) );
  NANDN U870 ( .A(n899), .B(n900), .Z(n898) );
  NAND U871 ( .A(n901), .B(n899), .Z(n897) );
  XNOR U872 ( .A(n902), .B(n903), .Z(n899) );
  XOR U873 ( .A(n904), .B(n905), .Z(n903) );
  XOR U874 ( .A(n906), .B(n907), .Z(n905) );
  XOR U875 ( .A(n908), .B(n909), .Z(n907) );
  XOR U876 ( .A(n910), .B(n911), .Z(n909) );
  NAND U877 ( .A(n912), .B(n913), .Z(n911) );
  NAND U878 ( .A(\stack[0][0] ), .B(n914), .Z(n913) );
  ANDN U879 ( .B(\stack[1][6] ), .A(n915), .Z(n914) );
  NAND U880 ( .A(\stack[1][7] ), .B(n742), .Z(n912) );
  IV U881 ( .A(\stack[0][0] ), .Z(n742) );
  XOR U882 ( .A(n916), .B(n917), .Z(n910) );
  AND U883 ( .A(n918), .B(n919), .Z(n917) );
  NAND U884 ( .A(n920), .B(n921), .Z(n919) );
  NANDN U885 ( .A(n922), .B(n923), .Z(n918) );
  AND U886 ( .A(\stack[0][6] ), .B(\stack[1][1] ), .Z(n916) );
  XOR U887 ( .A(n924), .B(n925), .Z(n908) );
  AND U888 ( .A(n926), .B(n927), .Z(n925) );
  NAND U889 ( .A(n928), .B(n929), .Z(n927) );
  NANDN U890 ( .A(n930), .B(n931), .Z(n929) );
  AND U891 ( .A(\stack[1][4] ), .B(\stack[0][3] ), .Z(n924) );
  XOR U892 ( .A(n932), .B(n933), .Z(n906) );
  XOR U893 ( .A(n934), .B(n935), .Z(n933) );
  AND U894 ( .A(\stack[0][1] ), .B(\stack[1][6] ), .Z(n935) );
  AND U895 ( .A(\stack[0][4] ), .B(\stack[1][3] ), .Z(n934) );
  XOR U896 ( .A(n936), .B(n937), .Z(n932) );
  AND U897 ( .A(n938), .B(n939), .Z(n937) );
  NAND U898 ( .A(n940), .B(n941), .Z(n939) );
  NANDN U899 ( .A(n942), .B(n943), .Z(n938) );
  AND U900 ( .A(\stack[1][5] ), .B(\stack[0][2] ), .Z(n936) );
  AND U901 ( .A(n944), .B(n945), .Z(n904) );
  NANDN U902 ( .A(n946), .B(n947), .Z(n945) );
  NANDN U903 ( .A(n948), .B(n949), .Z(n944) );
  XOR U904 ( .A(n950), .B(n951), .Z(n902) );
  AND U905 ( .A(\stack[1][2] ), .B(\stack[0][5] ), .Z(n951) );
  AND U906 ( .A(n952), .B(n953), .Z(n950) );
  NAND U907 ( .A(n954), .B(n875), .Z(n953) );
  NAND U908 ( .A(n955), .B(n956), .Z(n875) );
  NANDN U909 ( .A(n852), .B(n957), .Z(n956) );
  OR U910 ( .A(n851), .B(n849), .Z(n957) );
  AND U911 ( .A(n958), .B(n959), .Z(n852) );
  NANDN U912 ( .A(n826), .B(n960), .Z(n959) );
  NAND U913 ( .A(n961), .B(n829), .Z(n958) );
  NAND U914 ( .A(n962), .B(n963), .Z(n829) );
  NANDN U915 ( .A(n806), .B(n964), .Z(n963) );
  OR U916 ( .A(n805), .B(n803), .Z(n964) );
  AND U917 ( .A(n965), .B(n966), .Z(n806) );
  NANDN U918 ( .A(n780), .B(n782), .Z(n966) );
  NANDN U919 ( .A(n783), .B(n967), .Z(n965) );
  NANDN U920 ( .A(n782), .B(n780), .Z(n967) );
  XNOR U921 ( .A(n968), .B(n969), .Z(n780) );
  NAND U922 ( .A(\stack[1][2] ), .B(\stack[0][0] ), .Z(n969) );
  NOR U923 ( .A(n759), .B(n760), .Z(n782) );
  NAND U924 ( .A(\stack[1][0] ), .B(\stack[0][1] ), .Z(n760) );
  NAND U925 ( .A(\stack[1][1] ), .B(\stack[0][0] ), .Z(n759) );
  NAND U926 ( .A(\stack[1][0] ), .B(\stack[0][2] ), .Z(n783) );
  NAND U927 ( .A(n803), .B(n805), .Z(n962) );
  ANDN U928 ( .B(\stack[0][3] ), .A(n743), .Z(n805) );
  XOR U929 ( .A(n970), .B(n971), .Z(n803) );
  XNOR U930 ( .A(n972), .B(n973), .Z(n971) );
  NAND U931 ( .A(n828), .B(n826), .Z(n961) );
  XOR U932 ( .A(n974), .B(n975), .Z(n826) );
  XNOR U933 ( .A(n976), .B(n977), .Z(n975) );
  IV U934 ( .A(n960), .Z(n828) );
  NOR U935 ( .A(n743), .B(n834), .Z(n960) );
  NAND U936 ( .A(n849), .B(n851), .Z(n955) );
  ANDN U937 ( .B(\stack[1][0] ), .A(n857), .Z(n851) );
  XNOR U938 ( .A(n978), .B(n979), .Z(n849) );
  XOR U939 ( .A(n980), .B(n981), .Z(n979) );
  NANDN U940 ( .A(n874), .B(n872), .Z(n954) );
  AND U941 ( .A(n982), .B(n983), .Z(n952) );
  NAND U942 ( .A(\stack[0][7] ), .B(n743), .Z(n983) );
  NANDN U943 ( .A(n872), .B(n874), .Z(n982) );
  ANDN U944 ( .B(\stack[0][6] ), .A(n743), .Z(n874) );
  IV U945 ( .A(\stack[1][0] ), .Z(n743) );
  XNOR U946 ( .A(n921), .B(n984), .Z(n872) );
  XNOR U947 ( .A(n920), .B(n922), .Z(n984) );
  AND U948 ( .A(n985), .B(n986), .Z(n922) );
  NANDN U949 ( .A(n978), .B(n987), .Z(n986) );
  NANDN U950 ( .A(n981), .B(n988), .Z(n985) );
  NAND U951 ( .A(n980), .B(n978), .Z(n988) );
  XOR U952 ( .A(n989), .B(n990), .Z(n978) );
  XNOR U953 ( .A(n991), .B(n992), .Z(n990) );
  IV U954 ( .A(n987), .Z(n980) );
  NOR U955 ( .A(n765), .B(n834), .Z(n987) );
  AND U956 ( .A(n993), .B(n994), .Z(n981) );
  NANDN U957 ( .A(n974), .B(n976), .Z(n994) );
  NANDN U958 ( .A(n977), .B(n995), .Z(n993) );
  NANDN U959 ( .A(n976), .B(n974), .Z(n995) );
  XNOR U960 ( .A(n996), .B(n997), .Z(n974) );
  XNOR U961 ( .A(n998), .B(n999), .Z(n997) );
  AND U962 ( .A(\stack[1][1] ), .B(\stack[0][3] ), .Z(n976) );
  AND U963 ( .A(n1000), .B(n1001), .Z(n977) );
  NANDN U964 ( .A(n970), .B(n972), .Z(n1001) );
  NAND U965 ( .A(n1002), .B(n973), .Z(n1000) );
  ANDN U966 ( .B(n1003), .A(n968), .Z(n973) );
  NAND U967 ( .A(\stack[1][1] ), .B(\stack[0][1] ), .Z(n968) );
  AND U968 ( .A(\stack[1][2] ), .B(\stack[0][0] ), .Z(n1003) );
  NANDN U969 ( .A(n972), .B(n970), .Z(n1002) );
  XNOR U970 ( .A(n1004), .B(n1005), .Z(n970) );
  NAND U971 ( .A(\stack[0][0] ), .B(\stack[1][3] ), .Z(n1005) );
  AND U972 ( .A(\stack[1][1] ), .B(\stack[0][2] ), .Z(n972) );
  NOR U973 ( .A(n765), .B(n857), .Z(n920) );
  IV U974 ( .A(\stack[0][5] ), .Z(n857) );
  IV U975 ( .A(\stack[1][1] ), .Z(n765) );
  XNOR U976 ( .A(n946), .B(n1006), .Z(n921) );
  XNOR U977 ( .A(n947), .B(n948), .Z(n1006) );
  AND U978 ( .A(n1007), .B(n1008), .Z(n948) );
  NANDN U979 ( .A(n989), .B(n991), .Z(n1008) );
  NANDN U980 ( .A(n992), .B(n1009), .Z(n1007) );
  NANDN U981 ( .A(n991), .B(n989), .Z(n1009) );
  XNOR U982 ( .A(n1010), .B(n1011), .Z(n989) );
  XOR U983 ( .A(n1012), .B(n1013), .Z(n1011) );
  AND U984 ( .A(\stack[0][3] ), .B(\stack[1][2] ), .Z(n991) );
  AND U985 ( .A(n1014), .B(n1015), .Z(n992) );
  NANDN U986 ( .A(n996), .B(n998), .Z(n1015) );
  NAND U987 ( .A(n1016), .B(n999), .Z(n1014) );
  ANDN U988 ( .B(n1017), .A(n1004), .Z(n999) );
  NAND U989 ( .A(\stack[1][2] ), .B(\stack[0][1] ), .Z(n1004) );
  AND U990 ( .A(\stack[0][0] ), .B(\stack[1][3] ), .Z(n1017) );
  NANDN U991 ( .A(n998), .B(n996), .Z(n1016) );
  XNOR U992 ( .A(n1018), .B(n1019), .Z(n996) );
  NAND U993 ( .A(\stack[0][0] ), .B(\stack[1][4] ), .Z(n1019) );
  AND U994 ( .A(\stack[0][2] ), .B(\stack[1][2] ), .Z(n998) );
  NOR U995 ( .A(n788), .B(n834), .Z(n947) );
  IV U996 ( .A(\stack[0][4] ), .Z(n834) );
  IV U997 ( .A(\stack[1][2] ), .Z(n788) );
  XNOR U998 ( .A(n930), .B(n931), .Z(n1020) );
  AND U999 ( .A(n1021), .B(n1022), .Z(n931) );
  NANDN U1000 ( .A(n1010), .B(n1023), .Z(n1022) );
  NANDN U1001 ( .A(n1012), .B(n1013), .Z(n1023) );
  XNOR U1002 ( .A(n1024), .B(n1025), .Z(n1010) );
  NAND U1003 ( .A(\stack[0][0] ), .B(\stack[1][5] ), .Z(n1025) );
  NANDN U1004 ( .A(n1013), .B(n1012), .Z(n1021) );
  ANDN U1005 ( .B(n1026), .A(n1018), .Z(n1012) );
  NAND U1006 ( .A(\stack[1][3] ), .B(\stack[0][1] ), .Z(n1018) );
  AND U1007 ( .A(\stack[1][4] ), .B(\stack[0][0] ), .Z(n1026) );
  NAND U1008 ( .A(\stack[0][2] ), .B(\stack[1][3] ), .Z(n1013) );
  ANDN U1009 ( .B(\stack[0][3] ), .A(n811), .Z(n930) );
  IV U1010 ( .A(\stack[1][3] ), .Z(n811) );
  XNOR U1011 ( .A(n941), .B(n1027), .Z(n928) );
  XOR U1012 ( .A(n942), .B(n940), .Z(n1027) );
  ANDN U1013 ( .B(n1028), .A(n1024), .Z(n940) );
  NAND U1014 ( .A(\stack[1][4] ), .B(\stack[0][1] ), .Z(n1024) );
  AND U1015 ( .A(\stack[1][5] ), .B(\stack[0][0] ), .Z(n1028) );
  NAND U1016 ( .A(\stack[0][2] ), .B(\stack[1][4] ), .Z(n942) );
  XOR U1017 ( .A(n915), .B(n1029), .Z(n941) );
  NAND U1018 ( .A(\stack[0][0] ), .B(\stack[1][6] ), .Z(n1029) );
  NAND U1019 ( .A(\stack[1][5] ), .B(\stack[0][1] ), .Z(n915) );
  XOR U1020 ( .A(\stack[1][7] ), .B(\stack[0][7] ), .Z(n901) );
  AND U1021 ( .A(n1030), .B(n1031), .Z(n894) );
  NAND U1022 ( .A(\stack[1][7] ), .B(n1032), .Z(n1031) );
  ANDN U1023 ( .B(\stack[0][7] ), .A(n739), .Z(n1032) );
  NAND U1024 ( .A(n1033), .B(opcode[2]), .Z(n739) );
  NAND U1025 ( .A(n1034), .B(n741), .Z(n1030) );
  ANDN U1026 ( .B(opcode[0]), .A(n1035), .Z(n741) );
  AND U1027 ( .A(n1036), .B(n1037), .Z(n892) );
  NANDN U1028 ( .A(n746), .B(\stack[0][7] ), .Z(n1037) );
  NAND U1029 ( .A(n1033), .B(n1038), .Z(n746) );
  XOR U1030 ( .A(n1039), .B(n1040), .Z(n1036) );
  XOR U1031 ( .A(n749), .B(n1041), .Z(n1040) );
  NAND U1032 ( .A(n1042), .B(n1043), .Z(n1041) );
  NANDN U1033 ( .A(n885), .B(n1044), .Z(n1043) );
  OR U1034 ( .A(n884), .B(n882), .Z(n1044) );
  AND U1035 ( .A(n1045), .B(n1046), .Z(n885) );
  NAND U1036 ( .A(\stack[0][6] ), .B(n1047), .Z(n1046) );
  NAND U1037 ( .A(\stack[0][6] ), .B(n1048), .Z(n1045) );
  NAND U1038 ( .A(n884), .B(n882), .Z(n1042) );
  XNOR U1039 ( .A(n749), .B(n1049), .Z(n882) );
  NAND U1040 ( .A(n1050), .B(n1051), .Z(n1049) );
  NAND U1041 ( .A(n1048), .B(\stack[1][6] ), .Z(n1051) );
  AND U1042 ( .A(n1052), .B(n1053), .Z(n1050) );
  NANDN U1043 ( .A(n890), .B(\stack[0][6] ), .Z(n1053) );
  NAND U1044 ( .A(\stack[1][6] ), .B(n1047), .Z(n1052) );
  NAND U1045 ( .A(n1054), .B(n1055), .Z(n884) );
  NANDN U1046 ( .A(n862), .B(n1056), .Z(n1055) );
  NANDN U1047 ( .A(n863), .B(n1057), .Z(n1054) );
  NAND U1048 ( .A(n860), .B(n862), .Z(n1057) );
  AND U1049 ( .A(n1058), .B(n1059), .Z(n862) );
  NANDN U1050 ( .A(n839), .B(n1060), .Z(n1059) );
  NANDN U1051 ( .A(n840), .B(n1061), .Z(n1058) );
  NAND U1052 ( .A(n837), .B(n839), .Z(n1061) );
  AND U1053 ( .A(n1062), .B(n1063), .Z(n839) );
  NANDN U1054 ( .A(n816), .B(n1064), .Z(n1063) );
  NANDN U1055 ( .A(n817), .B(n1065), .Z(n1062) );
  NAND U1056 ( .A(n814), .B(n816), .Z(n1065) );
  AND U1057 ( .A(n1066), .B(n1067), .Z(n816) );
  NANDN U1058 ( .A(n793), .B(n1068), .Z(n1067) );
  NANDN U1059 ( .A(n794), .B(n1069), .Z(n1066) );
  NAND U1060 ( .A(n791), .B(n793), .Z(n1069) );
  AND U1061 ( .A(n1070), .B(n1071), .Z(n793) );
  NANDN U1062 ( .A(n770), .B(n1072), .Z(n1071) );
  NANDN U1063 ( .A(n771), .B(n1073), .Z(n1070) );
  NAND U1064 ( .A(n768), .B(n770), .Z(n1073) );
  AND U1065 ( .A(n1074), .B(n1075), .Z(n770) );
  OR U1066 ( .A(n749), .B(n1076), .Z(n1075) );
  NANDN U1067 ( .A(n750), .B(n1077), .Z(n1074) );
  NAND U1068 ( .A(n1076), .B(n749), .Z(n1077) );
  IV U1069 ( .A(n747), .Z(n1076) );
  XNOR U1070 ( .A(n749), .B(n1078), .Z(n747) );
  NAND U1071 ( .A(n1079), .B(n1080), .Z(n1078) );
  NAND U1072 ( .A(\stack[1][0] ), .B(n1048), .Z(n1080) );
  AND U1073 ( .A(n1081), .B(n1082), .Z(n1079) );
  NANDN U1074 ( .A(n890), .B(\stack[0][0] ), .Z(n1082) );
  NAND U1075 ( .A(\stack[1][0] ), .B(n1047), .Z(n1081) );
  AND U1076 ( .A(n1083), .B(n1084), .Z(n750) );
  NAND U1077 ( .A(\stack[0][0] ), .B(n1047), .Z(n1084) );
  NAND U1078 ( .A(\stack[0][0] ), .B(n1048), .Z(n1083) );
  IV U1079 ( .A(n1072), .Z(n768) );
  XNOR U1080 ( .A(n749), .B(n1085), .Z(n1072) );
  NAND U1081 ( .A(n1086), .B(n1087), .Z(n1085) );
  NAND U1082 ( .A(\stack[1][1] ), .B(n1048), .Z(n1087) );
  AND U1083 ( .A(n1088), .B(n1089), .Z(n1086) );
  NANDN U1084 ( .A(n890), .B(\stack[0][1] ), .Z(n1089) );
  NAND U1085 ( .A(\stack[1][1] ), .B(n1047), .Z(n1088) );
  AND U1086 ( .A(n1090), .B(n1091), .Z(n771) );
  NAND U1087 ( .A(\stack[0][1] ), .B(n1047), .Z(n1091) );
  NAND U1088 ( .A(n1048), .B(\stack[0][1] ), .Z(n1090) );
  IV U1089 ( .A(n1068), .Z(n791) );
  XNOR U1090 ( .A(n749), .B(n1092), .Z(n1068) );
  NAND U1091 ( .A(n1093), .B(n1094), .Z(n1092) );
  NAND U1092 ( .A(\stack[1][2] ), .B(n1048), .Z(n1094) );
  AND U1093 ( .A(n1095), .B(n1096), .Z(n1093) );
  NANDN U1094 ( .A(n890), .B(\stack[0][2] ), .Z(n1096) );
  NAND U1095 ( .A(\stack[1][2] ), .B(n1047), .Z(n1095) );
  AND U1096 ( .A(n1097), .B(n1098), .Z(n794) );
  NAND U1097 ( .A(\stack[0][2] ), .B(n1047), .Z(n1098) );
  NAND U1098 ( .A(\stack[0][2] ), .B(n1048), .Z(n1097) );
  IV U1099 ( .A(n1064), .Z(n814) );
  XNOR U1100 ( .A(n749), .B(n1099), .Z(n1064) );
  NAND U1101 ( .A(n1100), .B(n1101), .Z(n1099) );
  NAND U1102 ( .A(\stack[1][3] ), .B(n1048), .Z(n1101) );
  AND U1103 ( .A(n1102), .B(n1103), .Z(n1100) );
  NANDN U1104 ( .A(n890), .B(\stack[0][3] ), .Z(n1103) );
  NAND U1105 ( .A(\stack[1][3] ), .B(n1047), .Z(n1102) );
  AND U1106 ( .A(n1104), .B(n1105), .Z(n817) );
  NAND U1107 ( .A(\stack[0][3] ), .B(n1047), .Z(n1105) );
  NAND U1108 ( .A(\stack[0][3] ), .B(n1048), .Z(n1104) );
  IV U1109 ( .A(n1060), .Z(n837) );
  XNOR U1110 ( .A(n749), .B(n1106), .Z(n1060) );
  NAND U1111 ( .A(n1107), .B(n1108), .Z(n1106) );
  NAND U1112 ( .A(n1048), .B(\stack[1][4] ), .Z(n1108) );
  AND U1113 ( .A(n1109), .B(n1110), .Z(n1107) );
  NANDN U1114 ( .A(n890), .B(\stack[0][4] ), .Z(n1110) );
  NAND U1115 ( .A(\stack[1][4] ), .B(n1047), .Z(n1109) );
  AND U1116 ( .A(n1111), .B(n1112), .Z(n840) );
  NAND U1117 ( .A(\stack[0][4] ), .B(n1047), .Z(n1112) );
  NAND U1118 ( .A(\stack[0][4] ), .B(n1048), .Z(n1111) );
  IV U1119 ( .A(n1056), .Z(n860) );
  XNOR U1120 ( .A(n749), .B(n1113), .Z(n1056) );
  NAND U1121 ( .A(n1114), .B(n1115), .Z(n1113) );
  NAND U1122 ( .A(n1048), .B(\stack[1][5] ), .Z(n1115) );
  AND U1123 ( .A(n1116), .B(n1117), .Z(n1114) );
  NANDN U1124 ( .A(n890), .B(\stack[0][5] ), .Z(n1117) );
  NAND U1125 ( .A(\stack[1][5] ), .B(n1047), .Z(n1116) );
  AND U1126 ( .A(n1118), .B(n1119), .Z(n863) );
  NAND U1127 ( .A(\stack[0][5] ), .B(n1047), .Z(n1119) );
  NAND U1128 ( .A(\stack[0][5] ), .B(n1048), .Z(n1118) );
  AND U1129 ( .A(n890), .B(n1120), .Z(n749) );
  XOR U1130 ( .A(n1121), .B(n1122), .Z(n1039) );
  AND U1131 ( .A(n1123), .B(n1124), .Z(n1122) );
  NAND U1132 ( .A(\stack[0][7] ), .B(n1047), .Z(n1124) );
  NAND U1133 ( .A(\stack[0][7] ), .B(n1048), .Z(n1123) );
  AND U1134 ( .A(n1125), .B(n1126), .Z(n1121) );
  NAND U1135 ( .A(\stack[1][7] ), .B(n1048), .Z(n1126) );
  AND U1136 ( .A(n1127), .B(n1128), .Z(n1125) );
  NANDN U1137 ( .A(n890), .B(\stack[0][7] ), .Z(n1128) );
  NAND U1138 ( .A(opcode[0]), .B(n1129), .Z(n890) );
  AND U1139 ( .A(n1038), .B(opcode[2]), .Z(n1129) );
  NAND U1140 ( .A(\stack[1][7] ), .B(n1047), .Z(n1127) );
  NAND U1141 ( .A(n1130), .B(n1131), .Z(n691) );
  NAND U1142 ( .A(\stack[1][0] ), .B(n1132), .Z(n1131) );
  NAND U1143 ( .A(n1133), .B(n1134), .Z(n1130) );
  NAND U1144 ( .A(n1135), .B(n1136), .Z(n1134) );
  NAND U1145 ( .A(n703), .B(\stack[2][0] ), .Z(n1136) );
  NAND U1146 ( .A(\stack[0][0] ), .B(n1137), .Z(n1135) );
  NAND U1147 ( .A(n1138), .B(n1139), .Z(n690) );
  NAND U1148 ( .A(\stack[1][1] ), .B(n1132), .Z(n1139) );
  NAND U1149 ( .A(n1133), .B(n1140), .Z(n1138) );
  NAND U1150 ( .A(n1141), .B(n1142), .Z(n1140) );
  NAND U1151 ( .A(n703), .B(\stack[2][1] ), .Z(n1142) );
  NAND U1152 ( .A(n1137), .B(\stack[0][1] ), .Z(n1141) );
  NAND U1153 ( .A(n1143), .B(n1144), .Z(n689) );
  NAND U1154 ( .A(\stack[1][2] ), .B(n1132), .Z(n1144) );
  NAND U1155 ( .A(n1133), .B(n1145), .Z(n1143) );
  NAND U1156 ( .A(n1146), .B(n1147), .Z(n1145) );
  NAND U1157 ( .A(n703), .B(\stack[2][2] ), .Z(n1147) );
  NAND U1158 ( .A(\stack[0][2] ), .B(n1137), .Z(n1146) );
  NAND U1159 ( .A(n1148), .B(n1149), .Z(n688) );
  NAND U1160 ( .A(\stack[1][3] ), .B(n1132), .Z(n1149) );
  NAND U1161 ( .A(n1133), .B(n1150), .Z(n1148) );
  NAND U1162 ( .A(n1151), .B(n1152), .Z(n1150) );
  NAND U1163 ( .A(n703), .B(\stack[2][3] ), .Z(n1152) );
  NAND U1164 ( .A(\stack[0][3] ), .B(n1137), .Z(n1151) );
  NAND U1165 ( .A(n1153), .B(n1154), .Z(n687) );
  NAND U1166 ( .A(n1132), .B(\stack[1][4] ), .Z(n1154) );
  NAND U1167 ( .A(n1133), .B(n1155), .Z(n1153) );
  NAND U1168 ( .A(n1156), .B(n1157), .Z(n1155) );
  NAND U1169 ( .A(n703), .B(\stack[2][4] ), .Z(n1157) );
  NAND U1170 ( .A(\stack[0][4] ), .B(n1137), .Z(n1156) );
  NAND U1171 ( .A(n1158), .B(n1159), .Z(n686) );
  NAND U1172 ( .A(n1132), .B(\stack[1][5] ), .Z(n1159) );
  NAND U1173 ( .A(n1133), .B(n1160), .Z(n1158) );
  NAND U1174 ( .A(n1161), .B(n1162), .Z(n1160) );
  NAND U1175 ( .A(n703), .B(\stack[2][5] ), .Z(n1162) );
  NAND U1176 ( .A(\stack[0][5] ), .B(n1137), .Z(n1161) );
  NAND U1177 ( .A(n1163), .B(n1164), .Z(n685) );
  NAND U1178 ( .A(n1132), .B(\stack[1][6] ), .Z(n1164) );
  NAND U1179 ( .A(n1133), .B(n1165), .Z(n1163) );
  NAND U1180 ( .A(n1166), .B(n1167), .Z(n1165) );
  NAND U1181 ( .A(n703), .B(\stack[2][6] ), .Z(n1167) );
  NAND U1182 ( .A(\stack[0][6] ), .B(n1137), .Z(n1166) );
  NAND U1183 ( .A(n1168), .B(n1169), .Z(n684) );
  NAND U1184 ( .A(\stack[1][7] ), .B(n1132), .Z(n1169) );
  NAND U1185 ( .A(n1133), .B(n1170), .Z(n1168) );
  NAND U1186 ( .A(n1171), .B(n1172), .Z(n1170) );
  NAND U1187 ( .A(n703), .B(\stack[2][7] ), .Z(n1172) );
  NAND U1188 ( .A(\stack[0][7] ), .B(n1137), .Z(n1171) );
  NAND U1189 ( .A(n1173), .B(n1174), .Z(n683) );
  NAND U1190 ( .A(n1132), .B(\stack[2][0] ), .Z(n1174) );
  NAND U1191 ( .A(n1133), .B(n1175), .Z(n1173) );
  NAND U1192 ( .A(n1176), .B(n1177), .Z(n1175) );
  NAND U1193 ( .A(n703), .B(\stack[3][0] ), .Z(n1177) );
  NAND U1194 ( .A(\stack[1][0] ), .B(n1137), .Z(n1176) );
  NAND U1195 ( .A(n1178), .B(n1179), .Z(n682) );
  NAND U1196 ( .A(n1132), .B(\stack[2][1] ), .Z(n1179) );
  NAND U1197 ( .A(n1133), .B(n1180), .Z(n1178) );
  NAND U1198 ( .A(n1181), .B(n1182), .Z(n1180) );
  NAND U1199 ( .A(n703), .B(\stack[3][1] ), .Z(n1182) );
  NAND U1200 ( .A(\stack[1][1] ), .B(n1137), .Z(n1181) );
  NAND U1201 ( .A(n1183), .B(n1184), .Z(n681) );
  NAND U1202 ( .A(n1132), .B(\stack[2][2] ), .Z(n1184) );
  NAND U1203 ( .A(n1133), .B(n1185), .Z(n1183) );
  NAND U1204 ( .A(n1186), .B(n1187), .Z(n1185) );
  NAND U1205 ( .A(n703), .B(\stack[3][2] ), .Z(n1187) );
  NAND U1206 ( .A(\stack[1][2] ), .B(n1137), .Z(n1186) );
  NAND U1207 ( .A(n1188), .B(n1189), .Z(n680) );
  NAND U1208 ( .A(n1132), .B(\stack[2][3] ), .Z(n1189) );
  NAND U1209 ( .A(n1133), .B(n1190), .Z(n1188) );
  NAND U1210 ( .A(n1191), .B(n1192), .Z(n1190) );
  NAND U1211 ( .A(n703), .B(\stack[3][3] ), .Z(n1192) );
  NAND U1212 ( .A(\stack[1][3] ), .B(n1137), .Z(n1191) );
  NAND U1213 ( .A(n1193), .B(n1194), .Z(n679) );
  NAND U1214 ( .A(n1132), .B(\stack[2][4] ), .Z(n1194) );
  NAND U1215 ( .A(n1133), .B(n1195), .Z(n1193) );
  NAND U1216 ( .A(n1196), .B(n1197), .Z(n1195) );
  NAND U1217 ( .A(n703), .B(\stack[3][4] ), .Z(n1197) );
  NAND U1218 ( .A(n1137), .B(\stack[1][4] ), .Z(n1196) );
  NAND U1219 ( .A(n1198), .B(n1199), .Z(n678) );
  NAND U1220 ( .A(n1132), .B(\stack[2][5] ), .Z(n1199) );
  NAND U1221 ( .A(n1133), .B(n1200), .Z(n1198) );
  NAND U1222 ( .A(n1201), .B(n1202), .Z(n1200) );
  NAND U1223 ( .A(n703), .B(\stack[3][5] ), .Z(n1202) );
  NAND U1224 ( .A(n1137), .B(\stack[1][5] ), .Z(n1201) );
  NAND U1225 ( .A(n1203), .B(n1204), .Z(n677) );
  NAND U1226 ( .A(n1132), .B(\stack[2][6] ), .Z(n1204) );
  NAND U1227 ( .A(n1133), .B(n1205), .Z(n1203) );
  NAND U1228 ( .A(n1206), .B(n1207), .Z(n1205) );
  NAND U1229 ( .A(n703), .B(\stack[3][6] ), .Z(n1207) );
  NAND U1230 ( .A(n1137), .B(\stack[1][6] ), .Z(n1206) );
  NAND U1231 ( .A(n1208), .B(n1209), .Z(n676) );
  NAND U1232 ( .A(n1132), .B(\stack[2][7] ), .Z(n1209) );
  NAND U1233 ( .A(n1133), .B(n1210), .Z(n1208) );
  NAND U1234 ( .A(n1211), .B(n1212), .Z(n1210) );
  NAND U1235 ( .A(n703), .B(\stack[3][7] ), .Z(n1212) );
  NAND U1236 ( .A(n1137), .B(\stack[1][7] ), .Z(n1211) );
  NAND U1237 ( .A(n1213), .B(n1214), .Z(n675) );
  NAND U1238 ( .A(n1132), .B(\stack[3][0] ), .Z(n1214) );
  NAND U1239 ( .A(n1133), .B(n1215), .Z(n1213) );
  NAND U1240 ( .A(n1216), .B(n1217), .Z(n1215) );
  NAND U1241 ( .A(n703), .B(\stack[4][0] ), .Z(n1217) );
  NAND U1242 ( .A(n1137), .B(\stack[2][0] ), .Z(n1216) );
  NAND U1243 ( .A(n1218), .B(n1219), .Z(n674) );
  NAND U1244 ( .A(n1132), .B(\stack[3][1] ), .Z(n1219) );
  NAND U1245 ( .A(n1133), .B(n1220), .Z(n1218) );
  NAND U1246 ( .A(n1221), .B(n1222), .Z(n1220) );
  NAND U1247 ( .A(n703), .B(\stack[4][1] ), .Z(n1222) );
  NAND U1248 ( .A(n1137), .B(\stack[2][1] ), .Z(n1221) );
  NAND U1249 ( .A(n1223), .B(n1224), .Z(n673) );
  NAND U1250 ( .A(n1132), .B(\stack[3][2] ), .Z(n1224) );
  NAND U1251 ( .A(n1133), .B(n1225), .Z(n1223) );
  NAND U1252 ( .A(n1226), .B(n1227), .Z(n1225) );
  NAND U1253 ( .A(n703), .B(\stack[4][2] ), .Z(n1227) );
  NAND U1254 ( .A(n1137), .B(\stack[2][2] ), .Z(n1226) );
  NAND U1255 ( .A(n1228), .B(n1229), .Z(n672) );
  NAND U1256 ( .A(n1132), .B(\stack[3][3] ), .Z(n1229) );
  NAND U1257 ( .A(n1133), .B(n1230), .Z(n1228) );
  NAND U1258 ( .A(n1231), .B(n1232), .Z(n1230) );
  NAND U1259 ( .A(n703), .B(\stack[4][3] ), .Z(n1232) );
  NAND U1260 ( .A(n1137), .B(\stack[2][3] ), .Z(n1231) );
  NAND U1261 ( .A(n1233), .B(n1234), .Z(n671) );
  NAND U1262 ( .A(n1132), .B(\stack[3][4] ), .Z(n1234) );
  NAND U1263 ( .A(n1133), .B(n1235), .Z(n1233) );
  NAND U1264 ( .A(n1236), .B(n1237), .Z(n1235) );
  NAND U1265 ( .A(n703), .B(\stack[4][4] ), .Z(n1237) );
  NAND U1266 ( .A(n1137), .B(\stack[2][4] ), .Z(n1236) );
  NAND U1267 ( .A(n1238), .B(n1239), .Z(n670) );
  NAND U1268 ( .A(n1132), .B(\stack[3][5] ), .Z(n1239) );
  NAND U1269 ( .A(n1133), .B(n1240), .Z(n1238) );
  NAND U1270 ( .A(n1241), .B(n1242), .Z(n1240) );
  NAND U1271 ( .A(n703), .B(\stack[4][5] ), .Z(n1242) );
  NAND U1272 ( .A(n1137), .B(\stack[2][5] ), .Z(n1241) );
  NAND U1273 ( .A(n1243), .B(n1244), .Z(n669) );
  NAND U1274 ( .A(n1132), .B(\stack[3][6] ), .Z(n1244) );
  NAND U1275 ( .A(n1133), .B(n1245), .Z(n1243) );
  NAND U1276 ( .A(n1246), .B(n1247), .Z(n1245) );
  NAND U1277 ( .A(n703), .B(\stack[4][6] ), .Z(n1247) );
  NAND U1278 ( .A(n1137), .B(\stack[2][6] ), .Z(n1246) );
  NAND U1279 ( .A(n1248), .B(n1249), .Z(n668) );
  NAND U1280 ( .A(n1132), .B(\stack[3][7] ), .Z(n1249) );
  NAND U1281 ( .A(n1133), .B(n1250), .Z(n1248) );
  NAND U1282 ( .A(n1251), .B(n1252), .Z(n1250) );
  NAND U1283 ( .A(n703), .B(\stack[4][7] ), .Z(n1252) );
  NAND U1284 ( .A(n1137), .B(\stack[2][7] ), .Z(n1251) );
  NAND U1285 ( .A(n1253), .B(n1254), .Z(n667) );
  NAND U1286 ( .A(n1132), .B(\stack[4][0] ), .Z(n1254) );
  NAND U1287 ( .A(n1133), .B(n1255), .Z(n1253) );
  NAND U1288 ( .A(n1256), .B(n1257), .Z(n1255) );
  NAND U1289 ( .A(n703), .B(\stack[5][0] ), .Z(n1257) );
  NAND U1290 ( .A(n1137), .B(\stack[3][0] ), .Z(n1256) );
  NAND U1291 ( .A(n1258), .B(n1259), .Z(n666) );
  NAND U1292 ( .A(n1132), .B(\stack[4][1] ), .Z(n1259) );
  NAND U1293 ( .A(n1133), .B(n1260), .Z(n1258) );
  NAND U1294 ( .A(n1261), .B(n1262), .Z(n1260) );
  NAND U1295 ( .A(n703), .B(\stack[5][1] ), .Z(n1262) );
  NAND U1296 ( .A(n1137), .B(\stack[3][1] ), .Z(n1261) );
  NAND U1297 ( .A(n1263), .B(n1264), .Z(n665) );
  NAND U1298 ( .A(n1132), .B(\stack[4][2] ), .Z(n1264) );
  NAND U1299 ( .A(n1133), .B(n1265), .Z(n1263) );
  NAND U1300 ( .A(n1266), .B(n1267), .Z(n1265) );
  NAND U1301 ( .A(n703), .B(\stack[5][2] ), .Z(n1267) );
  NAND U1302 ( .A(n1137), .B(\stack[3][2] ), .Z(n1266) );
  NAND U1303 ( .A(n1268), .B(n1269), .Z(n664) );
  NAND U1304 ( .A(n1132), .B(\stack[4][3] ), .Z(n1269) );
  NAND U1305 ( .A(n1133), .B(n1270), .Z(n1268) );
  NAND U1306 ( .A(n1271), .B(n1272), .Z(n1270) );
  NAND U1307 ( .A(n703), .B(\stack[5][3] ), .Z(n1272) );
  NAND U1308 ( .A(n1137), .B(\stack[3][3] ), .Z(n1271) );
  NAND U1309 ( .A(n1273), .B(n1274), .Z(n663) );
  NAND U1310 ( .A(n1132), .B(\stack[4][4] ), .Z(n1274) );
  NAND U1311 ( .A(n1133), .B(n1275), .Z(n1273) );
  NAND U1312 ( .A(n1276), .B(n1277), .Z(n1275) );
  NAND U1313 ( .A(n703), .B(\stack[5][4] ), .Z(n1277) );
  NAND U1314 ( .A(n1137), .B(\stack[3][4] ), .Z(n1276) );
  NAND U1315 ( .A(n1278), .B(n1279), .Z(n662) );
  NAND U1316 ( .A(n1132), .B(\stack[4][5] ), .Z(n1279) );
  NAND U1317 ( .A(n1133), .B(n1280), .Z(n1278) );
  NAND U1318 ( .A(n1281), .B(n1282), .Z(n1280) );
  NAND U1319 ( .A(n703), .B(\stack[5][5] ), .Z(n1282) );
  NAND U1320 ( .A(n1137), .B(\stack[3][5] ), .Z(n1281) );
  NAND U1321 ( .A(n1283), .B(n1284), .Z(n661) );
  NAND U1322 ( .A(n1132), .B(\stack[4][6] ), .Z(n1284) );
  NAND U1323 ( .A(n1133), .B(n1285), .Z(n1283) );
  NAND U1324 ( .A(n1286), .B(n1287), .Z(n1285) );
  NAND U1325 ( .A(n703), .B(\stack[5][6] ), .Z(n1287) );
  NAND U1326 ( .A(n1137), .B(\stack[3][6] ), .Z(n1286) );
  NAND U1327 ( .A(n1288), .B(n1289), .Z(n660) );
  NAND U1328 ( .A(n1132), .B(\stack[4][7] ), .Z(n1289) );
  NAND U1329 ( .A(n1133), .B(n1290), .Z(n1288) );
  NAND U1330 ( .A(n1291), .B(n1292), .Z(n1290) );
  NAND U1331 ( .A(n703), .B(\stack[5][7] ), .Z(n1292) );
  NAND U1332 ( .A(n1137), .B(\stack[3][7] ), .Z(n1291) );
  NAND U1333 ( .A(n1293), .B(n1294), .Z(n659) );
  NAND U1334 ( .A(n1132), .B(\stack[5][0] ), .Z(n1294) );
  NAND U1335 ( .A(n1133), .B(n1295), .Z(n1293) );
  NAND U1336 ( .A(n1296), .B(n1297), .Z(n1295) );
  NAND U1337 ( .A(n703), .B(\stack[6][0] ), .Z(n1297) );
  NAND U1338 ( .A(n1137), .B(\stack[4][0] ), .Z(n1296) );
  NAND U1339 ( .A(n1298), .B(n1299), .Z(n658) );
  NAND U1340 ( .A(n1132), .B(\stack[5][1] ), .Z(n1299) );
  NAND U1341 ( .A(n1133), .B(n1300), .Z(n1298) );
  NAND U1342 ( .A(n1301), .B(n1302), .Z(n1300) );
  NAND U1343 ( .A(n703), .B(\stack[6][1] ), .Z(n1302) );
  NAND U1344 ( .A(n1137), .B(\stack[4][1] ), .Z(n1301) );
  NAND U1345 ( .A(n1303), .B(n1304), .Z(n657) );
  NAND U1346 ( .A(n1132), .B(\stack[5][2] ), .Z(n1304) );
  NAND U1347 ( .A(n1133), .B(n1305), .Z(n1303) );
  NAND U1348 ( .A(n1306), .B(n1307), .Z(n1305) );
  NAND U1349 ( .A(n703), .B(\stack[6][2] ), .Z(n1307) );
  NAND U1350 ( .A(n1137), .B(\stack[4][2] ), .Z(n1306) );
  NAND U1351 ( .A(n1308), .B(n1309), .Z(n656) );
  NAND U1352 ( .A(n1132), .B(\stack[5][3] ), .Z(n1309) );
  NAND U1353 ( .A(n1133), .B(n1310), .Z(n1308) );
  NAND U1354 ( .A(n1311), .B(n1312), .Z(n1310) );
  NAND U1355 ( .A(n703), .B(\stack[6][3] ), .Z(n1312) );
  NAND U1356 ( .A(n1137), .B(\stack[4][3] ), .Z(n1311) );
  NAND U1357 ( .A(n1313), .B(n1314), .Z(n655) );
  NAND U1358 ( .A(n1132), .B(\stack[5][4] ), .Z(n1314) );
  NAND U1359 ( .A(n1133), .B(n1315), .Z(n1313) );
  NAND U1360 ( .A(n1316), .B(n1317), .Z(n1315) );
  NAND U1361 ( .A(n703), .B(\stack[6][4] ), .Z(n1317) );
  NAND U1362 ( .A(n1137), .B(\stack[4][4] ), .Z(n1316) );
  NAND U1363 ( .A(n1318), .B(n1319), .Z(n654) );
  NAND U1364 ( .A(n1132), .B(\stack[5][5] ), .Z(n1319) );
  NAND U1365 ( .A(n1133), .B(n1320), .Z(n1318) );
  NAND U1366 ( .A(n1321), .B(n1322), .Z(n1320) );
  NAND U1367 ( .A(n703), .B(\stack[6][5] ), .Z(n1322) );
  NAND U1368 ( .A(n1137), .B(\stack[4][5] ), .Z(n1321) );
  NAND U1369 ( .A(n1323), .B(n1324), .Z(n653) );
  NAND U1370 ( .A(n1132), .B(\stack[5][6] ), .Z(n1324) );
  NAND U1371 ( .A(n1133), .B(n1325), .Z(n1323) );
  NAND U1372 ( .A(n1326), .B(n1327), .Z(n1325) );
  NAND U1373 ( .A(n703), .B(\stack[6][6] ), .Z(n1327) );
  NAND U1374 ( .A(n1137), .B(\stack[4][6] ), .Z(n1326) );
  NAND U1375 ( .A(n1328), .B(n1329), .Z(n652) );
  NAND U1376 ( .A(n1132), .B(\stack[5][7] ), .Z(n1329) );
  NAND U1377 ( .A(n1133), .B(n1330), .Z(n1328) );
  NAND U1378 ( .A(n1331), .B(n1332), .Z(n1330) );
  NAND U1379 ( .A(n703), .B(\stack[6][7] ), .Z(n1332) );
  NAND U1380 ( .A(n1137), .B(\stack[4][7] ), .Z(n1331) );
  NAND U1381 ( .A(n1333), .B(n1334), .Z(n651) );
  NAND U1382 ( .A(n1132), .B(\stack[6][0] ), .Z(n1334) );
  NAND U1383 ( .A(n1133), .B(n1335), .Z(n1333) );
  NAND U1384 ( .A(n1336), .B(n1337), .Z(n1335) );
  NAND U1385 ( .A(n703), .B(\stack[7][0] ), .Z(n1337) );
  NAND U1386 ( .A(n1137), .B(\stack[5][0] ), .Z(n1336) );
  NAND U1387 ( .A(n1338), .B(n1339), .Z(n650) );
  NAND U1388 ( .A(n1132), .B(\stack[6][1] ), .Z(n1339) );
  NAND U1389 ( .A(n1133), .B(n1340), .Z(n1338) );
  NAND U1390 ( .A(n1341), .B(n1342), .Z(n1340) );
  NAND U1391 ( .A(n703), .B(\stack[7][1] ), .Z(n1342) );
  NAND U1392 ( .A(n1137), .B(\stack[5][1] ), .Z(n1341) );
  NAND U1393 ( .A(n1343), .B(n1344), .Z(n649) );
  NAND U1394 ( .A(n1132), .B(\stack[6][2] ), .Z(n1344) );
  NAND U1395 ( .A(n1133), .B(n1345), .Z(n1343) );
  NAND U1396 ( .A(n1346), .B(n1347), .Z(n1345) );
  NAND U1397 ( .A(n703), .B(\stack[7][2] ), .Z(n1347) );
  NAND U1398 ( .A(n1137), .B(\stack[5][2] ), .Z(n1346) );
  NAND U1399 ( .A(n1348), .B(n1349), .Z(n648) );
  NAND U1400 ( .A(n1132), .B(\stack[6][3] ), .Z(n1349) );
  NAND U1401 ( .A(n1133), .B(n1350), .Z(n1348) );
  NAND U1402 ( .A(n1351), .B(n1352), .Z(n1350) );
  NAND U1403 ( .A(n703), .B(\stack[7][3] ), .Z(n1352) );
  NAND U1404 ( .A(n1137), .B(\stack[5][3] ), .Z(n1351) );
  NAND U1405 ( .A(n1353), .B(n1354), .Z(n647) );
  NAND U1406 ( .A(n1132), .B(\stack[6][4] ), .Z(n1354) );
  NAND U1407 ( .A(n1133), .B(n1355), .Z(n1353) );
  NAND U1408 ( .A(n1356), .B(n1357), .Z(n1355) );
  NAND U1409 ( .A(n703), .B(\stack[7][4] ), .Z(n1357) );
  NAND U1410 ( .A(n1137), .B(\stack[5][4] ), .Z(n1356) );
  NAND U1411 ( .A(n1358), .B(n1359), .Z(n646) );
  NAND U1412 ( .A(n1132), .B(\stack[6][5] ), .Z(n1359) );
  NAND U1413 ( .A(n1133), .B(n1360), .Z(n1358) );
  NAND U1414 ( .A(n1361), .B(n1362), .Z(n1360) );
  NAND U1415 ( .A(n703), .B(\stack[7][5] ), .Z(n1362) );
  NAND U1416 ( .A(n1137), .B(\stack[5][5] ), .Z(n1361) );
  NAND U1417 ( .A(n1363), .B(n1364), .Z(n645) );
  NAND U1418 ( .A(n1132), .B(\stack[6][6] ), .Z(n1364) );
  NAND U1419 ( .A(n1133), .B(n1365), .Z(n1363) );
  NAND U1420 ( .A(n1366), .B(n1367), .Z(n1365) );
  NAND U1421 ( .A(n703), .B(\stack[7][6] ), .Z(n1367) );
  NAND U1422 ( .A(n1137), .B(\stack[5][6] ), .Z(n1366) );
  NAND U1423 ( .A(n1368), .B(n1369), .Z(n644) );
  NAND U1424 ( .A(n1132), .B(\stack[6][7] ), .Z(n1369) );
  NAND U1425 ( .A(n1133), .B(n1370), .Z(n1368) );
  NAND U1426 ( .A(n1371), .B(n1372), .Z(n1370) );
  NAND U1427 ( .A(n703), .B(\stack[7][7] ), .Z(n1372) );
  NAND U1428 ( .A(n1137), .B(\stack[5][7] ), .Z(n1371) );
  IV U1429 ( .A(n1132), .Z(n1133) );
  ANDN U1430 ( .B(n703), .A(n888), .Z(n1132) );
  NAND U1431 ( .A(n1373), .B(n1374), .Z(n888) );
  ANDN U1432 ( .B(n1120), .A(n735), .Z(n1374) );
  ANDN U1433 ( .B(opcode[0]), .A(n1375), .Z(n735) );
  IV U1434 ( .A(n1048), .Z(n1120) );
  NOR U1435 ( .A(opcode[0]), .B(n1375), .Z(n1048) );
  NAND U1436 ( .A(n1376), .B(opcode[1]), .Z(n1375) );
  ANDN U1437 ( .B(n1035), .A(n1047), .Z(n1373) );
  ANDN U1438 ( .B(n1377), .A(n1033), .Z(n1047) );
  AND U1439 ( .A(n1038), .B(n1376), .Z(n1377) );
  NAND U1440 ( .A(opcode[2]), .B(opcode[1]), .Z(n1035) );
  IV U1441 ( .A(n1137), .Z(n703) );
  AND U1442 ( .A(n1378), .B(opcode[2]), .Z(n1137) );
  NAND U1443 ( .A(n1379), .B(n1380), .Z(n632) );
  AND U1444 ( .A(n1381), .B(n1382), .Z(n1380) );
  NAND U1445 ( .A(n1376), .B(\stack[7][1] ), .Z(n1382) );
  NAND U1446 ( .A(opcode[2]), .B(n1383), .Z(n1381) );
  AND U1447 ( .A(n1378), .B(\stack[6][1] ), .Z(n1383) );
  AND U1448 ( .A(n1384), .B(n1385), .Z(n1379) );
  NAND U1449 ( .A(opcode[0]), .B(\stack[7][1] ), .Z(n1385) );
  NAND U1450 ( .A(opcode[1]), .B(\stack[7][1] ), .Z(n1384) );
  NAND U1451 ( .A(n1386), .B(n1387), .Z(n623) );
  AND U1452 ( .A(n1388), .B(n1389), .Z(n1387) );
  NAND U1453 ( .A(n1376), .B(\stack[7][2] ), .Z(n1389) );
  NAND U1454 ( .A(opcode[2]), .B(n1390), .Z(n1388) );
  AND U1455 ( .A(n1378), .B(\stack[6][2] ), .Z(n1390) );
  AND U1456 ( .A(n1391), .B(n1392), .Z(n1386) );
  NAND U1457 ( .A(opcode[0]), .B(\stack[7][2] ), .Z(n1392) );
  NAND U1458 ( .A(opcode[1]), .B(\stack[7][2] ), .Z(n1391) );
  NAND U1459 ( .A(n1393), .B(n1394), .Z(n614) );
  AND U1460 ( .A(n1395), .B(n1396), .Z(n1394) );
  NAND U1461 ( .A(n1376), .B(\stack[7][3] ), .Z(n1396) );
  NAND U1462 ( .A(opcode[2]), .B(n1397), .Z(n1395) );
  AND U1463 ( .A(n1378), .B(\stack[6][3] ), .Z(n1397) );
  AND U1464 ( .A(n1398), .B(n1399), .Z(n1393) );
  NAND U1465 ( .A(opcode[0]), .B(\stack[7][3] ), .Z(n1399) );
  NAND U1466 ( .A(opcode[1]), .B(\stack[7][3] ), .Z(n1398) );
  NAND U1467 ( .A(n1400), .B(n1401), .Z(n605) );
  AND U1468 ( .A(n1402), .B(n1403), .Z(n1401) );
  NAND U1469 ( .A(n1376), .B(\stack[7][4] ), .Z(n1403) );
  NAND U1470 ( .A(opcode[2]), .B(n1404), .Z(n1402) );
  AND U1471 ( .A(n1378), .B(\stack[6][4] ), .Z(n1404) );
  AND U1472 ( .A(n1405), .B(n1406), .Z(n1400) );
  NAND U1473 ( .A(opcode[0]), .B(\stack[7][4] ), .Z(n1406) );
  NAND U1474 ( .A(opcode[1]), .B(\stack[7][4] ), .Z(n1405) );
  NAND U1475 ( .A(n1407), .B(n1408), .Z(n596) );
  AND U1476 ( .A(n1409), .B(n1410), .Z(n1408) );
  NAND U1477 ( .A(n1376), .B(\stack[7][5] ), .Z(n1410) );
  NAND U1478 ( .A(opcode[2]), .B(n1411), .Z(n1409) );
  AND U1479 ( .A(n1378), .B(\stack[6][5] ), .Z(n1411) );
  AND U1480 ( .A(n1412), .B(n1413), .Z(n1407) );
  NAND U1481 ( .A(opcode[0]), .B(\stack[7][5] ), .Z(n1413) );
  NAND U1482 ( .A(opcode[1]), .B(\stack[7][5] ), .Z(n1412) );
  NAND U1483 ( .A(n1414), .B(n1415), .Z(n587) );
  AND U1484 ( .A(n1416), .B(n1417), .Z(n1415) );
  NAND U1485 ( .A(n1376), .B(\stack[7][6] ), .Z(n1417) );
  NAND U1486 ( .A(opcode[2]), .B(n1418), .Z(n1416) );
  AND U1487 ( .A(n1378), .B(\stack[6][6] ), .Z(n1418) );
  AND U1488 ( .A(n1419), .B(n1420), .Z(n1414) );
  NAND U1489 ( .A(opcode[0]), .B(\stack[7][6] ), .Z(n1420) );
  NAND U1490 ( .A(opcode[1]), .B(\stack[7][6] ), .Z(n1419) );
  NAND U1491 ( .A(n1421), .B(n1422), .Z(n580) );
  AND U1492 ( .A(n1423), .B(n1424), .Z(n1422) );
  NAND U1493 ( .A(n1376), .B(\stack[7][7] ), .Z(n1424) );
  NAND U1494 ( .A(opcode[2]), .B(n1425), .Z(n1423) );
  AND U1495 ( .A(n1378), .B(\stack[6][7] ), .Z(n1425) );
  AND U1496 ( .A(n1426), .B(n1427), .Z(n1421) );
  NAND U1497 ( .A(opcode[0]), .B(\stack[7][7] ), .Z(n1427) );
  NAND U1498 ( .A(opcode[1]), .B(\stack[7][7] ), .Z(n1426) );
  NAND U1499 ( .A(n1428), .B(n1429), .Z(n573) );
  AND U1500 ( .A(n1430), .B(n1431), .Z(n1429) );
  NAND U1501 ( .A(n1376), .B(\stack[7][0] ), .Z(n1431) );
  IV U1502 ( .A(opcode[2]), .Z(n1376) );
  NAND U1503 ( .A(opcode[2]), .B(n1432), .Z(n1430) );
  AND U1504 ( .A(\stack[6][0] ), .B(n1378), .Z(n1432) );
  AND U1505 ( .A(n1038), .B(n1033), .Z(n1378) );
  IV U1506 ( .A(opcode[0]), .Z(n1033) );
  IV U1507 ( .A(opcode[1]), .Z(n1038) );
  AND U1508 ( .A(n1433), .B(n1434), .Z(n1428) );
  NAND U1509 ( .A(opcode[0]), .B(\stack[7][0] ), .Z(n1434) );
  NAND U1510 ( .A(opcode[1]), .B(\stack[7][0] ), .Z(n1433) );
endmodule

