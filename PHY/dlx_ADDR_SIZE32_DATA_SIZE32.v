/*
###############################################################
#  Generated by:      Cadence Innovus 17.11-s080_1
#  OS:                Linux x86_64(Host ID localhost.localdomain)
#  Generated on:      Mon Oct 11 18:41:49 2021
#  Design:            dlx_ADDR_SIZE32_DATA_SIZE32
#  Command:           saveNetlist dlx_ADDR_SIZE32_DATA_SIZE32.v
###############################################################
*/
module dlx_cu_HW_MICROCODE_MEM_SIZE10_FUNC_SIZE11_OP_CODE_SIZE6_IR_SIZE32_CW_SIZE19 (
	Clk, 
	Rst, 
	IR_IN, 
	bubble_in, 
	Branch_taken, 
	.FUNC_TO_DO ( { \FUNC_TO_DO[4] , 
		\FUNC_TO_DO[3] , 
		\FUNC_TO_DO[2] , 
		\FUNC_TO_DO[1] , 
		\FUNC_TO_DO[0]  } ), 
	HW_pre_immediate_enable, 
	HW_NPC_enable_fetch, 
	HW_PC_enable_fetch, 
	HW_Jump_25, 
	HW_reg1_decode, 
	HW_RF_enable, 
	HW_RF_RS1, 
	HW_RF_RS2, 
	HW_RF_WR_RDneg, 
	HW_muxs1, 
	HW_muxs2, 
	HW_reg2_execute, 
	HW_reg3_mem, 
	HW_CS_mem, 
	HW_RD_WRN_mem, 
	HW_MUX_PC_mem, 
	HW_muxs3, 
	HW_MUX_RS2_WR_sel, 
	HW_MUX_RD_WR_sel);
   input Clk;
   input Rst;
   input [31:0] IR_IN;
   input bubble_in;
   input Branch_taken;
   output \FUNC_TO_DO[4] ;
   output \FUNC_TO_DO[3] ;
   output \FUNC_TO_DO[2] ;
   output \FUNC_TO_DO[1] ;
   output \FUNC_TO_DO[0] ;
   output HW_pre_immediate_enable;
   output HW_NPC_enable_fetch;
   output HW_PC_enable_fetch;
   output HW_Jump_25;
   output HW_reg1_decode;
   output HW_RF_enable;
   output HW_RF_RS1;
   output HW_RF_RS2;
   output HW_RF_WR_RDneg;
   output HW_muxs1;
   output HW_muxs2;
   output HW_reg2_execute;
   output HW_reg3_mem;
   output HW_CS_mem;
   output HW_RD_WRN_mem;
   output HW_MUX_PC_mem;
   output HW_muxs3;
   output HW_MUX_RS2_WR_sel;
   output HW_MUX_RD_WR_sel;

   // Internal wires
   wire IR_IN_31;
   wire IR_IN_30;
   wire IR_IN_29;
   wire IR_IN_28;
   wire IR_IN_27;
   wire IR_IN_26;
   wire N198;
   wire N199;
   wire N200;
   wire N201;
   wire N202;
   wire N203;
   wire N204;
   wire N205;
   wire N206;
   wire N207;
   wire N208;
   wire N210;
   wire N211;
   wire N212;
   wire N213;
   wire N236;
   wire N237;
   wire N238;
   wire N239;
   wire N240;
   wire N241;
   wire N242;
   wire N243;
   wire N244;
   wire N245;
   wire N246;
   wire n142;
   wire n144;
   wire n146;
   wire n148;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n155;
   wire n164;
   wire n165;
   wire n166;
   wire n167;
   wire n168;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n175;
   wire n176;
   wire n177;
   wire n178;
   wire n179;
   wire n180;
   wire n181;
   wire n182;
   wire n183;
   wire n184;
   wire n185;
   wire n186;
   wire n187;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire [4:0] FUNC_TO_DO;
   wire [15:0] cw1;
   wire [7:0] cw3;
   wire [4:0] cw4;
   wire [4:0] ALUop1;

   assign IR_IN_31 = IR_IN[31] ;
   assign IR_IN_30 = IR_IN[30] ;
   assign IR_IN_29 = IR_IN[29] ;
   assign IR_IN_28 = IR_IN[28] ;
   assign IR_IN_27 = IR_IN[27] ;
   assign IR_IN_26 = IR_IN[26] ;

   DLH_X1 \ALUop1_reg[4]  (.D(N202),
	.G(N211),
	.Q(ALUop1[4]));
   DLH_X1 \ALUop1_reg[3]  (.D(N201),
	.G(N211),
	.Q(ALUop1[3]));
   DLH_X1 \ALUop1_reg[2]  (.D(N200),
	.G(N211),
	.Q(ALUop1[2]));
   DLH_X1 \ALUop1_reg[1]  (.D(N199),
	.G(N211),
	.Q(ALUop1[1]));
   DLH_X1 \ALUop1_reg[0]  (.D(N198),
	.G(N211),
	.Q(ALUop1[0]));
   DLH_X1 \cw1_reg[18]  (.D(N211),
	.G(N203),
	.Q(HW_PC_enable_fetch));
   DLH_X1 \cw1_reg[17]  (.D(N211),
	.G(N203),
	.Q(HW_NPC_enable_fetch));
   DLH_X1 \cw1_reg[16]  (.D(N211),
	.G(N203),
	.Q(HW_pre_immediate_enable));
   DLH_X1 \cw1_reg[15]  (.D(n181),
	.G(N203),
	.Q(cw1[15]));
   DLH_X1 \cw1_reg[14]  (.D(N211),
	.G(N203),
	.Q(cw1[14]));
   DLH_X1 \cw1_reg[13]  (.D(N211),
	.G(N203),
	.Q(cw1[13]));
   DLH_X1 \cw1_reg[12]  (.D(N211),
	.G(N203),
	.Q(cw1[12]));
   DLH_X1 \cw1_reg[11]  (.D(N211),
	.G(N203),
	.Q(cw1[11]));
   DLH_X1 \cw1_reg[10]  (.D(N213),
	.G(N203),
	.Q(cw1[10]));
   DLH_X1 \cw1_reg[9]  (.D(N212),
	.G(N203),
	.Q(cw1[9]));
   DLH_X1 \cw1_reg[8]  (.D(N211),
	.G(N203),
	.Q(cw1[8]));
   DLH_X1 \cw1_reg[7]  (.D(N211),
	.G(N203),
	.Q(cw1[7]));
   DLH_X1 \cw1_reg[6]  (.D(N210),
	.G(N203),
	.Q(cw1[6]));
   DLH_X1 \cw1_reg[5]  (.D(n180),
	.G(N203),
	.Q(cw1[5]));
   DLH_X1 \cw1_reg[4]  (.D(N208),
	.G(N203),
	.Q(cw1[4]));
   DLH_X1 \cw1_reg[3]  (.D(N207),
	.G(N203),
	.Q(cw1[3]));
   DLH_X1 \cw1_reg[2]  (.D(N206),
	.G(N203),
	.Q(cw1[2]));
   DLH_X1 \cw1_reg[1]  (.D(N205),
	.G(N203),
	.Q(cw1[1]));
   DLH_X1 \cw1_reg[0]  (.D(N204),
	.G(N203),
	.Q(cw1[0]));
   DFFR_X1 \cw2_reg[15]  (.D(n164),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_Jump_25));
   DFFR_X1 \cw2_reg[14]  (.D(n165),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_reg1_decode));
   DFFR_X1 \cw2_reg[13]  (.D(n166),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_RF_enable));
   DFFR_X1 \cw2_reg[12]  (.D(n167),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_RF_RS1));
   DFFR_X1 \cw2_reg[11]  (.D(n168),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_RF_RS2));
   DFFR_X1 \cw2_reg[10]  (.D(n169),
	.RN(Rst),
	.CK(Clk),
	.Q(n106));
   DFFR_X1 \cw2_reg[9]  (.D(n170),
	.RN(Rst),
	.CK(Clk),
	.Q(n107));
   DFFR_X1 \cw2_reg[8]  (.D(n171),
	.RN(Rst),
	.CK(Clk),
	.Q(n108));
   DFFR_X1 \cw2_reg[7]  (.D(n172),
	.RN(Rst),
	.CK(Clk),
	.Q(n109));
   DFFR_X1 \cw2_reg[6]  (.D(n173),
	.RN(Rst),
	.CK(Clk),
	.Q(n110));
   DFFR_X1 \cw2_reg[5]  (.D(n174),
	.RN(Rst),
	.CK(Clk),
	.Q(n111));
   DFFR_X1 \cw2_reg[4]  (.D(n175),
	.RN(Rst),
	.CK(Clk),
	.Q(n112));
   DFFR_X1 \cw2_reg[3]  (.D(n176),
	.RN(Rst),
	.CK(Clk),
	.Q(n113));
   DFFR_X1 \cw2_reg[2]  (.D(n177),
	.RN(Rst),
	.CK(Clk),
	.Q(n114));
   DFFR_X1 \cw2_reg[1]  (.D(n178),
	.RN(Rst),
	.CK(Clk),
	.Q(n115));
   DFFR_X1 \cw2_reg[0]  (.D(n179),
	.RN(Rst),
	.CK(Clk),
	.Q(n116));
   DFFR_X1 \cw3_reg[10]  (.D(N246),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_muxs1));
   DFFR_X1 \cw3_reg[9]  (.D(N245),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_muxs2));
   DFFR_X1 \cw3_reg[8]  (.D(N244),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_reg2_execute));
   DFFR_X1 \cw3_reg[7]  (.D(N243),
	.RN(Rst),
	.CK(Clk),
	.Q(cw3[7]));
   DFFR_X1 \cw3_reg[6]  (.D(N242),
	.RN(Rst),
	.CK(Clk),
	.Q(cw3[6]));
   DFFR_X1 \cw3_reg[5]  (.D(N241),
	.RN(Rst),
	.CK(Clk),
	.Q(cw3[5]));
   DFFR_X1 \cw3_reg[4]  (.D(N240),
	.RN(Rst),
	.CK(Clk),
	.Q(cw3[4]));
   DFFR_X1 \cw3_reg[3]  (.D(N239),
	.RN(Rst),
	.CK(Clk),
	.Q(cw3[3]));
   DFFR_X1 \cw3_reg[2]  (.D(N238),
	.RN(Rst),
	.CK(Clk),
	.Q(cw3[2]));
   DFFR_X1 \cw3_reg[1]  (.D(N237),
	.RN(Rst),
	.CK(Clk),
	.Q(cw3[1]));
   DFFR_X1 \cw3_reg[0]  (.D(N236),
	.RN(Rst),
	.CK(Clk),
	.Q(cw3[0]));
   SDFFR_X1 \cw4_reg[7]  (.D(1'b0),
	.RN(Rst),
	.SE(cw3[7]),
	.SI(n182),
	.CK(Clk),
	.Q(HW_reg3_mem));
   SDFFR_X1 \cw4_reg[6]  (.D(1'b0),
	.RN(Rst),
	.SE(cw3[6]),
	.SI(n182),
	.CK(Clk),
	.Q(HW_CS_mem));
   SDFFR_X1 \cw4_reg[5]  (.D(1'b0),
	.RN(Rst),
	.SE(cw3[5]),
	.SI(n182),
	.CK(Clk),
	.Q(HW_RD_WRN_mem));
   SDFFR_X1 \cw4_reg[4]  (.D(1'b0),
	.RN(Rst),
	.SE(cw3[4]),
	.SI(n182),
	.CK(Clk),
	.Q(cw4[4]));
   SDFFR_X1 \cw4_reg[3]  (.D(1'b0),
	.RN(Rst),
	.SE(cw3[3]),
	.SI(n182),
	.CK(Clk),
	.Q(cw4[3]));
   SDFFR_X1 \cw4_reg[2]  (.D(1'b0),
	.RN(Rst),
	.SE(cw3[2]),
	.SI(n182),
	.CK(Clk),
	.Q(cw4[2]));
   SDFFR_X1 \cw4_reg[1]  (.D(1'b0),
	.RN(Rst),
	.SE(cw3[1]),
	.SI(n182),
	.CK(Clk),
	.Q(cw4[1]));
   SDFFR_X1 \cw4_reg[0]  (.D(1'b0),
	.RN(Rst),
	.SE(cw3[0]),
	.SI(n182),
	.CK(Clk),
	.Q(cw4[0]));
   DFFR_X1 \cw5_reg[4]  (.D(cw4[4]),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_MUX_PC_mem));
   DFFR_X1 \cw5_reg[3]  (.D(cw4[3]),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_muxs3));
   DFFR_X1 \cw5_reg[2]  (.D(cw4[2]),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_MUX_RS2_WR_sel));
   DFFR_X1 \cw5_reg[1]  (.D(cw4[1]),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_MUX_RD_WR_sel));
   DFFR_X1 \cw5_reg[0]  (.D(cw4[0]),
	.RN(Rst),
	.CK(Clk),
	.Q(HW_RF_WR_RDneg));
   DFF_X1 \ALUop2_reg[4]  (.D(n187),
	.CK(Clk),
	.Q(n1),
	.QN(n105));
   DFF_X1 \aluOpcode_i_reg[4]  (.D(n155),
	.CK(Clk),
	.Q(FUNC_TO_DO[4]),
	.QN(n150));
   DFF_X1 \ALUop2_reg[3]  (.D(n186),
	.CK(Clk),
	.Q(n2),
	.QN(n104));
   DFF_X1 \aluOpcode_i_reg[3]  (.D(n154),
	.CK(Clk),
	.Q(FUNC_TO_DO[3]),
	.QN(n148));
   DFF_X1 \ALUop2_reg[2]  (.D(n185),
	.CK(Clk),
	.Q(n3),
	.QN(n103));
   DFF_X1 \aluOpcode_i_reg[2]  (.D(n153),
	.CK(Clk),
	.Q(FUNC_TO_DO[2]),
	.QN(n146));
   DFF_X1 \ALUop2_reg[1]  (.D(n184),
	.CK(Clk),
	.Q(n4),
	.QN(n102));
   DFF_X1 \aluOpcode_i_reg[1]  (.D(n152),
	.CK(Clk),
	.Q(FUNC_TO_DO[1]),
	.QN(n144));
   DFF_X1 \ALUop2_reg[0]  (.D(n183),
	.CK(Clk),
	.Q(n5),
	.QN(n101));
   DFF_X1 \aluOpcode_i_reg[0]  (.D(n151),
	.CK(Clk),
	.Q(FUNC_TO_DO[0]),
	.QN(n142));
   NOR4_X2 U3 (.A1(n84),
	.A2(IR_IN_28),
	.A3(IR_IN_29),
	.A4(IR_IN_31),
	.ZN(n29));
   NOR2_X4 U4 (.A1(Branch_taken),
	.A2(bubble_in),
	.ZN(n9));
   MUX2_X1 U5 (.A(ALUop1[4]),
	.B(n1),
	.S(n6),
	.Z(n187));
   MUX2_X1 U6 (.A(ALUop1[3]),
	.B(n2),
	.S(n6),
	.Z(n186));
   MUX2_X1 U7 (.A(ALUop1[2]),
	.B(n3),
	.S(n6),
	.Z(n185));
   MUX2_X1 U8 (.A(ALUop1[1]),
	.B(n4),
	.S(n6),
	.Z(n184));
   MUX2_X1 U9 (.A(ALUop1[0]),
	.B(n5),
	.S(n6),
	.Z(n183));
   INV_X1 U10 (.A(n7),
	.ZN(n181));
   INV_X1 U11 (.A(n8),
	.ZN(n180));
   MUX2_X1 U12 (.A(n116),
	.B(cw1[0]),
	.S(n9),
	.Z(n179));
   MUX2_X1 U13 (.A(n115),
	.B(cw1[1]),
	.S(n9),
	.Z(n178));
   MUX2_X1 U14 (.A(n114),
	.B(cw1[2]),
	.S(n9),
	.Z(n177));
   MUX2_X1 U15 (.A(n113),
	.B(cw1[3]),
	.S(n9),
	.Z(n176));
   MUX2_X1 U16 (.A(n112),
	.B(cw1[4]),
	.S(n9),
	.Z(n175));
   MUX2_X1 U17 (.A(n111),
	.B(cw1[5]),
	.S(n9),
	.Z(n174));
   MUX2_X1 U18 (.A(n110),
	.B(cw1[6]),
	.S(n9),
	.Z(n173));
   MUX2_X1 U19 (.A(n109),
	.B(cw1[7]),
	.S(n9),
	.Z(n172));
   MUX2_X1 U20 (.A(n108),
	.B(cw1[8]),
	.S(n9),
	.Z(n171));
   MUX2_X1 U21 (.A(n107),
	.B(cw1[9]),
	.S(n9),
	.Z(n170));
   MUX2_X1 U22 (.A(n106),
	.B(cw1[10]),
	.S(n9),
	.Z(n169));
   MUX2_X1 U23 (.A(HW_RF_RS2),
	.B(cw1[11]),
	.S(n9),
	.Z(n168));
   MUX2_X1 U24 (.A(HW_RF_RS1),
	.B(cw1[12]),
	.S(n9),
	.Z(n167));
   MUX2_X1 U25 (.A(HW_RF_enable),
	.B(cw1[13]),
	.S(n9),
	.Z(n166));
   MUX2_X1 U26 (.A(HW_reg1_decode),
	.B(cw1[14]),
	.S(n9),
	.Z(n165));
   MUX2_X1 U27 (.A(HW_Jump_25),
	.B(cw1[15]),
	.S(n9),
	.Z(n164));
   OAI22_X1 U28 (.A1(n150),
	.A2(Rst),
	.B1(n105),
	.B2(n6),
	.ZN(n155));
   OAI22_X1 U29 (.A1(n148),
	.A2(Rst),
	.B1(n104),
	.B2(n6),
	.ZN(n154));
   OAI22_X1 U30 (.A1(n146),
	.A2(Rst),
	.B1(n103),
	.B2(n6),
	.ZN(n153));
   OAI22_X1 U31 (.A1(n144),
	.A2(Rst),
	.B1(n102),
	.B2(n6),
	.ZN(n152));
   OAI22_X1 U32 (.A1(n142),
	.A2(Rst),
	.B1(n101),
	.B2(n6),
	.ZN(n151));
   NAND2_X1 U33 (.A1(Rst),
	.A2(n9),
	.ZN(n6));
   AND2_X1 U34 (.A1(n9),
	.A2(n106),
	.ZN(N246));
   AND2_X1 U35 (.A1(n9),
	.A2(n107),
	.ZN(N245));
   AND2_X1 U36 (.A1(n9),
	.A2(n108),
	.ZN(N244));
   AND2_X1 U37 (.A1(n9),
	.A2(n109),
	.ZN(N243));
   AND2_X1 U38 (.A1(n9),
	.A2(n110),
	.ZN(N242));
   AND2_X1 U39 (.A1(n9),
	.A2(n111),
	.ZN(N241));
   AND2_X1 U40 (.A1(n9),
	.A2(n112),
	.ZN(N240));
   AND2_X1 U41 (.A1(n9),
	.A2(n113),
	.ZN(N239));
   AND2_X1 U42 (.A1(n9),
	.A2(n114),
	.ZN(N238));
   AND2_X1 U43 (.A1(n9),
	.A2(n115),
	.ZN(N237));
   AND2_X1 U44 (.A1(n9),
	.A2(n116),
	.ZN(N236));
   NOR2_X1 U45 (.A1(n10),
	.A2(n11),
	.ZN(N213));
   OAI21_X1 U46 (.A(n13),
	.B1(n11),
	.B2(n12),
	.ZN(N212));
   INV_X1 U47 (.A(N208),
	.ZN(n13));
   NOR3_X1 U48 (.A1(n14),
	.A2(n15),
	.A3(n16),
	.ZN(n12));
   INV_X1 U49 (.A(n17),
	.ZN(n16));
   OAI21_X1 U50 (.A(n8),
	.B1(n11),
	.B2(n17),
	.ZN(N210));
   AOI21_X1 U51 (.A(N206),
	.B1(N211),
	.B2(n15),
	.ZN(n8));
   OAI21_X1 U52 (.A(n7),
	.B1(n11),
	.B2(n18),
	.ZN(N208));
   AOI21_X1 U53 (.A(N206),
	.B1(N211),
	.B2(n19),
	.ZN(n7));
   AND4_X1 U54 (.A1(n20),
	.A2(n21),
	.A3(N205),
	.A4(n22),
	.ZN(N206));
   NOR4_X1 U55 (.A1(n23),
	.A2(n24),
	.A3(n25),
	.A4(n26),
	.ZN(n22));
   INV_X1 U56 (.A(n27),
	.ZN(n26));
   INV_X1 U57 (.A(n28),
	.ZN(n20));
   AND2_X1 U58 (.A1(n29),
	.A2(N211),
	.ZN(N205));
   OAI21_X1 U59 (.A(n31),
	.B1(n11),
	.B2(n30),
	.ZN(N204));
   INV_X1 U60 (.A(N207),
	.ZN(n31));
   NOR2_X1 U61 (.A1(n11),
	.A2(n32),
	.ZN(N207));
   INV_X1 U62 (.A(N211),
	.ZN(n11));
   NAND3_X1 U63 (.A1(N211),
	.A2(n33),
	.A3(n10),
	.ZN(N203));
   AND4_X1 U64 (.A1(n32),
	.A2(n18),
	.A3(n17),
	.A4(n34),
	.ZN(n10));
   NOR2_X1 U65 (.A1(n14),
	.A2(n29),
	.ZN(n32));
   NAND4_X1 U66 (.A1(n35),
	.A2(n36),
	.A3(n37),
	.A4(n38),
	.ZN(n14));
   INV_X1 U67 (.A(n39),
	.ZN(n38));
   OAI211_X1 U68 (.A(n42),
	.B(n43),
	.C1(n40),
	.C2(n41),
	.ZN(n39));
   NAND2_X1 U69 (.A1(bubble_in),
	.A2(n182),
	.ZN(N211));
   INV_X1 U70 (.A(Branch_taken),
	.ZN(n182));
   NAND3_X1 U71 (.A1(n44),
	.A2(n17),
	.A3(n30),
	.ZN(N202));
   NOR2_X1 U72 (.A1(n19),
	.A2(n15),
	.ZN(n30));
   INV_X1 U73 (.A(n34),
	.ZN(n15));
   OAI211_X1 U74 (.A(n45),
	.B(n18),
	.C1(n41),
	.C2(n40),
	.ZN(N201));
   AND2_X1 U75 (.A1(n46),
	.A2(n47),
	.ZN(n18));
   OAI21_X1 U76 (.A(n29),
	.B1(n24),
	.B2(n25),
	.ZN(n45));
   INV_X1 U77 (.A(n48),
	.ZN(n25));
   AND2_X1 U78 (.A1(n49),
	.A2(n50),
	.ZN(n24));
   NOR2_X1 U79 (.A1(n51),
	.A2(n52),
	.ZN(n41));
   NAND4_X1 U80 (.A1(n44),
	.A2(n53),
	.A3(n42),
	.A4(n37),
	.ZN(N200));
   NAND2_X1 U81 (.A1(n29),
	.A2(n28),
	.ZN(n53));
   OAI221_X1 U82 (.A(n57),
	.B1(n54),
	.B2(n55),
	.C1(IR_IN[0]),
	.C2(n56),
	.ZN(n28));
   NAND2_X1 U83 (.A1(IR_IN[1]),
	.A2(n50),
	.ZN(n55));
   OR3_X1 U84 (.A1(IR_IN[3]),
	.A2(IR_IN[5]),
	.A3(n58),
	.ZN(n54));
   AOI21_X1 U85 (.A(n59),
	.B1(n29),
	.B2(n23),
	.ZN(n44));
   INV_X1 U86 (.A(n43),
	.ZN(n59));
   OAI211_X1 U87 (.A(IR_IN_30),
	.B(n61),
	.C1(n51),
	.C2(n60),
	.ZN(n43));
   AND2_X1 U88 (.A1(n62),
	.A2(IR_IN_28),
	.ZN(n60));
   AOI21_X1 U89 (.A(n65),
	.B1(n63),
	.B2(n64),
	.ZN(n23));
   NAND3_X1 U90 (.A1(n66),
	.A2(n67),
	.A3(n68),
	.ZN(N199));
   AND4_X1 U91 (.A1(n36),
	.A2(n34),
	.A3(n42),
	.A4(n47),
	.ZN(n68));
   NAND2_X1 U92 (.A1(n69),
	.A2(n70),
	.ZN(n47));
   NAND4_X1 U93 (.A1(n61),
	.A2(n52),
	.A3(n71),
	.A4(n72),
	.ZN(n42));
   NAND2_X1 U94 (.A1(n73),
	.A2(n74),
	.ZN(n34));
   NAND3_X1 U95 (.A1(n69),
	.A2(n62),
	.A3(IR_IN_30),
	.ZN(n36));
   INV_X1 U96 (.A(n75),
	.ZN(n67));
   AOI22_X1 U97 (.A1(n76),
	.A2(n62),
	.B1(n29),
	.B2(n77),
	.ZN(n66));
   OAI211_X1 U98 (.A(n21),
	.B(n57),
	.C1(n65),
	.C2(n63),
	.ZN(n77));
   NAND4_X1 U99 (.A1(IR_IN[1]),
	.A2(n78),
	.A3(n64),
	.A4(n79),
	.ZN(n57));
   NAND2_X1 U100 (.A1(n80),
	.A2(n81),
	.ZN(N198));
   AOI221_X1 U101 (.A(n83),
	.B1(n29),
	.B2(n82),
	.C1(n76),
	.C2(n51),
	.ZN(n81));
   INV_X1 U102 (.A(n37),
	.ZN(n83));
   NAND2_X1 U103 (.A1(n61),
	.A2(n70),
	.ZN(n37));
   INV_X1 U104 (.A(n84),
	.ZN(n70));
   AND3_X1 U105 (.A1(IR_IN_30),
	.A2(IR_IN_28),
	.A3(n61),
	.ZN(n76));
   NAND3_X1 U106 (.A1(n27),
	.A2(n48),
	.A3(n85),
	.ZN(n82));
   AOI22_X1 U107 (.A1(n50),
	.A2(n86),
	.B1(n49),
	.B2(n64),
	.ZN(n85));
   INV_X1 U108 (.A(n56),
	.ZN(n49));
   INV_X1 U109 (.A(n65),
	.ZN(n86));
   NAND4_X1 U110 (.A1(IR_IN[5]),
	.A2(IR_IN[3]),
	.A3(n87),
	.A4(n88),
	.ZN(n65));
   INV_X1 U111 (.A(n58),
	.ZN(n87));
   NOR2_X1 U112 (.A1(n64),
	.A2(n79),
	.ZN(n50));
   INV_X1 U113 (.A(IR_IN[2]),
	.ZN(n79));
   NAND3_X1 U114 (.A1(n89),
	.A2(IR_IN[5]),
	.A3(IR_IN[1]),
	.ZN(n48));
   NAND4_X1 U115 (.A1(n90),
	.A2(n64),
	.A3(IR_IN[6]),
	.A4(n91),
	.ZN(n27));
   NOR4_X1 U116 (.A1(IR_IN[5]),
	.A2(IR_IN[3]),
	.A3(IR_IN[2]),
	.A4(IR_IN[1]),
	.ZN(n91));
   AOI221_X1 U117 (.A(n75),
	.B1(n92),
	.B2(n52),
	.C1(IR_IN_26),
	.C2(n19),
	.ZN(n80));
   NAND4_X1 U118 (.A1(n17),
	.A2(n35),
	.A3(n46),
	.A4(n93),
	.ZN(n75));
   AOI22_X1 U119 (.A1(n29),
	.A2(n94),
	.B1(n92),
	.B2(n62),
	.ZN(n93));
   OAI22_X1 U120 (.A1(n56),
	.A2(n63),
	.B1(n88),
	.B2(n21),
	.ZN(n94));
   NAND2_X1 U121 (.A1(n89),
	.A2(n95),
	.ZN(n21));
   NOR3_X1 U122 (.A1(n58),
	.A2(IR_IN[3]),
	.A3(n63),
	.ZN(n89));
   NAND2_X1 U123 (.A1(IR_IN[2]),
	.A2(n64),
	.ZN(n63));
   INV_X1 U124 (.A(IR_IN[0]),
	.ZN(n64));
   NAND2_X1 U125 (.A1(n78),
	.A2(n88),
	.ZN(n56));
   INV_X1 U126 (.A(IR_IN[1]),
	.ZN(n88));
   NOR3_X1 U127 (.A1(n58),
	.A2(IR_IN[3]),
	.A3(n95),
	.ZN(n78));
   INV_X1 U128 (.A(IR_IN[5]),
	.ZN(n95));
   NAND2_X1 U129 (.A1(n90),
	.A2(n96),
	.ZN(n58));
   INV_X1 U130 (.A(IR_IN[6]),
	.ZN(n96));
   NOR3_X1 U131 (.A1(IR_IN[4]),
	.A2(IR_IN[10]),
	.A3(n97),
	.ZN(n90));
   OR3_X1 U132 (.A1(IR_IN[9]),
	.A2(IR_IN[8]),
	.A3(IR_IN[7]),
	.ZN(n97));
   NAND2_X1 U133 (.A1(n62),
	.A2(n72),
	.ZN(n84));
   NOR2_X1 U134 (.A1(IR_IN_26),
	.A2(IR_IN_27),
	.ZN(n62));
   NAND3_X1 U135 (.A1(n69),
	.A2(n72),
	.A3(n51),
	.ZN(n46));
   AND2_X1 U136 (.A1(IR_IN_26),
	.A2(n98),
	.ZN(n51));
   NAND3_X1 U137 (.A1(IR_IN_30),
	.A2(n69),
	.A3(n52),
	.ZN(n35));
   NOR3_X1 U138 (.A1(IR_IN_29),
	.A2(IR_IN_31),
	.A3(n71),
	.ZN(n69));
   NAND2_X1 U139 (.A1(IR_IN_29),
	.A2(n73),
	.ZN(n17));
   AND4_X1 U140 (.A1(IR_IN_31),
	.A2(IR_IN_26),
	.A3(n99),
	.A4(IR_IN_27),
	.ZN(n73));
   NOR2_X1 U141 (.A1(IR_IN_30),
	.A2(IR_IN_28),
	.ZN(n99));
   INV_X1 U142 (.A(n33),
	.ZN(n19));
   NAND4_X1 U143 (.A1(IR_IN_27),
	.A2(n71),
	.A3(n100),
	.A4(n74),
	.ZN(n33));
   NOR2_X1 U144 (.A1(IR_IN_31),
	.A2(IR_IN_30),
	.ZN(n100));
   INV_X1 U145 (.A(IR_IN_28),
	.ZN(n71));
   NOR2_X1 U146 (.A1(n98),
	.A2(IR_IN_26),
	.ZN(n52));
   INV_X1 U147 (.A(IR_IN_27),
	.ZN(n98));
   INV_X1 U148 (.A(n40),
	.ZN(n92));
   NAND3_X1 U149 (.A1(IR_IN_28),
	.A2(n72),
	.A3(n61),
	.ZN(n40));
   NOR2_X1 U150 (.A1(n74),
	.A2(IR_IN_31),
	.ZN(n61));
   INV_X1 U151 (.A(IR_IN_29),
	.ZN(n74));
   INV_X1 U152 (.A(IR_IN_30),
	.ZN(n72));
endmodule

module dlx_ADDR_SIZE32_DATA_SIZE32 (
	CLK, 
	RESET);
   input CLK;
   input RESET;

   // Internal wires
   wire out_bubble_signal;
   wire out_branch_signal;
   wire DP_pre_IMMM_enable_signal;
   wire DP_NPC_enable_signal;
   wire DP_PC_enable_signal;
   wire DP_Jump_25_signal;
   wire DP_reg1_enable_signal;
   wire DP_RF_enable_signal;
   wire DP_RF_RS1_signal;
   wire DP_RF_RS2_signal;
   wire DP_RF_WR_RDneg_signal;
   wire DP_muxs1_signal;
   wire DP_muxs2_signal;
   wire DP_reg2_signal;
   wire DP_reg3_signal;
   wire DP_CS_signal;
   wire DP_RD_WRN_mem_signal;
   wire DP_MUX_PC_mem_signal;
   wire DP_muxs3_signal;
   wire DP_MUX_RS2_WR_sel_signal;
   wire DP_MUX_RD_WR_sel_signal;
   wire [31:0] out_IR_fetch_signal;
   wire [4:0] DP_FUNC_signal;

   dlx_cu_HW_MICROCODE_MEM_SIZE10_FUNC_SIZE11_OP_CODE_SIZE6_IR_SIZE32_CW_SIZE19 cu (.Clk(CLK),
	.Rst(RESET),
	.IR_IN(out_IR_fetch_signal),
	.bubble_in(out_bubble_signal),
	.Branch_taken(out_branch_signal),
	.FUNC_TO_DO(DP_FUNC_signal),
	.HW_pre_immediate_enable(DP_pre_IMMM_enable_signal),
	.HW_NPC_enable_fetch(DP_NPC_enable_signal),
	.HW_PC_enable_fetch(DP_PC_enable_signal),
	.HW_Jump_25(DP_Jump_25_signal),
	.HW_reg1_decode(DP_reg1_enable_signal),
	.HW_RF_enable(DP_RF_enable_signal),
	.HW_RF_RS1(DP_RF_RS1_signal),
	.HW_RF_RS2(DP_RF_RS2_signal),
	.HW_RF_WR_RDneg(DP_RF_WR_RDneg_signal),
	.HW_muxs1(DP_muxs1_signal),
	.HW_muxs2(DP_muxs2_signal),
	.HW_reg2_execute(DP_reg2_signal),
	.HW_reg3_mem(DP_reg3_signal),
	.HW_CS_mem(DP_CS_signal),
	.HW_RD_WRN_mem(DP_RD_WRN_mem_signal),
	.HW_MUX_PC_mem(DP_MUX_PC_mem_signal),
	.HW_muxs3(DP_muxs3_signal),
	.HW_MUX_RS2_WR_sel(DP_MUX_RS2_WR_sel_signal),
	.HW_MUX_RD_WR_sel(DP_MUX_RD_WR_sel_signal));
   data_path dp (.clk(CLK),
	.reset(RESET),
	.DP_FUNC(DP_FUNC_signal),
	.DP_PC_enable(DP_PC_enable_signal),
	.DP_NPC_enable(DP_NPC_enable_signal),
	.DP_pre_IMMM_enable(DP_pre_IMMM_enable_signal),
	.DP_Jump_25(DP_Jump_25_signal),
	.DP_reg1_enable(DP_reg1_enable_signal),
	.DP_RF_enable(DP_RF_enable_signal),
	.DP_RF_RS1(DP_RF_RS1_signal),
	.DP_RF_RS2(DP_RF_RS2_signal),
	.DP_RF_WR_RDneg(DP_RF_WR_RDneg_signal),
	.DP_muxs1(DP_muxs1_signal),
	.DP_muxs2(DP_muxs2_signal),
	.DP_reg2(DP_reg2_signal),
	.DP_CS(DP_CS_signal),
	.DP_RD_WRN_mem(DP_RD_WRN_mem_signal),
	.DP_reg3(DP_reg3_signal),
	.DP_MUX_PC_mem(DP_MUX_PC_mem_signal),
	.DP_muxs3(DP_muxs3_signal),
	.DP_MUX_RD_WR_sel(DP_MUX_RD_WR_sel_signal),
	.DP_MUX_RS2_WR_sel(DP_MUX_RS2_WR_sel_signal),
	.out_bubble(out_bubble_signal),
	.out_branch(out_branch_signal),
	.out_IR_fetch(out_IR_fetch_signal));
endmodule

