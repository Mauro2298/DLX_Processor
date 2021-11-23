

    module dlx_cu_HW_MICROCODE_MEM_SIZE10_FUNC_SIZE11_OP_CODE_SIZE6_IR_SIZE32_CW_SIZE19 ( 
        Clk, Rst, IR_IN, bubble_in, Branch_taken, .FUNC_TO_DO({\FUNC_TO_DO[4] , 
        \FUNC_TO_DO[3] , \FUNC_TO_DO[2] , \FUNC_TO_DO[1] , \FUNC_TO_DO[0] }), 
        HW_pre_immediate_enable, HW_NPC_enable_fetch, HW_PC_enable_fetch, 
        HW_Jump_25, HW_reg1_decode, HW_RF_enable, HW_RF_RS1, HW_RF_RS2, 
        HW_RF_WR_RDneg, HW_muxs1, HW_muxs2, HW_reg2_execute, HW_reg3_mem, 
        HW_CS_mem, HW_RD_WRN_mem, HW_MUX_PC_mem, HW_muxs3, HW_MUX_RS2_WR_sel, 
        HW_MUX_RD_WR_sel );
  input [31:0] IR_IN;
  input Clk, Rst, bubble_in, Branch_taken;
  output \FUNC_TO_DO[4] , \FUNC_TO_DO[3] , \FUNC_TO_DO[2] , \FUNC_TO_DO[1] ,
         \FUNC_TO_DO[0] , HW_pre_immediate_enable, HW_NPC_enable_fetch,
         HW_PC_enable_fetch, HW_Jump_25, HW_reg1_decode, HW_RF_enable,
         HW_RF_RS1, HW_RF_RS2, HW_RF_WR_RDneg, HW_muxs1, HW_muxs2,
         HW_reg2_execute, HW_reg3_mem, HW_CS_mem, HW_RD_WRN_mem, HW_MUX_PC_mem,
         HW_muxs3, HW_MUX_RS2_WR_sel, HW_MUX_RD_WR_sel;
  wire   IR_IN_31, IR_IN_30, IR_IN_29, IR_IN_28, IR_IN_27, IR_IN_26, N198,
         N199, N200, N201, N202, N203, N208, N211, N212, N213, N236, N237,
         N238, N239, N240, N241, N242, N243, N244, N245, N246, n142, n144,
         n146, n148, n150, n151, n152, n153, n154, n155, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n183, n184, n185, n186, n187, n26, n27, n31, n19, n21,
         n29, n49, n138, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385;
  wire   [4:0] FUNC_TO_DO;
  wire   [15:0] cw1;
  wire   [7:0] cw3;
  wire   [4:0] cw4;
  wire   [4:0] ALUop1;
  assign IR_IN_31 = IR_IN[31];
  assign IR_IN_30 = IR_IN[30];
  assign IR_IN_29 = IR_IN[29];
  assign IR_IN_28 = IR_IN[28];
  assign IR_IN_27 = IR_IN[27];
  assign IR_IN_26 = IR_IN[26];

  DLH_X1 \ALUop1_reg[4]  ( .G(N211), .D(N202), .Q(ALUop1[4]) );
  DLH_X1 \ALUop1_reg[3]  ( .G(N211), .D(N201), .Q(ALUop1[3]) );
  DLH_X1 \ALUop1_reg[2]  ( .G(N211), .D(N200), .Q(ALUop1[2]) );
  DLH_X1 \ALUop1_reg[1]  ( .G(N211), .D(N199), .Q(ALUop1[1]) );
  DLH_X1 \ALUop1_reg[0]  ( .G(N211), .D(N198), .Q(ALUop1[0]) );
  DLH_X1 \cw1_reg[18]  ( .G(N203), .D(N211), .Q(HW_PC_enable_fetch) );
  DLH_X1 \cw1_reg[17]  ( .G(N203), .D(N211), .Q(HW_NPC_enable_fetch) );
  DLH_X1 \cw1_reg[16]  ( .G(N203), .D(N211), .Q(HW_pre_immediate_enable) );
  DLH_X1 \cw1_reg[15]  ( .G(N203), .D(n27), .Q(cw1[15]) );
  DLH_X1 \cw1_reg[14]  ( .G(N203), .D(N211), .Q(cw1[14]) );
  DLH_X1 \cw1_reg[13]  ( .G(N203), .D(N211), .Q(cw1[13]) );
  DLH_X1 \cw1_reg[12]  ( .G(N203), .D(N211), .Q(cw1[12]) );
  DLH_X1 \cw1_reg[11]  ( .G(N203), .D(N211), .Q(cw1[11]) );
  DLH_X1 \cw1_reg[10]  ( .G(N203), .D(N213), .Q(cw1[10]) );
  DLH_X1 \cw1_reg[9]  ( .G(N203), .D(N212), .Q(cw1[9]) );
  DLH_X1 \cw1_reg[8]  ( .G(N203), .D(N211), .Q(cw1[8]) );
  DLH_X1 \cw1_reg[7]  ( .G(N203), .D(N211), .Q(cw1[7]) );
  DLH_X1 \cw1_reg[6]  ( .G(N203), .D(n21), .Q(cw1[6]) );
  DLH_X1 \cw1_reg[5]  ( .G(N203), .D(n31), .Q(cw1[5]) );
  DLH_X1 \cw1_reg[4]  ( .G(N203), .D(N208), .Q(cw1[4]) );
  DLH_X1 \cw1_reg[3]  ( .G(N203), .D(n19), .Q(cw1[3]) );
  DLH_X1 \cw1_reg[2]  ( .G(N203), .D(n29), .Q(cw1[2]) );
  DLH_X1 \cw1_reg[1]  ( .G(N203), .D(n138), .Q(cw1[1]) );
  DLH_X1 \cw1_reg[0]  ( .G(N203), .D(n26), .Q(cw1[0]) );
  DFFR_X1 \cw2_reg[15]  ( .D(n164), .CK(Clk), .RN(Rst), .Q(HW_Jump_25) );
  DFFR_X1 \cw2_reg[14]  ( .D(n165), .CK(Clk), .RN(Rst), .Q(HW_reg1_decode) );
  DFFR_X1 \cw2_reg[13]  ( .D(n166), .CK(Clk), .RN(Rst), .Q(HW_RF_enable) );
  DFFR_X1 \cw2_reg[12]  ( .D(n167), .CK(Clk), .RN(Rst), .Q(HW_RF_RS1) );
  DFFR_X1 \cw2_reg[11]  ( .D(n168), .CK(Clk), .RN(Rst), .Q(HW_RF_RS2) );
  DFFR_X1 \cw2_reg[10]  ( .D(n169), .CK(Clk), .RN(Rst), .Q(n374) );
  DFFR_X1 \cw2_reg[9]  ( .D(n170), .CK(Clk), .RN(Rst), .Q(n375) );
  DFFR_X1 \cw2_reg[8]  ( .D(n171), .CK(Clk), .RN(Rst), .Q(n376) );
  DFFR_X1 \cw2_reg[7]  ( .D(n172), .CK(Clk), .RN(Rst), .Q(n377) );
  DFFR_X1 \cw2_reg[6]  ( .D(n173), .CK(Clk), .RN(Rst), .Q(n378) );
  DFFR_X1 \cw2_reg[5]  ( .D(n174), .CK(Clk), .RN(Rst), .Q(n379) );
  DFFR_X1 \cw2_reg[4]  ( .D(n175), .CK(Clk), .RN(Rst), .Q(n380) );
  DFFR_X1 \cw2_reg[3]  ( .D(n176), .CK(Clk), .RN(Rst), .Q(n381) );
  DFFR_X1 \cw2_reg[2]  ( .D(n177), .CK(Clk), .RN(Rst), .Q(n382) );
  DFFR_X1 \cw2_reg[1]  ( .D(n178), .CK(Clk), .RN(Rst), .Q(n383) );
  DFFR_X1 \cw2_reg[0]  ( .D(n179), .CK(Clk), .RN(Rst), .Q(n384) );
  DFFR_X1 \cw3_reg[10]  ( .D(N246), .CK(Clk), .RN(Rst), .Q(HW_muxs1) );
  DFFR_X1 \cw3_reg[9]  ( .D(N245), .CK(Clk), .RN(Rst), .Q(HW_muxs2) );
  DFFR_X1 \cw3_reg[8]  ( .D(N244), .CK(Clk), .RN(Rst), .Q(HW_reg2_execute) );
  DFFR_X1 \cw3_reg[7]  ( .D(N243), .CK(Clk), .RN(Rst), .Q(cw3[7]) );
  DFFR_X1 \cw3_reg[6]  ( .D(N242), .CK(Clk), .RN(Rst), .Q(cw3[6]) );
  DFFR_X1 \cw3_reg[5]  ( .D(N241), .CK(Clk), .RN(Rst), .Q(cw3[5]) );
  DFFR_X1 \cw3_reg[4]  ( .D(N240), .CK(Clk), .RN(Rst), .Q(cw3[4]) );
  DFFR_X1 \cw3_reg[3]  ( .D(N239), .CK(Clk), .RN(Rst), .Q(cw3[3]) );
  DFFR_X1 \cw3_reg[2]  ( .D(N238), .CK(Clk), .RN(Rst), .Q(cw3[2]) );
  DFFR_X1 \cw3_reg[1]  ( .D(N237), .CK(Clk), .RN(Rst), .Q(cw3[1]) );
  DFFR_X1 \cw3_reg[0]  ( .D(N236), .CK(Clk), .RN(Rst), .Q(cw3[0]) );
  SDFFR_X1 \cw4_reg[7]  ( .D(1'b0), .SI(n49), .SE(cw3[7]), .CK(Clk), .RN(Rst), 
        .Q(HW_reg3_mem) );
  SDFFR_X1 \cw4_reg[6]  ( .D(1'b0), .SI(n49), .SE(cw3[6]), .CK(Clk), .RN(Rst), 
        .Q(HW_CS_mem) );
  SDFFR_X1 \cw4_reg[5]  ( .D(1'b0), .SI(n49), .SE(cw3[5]), .CK(Clk), .RN(Rst), 
        .Q(HW_RD_WRN_mem) );
  SDFFR_X1 \cw4_reg[4]  ( .D(1'b0), .SI(n49), .SE(cw3[4]), .CK(Clk), .RN(Rst), 
        .Q(cw4[4]) );
  SDFFR_X1 \cw4_reg[3]  ( .D(1'b0), .SI(n49), .SE(cw3[3]), .CK(Clk), .RN(Rst), 
        .Q(cw4[3]) );
  SDFFR_X1 \cw4_reg[2]  ( .D(1'b0), .SI(n49), .SE(cw3[2]), .CK(Clk), .RN(Rst), 
        .Q(cw4[2]) );
  SDFFR_X1 \cw4_reg[1]  ( .D(1'b0), .SI(n49), .SE(cw3[1]), .CK(Clk), .RN(Rst), 
        .Q(cw4[1]) );
  SDFFR_X1 \cw4_reg[0]  ( .D(1'b0), .SI(n49), .SE(cw3[0]), .CK(Clk), .RN(Rst), 
        .Q(cw4[0]) );
  DFFR_X1 \cw5_reg[4]  ( .D(cw4[4]), .CK(Clk), .RN(Rst), .Q(HW_MUX_PC_mem) );
  DFFR_X1 \cw5_reg[3]  ( .D(cw4[3]), .CK(Clk), .RN(Rst), .Q(HW_muxs3) );
  DFFR_X1 \cw5_reg[2]  ( .D(cw4[2]), .CK(Clk), .RN(Rst), .Q(HW_MUX_RS2_WR_sel)
         );
  DFFR_X1 \cw5_reg[1]  ( .D(cw4[1]), .CK(Clk), .RN(Rst), .Q(HW_MUX_RD_WR_sel)
         );
  DFFR_X1 \cw5_reg[0]  ( .D(cw4[0]), .CK(Clk), .RN(Rst), .Q(HW_RF_WR_RDneg) );
  DFF_X1 \ALUop2_reg[4]  ( .D(n187), .CK(Clk), .Q(n271), .QN(n385) );
  DFF_X1 \aluOpcode_i_reg[4]  ( .D(n155), .CK(Clk), .Q(FUNC_TO_DO[4]), .QN(
        n150) );
  DFF_X1 \ALUop2_reg[3]  ( .D(n186), .CK(Clk), .Q(n370), .QN(n272) );
  DFF_X1 \aluOpcode_i_reg[3]  ( .D(n154), .CK(Clk), .Q(FUNC_TO_DO[3]), .QN(
        n148) );
  DFF_X1 \ALUop2_reg[2]  ( .D(n185), .CK(Clk), .Q(n371), .QN(n273) );
  DFF_X1 \aluOpcode_i_reg[2]  ( .D(n153), .CK(Clk), .Q(FUNC_TO_DO[2]), .QN(
        n146) );
  DFF_X1 \ALUop2_reg[1]  ( .D(n184), .CK(Clk), .Q(n372), .QN(n274) );
  DFF_X1 \aluOpcode_i_reg[1]  ( .D(n152), .CK(Clk), .Q(FUNC_TO_DO[1]), .QN(
        n144) );
  DFF_X1 \ALUop2_reg[0]  ( .D(n183), .CK(Clk), .Q(n373), .QN(n275) );
  DFF_X1 \aluOpcode_i_reg[0]  ( .D(n151), .CK(Clk), .Q(FUNC_TO_DO[0]), .QN(
        n142) );
  NOR2_X4 U3 ( .A1(Branch_taken), .A2(bubble_in), .ZN(n283) );
  OAI211_X1 U4 ( .C1(n276), .C2(n277), .A(n278), .B(n279), .ZN(n26) );
  INV_X1 U5 ( .A(n280), .ZN(n21) );
  INV_X1 U6 ( .A(n279), .ZN(n19) );
  AOI21_X1 U7 ( .B1(N211), .B2(n281), .A(n138), .ZN(n279) );
  MUX2_X1 U8 ( .A(ALUop1[4]), .B(n271), .S(n282), .Z(n187) );
  MUX2_X1 U9 ( .A(ALUop1[3]), .B(n370), .S(n282), .Z(n186) );
  MUX2_X1 U10 ( .A(ALUop1[2]), .B(n371), .S(n282), .Z(n185) );
  MUX2_X1 U11 ( .A(ALUop1[1]), .B(n372), .S(n282), .Z(n184) );
  MUX2_X1 U12 ( .A(ALUop1[0]), .B(n373), .S(n282), .Z(n183) );
  MUX2_X1 U13 ( .A(n384), .B(cw1[0]), .S(n283), .Z(n179) );
  MUX2_X1 U14 ( .A(n383), .B(cw1[1]), .S(n283), .Z(n178) );
  MUX2_X1 U15 ( .A(n382), .B(cw1[2]), .S(n283), .Z(n177) );
  MUX2_X1 U16 ( .A(n381), .B(cw1[3]), .S(n283), .Z(n176) );
  MUX2_X1 U17 ( .A(n380), .B(cw1[4]), .S(n283), .Z(n175) );
  MUX2_X1 U18 ( .A(n379), .B(cw1[5]), .S(n283), .Z(n174) );
  MUX2_X1 U19 ( .A(n378), .B(cw1[6]), .S(n283), .Z(n173) );
  MUX2_X1 U20 ( .A(n377), .B(cw1[7]), .S(n283), .Z(n172) );
  MUX2_X1 U21 ( .A(n376), .B(cw1[8]), .S(n283), .Z(n171) );
  MUX2_X1 U22 ( .A(n375), .B(cw1[9]), .S(n283), .Z(n170) );
  MUX2_X1 U23 ( .A(n374), .B(cw1[10]), .S(n283), .Z(n169) );
  MUX2_X1 U24 ( .A(HW_RF_RS2), .B(cw1[11]), .S(n283), .Z(n168) );
  MUX2_X1 U25 ( .A(HW_RF_RS1), .B(cw1[12]), .S(n283), .Z(n167) );
  MUX2_X1 U26 ( .A(HW_RF_enable), .B(cw1[13]), .S(n283), .Z(n166) );
  MUX2_X1 U27 ( .A(HW_reg1_decode), .B(cw1[14]), .S(n283), .Z(n165) );
  MUX2_X1 U28 ( .A(HW_Jump_25), .B(cw1[15]), .S(n283), .Z(n164) );
  OAI22_X1 U29 ( .A1(n150), .A2(Rst), .B1(n385), .B2(n282), .ZN(n155) );
  OAI22_X1 U30 ( .A1(n148), .A2(Rst), .B1(n282), .B2(n272), .ZN(n154) );
  OAI22_X1 U31 ( .A1(n146), .A2(Rst), .B1(n282), .B2(n273), .ZN(n153) );
  OAI22_X1 U32 ( .A1(n144), .A2(Rst), .B1(n282), .B2(n274), .ZN(n152) );
  OAI22_X1 U33 ( .A1(n142), .A2(Rst), .B1(n282), .B2(n275), .ZN(n151) );
  NAND2_X1 U34 ( .A1(Rst), .A2(n283), .ZN(n282) );
  AND2_X1 U35 ( .A1(n283), .A2(n374), .ZN(N246) );
  AND2_X1 U36 ( .A1(n283), .A2(n375), .ZN(N245) );
  AND2_X1 U37 ( .A1(n283), .A2(n376), .ZN(N244) );
  AND2_X1 U38 ( .A1(n283), .A2(n377), .ZN(N243) );
  AND2_X1 U39 ( .A1(n283), .A2(n378), .ZN(N242) );
  AND2_X1 U40 ( .A1(n283), .A2(n379), .ZN(N241) );
  AND2_X1 U41 ( .A1(n283), .A2(n380), .ZN(N240) );
  AND2_X1 U42 ( .A1(n283), .A2(n381), .ZN(N239) );
  AND2_X1 U43 ( .A1(n283), .A2(n382), .ZN(N238) );
  AND2_X1 U44 ( .A1(n283), .A2(n383), .ZN(N237) );
  AND2_X1 U45 ( .A1(n283), .A2(n384), .ZN(N236) );
  NOR2_X1 U46 ( .A1(n284), .A2(n276), .ZN(N213) );
  NAND3_X1 U47 ( .A1(n278), .A2(n280), .A3(n285), .ZN(N212) );
  OAI21_X1 U48 ( .B1(n286), .B2(n281), .A(N211), .ZN(n285) );
  AOI21_X1 U49 ( .B1(N211), .B2(n287), .A(n31), .ZN(n280) );
  OAI21_X1 U50 ( .B1(n276), .B2(n277), .A(n288), .ZN(n31) );
  INV_X1 U51 ( .A(n289), .ZN(N208) );
  AOI21_X1 U52 ( .B1(N211), .B2(n286), .A(n27), .ZN(n289) );
  NAND2_X1 U53 ( .A1(n288), .A2(n278), .ZN(n27) );
  NAND2_X1 U54 ( .A1(n290), .A2(N211), .ZN(n278) );
  INV_X1 U55 ( .A(n29), .ZN(n288) );
  NOR4_X1 U56 ( .A1(n291), .A2(n292), .A3(n293), .A4(n294), .ZN(n29) );
  OAI211_X1 U57 ( .C1(n295), .C2(n296), .A(n138), .B(n297), .ZN(n294) );
  NOR2_X1 U58 ( .A1(n298), .A2(n276), .ZN(n138) );
  INV_X1 U59 ( .A(N211), .ZN(n276) );
  AND2_X1 U60 ( .A1(n299), .A2(n300), .ZN(n293) );
  INV_X1 U61 ( .A(n301), .ZN(n291) );
  NAND3_X1 U62 ( .A1(n302), .A2(N211), .A3(n284), .ZN(N203) );
  NOR3_X1 U63 ( .A1(n281), .A2(n286), .A3(n303), .ZN(n284) );
  NAND3_X1 U64 ( .A1(n304), .A2(n277), .A3(n298), .ZN(n303) );
  NAND4_X1 U65 ( .A1(n305), .A2(n306), .A3(n307), .A4(n308), .ZN(n281) );
  INV_X1 U66 ( .A(n309), .ZN(n308) );
  INV_X1 U67 ( .A(n310), .ZN(n306) );
  NAND2_X1 U68 ( .A1(bubble_in), .A2(n49), .ZN(N211) );
  INV_X1 U69 ( .A(Branch_taken), .ZN(n49) );
  NAND4_X1 U70 ( .A1(n311), .A2(n304), .A3(n302), .A4(n277), .ZN(N202) );
  OAI211_X1 U71 ( .C1(n298), .C2(n301), .A(n312), .B(n313), .ZN(N201) );
  NOR2_X1 U72 ( .A1(n309), .A2(n314), .ZN(n313) );
  NOR4_X1 U73 ( .A1(n315), .A2(n316), .A3(n317), .A4(IR_IN_30), .ZN(n309) );
  INV_X1 U74 ( .A(n286), .ZN(n312) );
  NAND3_X1 U75 ( .A1(IR_IN[5]), .A2(IR_IN[2]), .A3(n318), .ZN(n301) );
  MUX2_X1 U76 ( .A(n319), .B(n320), .S(n321), .Z(n318) );
  NOR2_X1 U77 ( .A1(n322), .A2(n323), .ZN(n320) );
  OAI211_X1 U78 ( .C1(n297), .C2(n298), .A(n311), .B(n324), .ZN(N200) );
  NOR2_X1 U79 ( .A1(n325), .A2(n326), .ZN(n324) );
  INV_X1 U80 ( .A(n327), .ZN(n326) );
  INV_X1 U81 ( .A(n328), .ZN(n311) );
  OAI21_X1 U82 ( .B1(n329), .B2(n330), .A(n307), .ZN(n328) );
  OAI211_X1 U83 ( .C1(n331), .C2(n332), .A(n333), .B(IR_IN_30), .ZN(n307) );
  NOR2_X1 U84 ( .A1(n334), .A2(n315), .ZN(n332) );
  NAND2_X1 U85 ( .A1(n335), .A2(n300), .ZN(n330) );
  INV_X1 U86 ( .A(n335), .ZN(n298) );
  MUX2_X1 U87 ( .A(n336), .B(n337), .S(n338), .Z(n297) );
  OR3_X1 U88 ( .A1(n322), .A2(IR_IN[5]), .A3(n323), .ZN(n336) );
  NAND2_X1 U89 ( .A1(n339), .A2(n340), .ZN(N199) );
  NOR4_X1 U90 ( .A1(n341), .A2(n342), .A3(n287), .A4(n286), .ZN(n340) );
  AOI211_X1 U91 ( .C1(n334), .C2(n317), .A(n343), .B(n315), .ZN(n286) );
  INV_X1 U92 ( .A(n277), .ZN(n342) );
  NAND2_X1 U93 ( .A1(n344), .A2(n345), .ZN(n277) );
  AOI211_X1 U94 ( .C1(n346), .C2(n335), .A(n310), .B(n347), .ZN(n339) );
  NOR3_X1 U95 ( .A1(n315), .A2(n334), .A3(n316), .ZN(n347) );
  OAI21_X1 U96 ( .B1(n334), .B2(n348), .A(n327), .ZN(n310) );
  NAND3_X1 U97 ( .A1(n349), .A2(n350), .A3(n333), .ZN(n327) );
  MUX2_X1 U98 ( .A(n351), .B(n352), .S(n296), .Z(n346) );
  NOR2_X1 U99 ( .A1(n321), .A2(n337), .ZN(n352) );
  OAI21_X1 U100 ( .B1(IR_IN[0]), .B2(n329), .A(n353), .ZN(n351) );
  OAI21_X1 U101 ( .B1(n321), .B2(n354), .A(n319), .ZN(n353) );
  INV_X1 U102 ( .A(n299), .ZN(n329) );
  OAI211_X1 U103 ( .C1(n350), .C2(n302), .A(n305), .B(n355), .ZN(N198) );
  AOI211_X1 U104 ( .C1(n335), .C2(n356), .A(n287), .B(n357), .ZN(n355) );
  AOI211_X1 U105 ( .C1(n343), .C2(n358), .A(n315), .B(n317), .ZN(n357) );
  INV_X1 U106 ( .A(n331), .ZN(n317) );
  NOR2_X1 U107 ( .A1(n350), .A2(IR_IN_27), .ZN(n331) );
  INV_X1 U108 ( .A(IR_IN_28), .ZN(n315) );
  NAND2_X1 U109 ( .A1(IR_IN_30), .A2(n333), .ZN(n358) );
  INV_X1 U110 ( .A(n304), .ZN(n287) );
  NAND2_X1 U111 ( .A1(IR_IN_29), .A2(n344), .ZN(n304) );
  AND3_X1 U112 ( .A1(IR_IN_26), .A2(n349), .A3(IR_IN_31), .ZN(n344) );
  NOR3_X1 U113 ( .A1(IR_IN_28), .A2(IR_IN_30), .A3(n359), .ZN(n349) );
  OAI221_X1 U114 ( .B1(IR_IN[1]), .B2(n337), .C1(n295), .C2(n338), .A(n360), 
        .ZN(n356) );
  AOI21_X1 U115 ( .B1(n361), .B2(n299), .A(n292), .ZN(n360) );
  NOR4_X1 U116 ( .A1(IR_IN[3]), .A2(IR_IN[5]), .A3(n300), .A4(n362), .ZN(n292)
         );
  OR2_X1 U117 ( .A1(n363), .A2(n364), .ZN(n362) );
  NAND2_X1 U118 ( .A1(n296), .A2(n323), .ZN(n300) );
  NOR4_X1 U119 ( .A1(n365), .A2(n354), .A3(n363), .A4(IR_IN[6]), .ZN(n299) );
  NAND2_X1 U120 ( .A1(n366), .A2(n321), .ZN(n363) );
  INV_X1 U121 ( .A(IR_IN[1]), .ZN(n321) );
  INV_X1 U122 ( .A(IR_IN[5]), .ZN(n354) );
  NOR2_X1 U123 ( .A1(n323), .A2(n296), .ZN(n361) );
  INV_X1 U124 ( .A(IR_IN[2]), .ZN(n296) );
  INV_X1 U125 ( .A(IR_IN[0]), .ZN(n323) );
  NAND2_X1 U126 ( .A1(IR_IN[2]), .A2(IR_IN[1]), .ZN(n338) );
  INV_X1 U127 ( .A(n319), .ZN(n295) );
  NAND2_X1 U128 ( .A1(n319), .A2(IR_IN[5]), .ZN(n337) );
  NOR2_X1 U129 ( .A1(n322), .A2(IR_IN[0]), .ZN(n319) );
  NAND3_X1 U130 ( .A1(n365), .A2(n364), .A3(n366), .ZN(n322) );
  NOR3_X1 U131 ( .A1(IR_IN[4]), .A2(IR_IN[10]), .A3(n367), .ZN(n366) );
  OR3_X1 U132 ( .A1(IR_IN[9]), .A2(IR_IN[8]), .A3(IR_IN[7]), .ZN(n367) );
  INV_X1 U133 ( .A(IR_IN[6]), .ZN(n364) );
  INV_X1 U134 ( .A(IR_IN[3]), .ZN(n365) );
  NOR3_X1 U135 ( .A1(n343), .A2(IR_IN_28), .A3(n334), .ZN(n335) );
  NOR3_X1 U136 ( .A1(n341), .A2(n325), .A3(n314), .ZN(n305) );
  AND3_X1 U137 ( .A1(IR_IN_28), .A2(n333), .A3(n368), .ZN(n314) );
  NOR3_X1 U138 ( .A1(n359), .A2(IR_IN_30), .A3(IR_IN_26), .ZN(n368) );
  NOR3_X1 U139 ( .A1(n334), .A2(IR_IN_30), .A3(n316), .ZN(n325) );
  INV_X1 U140 ( .A(n333), .ZN(n316) );
  NOR2_X1 U141 ( .A1(n345), .A2(IR_IN_31), .ZN(n333) );
  NAND2_X1 U142 ( .A1(n350), .A2(n359), .ZN(n334) );
  NOR3_X1 U143 ( .A1(n359), .A2(IR_IN_26), .A3(n348), .ZN(n341) );
  NAND4_X1 U144 ( .A1(IR_IN_30), .A2(IR_IN_28), .A3(n345), .A4(n369), .ZN(n348) );
  INV_X1 U145 ( .A(IR_IN_31), .ZN(n369) );
  INV_X1 U146 ( .A(IR_IN_29), .ZN(n345) );
  INV_X1 U147 ( .A(n290), .ZN(n302) );
  NOR3_X1 U148 ( .A1(n359), .A2(IR_IN_28), .A3(n343), .ZN(n290) );
  OR3_X1 U149 ( .A1(IR_IN_30), .A2(IR_IN_31), .A3(IR_IN_29), .ZN(n343) );
  INV_X1 U150 ( .A(IR_IN_27), .ZN(n359) );
  INV_X1 U151 ( .A(IR_IN_26), .ZN(n350) );
endmodule


module dlx_ADDR_SIZE32_DATA_SIZE32 ( CLK, RESET );
  input CLK, RESET;
  wire   out_bubble_signal, out_branch_signal, DP_pre_IMMM_enable_signal,
         DP_NPC_enable_signal, DP_PC_enable_signal, DP_Jump_25_signal,
         DP_reg1_enable_signal, DP_RF_enable_signal, DP_RF_RS1_signal,
         DP_RF_RS2_signal, DP_RF_WR_RDneg_signal, DP_muxs1_signal,
         DP_muxs2_signal, DP_reg2_signal, DP_reg3_signal, DP_CS_signal,
         DP_RD_WRN_mem_signal, DP_MUX_PC_mem_signal, DP_muxs3_signal,
         DP_MUX_RS2_WR_sel_signal, DP_MUX_RD_WR_sel_signal;
  wire   [31:0] out_IR_fetch_signal;
  wire   [4:0] DP_FUNC_signal;

  dlx_cu_HW_MICROCODE_MEM_SIZE10_FUNC_SIZE11_OP_CODE_SIZE6_IR_SIZE32_CW_SIZE19 cu ( 
        .Clk(CLK), .Rst(RESET), .IR_IN(out_IR_fetch_signal), .bubble_in(
        out_bubble_signal), .Branch_taken(out_branch_signal), .FUNC_TO_DO(
        DP_FUNC_signal), .HW_pre_immediate_enable(DP_pre_IMMM_enable_signal), 
        .HW_NPC_enable_fetch(DP_NPC_enable_signal), .HW_PC_enable_fetch(
        DP_PC_enable_signal), .HW_Jump_25(DP_Jump_25_signal), .HW_reg1_decode(
        DP_reg1_enable_signal), .HW_RF_enable(DP_RF_enable_signal), 
        .HW_RF_RS1(DP_RF_RS1_signal), .HW_RF_RS2(DP_RF_RS2_signal), 
        .HW_RF_WR_RDneg(DP_RF_WR_RDneg_signal), .HW_muxs1(DP_muxs1_signal), 
        .HW_muxs2(DP_muxs2_signal), .HW_reg2_execute(DP_reg2_signal), 
        .HW_reg3_mem(DP_reg3_signal), .HW_CS_mem(DP_CS_signal), 
        .HW_RD_WRN_mem(DP_RD_WRN_mem_signal), .HW_MUX_PC_mem(
        DP_MUX_PC_mem_signal), .HW_muxs3(DP_muxs3_signal), .HW_MUX_RS2_WR_sel(
        DP_MUX_RS2_WR_sel_signal), .HW_MUX_RD_WR_sel(DP_MUX_RD_WR_sel_signal)
         );
  data_path dp ( .clk(CLK), .reset(RESET), .DP_FUNC(DP_FUNC_signal), 
        .DP_PC_enable(DP_PC_enable_signal), .DP_NPC_enable(
        DP_NPC_enable_signal), .DP_pre_IMMM_enable(DP_pre_IMMM_enable_signal), 
        .DP_Jump_25(DP_Jump_25_signal), .DP_reg1_enable(DP_reg1_enable_signal), 
        .DP_RF_enable(DP_RF_enable_signal), .DP_RF_RS1(DP_RF_RS1_signal), 
        .DP_RF_RS2(DP_RF_RS2_signal), .DP_RF_WR_RDneg(DP_RF_WR_RDneg_signal), 
        .DP_muxs1(DP_muxs1_signal), .DP_muxs2(DP_muxs2_signal), .DP_reg2(
        DP_reg2_signal), .DP_CS(DP_CS_signal), .DP_RD_WRN_mem(
        DP_RD_WRN_mem_signal), .DP_reg3(DP_reg3_signal), .DP_MUX_PC_mem(
        DP_MUX_PC_mem_signal), .DP_muxs3(DP_muxs3_signal), .DP_MUX_RD_WR_sel(
        DP_MUX_RD_WR_sel_signal), .DP_MUX_RS2_WR_sel(DP_MUX_RS2_WR_sel_signal), 
        .out_bubble(out_bubble_signal), .out_branch(out_branch_signal), 
        .out_IR_fetch(out_IR_fetch_signal) );
endmodule

