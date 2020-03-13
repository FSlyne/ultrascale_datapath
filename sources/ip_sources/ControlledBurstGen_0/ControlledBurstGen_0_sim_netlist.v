// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Wed Feb 12 14:41:03 2020
// Host        : Christian running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top ControlledBurstGen_0 -prefix
//               ControlledBurstGen_0_ ControlledBurstGen_0_sim_netlist.v
// Design      : ControlledBurstGen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu095-ffva2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ap_ST_fsm_state1 = "1'b1" *) (* hls_module = "yes" *) 
module ControlledBurstGen_0_ControlledBurstGen
   (ap_clk,
    ap_rst_n,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    enable,
    preamble_length,
    preamble,
    delimiter,
    burst_length,
    burst_period,
    dataOut_TDATA,
    dataOut_TVALID,
    dataOut_TREADY,
    dataOut_TKEEP,
    dataOut_TSTRB,
    dataOut_TUSER,
    dataOut_TLAST,
    dataOut_TID,
    dataOut_TDEST);
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input enable;
  input [31:0]preamble_length;
  input [31:0]preamble;
  input [31:0]delimiter;
  input [31:0]burst_length;
  input [31:0]burst_period;
  output [31:0]dataOut_TDATA;
  output dataOut_TVALID;
  input dataOut_TREADY;
  output [3:0]dataOut_TKEEP;
  output [3:0]dataOut_TSTRB;
  output [1:0]dataOut_TUSER;
  output [0:0]dataOut_TLAST;
  output [4:0]dataOut_TID;
  output [5:0]dataOut_TDEST;

  wire \<const0> ;
  wire \<const1> ;
  wire ap_clk;
  wire ap_condition_184;
  wire ap_idle;
  wire ap_ready;
  wire ap_ready_INST_0_i_10_n_0;
  wire ap_ready_INST_0_i_11_n_0;
  wire ap_ready_INST_0_i_12_n_0;
  wire ap_ready_INST_0_i_13_n_0;
  wire ap_ready_INST_0_i_14_n_0;
  wire ap_ready_INST_0_i_15_n_0;
  wire ap_ready_INST_0_i_16_n_0;
  wire ap_ready_INST_0_i_17_n_0;
  wire ap_ready_INST_0_i_18_n_0;
  wire ap_ready_INST_0_i_19_n_0;
  wire ap_ready_INST_0_i_1_n_1;
  wire ap_ready_INST_0_i_1_n_2;
  wire ap_ready_INST_0_i_1_n_3;
  wire ap_ready_INST_0_i_1_n_5;
  wire ap_ready_INST_0_i_1_n_6;
  wire ap_ready_INST_0_i_1_n_7;
  wire ap_ready_INST_0_i_20_n_0;
  wire ap_ready_INST_0_i_21_n_0;
  wire ap_ready_INST_0_i_22_n_0;
  wire ap_ready_INST_0_i_23_n_0;
  wire ap_ready_INST_0_i_24_n_0;
  wire ap_ready_INST_0_i_25_n_0;
  wire ap_ready_INST_0_i_26_n_0;
  wire ap_ready_INST_0_i_27_n_0;
  wire ap_ready_INST_0_i_28_n_0;
  wire ap_ready_INST_0_i_29_n_0;
  wire ap_ready_INST_0_i_2_n_0;
  wire ap_ready_INST_0_i_30_n_0;
  wire ap_ready_INST_0_i_31_n_0;
  wire ap_ready_INST_0_i_32_n_0;
  wire ap_ready_INST_0_i_33_n_0;
  wire ap_ready_INST_0_i_34_n_0;
  wire ap_ready_INST_0_i_35_n_0;
  wire ap_ready_INST_0_i_36_n_2;
  wire ap_ready_INST_0_i_36_n_3;
  wire ap_ready_INST_0_i_36_n_5;
  wire ap_ready_INST_0_i_36_n_6;
  wire ap_ready_INST_0_i_36_n_7;
  wire ap_ready_INST_0_i_37_n_0;
  wire ap_ready_INST_0_i_37_n_1;
  wire ap_ready_INST_0_i_37_n_2;
  wire ap_ready_INST_0_i_37_n_3;
  wire ap_ready_INST_0_i_37_n_5;
  wire ap_ready_INST_0_i_37_n_6;
  wire ap_ready_INST_0_i_37_n_7;
  wire ap_ready_INST_0_i_38_n_0;
  wire ap_ready_INST_0_i_38_n_1;
  wire ap_ready_INST_0_i_38_n_2;
  wire ap_ready_INST_0_i_38_n_3;
  wire ap_ready_INST_0_i_38_n_5;
  wire ap_ready_INST_0_i_38_n_6;
  wire ap_ready_INST_0_i_38_n_7;
  wire ap_ready_INST_0_i_39_n_0;
  wire ap_ready_INST_0_i_39_n_1;
  wire ap_ready_INST_0_i_39_n_2;
  wire ap_ready_INST_0_i_39_n_3;
  wire ap_ready_INST_0_i_39_n_5;
  wire ap_ready_INST_0_i_39_n_6;
  wire ap_ready_INST_0_i_39_n_7;
  wire ap_ready_INST_0_i_3_n_0;
  wire ap_ready_INST_0_i_3_n_1;
  wire ap_ready_INST_0_i_3_n_2;
  wire ap_ready_INST_0_i_3_n_3;
  wire ap_ready_INST_0_i_3_n_5;
  wire ap_ready_INST_0_i_3_n_6;
  wire ap_ready_INST_0_i_3_n_7;
  wire ap_ready_INST_0_i_40_n_0;
  wire ap_ready_INST_0_i_41_n_0;
  wire ap_ready_INST_0_i_42_n_0;
  wire ap_ready_INST_0_i_43_n_0;
  wire ap_ready_INST_0_i_44_n_0;
  wire ap_ready_INST_0_i_45_n_0;
  wire ap_ready_INST_0_i_46_n_0;
  wire ap_ready_INST_0_i_47_n_0;
  wire ap_ready_INST_0_i_48_n_0;
  wire ap_ready_INST_0_i_49_n_0;
  wire ap_ready_INST_0_i_4_n_0;
  wire ap_ready_INST_0_i_50_n_0;
  wire ap_ready_INST_0_i_51_n_0;
  wire ap_ready_INST_0_i_52_n_0;
  wire ap_ready_INST_0_i_53_n_0;
  wire ap_ready_INST_0_i_54_n_0;
  wire ap_ready_INST_0_i_55_n_0;
  wire ap_ready_INST_0_i_56_n_0;
  wire ap_ready_INST_0_i_57_n_0;
  wire ap_ready_INST_0_i_58_n_0;
  wire ap_ready_INST_0_i_59_n_0;
  wire ap_ready_INST_0_i_5_n_0;
  wire ap_ready_INST_0_i_60_n_0;
  wire ap_ready_INST_0_i_61_n_0;
  wire ap_ready_INST_0_i_62_n_0;
  wire ap_ready_INST_0_i_63_n_0;
  wire ap_ready_INST_0_i_64_n_0;
  wire ap_ready_INST_0_i_65_n_0;
  wire ap_ready_INST_0_i_66_n_0;
  wire ap_ready_INST_0_i_67_n_0;
  wire ap_ready_INST_0_i_68_n_0;
  wire ap_ready_INST_0_i_69_n_0;
  wire ap_ready_INST_0_i_6_n_0;
  wire ap_ready_INST_0_i_70_n_0;
  wire ap_ready_INST_0_i_7_n_0;
  wire ap_ready_INST_0_i_8_n_0;
  wire ap_ready_INST_0_i_9_n_0;
  wire ap_reg_ioackin_dataOut_TREADY_i_1_n_0;
  wire ap_reg_ioackin_dataOut_TREADY_i_2_n_0;
  wire ap_rst_n;
  wire ap_start;
  wire [31:0]burst_length;
  wire [31:0]burst_period;
  wire [31:0]dataOut_TDATA;
  wire \dataOut_TDATA[31]_INST_0_i_10_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_11_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_12_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_13_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_14_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_15_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_16_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_17_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_18_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_19_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_1_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_20_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_21_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_22_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_23_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_23_n_1 ;
  wire \dataOut_TDATA[31]_INST_0_i_23_n_2 ;
  wire \dataOut_TDATA[31]_INST_0_i_23_n_3 ;
  wire \dataOut_TDATA[31]_INST_0_i_23_n_5 ;
  wire \dataOut_TDATA[31]_INST_0_i_23_n_6 ;
  wire \dataOut_TDATA[31]_INST_0_i_23_n_7 ;
  wire \dataOut_TDATA[31]_INST_0_i_24_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_25_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_26_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_27_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_28_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_29_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_2_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_30_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_31_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_32_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_33_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_34_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_35_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_36_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_37_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_38_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_39_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_3_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_40_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_41_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_42_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_43_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_44_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_45_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_46_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_47_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_48_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_49_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_4_n_1 ;
  wire \dataOut_TDATA[31]_INST_0_i_4_n_2 ;
  wire \dataOut_TDATA[31]_INST_0_i_4_n_3 ;
  wire \dataOut_TDATA[31]_INST_0_i_4_n_5 ;
  wire \dataOut_TDATA[31]_INST_0_i_4_n_6 ;
  wire \dataOut_TDATA[31]_INST_0_i_4_n_7 ;
  wire \dataOut_TDATA[31]_INST_0_i_50_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_5_n_6 ;
  wire \dataOut_TDATA[31]_INST_0_i_5_n_7 ;
  wire \dataOut_TDATA[31]_INST_0_i_6_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_6_n_1 ;
  wire \dataOut_TDATA[31]_INST_0_i_6_n_2 ;
  wire \dataOut_TDATA[31]_INST_0_i_6_n_3 ;
  wire \dataOut_TDATA[31]_INST_0_i_6_n_5 ;
  wire \dataOut_TDATA[31]_INST_0_i_6_n_6 ;
  wire \dataOut_TDATA[31]_INST_0_i_6_n_7 ;
  wire \dataOut_TDATA[31]_INST_0_i_7_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_8_n_0 ;
  wire \dataOut_TDATA[31]_INST_0_i_9_n_0 ;
  wire [0:0]dataOut_TLAST;
  wire dataOut_TREADY;
  wire dataOut_TVALID;
  wire dataOut_TVALID_INST_0_i_10_n_0;
  wire dataOut_TVALID_INST_0_i_11_n_0;
  wire dataOut_TVALID_INST_0_i_12_n_0;
  wire dataOut_TVALID_INST_0_i_13_n_0;
  wire dataOut_TVALID_INST_0_i_14_n_0;
  wire dataOut_TVALID_INST_0_i_15_n_0;
  wire dataOut_TVALID_INST_0_i_16_n_0;
  wire dataOut_TVALID_INST_0_i_17_n_0;
  wire dataOut_TVALID_INST_0_i_18_n_0;
  wire dataOut_TVALID_INST_0_i_19_n_0;
  wire dataOut_TVALID_INST_0_i_1_n_6;
  wire dataOut_TVALID_INST_0_i_1_n_7;
  wire dataOut_TVALID_INST_0_i_20_n_0;
  wire dataOut_TVALID_INST_0_i_21_n_0;
  wire dataOut_TVALID_INST_0_i_22_n_0;
  wire dataOut_TVALID_INST_0_i_23_n_0;
  wire dataOut_TVALID_INST_0_i_24_n_0;
  wire dataOut_TVALID_INST_0_i_25_n_0;
  wire dataOut_TVALID_INST_0_i_26_n_0;
  wire dataOut_TVALID_INST_0_i_27_n_0;
  wire dataOut_TVALID_INST_0_i_28_n_0;
  wire dataOut_TVALID_INST_0_i_29_n_0;
  wire dataOut_TVALID_INST_0_i_2_n_1;
  wire dataOut_TVALID_INST_0_i_2_n_2;
  wire dataOut_TVALID_INST_0_i_2_n_3;
  wire dataOut_TVALID_INST_0_i_2_n_5;
  wire dataOut_TVALID_INST_0_i_2_n_6;
  wire dataOut_TVALID_INST_0_i_2_n_7;
  wire dataOut_TVALID_INST_0_i_30_n_0;
  wire dataOut_TVALID_INST_0_i_31_n_0;
  wire dataOut_TVALID_INST_0_i_32_n_2;
  wire dataOut_TVALID_INST_0_i_32_n_3;
  wire dataOut_TVALID_INST_0_i_32_n_5;
  wire dataOut_TVALID_INST_0_i_32_n_6;
  wire dataOut_TVALID_INST_0_i_32_n_7;
  wire dataOut_TVALID_INST_0_i_33_n_0;
  wire dataOut_TVALID_INST_0_i_33_n_1;
  wire dataOut_TVALID_INST_0_i_33_n_2;
  wire dataOut_TVALID_INST_0_i_33_n_3;
  wire dataOut_TVALID_INST_0_i_33_n_5;
  wire dataOut_TVALID_INST_0_i_33_n_6;
  wire dataOut_TVALID_INST_0_i_33_n_7;
  wire dataOut_TVALID_INST_0_i_34_n_0;
  wire dataOut_TVALID_INST_0_i_35_n_0;
  wire dataOut_TVALID_INST_0_i_36_n_0;
  wire dataOut_TVALID_INST_0_i_37_n_0;
  wire dataOut_TVALID_INST_0_i_38_n_0;
  wire dataOut_TVALID_INST_0_i_39_n_0;
  wire dataOut_TVALID_INST_0_i_3_n_0;
  wire dataOut_TVALID_INST_0_i_3_n_1;
  wire dataOut_TVALID_INST_0_i_3_n_2;
  wire dataOut_TVALID_INST_0_i_3_n_3;
  wire dataOut_TVALID_INST_0_i_3_n_5;
  wire dataOut_TVALID_INST_0_i_3_n_6;
  wire dataOut_TVALID_INST_0_i_3_n_7;
  wire dataOut_TVALID_INST_0_i_40_n_0;
  wire dataOut_TVALID_INST_0_i_41_n_0;
  wire dataOut_TVALID_INST_0_i_42_n_0;
  wire dataOut_TVALID_INST_0_i_43_n_0;
  wire dataOut_TVALID_INST_0_i_44_n_0;
  wire dataOut_TVALID_INST_0_i_45_n_0;
  wire dataOut_TVALID_INST_0_i_46_n_0;
  wire dataOut_TVALID_INST_0_i_47_n_0;
  wire dataOut_TVALID_INST_0_i_48_n_0;
  wire dataOut_TVALID_INST_0_i_49_n_0;
  wire dataOut_TVALID_INST_0_i_4_n_0;
  wire dataOut_TVALID_INST_0_i_50_n_0;
  wire dataOut_TVALID_INST_0_i_50_n_1;
  wire dataOut_TVALID_INST_0_i_50_n_2;
  wire dataOut_TVALID_INST_0_i_50_n_3;
  wire dataOut_TVALID_INST_0_i_50_n_5;
  wire dataOut_TVALID_INST_0_i_50_n_6;
  wire dataOut_TVALID_INST_0_i_50_n_7;
  wire dataOut_TVALID_INST_0_i_51_n_0;
  wire dataOut_TVALID_INST_0_i_51_n_1;
  wire dataOut_TVALID_INST_0_i_51_n_2;
  wire dataOut_TVALID_INST_0_i_51_n_3;
  wire dataOut_TVALID_INST_0_i_51_n_5;
  wire dataOut_TVALID_INST_0_i_51_n_6;
  wire dataOut_TVALID_INST_0_i_51_n_7;
  wire dataOut_TVALID_INST_0_i_52_n_0;
  wire dataOut_TVALID_INST_0_i_53_n_0;
  wire dataOut_TVALID_INST_0_i_54_n_0;
  wire dataOut_TVALID_INST_0_i_55_n_0;
  wire dataOut_TVALID_INST_0_i_56_n_0;
  wire dataOut_TVALID_INST_0_i_57_n_0;
  wire dataOut_TVALID_INST_0_i_58_n_0;
  wire dataOut_TVALID_INST_0_i_59_n_0;
  wire dataOut_TVALID_INST_0_i_5_n_0;
  wire dataOut_TVALID_INST_0_i_60_n_0;
  wire dataOut_TVALID_INST_0_i_61_n_0;
  wire dataOut_TVALID_INST_0_i_62_n_0;
  wire dataOut_TVALID_INST_0_i_63_n_0;
  wire dataOut_TVALID_INST_0_i_64_n_0;
  wire dataOut_TVALID_INST_0_i_65_n_0;
  wire dataOut_TVALID_INST_0_i_66_n_0;
  wire dataOut_TVALID_INST_0_i_67_n_0;
  wire dataOut_TVALID_INST_0_i_68_n_0;
  wire dataOut_TVALID_INST_0_i_69_n_0;
  wire dataOut_TVALID_INST_0_i_6_n_0;
  wire dataOut_TVALID_INST_0_i_70_n_0;
  wire dataOut_TVALID_INST_0_i_71_n_0;
  wire dataOut_TVALID_INST_0_i_72_n_0;
  wire dataOut_TVALID_INST_0_i_73_n_0;
  wire dataOut_TVALID_INST_0_i_74_n_0;
  wire dataOut_TVALID_INST_0_i_75_n_0;
  wire dataOut_TVALID_INST_0_i_76_n_0;
  wire dataOut_TVALID_INST_0_i_77_n_0;
  wire dataOut_TVALID_INST_0_i_78_n_0;
  wire dataOut_TVALID_INST_0_i_79_n_0;
  wire dataOut_TVALID_INST_0_i_7_n_0;
  wire dataOut_TVALID_INST_0_i_7_n_1;
  wire dataOut_TVALID_INST_0_i_7_n_2;
  wire dataOut_TVALID_INST_0_i_7_n_3;
  wire dataOut_TVALID_INST_0_i_7_n_5;
  wire dataOut_TVALID_INST_0_i_7_n_6;
  wire dataOut_TVALID_INST_0_i_7_n_7;
  wire dataOut_TVALID_INST_0_i_80_n_0;
  wire dataOut_TVALID_INST_0_i_81_n_0;
  wire dataOut_TVALID_INST_0_i_82_n_0;
  wire dataOut_TVALID_INST_0_i_8_n_0;
  wire dataOut_TVALID_INST_0_i_9_n_0;
  wire \data_count[0]_i_1_n_0 ;
  wire \data_count[0]_i_4_n_0 ;
  wire [31:0]data_count_reg;
  wire \data_count_reg[0]_i_3_n_0 ;
  wire \data_count_reg[0]_i_3_n_1 ;
  wire \data_count_reg[0]_i_3_n_10 ;
  wire \data_count_reg[0]_i_3_n_11 ;
  wire \data_count_reg[0]_i_3_n_12 ;
  wire \data_count_reg[0]_i_3_n_13 ;
  wire \data_count_reg[0]_i_3_n_14 ;
  wire \data_count_reg[0]_i_3_n_15 ;
  wire \data_count_reg[0]_i_3_n_2 ;
  wire \data_count_reg[0]_i_3_n_3 ;
  wire \data_count_reg[0]_i_3_n_5 ;
  wire \data_count_reg[0]_i_3_n_6 ;
  wire \data_count_reg[0]_i_3_n_7 ;
  wire \data_count_reg[0]_i_3_n_8 ;
  wire \data_count_reg[0]_i_3_n_9 ;
  wire \data_count_reg[16]_i_1_n_0 ;
  wire \data_count_reg[16]_i_1_n_1 ;
  wire \data_count_reg[16]_i_1_n_10 ;
  wire \data_count_reg[16]_i_1_n_11 ;
  wire \data_count_reg[16]_i_1_n_12 ;
  wire \data_count_reg[16]_i_1_n_13 ;
  wire \data_count_reg[16]_i_1_n_14 ;
  wire \data_count_reg[16]_i_1_n_15 ;
  wire \data_count_reg[16]_i_1_n_2 ;
  wire \data_count_reg[16]_i_1_n_3 ;
  wire \data_count_reg[16]_i_1_n_5 ;
  wire \data_count_reg[16]_i_1_n_6 ;
  wire \data_count_reg[16]_i_1_n_7 ;
  wire \data_count_reg[16]_i_1_n_8 ;
  wire \data_count_reg[16]_i_1_n_9 ;
  wire \data_count_reg[24]_i_1_n_1 ;
  wire \data_count_reg[24]_i_1_n_10 ;
  wire \data_count_reg[24]_i_1_n_11 ;
  wire \data_count_reg[24]_i_1_n_12 ;
  wire \data_count_reg[24]_i_1_n_13 ;
  wire \data_count_reg[24]_i_1_n_14 ;
  wire \data_count_reg[24]_i_1_n_15 ;
  wire \data_count_reg[24]_i_1_n_2 ;
  wire \data_count_reg[24]_i_1_n_3 ;
  wire \data_count_reg[24]_i_1_n_5 ;
  wire \data_count_reg[24]_i_1_n_6 ;
  wire \data_count_reg[24]_i_1_n_7 ;
  wire \data_count_reg[24]_i_1_n_8 ;
  wire \data_count_reg[24]_i_1_n_9 ;
  wire \data_count_reg[8]_i_1_n_0 ;
  wire \data_count_reg[8]_i_1_n_1 ;
  wire \data_count_reg[8]_i_1_n_10 ;
  wire \data_count_reg[8]_i_1_n_11 ;
  wire \data_count_reg[8]_i_1_n_12 ;
  wire \data_count_reg[8]_i_1_n_13 ;
  wire \data_count_reg[8]_i_1_n_14 ;
  wire \data_count_reg[8]_i_1_n_15 ;
  wire \data_count_reg[8]_i_1_n_2 ;
  wire \data_count_reg[8]_i_1_n_3 ;
  wire \data_count_reg[8]_i_1_n_5 ;
  wire \data_count_reg[8]_i_1_n_6 ;
  wire \data_count_reg[8]_i_1_n_7 ;
  wire \data_count_reg[8]_i_1_n_8 ;
  wire \data_count_reg[8]_i_1_n_9 ;
  wire [31:0]delimiter;
  wire enable;
  wire init_data0;
  wire \init_data[0]_i_3_n_0 ;
  wire \init_data[0]_i_4_n_0 ;
  wire [31:0]init_data_reg;
  wire \init_data_reg[0]_i_2_n_0 ;
  wire \init_data_reg[0]_i_2_n_1 ;
  wire \init_data_reg[0]_i_2_n_10 ;
  wire \init_data_reg[0]_i_2_n_11 ;
  wire \init_data_reg[0]_i_2_n_12 ;
  wire \init_data_reg[0]_i_2_n_13 ;
  wire \init_data_reg[0]_i_2_n_14 ;
  wire \init_data_reg[0]_i_2_n_15 ;
  wire \init_data_reg[0]_i_2_n_2 ;
  wire \init_data_reg[0]_i_2_n_3 ;
  wire \init_data_reg[0]_i_2_n_5 ;
  wire \init_data_reg[0]_i_2_n_6 ;
  wire \init_data_reg[0]_i_2_n_7 ;
  wire \init_data_reg[0]_i_2_n_8 ;
  wire \init_data_reg[0]_i_2_n_9 ;
  wire \init_data_reg[16]_i_1_n_0 ;
  wire \init_data_reg[16]_i_1_n_1 ;
  wire \init_data_reg[16]_i_1_n_10 ;
  wire \init_data_reg[16]_i_1_n_11 ;
  wire \init_data_reg[16]_i_1_n_12 ;
  wire \init_data_reg[16]_i_1_n_13 ;
  wire \init_data_reg[16]_i_1_n_14 ;
  wire \init_data_reg[16]_i_1_n_15 ;
  wire \init_data_reg[16]_i_1_n_2 ;
  wire \init_data_reg[16]_i_1_n_3 ;
  wire \init_data_reg[16]_i_1_n_5 ;
  wire \init_data_reg[16]_i_1_n_6 ;
  wire \init_data_reg[16]_i_1_n_7 ;
  wire \init_data_reg[16]_i_1_n_8 ;
  wire \init_data_reg[16]_i_1_n_9 ;
  wire \init_data_reg[24]_i_1_n_1 ;
  wire \init_data_reg[24]_i_1_n_10 ;
  wire \init_data_reg[24]_i_1_n_11 ;
  wire \init_data_reg[24]_i_1_n_12 ;
  wire \init_data_reg[24]_i_1_n_13 ;
  wire \init_data_reg[24]_i_1_n_14 ;
  wire \init_data_reg[24]_i_1_n_15 ;
  wire \init_data_reg[24]_i_1_n_2 ;
  wire \init_data_reg[24]_i_1_n_3 ;
  wire \init_data_reg[24]_i_1_n_5 ;
  wire \init_data_reg[24]_i_1_n_6 ;
  wire \init_data_reg[24]_i_1_n_7 ;
  wire \init_data_reg[24]_i_1_n_8 ;
  wire \init_data_reg[24]_i_1_n_9 ;
  wire \init_data_reg[8]_i_1_n_0 ;
  wire \init_data_reg[8]_i_1_n_1 ;
  wire \init_data_reg[8]_i_1_n_10 ;
  wire \init_data_reg[8]_i_1_n_11 ;
  wire \init_data_reg[8]_i_1_n_12 ;
  wire \init_data_reg[8]_i_1_n_13 ;
  wire \init_data_reg[8]_i_1_n_14 ;
  wire \init_data_reg[8]_i_1_n_15 ;
  wire \init_data_reg[8]_i_1_n_2 ;
  wire \init_data_reg[8]_i_1_n_3 ;
  wire \init_data_reg[8]_i_1_n_5 ;
  wire \init_data_reg[8]_i_1_n_6 ;
  wire \init_data_reg[8]_i_1_n_7 ;
  wire \init_data_reg[8]_i_1_n_8 ;
  wire \init_data_reg[8]_i_1_n_9 ;
  wire [0:0]p_0_in;
  wire [31:0]preamble;
  wire [31:0]preamble_length;
  wire tmp_1_fu_175_p2;
  wire [31:1]tmp_2_fu_193_p2;
  wire tmp_3_fu_199_p2;
  wire tmp_4_fu_211_p2;
  wire tmp_5_fu_205_p2;
  wire tmp_6_fu_217_p2;
  wire [31:1]tmp_fu_169_p2;
  wire [3:3]NLW_ap_ready_INST_0_i_1_CO_UNCONNECTED;
  wire [7:0]NLW_ap_ready_INST_0_i_1_O_UNCONNECTED;
  wire [3:3]NLW_ap_ready_INST_0_i_3_CO_UNCONNECTED;
  wire [7:0]NLW_ap_ready_INST_0_i_3_O_UNCONNECTED;
  wire [7:3]NLW_ap_ready_INST_0_i_36_CO_UNCONNECTED;
  wire [7:7]NLW_ap_ready_INST_0_i_36_DI_UNCONNECTED;
  wire [7:7]NLW_ap_ready_INST_0_i_36_O_UNCONNECTED;
  wire [7:7]NLW_ap_ready_INST_0_i_36_S_UNCONNECTED;
  wire [3:3]NLW_ap_ready_INST_0_i_37_CO_UNCONNECTED;
  wire [3:3]NLW_ap_ready_INST_0_i_38_CO_UNCONNECTED;
  wire [3:3]NLW_ap_ready_INST_0_i_39_CO_UNCONNECTED;
  wire [3:3]\NLW_dataOut_TDATA[31]_INST_0_i_23_CO_UNCONNECTED ;
  wire [7:0]\NLW_dataOut_TDATA[31]_INST_0_i_23_O_UNCONNECTED ;
  wire [3:3]\NLW_dataOut_TDATA[31]_INST_0_i_4_CO_UNCONNECTED ;
  wire [7:0]\NLW_dataOut_TDATA[31]_INST_0_i_4_O_UNCONNECTED ;
  wire [7:3]\NLW_dataOut_TDATA[31]_INST_0_i_5_CO_UNCONNECTED ;
  wire [7:3]\NLW_dataOut_TDATA[31]_INST_0_i_5_DI_UNCONNECTED ;
  wire [7:0]\NLW_dataOut_TDATA[31]_INST_0_i_5_O_UNCONNECTED ;
  wire [7:3]\NLW_dataOut_TDATA[31]_INST_0_i_5_S_UNCONNECTED ;
  wire [3:3]\NLW_dataOut_TDATA[31]_INST_0_i_6_CO_UNCONNECTED ;
  wire [7:0]\NLW_dataOut_TDATA[31]_INST_0_i_6_O_UNCONNECTED ;
  wire [7:3]NLW_dataOut_TVALID_INST_0_i_1_CO_UNCONNECTED;
  wire [7:3]NLW_dataOut_TVALID_INST_0_i_1_DI_UNCONNECTED;
  wire [7:0]NLW_dataOut_TVALID_INST_0_i_1_O_UNCONNECTED;
  wire [7:3]NLW_dataOut_TVALID_INST_0_i_1_S_UNCONNECTED;
  wire [3:3]NLW_dataOut_TVALID_INST_0_i_2_CO_UNCONNECTED;
  wire [7:0]NLW_dataOut_TVALID_INST_0_i_2_O_UNCONNECTED;
  wire [3:3]NLW_dataOut_TVALID_INST_0_i_3_CO_UNCONNECTED;
  wire [7:0]NLW_dataOut_TVALID_INST_0_i_3_O_UNCONNECTED;
  wire [7:3]NLW_dataOut_TVALID_INST_0_i_32_CO_UNCONNECTED;
  wire [7:7]NLW_dataOut_TVALID_INST_0_i_32_DI_UNCONNECTED;
  wire [7:7]NLW_dataOut_TVALID_INST_0_i_32_O_UNCONNECTED;
  wire [7:7]NLW_dataOut_TVALID_INST_0_i_32_S_UNCONNECTED;
  wire [3:3]NLW_dataOut_TVALID_INST_0_i_33_CO_UNCONNECTED;
  wire [3:3]NLW_dataOut_TVALID_INST_0_i_50_CO_UNCONNECTED;
  wire [3:3]NLW_dataOut_TVALID_INST_0_i_51_CO_UNCONNECTED;
  wire [3:3]NLW_dataOut_TVALID_INST_0_i_7_CO_UNCONNECTED;
  wire [7:0]NLW_dataOut_TVALID_INST_0_i_7_O_UNCONNECTED;
  wire [3:3]\NLW_data_count_reg[0]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_data_count_reg[16]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_data_count_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_data_count_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_init_data_reg[0]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_init_data_reg[16]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_init_data_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_init_data_reg[8]_i_1_CO_UNCONNECTED ;

  assign ap_done = ap_ready;
  assign dataOut_TDEST[5] = \<const0> ;
  assign dataOut_TDEST[4] = \<const0> ;
  assign dataOut_TDEST[3] = \<const0> ;
  assign dataOut_TDEST[2] = \<const0> ;
  assign dataOut_TDEST[1] = \<const0> ;
  assign dataOut_TDEST[0] = \<const0> ;
  assign dataOut_TID[4] = \<const0> ;
  assign dataOut_TID[3] = \<const0> ;
  assign dataOut_TID[2] = \<const0> ;
  assign dataOut_TID[1] = \<const0> ;
  assign dataOut_TID[0] = \<const0> ;
  assign dataOut_TKEEP[3] = \<const1> ;
  assign dataOut_TKEEP[2] = \<const1> ;
  assign dataOut_TKEEP[1] = \<const1> ;
  assign dataOut_TKEEP[0] = \<const1> ;
  assign dataOut_TSTRB[3] = \<const0> ;
  assign dataOut_TSTRB[2] = \<const0> ;
  assign dataOut_TSTRB[1] = \<const0> ;
  assign dataOut_TSTRB[0] = \<const0> ;
  assign dataOut_TUSER[1] = \<const0> ;
  assign dataOut_TUSER[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    ap_idle_INST_0
       (.I0(ap_start),
        .O(ap_idle));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    ap_ready_INST_0
       (.I0(tmp_1_fu_175_p2),
        .I1(p_0_in),
        .I2(dataOut_TREADY),
        .I3(ap_ready_INST_0_i_2_n_0),
        .I4(enable),
        .I5(ap_start),
        .O(ap_ready));
  CARRY8 ap_ready_INST_0_i_1
       (.CI(ap_ready_INST_0_i_3_n_0),
        .CI_TOP(1'b0),
        .CO({tmp_1_fu_175_p2,ap_ready_INST_0_i_1_n_1,ap_ready_INST_0_i_1_n_2,ap_ready_INST_0_i_1_n_3,NLW_ap_ready_INST_0_i_1_CO_UNCONNECTED[3],ap_ready_INST_0_i_1_n_5,ap_ready_INST_0_i_1_n_6,ap_ready_INST_0_i_1_n_7}),
        .DI({ap_ready_INST_0_i_4_n_0,ap_ready_INST_0_i_5_n_0,ap_ready_INST_0_i_6_n_0,ap_ready_INST_0_i_7_n_0,ap_ready_INST_0_i_8_n_0,ap_ready_INST_0_i_9_n_0,ap_ready_INST_0_i_10_n_0,ap_ready_INST_0_i_11_n_0}),
        .O(NLW_ap_ready_INST_0_i_1_O_UNCONNECTED[7:0]),
        .S({ap_ready_INST_0_i_12_n_0,ap_ready_INST_0_i_13_n_0,ap_ready_INST_0_i_14_n_0,ap_ready_INST_0_i_15_n_0,ap_ready_INST_0_i_16_n_0,ap_ready_INST_0_i_17_n_0,ap_ready_INST_0_i_18_n_0,ap_ready_INST_0_i_19_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_10
       (.I0(tmp_fu_169_p2[18]),
        .I1(data_count_reg[18]),
        .I2(data_count_reg[19]),
        .I3(tmp_fu_169_p2[19]),
        .O(ap_ready_INST_0_i_10_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_11
       (.I0(tmp_fu_169_p2[16]),
        .I1(data_count_reg[16]),
        .I2(data_count_reg[17]),
        .I3(tmp_fu_169_p2[17]),
        .O(ap_ready_INST_0_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_12
       (.I0(data_count_reg[31]),
        .I1(tmp_fu_169_p2[31]),
        .I2(tmp_fu_169_p2[30]),
        .I3(data_count_reg[30]),
        .O(ap_ready_INST_0_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_13
       (.I0(data_count_reg[29]),
        .I1(tmp_fu_169_p2[29]),
        .I2(tmp_fu_169_p2[28]),
        .I3(data_count_reg[28]),
        .O(ap_ready_INST_0_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_14
       (.I0(data_count_reg[27]),
        .I1(tmp_fu_169_p2[27]),
        .I2(tmp_fu_169_p2[26]),
        .I3(data_count_reg[26]),
        .O(ap_ready_INST_0_i_14_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_15
       (.I0(data_count_reg[25]),
        .I1(tmp_fu_169_p2[25]),
        .I2(tmp_fu_169_p2[24]),
        .I3(data_count_reg[24]),
        .O(ap_ready_INST_0_i_15_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_16
       (.I0(data_count_reg[23]),
        .I1(tmp_fu_169_p2[23]),
        .I2(tmp_fu_169_p2[22]),
        .I3(data_count_reg[22]),
        .O(ap_ready_INST_0_i_16_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_17
       (.I0(data_count_reg[21]),
        .I1(tmp_fu_169_p2[21]),
        .I2(tmp_fu_169_p2[20]),
        .I3(data_count_reg[20]),
        .O(ap_ready_INST_0_i_17_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_18
       (.I0(data_count_reg[19]),
        .I1(tmp_fu_169_p2[19]),
        .I2(tmp_fu_169_p2[18]),
        .I3(data_count_reg[18]),
        .O(ap_ready_INST_0_i_18_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_19
       (.I0(data_count_reg[17]),
        .I1(tmp_fu_169_p2[17]),
        .I2(tmp_fu_169_p2[16]),
        .I3(data_count_reg[16]),
        .O(ap_ready_INST_0_i_19_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    ap_ready_INST_0_i_2
       (.I0(tmp_5_fu_205_p2),
        .I1(tmp_3_fu_199_p2),
        .O(ap_ready_INST_0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_20
       (.I0(tmp_fu_169_p2[14]),
        .I1(data_count_reg[14]),
        .I2(data_count_reg[15]),
        .I3(tmp_fu_169_p2[15]),
        .O(ap_ready_INST_0_i_20_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_21
       (.I0(tmp_fu_169_p2[12]),
        .I1(data_count_reg[12]),
        .I2(data_count_reg[13]),
        .I3(tmp_fu_169_p2[13]),
        .O(ap_ready_INST_0_i_21_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_22
       (.I0(tmp_fu_169_p2[10]),
        .I1(data_count_reg[10]),
        .I2(data_count_reg[11]),
        .I3(tmp_fu_169_p2[11]),
        .O(ap_ready_INST_0_i_22_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_23
       (.I0(tmp_fu_169_p2[8]),
        .I1(data_count_reg[8]),
        .I2(data_count_reg[9]),
        .I3(tmp_fu_169_p2[9]),
        .O(ap_ready_INST_0_i_23_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_24
       (.I0(tmp_fu_169_p2[6]),
        .I1(data_count_reg[6]),
        .I2(data_count_reg[7]),
        .I3(tmp_fu_169_p2[7]),
        .O(ap_ready_INST_0_i_24_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_25
       (.I0(tmp_fu_169_p2[4]),
        .I1(data_count_reg[4]),
        .I2(data_count_reg[5]),
        .I3(tmp_fu_169_p2[5]),
        .O(ap_ready_INST_0_i_25_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_26
       (.I0(tmp_fu_169_p2[2]),
        .I1(data_count_reg[2]),
        .I2(data_count_reg[3]),
        .I3(tmp_fu_169_p2[3]),
        .O(ap_ready_INST_0_i_26_n_0));
  LUT4 #(
    .INIT(16'h1F01)) 
    ap_ready_INST_0_i_27
       (.I0(data_count_reg[0]),
        .I1(burst_period[0]),
        .I2(data_count_reg[1]),
        .I3(tmp_fu_169_p2[1]),
        .O(ap_ready_INST_0_i_27_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_28
       (.I0(data_count_reg[15]),
        .I1(tmp_fu_169_p2[15]),
        .I2(tmp_fu_169_p2[14]),
        .I3(data_count_reg[14]),
        .O(ap_ready_INST_0_i_28_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_29
       (.I0(data_count_reg[13]),
        .I1(tmp_fu_169_p2[13]),
        .I2(tmp_fu_169_p2[12]),
        .I3(data_count_reg[12]),
        .O(ap_ready_INST_0_i_29_n_0));
  CARRY8 ap_ready_INST_0_i_3
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({ap_ready_INST_0_i_3_n_0,ap_ready_INST_0_i_3_n_1,ap_ready_INST_0_i_3_n_2,ap_ready_INST_0_i_3_n_3,NLW_ap_ready_INST_0_i_3_CO_UNCONNECTED[3],ap_ready_INST_0_i_3_n_5,ap_ready_INST_0_i_3_n_6,ap_ready_INST_0_i_3_n_7}),
        .DI({ap_ready_INST_0_i_20_n_0,ap_ready_INST_0_i_21_n_0,ap_ready_INST_0_i_22_n_0,ap_ready_INST_0_i_23_n_0,ap_ready_INST_0_i_24_n_0,ap_ready_INST_0_i_25_n_0,ap_ready_INST_0_i_26_n_0,ap_ready_INST_0_i_27_n_0}),
        .O(NLW_ap_ready_INST_0_i_3_O_UNCONNECTED[7:0]),
        .S({ap_ready_INST_0_i_28_n_0,ap_ready_INST_0_i_29_n_0,ap_ready_INST_0_i_30_n_0,ap_ready_INST_0_i_31_n_0,ap_ready_INST_0_i_32_n_0,ap_ready_INST_0_i_33_n_0,ap_ready_INST_0_i_34_n_0,ap_ready_INST_0_i_35_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_30
       (.I0(data_count_reg[11]),
        .I1(tmp_fu_169_p2[11]),
        .I2(tmp_fu_169_p2[10]),
        .I3(data_count_reg[10]),
        .O(ap_ready_INST_0_i_30_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_31
       (.I0(data_count_reg[9]),
        .I1(tmp_fu_169_p2[9]),
        .I2(tmp_fu_169_p2[8]),
        .I3(data_count_reg[8]),
        .O(ap_ready_INST_0_i_31_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_32
       (.I0(data_count_reg[7]),
        .I1(tmp_fu_169_p2[7]),
        .I2(tmp_fu_169_p2[6]),
        .I3(data_count_reg[6]),
        .O(ap_ready_INST_0_i_32_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_33
       (.I0(data_count_reg[5]),
        .I1(tmp_fu_169_p2[5]),
        .I2(tmp_fu_169_p2[4]),
        .I3(data_count_reg[4]),
        .O(ap_ready_INST_0_i_33_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ap_ready_INST_0_i_34
       (.I0(data_count_reg[3]),
        .I1(tmp_fu_169_p2[3]),
        .I2(tmp_fu_169_p2[2]),
        .I3(data_count_reg[2]),
        .O(ap_ready_INST_0_i_34_n_0));
  LUT4 #(
    .INIT(16'h6006)) 
    ap_ready_INST_0_i_35
       (.I0(burst_period[0]),
        .I1(data_count_reg[0]),
        .I2(tmp_fu_169_p2[1]),
        .I3(data_count_reg[1]),
        .O(ap_ready_INST_0_i_35_n_0));
  CARRY8 ap_ready_INST_0_i_36
       (.CI(ap_ready_INST_0_i_37_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_ap_ready_INST_0_i_36_CO_UNCONNECTED[7:6],ap_ready_INST_0_i_36_n_2,ap_ready_INST_0_i_36_n_3,NLW_ap_ready_INST_0_i_36_CO_UNCONNECTED[3],ap_ready_INST_0_i_36_n_5,ap_ready_INST_0_i_36_n_6,ap_ready_INST_0_i_36_n_7}),
        .DI({NLW_ap_ready_INST_0_i_36_DI_UNCONNECTED[7],1'b0,burst_period[30:25]}),
        .O({NLW_ap_ready_INST_0_i_36_O_UNCONNECTED[7],tmp_fu_169_p2[31:25]}),
        .S({NLW_ap_ready_INST_0_i_36_S_UNCONNECTED[7],ap_ready_INST_0_i_40_n_0,ap_ready_INST_0_i_41_n_0,ap_ready_INST_0_i_42_n_0,ap_ready_INST_0_i_43_n_0,ap_ready_INST_0_i_44_n_0,ap_ready_INST_0_i_45_n_0,ap_ready_INST_0_i_46_n_0}));
  CARRY8 ap_ready_INST_0_i_37
       (.CI(ap_ready_INST_0_i_38_n_0),
        .CI_TOP(1'b0),
        .CO({ap_ready_INST_0_i_37_n_0,ap_ready_INST_0_i_37_n_1,ap_ready_INST_0_i_37_n_2,ap_ready_INST_0_i_37_n_3,NLW_ap_ready_INST_0_i_37_CO_UNCONNECTED[3],ap_ready_INST_0_i_37_n_5,ap_ready_INST_0_i_37_n_6,ap_ready_INST_0_i_37_n_7}),
        .DI(burst_period[24:17]),
        .O(tmp_fu_169_p2[24:17]),
        .S({ap_ready_INST_0_i_47_n_0,ap_ready_INST_0_i_48_n_0,ap_ready_INST_0_i_49_n_0,ap_ready_INST_0_i_50_n_0,ap_ready_INST_0_i_51_n_0,ap_ready_INST_0_i_52_n_0,ap_ready_INST_0_i_53_n_0,ap_ready_INST_0_i_54_n_0}));
  CARRY8 ap_ready_INST_0_i_38
       (.CI(ap_ready_INST_0_i_39_n_0),
        .CI_TOP(1'b0),
        .CO({ap_ready_INST_0_i_38_n_0,ap_ready_INST_0_i_38_n_1,ap_ready_INST_0_i_38_n_2,ap_ready_INST_0_i_38_n_3,NLW_ap_ready_INST_0_i_38_CO_UNCONNECTED[3],ap_ready_INST_0_i_38_n_5,ap_ready_INST_0_i_38_n_6,ap_ready_INST_0_i_38_n_7}),
        .DI(burst_period[16:9]),
        .O(tmp_fu_169_p2[16:9]),
        .S({ap_ready_INST_0_i_55_n_0,ap_ready_INST_0_i_56_n_0,ap_ready_INST_0_i_57_n_0,ap_ready_INST_0_i_58_n_0,ap_ready_INST_0_i_59_n_0,ap_ready_INST_0_i_60_n_0,ap_ready_INST_0_i_61_n_0,ap_ready_INST_0_i_62_n_0}));
  CARRY8 ap_ready_INST_0_i_39
       (.CI(burst_period[0]),
        .CI_TOP(1'b0),
        .CO({ap_ready_INST_0_i_39_n_0,ap_ready_INST_0_i_39_n_1,ap_ready_INST_0_i_39_n_2,ap_ready_INST_0_i_39_n_3,NLW_ap_ready_INST_0_i_39_CO_UNCONNECTED[3],ap_ready_INST_0_i_39_n_5,ap_ready_INST_0_i_39_n_6,ap_ready_INST_0_i_39_n_7}),
        .DI(burst_period[8:1]),
        .O(tmp_fu_169_p2[8:1]),
        .S({ap_ready_INST_0_i_63_n_0,ap_ready_INST_0_i_64_n_0,ap_ready_INST_0_i_65_n_0,ap_ready_INST_0_i_66_n_0,ap_ready_INST_0_i_67_n_0,ap_ready_INST_0_i_68_n_0,ap_ready_INST_0_i_69_n_0,ap_ready_INST_0_i_70_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_4
       (.I0(tmp_fu_169_p2[30]),
        .I1(data_count_reg[30]),
        .I2(data_count_reg[31]),
        .I3(tmp_fu_169_p2[31]),
        .O(ap_ready_INST_0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_40
       (.I0(burst_period[31]),
        .O(ap_ready_INST_0_i_40_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_41
       (.I0(burst_period[30]),
        .O(ap_ready_INST_0_i_41_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_42
       (.I0(burst_period[29]),
        .O(ap_ready_INST_0_i_42_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_43
       (.I0(burst_period[28]),
        .O(ap_ready_INST_0_i_43_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_44
       (.I0(burst_period[27]),
        .O(ap_ready_INST_0_i_44_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_45
       (.I0(burst_period[26]),
        .O(ap_ready_INST_0_i_45_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_46
       (.I0(burst_period[25]),
        .O(ap_ready_INST_0_i_46_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_47
       (.I0(burst_period[24]),
        .O(ap_ready_INST_0_i_47_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_48
       (.I0(burst_period[23]),
        .O(ap_ready_INST_0_i_48_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_49
       (.I0(burst_period[22]),
        .O(ap_ready_INST_0_i_49_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_5
       (.I0(tmp_fu_169_p2[28]),
        .I1(data_count_reg[28]),
        .I2(data_count_reg[29]),
        .I3(tmp_fu_169_p2[29]),
        .O(ap_ready_INST_0_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_50
       (.I0(burst_period[21]),
        .O(ap_ready_INST_0_i_50_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_51
       (.I0(burst_period[20]),
        .O(ap_ready_INST_0_i_51_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_52
       (.I0(burst_period[19]),
        .O(ap_ready_INST_0_i_52_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_53
       (.I0(burst_period[18]),
        .O(ap_ready_INST_0_i_53_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_54
       (.I0(burst_period[17]),
        .O(ap_ready_INST_0_i_54_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_55
       (.I0(burst_period[16]),
        .O(ap_ready_INST_0_i_55_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_56
       (.I0(burst_period[15]),
        .O(ap_ready_INST_0_i_56_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_57
       (.I0(burst_period[14]),
        .O(ap_ready_INST_0_i_57_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_58
       (.I0(burst_period[13]),
        .O(ap_ready_INST_0_i_58_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_59
       (.I0(burst_period[12]),
        .O(ap_ready_INST_0_i_59_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_6
       (.I0(tmp_fu_169_p2[26]),
        .I1(data_count_reg[26]),
        .I2(data_count_reg[27]),
        .I3(tmp_fu_169_p2[27]),
        .O(ap_ready_INST_0_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_60
       (.I0(burst_period[11]),
        .O(ap_ready_INST_0_i_60_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_61
       (.I0(burst_period[10]),
        .O(ap_ready_INST_0_i_61_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_62
       (.I0(burst_period[9]),
        .O(ap_ready_INST_0_i_62_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_63
       (.I0(burst_period[8]),
        .O(ap_ready_INST_0_i_63_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_64
       (.I0(burst_period[7]),
        .O(ap_ready_INST_0_i_64_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_65
       (.I0(burst_period[6]),
        .O(ap_ready_INST_0_i_65_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_66
       (.I0(burst_period[5]),
        .O(ap_ready_INST_0_i_66_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_67
       (.I0(burst_period[4]),
        .O(ap_ready_INST_0_i_67_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_68
       (.I0(burst_period[3]),
        .O(ap_ready_INST_0_i_68_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_69
       (.I0(burst_period[2]),
        .O(ap_ready_INST_0_i_69_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_7
       (.I0(tmp_fu_169_p2[24]),
        .I1(data_count_reg[24]),
        .I2(data_count_reg[25]),
        .I3(tmp_fu_169_p2[25]),
        .O(ap_ready_INST_0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_ready_INST_0_i_70
       (.I0(burst_period[1]),
        .O(ap_ready_INST_0_i_70_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_8
       (.I0(tmp_fu_169_p2[22]),
        .I1(data_count_reg[22]),
        .I2(data_count_reg[23]),
        .I3(tmp_fu_169_p2[23]),
        .O(ap_ready_INST_0_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    ap_ready_INST_0_i_9
       (.I0(tmp_fu_169_p2[20]),
        .I1(data_count_reg[20]),
        .I2(data_count_reg[21]),
        .I3(tmp_fu_169_p2[21]),
        .O(ap_ready_INST_0_i_9_n_0));
  LUT5 #(
    .INIT(32'hAA020000)) 
    ap_reg_ioackin_dataOut_TREADY_i_1
       (.I0(ap_rst_n),
        .I1(tmp_5_fu_205_p2),
        .I2(tmp_3_fu_199_p2),
        .I3(ap_reg_ioackin_dataOut_TREADY_i_2_n_0),
        .I4(p_0_in),
        .O(ap_reg_ioackin_dataOut_TREADY_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    ap_reg_ioackin_dataOut_TREADY_i_2
       (.I0(ap_start),
        .I1(enable),
        .I2(tmp_1_fu_175_p2),
        .O(ap_reg_ioackin_dataOut_TREADY_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    ap_reg_ioackin_dataOut_TREADY_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_reg_ioackin_dataOut_TREADY_i_1_n_0),
        .Q(p_0_in),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[0]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[0]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[0]),
        .I4(init_data_reg[0]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[0]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[10]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[10]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[10]),
        .I4(init_data_reg[10]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[10]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[11]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[11]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[11]),
        .I4(init_data_reg[11]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[11]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[12]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[12]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[12]),
        .I4(init_data_reg[12]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[12]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[13]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[13]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[13]),
        .I4(init_data_reg[13]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[13]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[14]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[14]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[14]),
        .I4(init_data_reg[14]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[14]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[15]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[15]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[15]),
        .I4(init_data_reg[15]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[15]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[16]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[16]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[16]),
        .I4(init_data_reg[16]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[16]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[17]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[17]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[17]),
        .I4(init_data_reg[17]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[17]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[18]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[18]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[18]),
        .I4(init_data_reg[18]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[18]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[19]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[19]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[19]),
        .I4(init_data_reg[19]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[19]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[1]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[1]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[1]),
        .I4(init_data_reg[1]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[1]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[20]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[20]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[20]),
        .I4(init_data_reg[20]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[20]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[21]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[21]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[21]),
        .I4(init_data_reg[21]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[21]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[22]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[22]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[22]),
        .I4(init_data_reg[22]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[22]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[23]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[23]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[23]),
        .I4(init_data_reg[23]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[23]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[24]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[24]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[24]),
        .I4(init_data_reg[24]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[24]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[25]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[25]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[25]),
        .I4(init_data_reg[25]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[25]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[26]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[26]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[26]),
        .I4(init_data_reg[26]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[26]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[27]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[27]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[27]),
        .I4(init_data_reg[27]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[27]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[28]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[28]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[28]),
        .I4(init_data_reg[28]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[28]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[29]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[29]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[29]),
        .I4(init_data_reg[29]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[29]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[2]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[2]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[2]),
        .I4(init_data_reg[2]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[2]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[30]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[30]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[30]),
        .I4(init_data_reg[30]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[30]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[31]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[31]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[31]),
        .I4(init_data_reg[31]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[31]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \dataOut_TDATA[31]_INST_0_i_1 
       (.I0(tmp_4_fu_211_p2),
        .I1(tmp_3_fu_199_p2),
        .I2(ap_start),
        .I3(enable),
        .I4(tmp_1_fu_175_p2),
        .O(\dataOut_TDATA[31]_INST_0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_10 
       (.I0(preamble_length[24]),
        .I1(data_count_reg[24]),
        .I2(data_count_reg[25]),
        .I3(preamble_length[25]),
        .O(\dataOut_TDATA[31]_INST_0_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_11 
       (.I0(preamble_length[22]),
        .I1(data_count_reg[22]),
        .I2(data_count_reg[23]),
        .I3(preamble_length[23]),
        .O(\dataOut_TDATA[31]_INST_0_i_11_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_12 
       (.I0(preamble_length[20]),
        .I1(data_count_reg[20]),
        .I2(data_count_reg[21]),
        .I3(preamble_length[21]),
        .O(\dataOut_TDATA[31]_INST_0_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_13 
       (.I0(preamble_length[18]),
        .I1(data_count_reg[18]),
        .I2(data_count_reg[19]),
        .I3(preamble_length[19]),
        .O(\dataOut_TDATA[31]_INST_0_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_14 
       (.I0(preamble_length[16]),
        .I1(data_count_reg[16]),
        .I2(data_count_reg[17]),
        .I3(preamble_length[17]),
        .O(\dataOut_TDATA[31]_INST_0_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_15 
       (.I0(preamble_length[31]),
        .I1(data_count_reg[31]),
        .I2(preamble_length[30]),
        .I3(data_count_reg[30]),
        .O(\dataOut_TDATA[31]_INST_0_i_15_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_16 
       (.I0(preamble_length[29]),
        .I1(data_count_reg[29]),
        .I2(preamble_length[28]),
        .I3(data_count_reg[28]),
        .O(\dataOut_TDATA[31]_INST_0_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_17 
       (.I0(data_count_reg[27]),
        .I1(preamble_length[27]),
        .I2(data_count_reg[26]),
        .I3(preamble_length[26]),
        .O(\dataOut_TDATA[31]_INST_0_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_18 
       (.I0(data_count_reg[25]),
        .I1(preamble_length[25]),
        .I2(data_count_reg[24]),
        .I3(preamble_length[24]),
        .O(\dataOut_TDATA[31]_INST_0_i_18_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_19 
       (.I0(preamble_length[23]),
        .I1(data_count_reg[23]),
        .I2(preamble_length[22]),
        .I3(data_count_reg[22]),
        .O(\dataOut_TDATA[31]_INST_0_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \dataOut_TDATA[31]_INST_0_i_2 
       (.I0(tmp_4_fu_211_p2),
        .I1(tmp_6_fu_217_p2),
        .I2(tmp_3_fu_199_p2),
        .I3(ap_start),
        .I4(enable),
        .I5(tmp_1_fu_175_p2),
        .O(\dataOut_TDATA[31]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_20 
       (.I0(data_count_reg[21]),
        .I1(preamble_length[21]),
        .I2(data_count_reg[20]),
        .I3(preamble_length[20]),
        .O(\dataOut_TDATA[31]_INST_0_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_21 
       (.I0(data_count_reg[19]),
        .I1(preamble_length[19]),
        .I2(data_count_reg[18]),
        .I3(preamble_length[18]),
        .O(\dataOut_TDATA[31]_INST_0_i_21_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_22 
       (.I0(preamble_length[17]),
        .I1(data_count_reg[17]),
        .I2(preamble_length[16]),
        .I3(data_count_reg[16]),
        .O(\dataOut_TDATA[31]_INST_0_i_22_n_0 ));
  CARRY8 \dataOut_TDATA[31]_INST_0_i_23 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\dataOut_TDATA[31]_INST_0_i_23_n_0 ,\dataOut_TDATA[31]_INST_0_i_23_n_1 ,\dataOut_TDATA[31]_INST_0_i_23_n_2 ,\dataOut_TDATA[31]_INST_0_i_23_n_3 ,\NLW_dataOut_TDATA[31]_INST_0_i_23_CO_UNCONNECTED [3],\dataOut_TDATA[31]_INST_0_i_23_n_5 ,\dataOut_TDATA[31]_INST_0_i_23_n_6 ,\dataOut_TDATA[31]_INST_0_i_23_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_dataOut_TDATA[31]_INST_0_i_23_O_UNCONNECTED [7:0]),
        .S({\dataOut_TDATA[31]_INST_0_i_43_n_0 ,\dataOut_TDATA[31]_INST_0_i_44_n_0 ,\dataOut_TDATA[31]_INST_0_i_45_n_0 ,\dataOut_TDATA[31]_INST_0_i_46_n_0 ,\dataOut_TDATA[31]_INST_0_i_47_n_0 ,\dataOut_TDATA[31]_INST_0_i_48_n_0 ,\dataOut_TDATA[31]_INST_0_i_49_n_0 ,\dataOut_TDATA[31]_INST_0_i_50_n_0 }));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_24 
       (.I0(preamble_length[31]),
        .I1(data_count_reg[31]),
        .I2(preamble_length[30]),
        .I3(data_count_reg[30]),
        .O(\dataOut_TDATA[31]_INST_0_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dataOut_TDATA[31]_INST_0_i_25 
       (.I0(data_count_reg[27]),
        .I1(preamble_length[27]),
        .I2(data_count_reg[28]),
        .I3(preamble_length[28]),
        .I4(data_count_reg[29]),
        .I5(preamble_length[29]),
        .O(\dataOut_TDATA[31]_INST_0_i_25_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dataOut_TDATA[31]_INST_0_i_26 
       (.I0(preamble_length[26]),
        .I1(data_count_reg[26]),
        .I2(preamble_length[24]),
        .I3(data_count_reg[24]),
        .I4(data_count_reg[25]),
        .I5(preamble_length[25]),
        .O(\dataOut_TDATA[31]_INST_0_i_26_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_27 
       (.I0(preamble_length[14]),
        .I1(data_count_reg[14]),
        .I2(data_count_reg[15]),
        .I3(preamble_length[15]),
        .O(\dataOut_TDATA[31]_INST_0_i_27_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_28 
       (.I0(preamble_length[12]),
        .I1(data_count_reg[12]),
        .I2(data_count_reg[13]),
        .I3(preamble_length[13]),
        .O(\dataOut_TDATA[31]_INST_0_i_28_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_29 
       (.I0(preamble_length[10]),
        .I1(data_count_reg[10]),
        .I2(data_count_reg[11]),
        .I3(preamble_length[11]),
        .O(\dataOut_TDATA[31]_INST_0_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h1FFFFFFFFFFFFFFF)) 
    \dataOut_TDATA[31]_INST_0_i_3 
       (.I0(tmp_6_fu_217_p2),
        .I1(tmp_4_fu_211_p2),
        .I2(tmp_3_fu_199_p2),
        .I3(ap_start),
        .I4(enable),
        .I5(tmp_1_fu_175_p2),
        .O(\dataOut_TDATA[31]_INST_0_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_30 
       (.I0(preamble_length[8]),
        .I1(data_count_reg[8]),
        .I2(data_count_reg[9]),
        .I3(preamble_length[9]),
        .O(\dataOut_TDATA[31]_INST_0_i_30_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_31 
       (.I0(preamble_length[6]),
        .I1(data_count_reg[6]),
        .I2(data_count_reg[7]),
        .I3(preamble_length[7]),
        .O(\dataOut_TDATA[31]_INST_0_i_31_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_32 
       (.I0(preamble_length[4]),
        .I1(data_count_reg[4]),
        .I2(data_count_reg[5]),
        .I3(preamble_length[5]),
        .O(\dataOut_TDATA[31]_INST_0_i_32_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_33 
       (.I0(preamble_length[2]),
        .I1(data_count_reg[2]),
        .I2(data_count_reg[3]),
        .I3(preamble_length[3]),
        .O(\dataOut_TDATA[31]_INST_0_i_33_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_34 
       (.I0(preamble_length[0]),
        .I1(data_count_reg[0]),
        .I2(data_count_reg[1]),
        .I3(preamble_length[1]),
        .O(\dataOut_TDATA[31]_INST_0_i_34_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_35 
       (.I0(data_count_reg[15]),
        .I1(preamble_length[15]),
        .I2(data_count_reg[14]),
        .I3(preamble_length[14]),
        .O(\dataOut_TDATA[31]_INST_0_i_35_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_36 
       (.I0(data_count_reg[13]),
        .I1(preamble_length[13]),
        .I2(data_count_reg[12]),
        .I3(preamble_length[12]),
        .O(\dataOut_TDATA[31]_INST_0_i_36_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_37 
       (.I0(preamble_length[11]),
        .I1(data_count_reg[11]),
        .I2(preamble_length[10]),
        .I3(data_count_reg[10]),
        .O(\dataOut_TDATA[31]_INST_0_i_37_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_38 
       (.I0(data_count_reg[9]),
        .I1(preamble_length[9]),
        .I2(data_count_reg[8]),
        .I3(preamble_length[8]),
        .O(\dataOut_TDATA[31]_INST_0_i_38_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_39 
       (.I0(data_count_reg[7]),
        .I1(preamble_length[7]),
        .I2(data_count_reg[6]),
        .I3(preamble_length[6]),
        .O(\dataOut_TDATA[31]_INST_0_i_39_n_0 ));
  CARRY8 \dataOut_TDATA[31]_INST_0_i_4 
       (.CI(\dataOut_TDATA[31]_INST_0_i_6_n_0 ),
        .CI_TOP(1'b0),
        .CO({tmp_4_fu_211_p2,\dataOut_TDATA[31]_INST_0_i_4_n_1 ,\dataOut_TDATA[31]_INST_0_i_4_n_2 ,\dataOut_TDATA[31]_INST_0_i_4_n_3 ,\NLW_dataOut_TDATA[31]_INST_0_i_4_CO_UNCONNECTED [3],\dataOut_TDATA[31]_INST_0_i_4_n_5 ,\dataOut_TDATA[31]_INST_0_i_4_n_6 ,\dataOut_TDATA[31]_INST_0_i_4_n_7 }),
        .DI({\dataOut_TDATA[31]_INST_0_i_7_n_0 ,\dataOut_TDATA[31]_INST_0_i_8_n_0 ,\dataOut_TDATA[31]_INST_0_i_9_n_0 ,\dataOut_TDATA[31]_INST_0_i_10_n_0 ,\dataOut_TDATA[31]_INST_0_i_11_n_0 ,\dataOut_TDATA[31]_INST_0_i_12_n_0 ,\dataOut_TDATA[31]_INST_0_i_13_n_0 ,\dataOut_TDATA[31]_INST_0_i_14_n_0 }),
        .O(\NLW_dataOut_TDATA[31]_INST_0_i_4_O_UNCONNECTED [7:0]),
        .S({\dataOut_TDATA[31]_INST_0_i_15_n_0 ,\dataOut_TDATA[31]_INST_0_i_16_n_0 ,\dataOut_TDATA[31]_INST_0_i_17_n_0 ,\dataOut_TDATA[31]_INST_0_i_18_n_0 ,\dataOut_TDATA[31]_INST_0_i_19_n_0 ,\dataOut_TDATA[31]_INST_0_i_20_n_0 ,\dataOut_TDATA[31]_INST_0_i_21_n_0 ,\dataOut_TDATA[31]_INST_0_i_22_n_0 }));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_40 
       (.I0(preamble_length[5]),
        .I1(data_count_reg[5]),
        .I2(preamble_length[4]),
        .I3(data_count_reg[4]),
        .O(\dataOut_TDATA[31]_INST_0_i_40_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_41 
       (.I0(data_count_reg[3]),
        .I1(preamble_length[3]),
        .I2(data_count_reg[2]),
        .I3(preamble_length[2]),
        .O(\dataOut_TDATA[31]_INST_0_i_41_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \dataOut_TDATA[31]_INST_0_i_42 
       (.I0(data_count_reg[1]),
        .I1(preamble_length[1]),
        .I2(data_count_reg[0]),
        .I3(preamble_length[0]),
        .O(\dataOut_TDATA[31]_INST_0_i_42_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dataOut_TDATA[31]_INST_0_i_43 
       (.I0(data_count_reg[21]),
        .I1(preamble_length[21]),
        .I2(data_count_reg[22]),
        .I3(preamble_length[22]),
        .I4(data_count_reg[23]),
        .I5(preamble_length[23]),
        .O(\dataOut_TDATA[31]_INST_0_i_43_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dataOut_TDATA[31]_INST_0_i_44 
       (.I0(preamble_length[20]),
        .I1(data_count_reg[20]),
        .I2(preamble_length[18]),
        .I3(data_count_reg[18]),
        .I4(data_count_reg[19]),
        .I5(preamble_length[19]),
        .O(\dataOut_TDATA[31]_INST_0_i_44_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dataOut_TDATA[31]_INST_0_i_45 
       (.I0(data_count_reg[15]),
        .I1(preamble_length[15]),
        .I2(data_count_reg[16]),
        .I3(preamble_length[16]),
        .I4(data_count_reg[17]),
        .I5(preamble_length[17]),
        .O(\dataOut_TDATA[31]_INST_0_i_45_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dataOut_TDATA[31]_INST_0_i_46 
       (.I0(preamble_length[14]),
        .I1(data_count_reg[14]),
        .I2(preamble_length[12]),
        .I3(data_count_reg[12]),
        .I4(data_count_reg[13]),
        .I5(preamble_length[13]),
        .O(\dataOut_TDATA[31]_INST_0_i_46_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dataOut_TDATA[31]_INST_0_i_47 
       (.I0(data_count_reg[9]),
        .I1(preamble_length[9]),
        .I2(data_count_reg[10]),
        .I3(preamble_length[10]),
        .I4(data_count_reg[11]),
        .I5(preamble_length[11]),
        .O(\dataOut_TDATA[31]_INST_0_i_47_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dataOut_TDATA[31]_INST_0_i_48 
       (.I0(preamble_length[8]),
        .I1(data_count_reg[8]),
        .I2(preamble_length[6]),
        .I3(data_count_reg[6]),
        .I4(data_count_reg[7]),
        .I5(preamble_length[7]),
        .O(\dataOut_TDATA[31]_INST_0_i_48_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dataOut_TDATA[31]_INST_0_i_49 
       (.I0(data_count_reg[3]),
        .I1(preamble_length[3]),
        .I2(data_count_reg[4]),
        .I3(preamble_length[4]),
        .I4(data_count_reg[5]),
        .I5(preamble_length[5]),
        .O(\dataOut_TDATA[31]_INST_0_i_49_n_0 ));
  CARRY8 \dataOut_TDATA[31]_INST_0_i_5 
       (.CI(\dataOut_TDATA[31]_INST_0_i_23_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_dataOut_TDATA[31]_INST_0_i_5_CO_UNCONNECTED [7:3],tmp_6_fu_217_p2,\dataOut_TDATA[31]_INST_0_i_5_n_6 ,\dataOut_TDATA[31]_INST_0_i_5_n_7 }),
        .DI({\NLW_dataOut_TDATA[31]_INST_0_i_5_DI_UNCONNECTED [7:3],1'b0,1'b0,1'b0}),
        .O(\NLW_dataOut_TDATA[31]_INST_0_i_5_O_UNCONNECTED [7:0]),
        .S({\NLW_dataOut_TDATA[31]_INST_0_i_5_S_UNCONNECTED [7:3],\dataOut_TDATA[31]_INST_0_i_24_n_0 ,\dataOut_TDATA[31]_INST_0_i_25_n_0 ,\dataOut_TDATA[31]_INST_0_i_26_n_0 }));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \dataOut_TDATA[31]_INST_0_i_50 
       (.I0(preamble_length[2]),
        .I1(data_count_reg[2]),
        .I2(preamble_length[0]),
        .I3(data_count_reg[0]),
        .I4(data_count_reg[1]),
        .I5(preamble_length[1]),
        .O(\dataOut_TDATA[31]_INST_0_i_50_n_0 ));
  CARRY8 \dataOut_TDATA[31]_INST_0_i_6 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\dataOut_TDATA[31]_INST_0_i_6_n_0 ,\dataOut_TDATA[31]_INST_0_i_6_n_1 ,\dataOut_TDATA[31]_INST_0_i_6_n_2 ,\dataOut_TDATA[31]_INST_0_i_6_n_3 ,\NLW_dataOut_TDATA[31]_INST_0_i_6_CO_UNCONNECTED [3],\dataOut_TDATA[31]_INST_0_i_6_n_5 ,\dataOut_TDATA[31]_INST_0_i_6_n_6 ,\dataOut_TDATA[31]_INST_0_i_6_n_7 }),
        .DI({\dataOut_TDATA[31]_INST_0_i_27_n_0 ,\dataOut_TDATA[31]_INST_0_i_28_n_0 ,\dataOut_TDATA[31]_INST_0_i_29_n_0 ,\dataOut_TDATA[31]_INST_0_i_30_n_0 ,\dataOut_TDATA[31]_INST_0_i_31_n_0 ,\dataOut_TDATA[31]_INST_0_i_32_n_0 ,\dataOut_TDATA[31]_INST_0_i_33_n_0 ,\dataOut_TDATA[31]_INST_0_i_34_n_0 }),
        .O(\NLW_dataOut_TDATA[31]_INST_0_i_6_O_UNCONNECTED [7:0]),
        .S({\dataOut_TDATA[31]_INST_0_i_35_n_0 ,\dataOut_TDATA[31]_INST_0_i_36_n_0 ,\dataOut_TDATA[31]_INST_0_i_37_n_0 ,\dataOut_TDATA[31]_INST_0_i_38_n_0 ,\dataOut_TDATA[31]_INST_0_i_39_n_0 ,\dataOut_TDATA[31]_INST_0_i_40_n_0 ,\dataOut_TDATA[31]_INST_0_i_41_n_0 ,\dataOut_TDATA[31]_INST_0_i_42_n_0 }));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_7 
       (.I0(preamble_length[30]),
        .I1(data_count_reg[30]),
        .I2(data_count_reg[31]),
        .I3(preamble_length[31]),
        .O(\dataOut_TDATA[31]_INST_0_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_8 
       (.I0(preamble_length[28]),
        .I1(data_count_reg[28]),
        .I2(data_count_reg[29]),
        .I3(preamble_length[29]),
        .O(\dataOut_TDATA[31]_INST_0_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h2F02)) 
    \dataOut_TDATA[31]_INST_0_i_9 
       (.I0(preamble_length[26]),
        .I1(data_count_reg[26]),
        .I2(data_count_reg[27]),
        .I3(preamble_length[27]),
        .O(\dataOut_TDATA[31]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[3]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[3]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[3]),
        .I4(init_data_reg[3]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[3]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[4]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[4]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[4]),
        .I4(init_data_reg[4]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[4]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[5]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[5]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[5]),
        .I4(init_data_reg[5]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[5]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[6]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[6]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[6]),
        .I4(init_data_reg[6]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[6]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[7]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[7]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[7]),
        .I4(init_data_reg[7]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \dataOut_TDATA[8]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[8]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[8]),
        .I4(init_data_reg[8]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[8]));
  LUT6 #(
    .INIT(64'hF888FFFFF888F888)) 
    \dataOut_TDATA[9]_INST_0 
       (.I0(\dataOut_TDATA[31]_INST_0_i_1_n_0 ),
        .I1(preamble[9]),
        .I2(\dataOut_TDATA[31]_INST_0_i_2_n_0 ),
        .I3(delimiter[9]),
        .I4(init_data_reg[9]),
        .I5(\dataOut_TDATA[31]_INST_0_i_3_n_0 ),
        .O(dataOut_TDATA[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \dataOut_TLAST[0]_INST_0 
       (.I0(tmp_3_fu_199_p2),
        .I1(tmp_5_fu_205_p2),
        .I2(tmp_1_fu_175_p2),
        .I3(enable),
        .I4(ap_start),
        .O(dataOut_TLAST));
  LUT6 #(
    .INIT(64'h5400000000000000)) 
    dataOut_TVALID_INST_0
       (.I0(p_0_in),
        .I1(tmp_5_fu_205_p2),
        .I2(tmp_3_fu_199_p2),
        .I3(tmp_1_fu_175_p2),
        .I4(enable),
        .I5(ap_start),
        .O(dataOut_TVALID));
  CARRY8 dataOut_TVALID_INST_0_i_1
       (.CI(dataOut_TVALID_INST_0_i_3_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_dataOut_TVALID_INST_0_i_1_CO_UNCONNECTED[7:3],tmp_5_fu_205_p2,dataOut_TVALID_INST_0_i_1_n_6,dataOut_TVALID_INST_0_i_1_n_7}),
        .DI({NLW_dataOut_TVALID_INST_0_i_1_DI_UNCONNECTED[7:3],1'b0,1'b0,1'b0}),
        .O(NLW_dataOut_TVALID_INST_0_i_1_O_UNCONNECTED[7:0]),
        .S({NLW_dataOut_TVALID_INST_0_i_1_S_UNCONNECTED[7:3],dataOut_TVALID_INST_0_i_4_n_0,dataOut_TVALID_INST_0_i_5_n_0,dataOut_TVALID_INST_0_i_6_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_10
       (.I0(tmp_2_fu_193_p2[26]),
        .I1(data_count_reg[26]),
        .I2(data_count_reg[27]),
        .I3(tmp_2_fu_193_p2[27]),
        .O(dataOut_TVALID_INST_0_i_10_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_11
       (.I0(tmp_2_fu_193_p2[24]),
        .I1(data_count_reg[24]),
        .I2(data_count_reg[25]),
        .I3(tmp_2_fu_193_p2[25]),
        .O(dataOut_TVALID_INST_0_i_11_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_12
       (.I0(tmp_2_fu_193_p2[22]),
        .I1(data_count_reg[22]),
        .I2(data_count_reg[23]),
        .I3(tmp_2_fu_193_p2[23]),
        .O(dataOut_TVALID_INST_0_i_12_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_13
       (.I0(tmp_2_fu_193_p2[20]),
        .I1(data_count_reg[20]),
        .I2(data_count_reg[21]),
        .I3(tmp_2_fu_193_p2[21]),
        .O(dataOut_TVALID_INST_0_i_13_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_14
       (.I0(tmp_2_fu_193_p2[18]),
        .I1(data_count_reg[18]),
        .I2(data_count_reg[19]),
        .I3(tmp_2_fu_193_p2[19]),
        .O(dataOut_TVALID_INST_0_i_14_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_15
       (.I0(tmp_2_fu_193_p2[16]),
        .I1(data_count_reg[16]),
        .I2(data_count_reg[17]),
        .I3(tmp_2_fu_193_p2[17]),
        .O(dataOut_TVALID_INST_0_i_15_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_16
       (.I0(tmp_2_fu_193_p2[31]),
        .I1(data_count_reg[31]),
        .I2(tmp_2_fu_193_p2[30]),
        .I3(data_count_reg[30]),
        .O(dataOut_TVALID_INST_0_i_16_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_17
       (.I0(data_count_reg[29]),
        .I1(tmp_2_fu_193_p2[29]),
        .I2(data_count_reg[28]),
        .I3(tmp_2_fu_193_p2[28]),
        .O(dataOut_TVALID_INST_0_i_17_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_18
       (.I0(data_count_reg[26]),
        .I1(tmp_2_fu_193_p2[26]),
        .I2(data_count_reg[27]),
        .I3(tmp_2_fu_193_p2[27]),
        .O(dataOut_TVALID_INST_0_i_18_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_19
       (.I0(tmp_2_fu_193_p2[25]),
        .I1(data_count_reg[25]),
        .I2(tmp_2_fu_193_p2[24]),
        .I3(data_count_reg[24]),
        .O(dataOut_TVALID_INST_0_i_19_n_0));
  CARRY8 dataOut_TVALID_INST_0_i_2
       (.CI(dataOut_TVALID_INST_0_i_7_n_0),
        .CI_TOP(1'b0),
        .CO({tmp_3_fu_199_p2,dataOut_TVALID_INST_0_i_2_n_1,dataOut_TVALID_INST_0_i_2_n_2,dataOut_TVALID_INST_0_i_2_n_3,NLW_dataOut_TVALID_INST_0_i_2_CO_UNCONNECTED[3],dataOut_TVALID_INST_0_i_2_n_5,dataOut_TVALID_INST_0_i_2_n_6,dataOut_TVALID_INST_0_i_2_n_7}),
        .DI({dataOut_TVALID_INST_0_i_8_n_0,dataOut_TVALID_INST_0_i_9_n_0,dataOut_TVALID_INST_0_i_10_n_0,dataOut_TVALID_INST_0_i_11_n_0,dataOut_TVALID_INST_0_i_12_n_0,dataOut_TVALID_INST_0_i_13_n_0,dataOut_TVALID_INST_0_i_14_n_0,dataOut_TVALID_INST_0_i_15_n_0}),
        .O(NLW_dataOut_TVALID_INST_0_i_2_O_UNCONNECTED[7:0]),
        .S({dataOut_TVALID_INST_0_i_16_n_0,dataOut_TVALID_INST_0_i_17_n_0,dataOut_TVALID_INST_0_i_18_n_0,dataOut_TVALID_INST_0_i_19_n_0,dataOut_TVALID_INST_0_i_20_n_0,dataOut_TVALID_INST_0_i_21_n_0,dataOut_TVALID_INST_0_i_22_n_0,dataOut_TVALID_INST_0_i_23_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_20
       (.I0(data_count_reg[23]),
        .I1(tmp_2_fu_193_p2[23]),
        .I2(data_count_reg[22]),
        .I3(tmp_2_fu_193_p2[22]),
        .O(dataOut_TVALID_INST_0_i_20_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_21
       (.I0(data_count_reg[20]),
        .I1(tmp_2_fu_193_p2[20]),
        .I2(data_count_reg[21]),
        .I3(tmp_2_fu_193_p2[21]),
        .O(dataOut_TVALID_INST_0_i_21_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_22
       (.I0(tmp_2_fu_193_p2[19]),
        .I1(data_count_reg[19]),
        .I2(tmp_2_fu_193_p2[18]),
        .I3(data_count_reg[18]),
        .O(dataOut_TVALID_INST_0_i_22_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_23
       (.I0(data_count_reg[17]),
        .I1(tmp_2_fu_193_p2[17]),
        .I2(data_count_reg[16]),
        .I3(tmp_2_fu_193_p2[16]),
        .O(dataOut_TVALID_INST_0_i_23_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    dataOut_TVALID_INST_0_i_24
       (.I0(tmp_2_fu_193_p2[22]),
        .I1(data_count_reg[22]),
        .I2(tmp_2_fu_193_p2[23]),
        .I3(data_count_reg[23]),
        .I4(data_count_reg[21]),
        .I5(tmp_2_fu_193_p2[21]),
        .O(dataOut_TVALID_INST_0_i_24_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    dataOut_TVALID_INST_0_i_25
       (.I0(data_count_reg[20]),
        .I1(tmp_2_fu_193_p2[20]),
        .I2(data_count_reg[18]),
        .I3(tmp_2_fu_193_p2[18]),
        .I4(data_count_reg[19]),
        .I5(tmp_2_fu_193_p2[19]),
        .O(dataOut_TVALID_INST_0_i_25_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    dataOut_TVALID_INST_0_i_26
       (.I0(tmp_2_fu_193_p2[15]),
        .I1(data_count_reg[15]),
        .I2(tmp_2_fu_193_p2[16]),
        .I3(data_count_reg[16]),
        .I4(data_count_reg[17]),
        .I5(tmp_2_fu_193_p2[17]),
        .O(dataOut_TVALID_INST_0_i_26_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    dataOut_TVALID_INST_0_i_27
       (.I0(data_count_reg[14]),
        .I1(tmp_2_fu_193_p2[14]),
        .I2(data_count_reg[12]),
        .I3(tmp_2_fu_193_p2[12]),
        .I4(data_count_reg[13]),
        .I5(tmp_2_fu_193_p2[13]),
        .O(dataOut_TVALID_INST_0_i_27_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    dataOut_TVALID_INST_0_i_28
       (.I0(tmp_2_fu_193_p2[10]),
        .I1(data_count_reg[10]),
        .I2(tmp_2_fu_193_p2[11]),
        .I3(data_count_reg[11]),
        .I4(data_count_reg[9]),
        .I5(tmp_2_fu_193_p2[9]),
        .O(dataOut_TVALID_INST_0_i_28_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    dataOut_TVALID_INST_0_i_29
       (.I0(data_count_reg[8]),
        .I1(tmp_2_fu_193_p2[8]),
        .I2(data_count_reg[6]),
        .I3(tmp_2_fu_193_p2[6]),
        .I4(data_count_reg[7]),
        .I5(tmp_2_fu_193_p2[7]),
        .O(dataOut_TVALID_INST_0_i_29_n_0));
  CARRY8 dataOut_TVALID_INST_0_i_3
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({dataOut_TVALID_INST_0_i_3_n_0,dataOut_TVALID_INST_0_i_3_n_1,dataOut_TVALID_INST_0_i_3_n_2,dataOut_TVALID_INST_0_i_3_n_3,NLW_dataOut_TVALID_INST_0_i_3_CO_UNCONNECTED[3],dataOut_TVALID_INST_0_i_3_n_5,dataOut_TVALID_INST_0_i_3_n_6,dataOut_TVALID_INST_0_i_3_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_dataOut_TVALID_INST_0_i_3_O_UNCONNECTED[7:0]),
        .S({dataOut_TVALID_INST_0_i_24_n_0,dataOut_TVALID_INST_0_i_25_n_0,dataOut_TVALID_INST_0_i_26_n_0,dataOut_TVALID_INST_0_i_27_n_0,dataOut_TVALID_INST_0_i_28_n_0,dataOut_TVALID_INST_0_i_29_n_0,dataOut_TVALID_INST_0_i_30_n_0,dataOut_TVALID_INST_0_i_31_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    dataOut_TVALID_INST_0_i_30
       (.I0(tmp_2_fu_193_p2[4]),
        .I1(data_count_reg[4]),
        .I2(tmp_2_fu_193_p2[5]),
        .I3(data_count_reg[5]),
        .I4(data_count_reg[3]),
        .I5(tmp_2_fu_193_p2[3]),
        .O(dataOut_TVALID_INST_0_i_30_n_0));
  LUT6 #(
    .INIT(64'h0000900990090000)) 
    dataOut_TVALID_INST_0_i_31
       (.I0(data_count_reg[2]),
        .I1(tmp_2_fu_193_p2[2]),
        .I2(data_count_reg[1]),
        .I3(tmp_2_fu_193_p2[1]),
        .I4(data_count_reg[0]),
        .I5(burst_length[0]),
        .O(dataOut_TVALID_INST_0_i_31_n_0));
  CARRY8 dataOut_TVALID_INST_0_i_32
       (.CI(dataOut_TVALID_INST_0_i_33_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_dataOut_TVALID_INST_0_i_32_CO_UNCONNECTED[7:6],dataOut_TVALID_INST_0_i_32_n_2,dataOut_TVALID_INST_0_i_32_n_3,NLW_dataOut_TVALID_INST_0_i_32_CO_UNCONNECTED[3],dataOut_TVALID_INST_0_i_32_n_5,dataOut_TVALID_INST_0_i_32_n_6,dataOut_TVALID_INST_0_i_32_n_7}),
        .DI({NLW_dataOut_TVALID_INST_0_i_32_DI_UNCONNECTED[7],1'b0,burst_length[30:25]}),
        .O({NLW_dataOut_TVALID_INST_0_i_32_O_UNCONNECTED[7],tmp_2_fu_193_p2[31:25]}),
        .S({NLW_dataOut_TVALID_INST_0_i_32_S_UNCONNECTED[7],dataOut_TVALID_INST_0_i_52_n_0,dataOut_TVALID_INST_0_i_53_n_0,dataOut_TVALID_INST_0_i_54_n_0,dataOut_TVALID_INST_0_i_55_n_0,dataOut_TVALID_INST_0_i_56_n_0,dataOut_TVALID_INST_0_i_57_n_0,dataOut_TVALID_INST_0_i_58_n_0}));
  CARRY8 dataOut_TVALID_INST_0_i_33
       (.CI(dataOut_TVALID_INST_0_i_50_n_0),
        .CI_TOP(1'b0),
        .CO({dataOut_TVALID_INST_0_i_33_n_0,dataOut_TVALID_INST_0_i_33_n_1,dataOut_TVALID_INST_0_i_33_n_2,dataOut_TVALID_INST_0_i_33_n_3,NLW_dataOut_TVALID_INST_0_i_33_CO_UNCONNECTED[3],dataOut_TVALID_INST_0_i_33_n_5,dataOut_TVALID_INST_0_i_33_n_6,dataOut_TVALID_INST_0_i_33_n_7}),
        .DI(burst_length[24:17]),
        .O(tmp_2_fu_193_p2[24:17]),
        .S({dataOut_TVALID_INST_0_i_59_n_0,dataOut_TVALID_INST_0_i_60_n_0,dataOut_TVALID_INST_0_i_61_n_0,dataOut_TVALID_INST_0_i_62_n_0,dataOut_TVALID_INST_0_i_63_n_0,dataOut_TVALID_INST_0_i_64_n_0,dataOut_TVALID_INST_0_i_65_n_0,dataOut_TVALID_INST_0_i_66_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_34
       (.I0(tmp_2_fu_193_p2[14]),
        .I1(data_count_reg[14]),
        .I2(data_count_reg[15]),
        .I3(tmp_2_fu_193_p2[15]),
        .O(dataOut_TVALID_INST_0_i_34_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_35
       (.I0(tmp_2_fu_193_p2[12]),
        .I1(data_count_reg[12]),
        .I2(data_count_reg[13]),
        .I3(tmp_2_fu_193_p2[13]),
        .O(dataOut_TVALID_INST_0_i_35_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_36
       (.I0(tmp_2_fu_193_p2[10]),
        .I1(data_count_reg[10]),
        .I2(data_count_reg[11]),
        .I3(tmp_2_fu_193_p2[11]),
        .O(dataOut_TVALID_INST_0_i_36_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_37
       (.I0(tmp_2_fu_193_p2[8]),
        .I1(data_count_reg[8]),
        .I2(data_count_reg[9]),
        .I3(tmp_2_fu_193_p2[9]),
        .O(dataOut_TVALID_INST_0_i_37_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_38
       (.I0(tmp_2_fu_193_p2[6]),
        .I1(data_count_reg[6]),
        .I2(data_count_reg[7]),
        .I3(tmp_2_fu_193_p2[7]),
        .O(dataOut_TVALID_INST_0_i_38_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_39
       (.I0(tmp_2_fu_193_p2[4]),
        .I1(data_count_reg[4]),
        .I2(data_count_reg[5]),
        .I3(tmp_2_fu_193_p2[5]),
        .O(dataOut_TVALID_INST_0_i_39_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_4
       (.I0(tmp_2_fu_193_p2[31]),
        .I1(data_count_reg[31]),
        .I2(tmp_2_fu_193_p2[30]),
        .I3(data_count_reg[30]),
        .O(dataOut_TVALID_INST_0_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_40
       (.I0(tmp_2_fu_193_p2[2]),
        .I1(data_count_reg[2]),
        .I2(data_count_reg[3]),
        .I3(tmp_2_fu_193_p2[3]),
        .O(dataOut_TVALID_INST_0_i_40_n_0));
  LUT4 #(
    .INIT(16'h1F01)) 
    dataOut_TVALID_INST_0_i_41
       (.I0(burst_length[0]),
        .I1(data_count_reg[0]),
        .I2(data_count_reg[1]),
        .I3(tmp_2_fu_193_p2[1]),
        .O(dataOut_TVALID_INST_0_i_41_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_42
       (.I0(data_count_reg[14]),
        .I1(tmp_2_fu_193_p2[14]),
        .I2(data_count_reg[15]),
        .I3(tmp_2_fu_193_p2[15]),
        .O(dataOut_TVALID_INST_0_i_42_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_43
       (.I0(tmp_2_fu_193_p2[13]),
        .I1(data_count_reg[13]),
        .I2(tmp_2_fu_193_p2[12]),
        .I3(data_count_reg[12]),
        .O(dataOut_TVALID_INST_0_i_43_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_44
       (.I0(data_count_reg[11]),
        .I1(tmp_2_fu_193_p2[11]),
        .I2(data_count_reg[10]),
        .I3(tmp_2_fu_193_p2[10]),
        .O(dataOut_TVALID_INST_0_i_44_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_45
       (.I0(data_count_reg[8]),
        .I1(tmp_2_fu_193_p2[8]),
        .I2(data_count_reg[9]),
        .I3(tmp_2_fu_193_p2[9]),
        .O(dataOut_TVALID_INST_0_i_45_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_46
       (.I0(tmp_2_fu_193_p2[7]),
        .I1(data_count_reg[7]),
        .I2(tmp_2_fu_193_p2[6]),
        .I3(data_count_reg[6]),
        .O(dataOut_TVALID_INST_0_i_46_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_47
       (.I0(data_count_reg[5]),
        .I1(tmp_2_fu_193_p2[5]),
        .I2(data_count_reg[4]),
        .I3(tmp_2_fu_193_p2[4]),
        .O(dataOut_TVALID_INST_0_i_47_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    dataOut_TVALID_INST_0_i_48
       (.I0(data_count_reg[2]),
        .I1(tmp_2_fu_193_p2[2]),
        .I2(data_count_reg[3]),
        .I3(tmp_2_fu_193_p2[3]),
        .O(dataOut_TVALID_INST_0_i_48_n_0));
  LUT4 #(
    .INIT(16'h6006)) 
    dataOut_TVALID_INST_0_i_49
       (.I0(burst_length[0]),
        .I1(data_count_reg[0]),
        .I2(tmp_2_fu_193_p2[1]),
        .I3(data_count_reg[1]),
        .O(dataOut_TVALID_INST_0_i_49_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    dataOut_TVALID_INST_0_i_5
       (.I0(tmp_2_fu_193_p2[28]),
        .I1(data_count_reg[28]),
        .I2(tmp_2_fu_193_p2[29]),
        .I3(data_count_reg[29]),
        .I4(data_count_reg[27]),
        .I5(tmp_2_fu_193_p2[27]),
        .O(dataOut_TVALID_INST_0_i_5_n_0));
  CARRY8 dataOut_TVALID_INST_0_i_50
       (.CI(dataOut_TVALID_INST_0_i_51_n_0),
        .CI_TOP(1'b0),
        .CO({dataOut_TVALID_INST_0_i_50_n_0,dataOut_TVALID_INST_0_i_50_n_1,dataOut_TVALID_INST_0_i_50_n_2,dataOut_TVALID_INST_0_i_50_n_3,NLW_dataOut_TVALID_INST_0_i_50_CO_UNCONNECTED[3],dataOut_TVALID_INST_0_i_50_n_5,dataOut_TVALID_INST_0_i_50_n_6,dataOut_TVALID_INST_0_i_50_n_7}),
        .DI(burst_length[16:9]),
        .O(tmp_2_fu_193_p2[16:9]),
        .S({dataOut_TVALID_INST_0_i_67_n_0,dataOut_TVALID_INST_0_i_68_n_0,dataOut_TVALID_INST_0_i_69_n_0,dataOut_TVALID_INST_0_i_70_n_0,dataOut_TVALID_INST_0_i_71_n_0,dataOut_TVALID_INST_0_i_72_n_0,dataOut_TVALID_INST_0_i_73_n_0,dataOut_TVALID_INST_0_i_74_n_0}));
  CARRY8 dataOut_TVALID_INST_0_i_51
       (.CI(burst_length[0]),
        .CI_TOP(1'b0),
        .CO({dataOut_TVALID_INST_0_i_51_n_0,dataOut_TVALID_INST_0_i_51_n_1,dataOut_TVALID_INST_0_i_51_n_2,dataOut_TVALID_INST_0_i_51_n_3,NLW_dataOut_TVALID_INST_0_i_51_CO_UNCONNECTED[3],dataOut_TVALID_INST_0_i_51_n_5,dataOut_TVALID_INST_0_i_51_n_6,dataOut_TVALID_INST_0_i_51_n_7}),
        .DI(burst_length[8:1]),
        .O(tmp_2_fu_193_p2[8:1]),
        .S({dataOut_TVALID_INST_0_i_75_n_0,dataOut_TVALID_INST_0_i_76_n_0,dataOut_TVALID_INST_0_i_77_n_0,dataOut_TVALID_INST_0_i_78_n_0,dataOut_TVALID_INST_0_i_79_n_0,dataOut_TVALID_INST_0_i_80_n_0,dataOut_TVALID_INST_0_i_81_n_0,dataOut_TVALID_INST_0_i_82_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_52
       (.I0(burst_length[31]),
        .O(dataOut_TVALID_INST_0_i_52_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_53
       (.I0(burst_length[30]),
        .O(dataOut_TVALID_INST_0_i_53_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_54
       (.I0(burst_length[29]),
        .O(dataOut_TVALID_INST_0_i_54_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_55
       (.I0(burst_length[28]),
        .O(dataOut_TVALID_INST_0_i_55_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_56
       (.I0(burst_length[27]),
        .O(dataOut_TVALID_INST_0_i_56_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_57
       (.I0(burst_length[26]),
        .O(dataOut_TVALID_INST_0_i_57_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_58
       (.I0(burst_length[25]),
        .O(dataOut_TVALID_INST_0_i_58_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_59
       (.I0(burst_length[24]),
        .O(dataOut_TVALID_INST_0_i_59_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    dataOut_TVALID_INST_0_i_6
       (.I0(data_count_reg[26]),
        .I1(tmp_2_fu_193_p2[26]),
        .I2(data_count_reg[24]),
        .I3(tmp_2_fu_193_p2[24]),
        .I4(data_count_reg[25]),
        .I5(tmp_2_fu_193_p2[25]),
        .O(dataOut_TVALID_INST_0_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_60
       (.I0(burst_length[23]),
        .O(dataOut_TVALID_INST_0_i_60_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_61
       (.I0(burst_length[22]),
        .O(dataOut_TVALID_INST_0_i_61_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_62
       (.I0(burst_length[21]),
        .O(dataOut_TVALID_INST_0_i_62_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_63
       (.I0(burst_length[20]),
        .O(dataOut_TVALID_INST_0_i_63_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_64
       (.I0(burst_length[19]),
        .O(dataOut_TVALID_INST_0_i_64_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_65
       (.I0(burst_length[18]),
        .O(dataOut_TVALID_INST_0_i_65_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_66
       (.I0(burst_length[17]),
        .O(dataOut_TVALID_INST_0_i_66_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_67
       (.I0(burst_length[16]),
        .O(dataOut_TVALID_INST_0_i_67_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_68
       (.I0(burst_length[15]),
        .O(dataOut_TVALID_INST_0_i_68_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_69
       (.I0(burst_length[14]),
        .O(dataOut_TVALID_INST_0_i_69_n_0));
  CARRY8 dataOut_TVALID_INST_0_i_7
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({dataOut_TVALID_INST_0_i_7_n_0,dataOut_TVALID_INST_0_i_7_n_1,dataOut_TVALID_INST_0_i_7_n_2,dataOut_TVALID_INST_0_i_7_n_3,NLW_dataOut_TVALID_INST_0_i_7_CO_UNCONNECTED[3],dataOut_TVALID_INST_0_i_7_n_5,dataOut_TVALID_INST_0_i_7_n_6,dataOut_TVALID_INST_0_i_7_n_7}),
        .DI({dataOut_TVALID_INST_0_i_34_n_0,dataOut_TVALID_INST_0_i_35_n_0,dataOut_TVALID_INST_0_i_36_n_0,dataOut_TVALID_INST_0_i_37_n_0,dataOut_TVALID_INST_0_i_38_n_0,dataOut_TVALID_INST_0_i_39_n_0,dataOut_TVALID_INST_0_i_40_n_0,dataOut_TVALID_INST_0_i_41_n_0}),
        .O(NLW_dataOut_TVALID_INST_0_i_7_O_UNCONNECTED[7:0]),
        .S({dataOut_TVALID_INST_0_i_42_n_0,dataOut_TVALID_INST_0_i_43_n_0,dataOut_TVALID_INST_0_i_44_n_0,dataOut_TVALID_INST_0_i_45_n_0,dataOut_TVALID_INST_0_i_46_n_0,dataOut_TVALID_INST_0_i_47_n_0,dataOut_TVALID_INST_0_i_48_n_0,dataOut_TVALID_INST_0_i_49_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_70
       (.I0(burst_length[13]),
        .O(dataOut_TVALID_INST_0_i_70_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_71
       (.I0(burst_length[12]),
        .O(dataOut_TVALID_INST_0_i_71_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_72
       (.I0(burst_length[11]),
        .O(dataOut_TVALID_INST_0_i_72_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_73
       (.I0(burst_length[10]),
        .O(dataOut_TVALID_INST_0_i_73_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_74
       (.I0(burst_length[9]),
        .O(dataOut_TVALID_INST_0_i_74_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_75
       (.I0(burst_length[8]),
        .O(dataOut_TVALID_INST_0_i_75_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_76
       (.I0(burst_length[7]),
        .O(dataOut_TVALID_INST_0_i_76_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_77
       (.I0(burst_length[6]),
        .O(dataOut_TVALID_INST_0_i_77_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_78
       (.I0(burst_length[5]),
        .O(dataOut_TVALID_INST_0_i_78_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_79
       (.I0(burst_length[4]),
        .O(dataOut_TVALID_INST_0_i_79_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_8
       (.I0(tmp_2_fu_193_p2[30]),
        .I1(data_count_reg[30]),
        .I2(data_count_reg[31]),
        .I3(tmp_2_fu_193_p2[31]),
        .O(dataOut_TVALID_INST_0_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_80
       (.I0(burst_length[3]),
        .O(dataOut_TVALID_INST_0_i_80_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_81
       (.I0(burst_length[2]),
        .O(dataOut_TVALID_INST_0_i_81_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    dataOut_TVALID_INST_0_i_82
       (.I0(burst_length[1]),
        .O(dataOut_TVALID_INST_0_i_82_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    dataOut_TVALID_INST_0_i_9
       (.I0(tmp_2_fu_193_p2[28]),
        .I1(data_count_reg[28]),
        .I2(data_count_reg[29]),
        .I3(tmp_2_fu_193_p2[29]),
        .O(dataOut_TVALID_INST_0_i_9_n_0));
  LUT4 #(
    .INIT(16'h40FF)) 
    \data_count[0]_i_1 
       (.I0(tmp_1_fu_175_p2),
        .I1(enable),
        .I2(ap_start),
        .I3(ap_rst_n),
        .O(\data_count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFDFF000000000000)) 
    \data_count[0]_i_2 
       (.I0(ap_ready_INST_0_i_2_n_0),
        .I1(dataOut_TREADY),
        .I2(p_0_in),
        .I3(tmp_1_fu_175_p2),
        .I4(ap_start),
        .I5(enable),
        .O(ap_condition_184));
  LUT1 #(
    .INIT(2'h1)) 
    \data_count[0]_i_4 
       (.I0(data_count_reg[0]),
        .O(\data_count[0]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[0] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[0]_i_3_n_15 ),
        .Q(data_count_reg[0]),
        .R(\data_count[0]_i_1_n_0 ));
  CARRY8 \data_count_reg[0]_i_3 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\data_count_reg[0]_i_3_n_0 ,\data_count_reg[0]_i_3_n_1 ,\data_count_reg[0]_i_3_n_2 ,\data_count_reg[0]_i_3_n_3 ,\NLW_data_count_reg[0]_i_3_CO_UNCONNECTED [3],\data_count_reg[0]_i_3_n_5 ,\data_count_reg[0]_i_3_n_6 ,\data_count_reg[0]_i_3_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\data_count_reg[0]_i_3_n_8 ,\data_count_reg[0]_i_3_n_9 ,\data_count_reg[0]_i_3_n_10 ,\data_count_reg[0]_i_3_n_11 ,\data_count_reg[0]_i_3_n_12 ,\data_count_reg[0]_i_3_n_13 ,\data_count_reg[0]_i_3_n_14 ,\data_count_reg[0]_i_3_n_15 }),
        .S({data_count_reg[7:1],\data_count[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[10] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[8]_i_1_n_13 ),
        .Q(data_count_reg[10]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[11] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[8]_i_1_n_12 ),
        .Q(data_count_reg[11]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[12] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[8]_i_1_n_11 ),
        .Q(data_count_reg[12]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[13] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[8]_i_1_n_10 ),
        .Q(data_count_reg[13]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[14] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[8]_i_1_n_9 ),
        .Q(data_count_reg[14]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[15] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[8]_i_1_n_8 ),
        .Q(data_count_reg[15]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[16] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[16]_i_1_n_15 ),
        .Q(data_count_reg[16]),
        .R(\data_count[0]_i_1_n_0 ));
  CARRY8 \data_count_reg[16]_i_1 
       (.CI(\data_count_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\data_count_reg[16]_i_1_n_0 ,\data_count_reg[16]_i_1_n_1 ,\data_count_reg[16]_i_1_n_2 ,\data_count_reg[16]_i_1_n_3 ,\NLW_data_count_reg[16]_i_1_CO_UNCONNECTED [3],\data_count_reg[16]_i_1_n_5 ,\data_count_reg[16]_i_1_n_6 ,\data_count_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\data_count_reg[16]_i_1_n_8 ,\data_count_reg[16]_i_1_n_9 ,\data_count_reg[16]_i_1_n_10 ,\data_count_reg[16]_i_1_n_11 ,\data_count_reg[16]_i_1_n_12 ,\data_count_reg[16]_i_1_n_13 ,\data_count_reg[16]_i_1_n_14 ,\data_count_reg[16]_i_1_n_15 }),
        .S(data_count_reg[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[17] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[16]_i_1_n_14 ),
        .Q(data_count_reg[17]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[18] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[16]_i_1_n_13 ),
        .Q(data_count_reg[18]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[19] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[16]_i_1_n_12 ),
        .Q(data_count_reg[19]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[1] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[0]_i_3_n_14 ),
        .Q(data_count_reg[1]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[20] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[16]_i_1_n_11 ),
        .Q(data_count_reg[20]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[21] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[16]_i_1_n_10 ),
        .Q(data_count_reg[21]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[22] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[16]_i_1_n_9 ),
        .Q(data_count_reg[22]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[23] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[16]_i_1_n_8 ),
        .Q(data_count_reg[23]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[24] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[24]_i_1_n_15 ),
        .Q(data_count_reg[24]),
        .R(\data_count[0]_i_1_n_0 ));
  CARRY8 \data_count_reg[24]_i_1 
       (.CI(\data_count_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_data_count_reg[24]_i_1_CO_UNCONNECTED [7],\data_count_reg[24]_i_1_n_1 ,\data_count_reg[24]_i_1_n_2 ,\data_count_reg[24]_i_1_n_3 ,\NLW_data_count_reg[24]_i_1_CO_UNCONNECTED [3],\data_count_reg[24]_i_1_n_5 ,\data_count_reg[24]_i_1_n_6 ,\data_count_reg[24]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\data_count_reg[24]_i_1_n_8 ,\data_count_reg[24]_i_1_n_9 ,\data_count_reg[24]_i_1_n_10 ,\data_count_reg[24]_i_1_n_11 ,\data_count_reg[24]_i_1_n_12 ,\data_count_reg[24]_i_1_n_13 ,\data_count_reg[24]_i_1_n_14 ,\data_count_reg[24]_i_1_n_15 }),
        .S(data_count_reg[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[25] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[24]_i_1_n_14 ),
        .Q(data_count_reg[25]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[26] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[24]_i_1_n_13 ),
        .Q(data_count_reg[26]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[27] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[24]_i_1_n_12 ),
        .Q(data_count_reg[27]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[28] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[24]_i_1_n_11 ),
        .Q(data_count_reg[28]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[29] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[24]_i_1_n_10 ),
        .Q(data_count_reg[29]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[2] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[0]_i_3_n_13 ),
        .Q(data_count_reg[2]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[30] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[24]_i_1_n_9 ),
        .Q(data_count_reg[30]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[31] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[24]_i_1_n_8 ),
        .Q(data_count_reg[31]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[3] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[0]_i_3_n_12 ),
        .Q(data_count_reg[3]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[4] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[0]_i_3_n_11 ),
        .Q(data_count_reg[4]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[5] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[0]_i_3_n_10 ),
        .Q(data_count_reg[5]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[6] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[0]_i_3_n_9 ),
        .Q(data_count_reg[6]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[7] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[0]_i_3_n_8 ),
        .Q(data_count_reg[7]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[8] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[8]_i_1_n_15 ),
        .Q(data_count_reg[8]),
        .R(\data_count[0]_i_1_n_0 ));
  CARRY8 \data_count_reg[8]_i_1 
       (.CI(\data_count_reg[0]_i_3_n_0 ),
        .CI_TOP(1'b0),
        .CO({\data_count_reg[8]_i_1_n_0 ,\data_count_reg[8]_i_1_n_1 ,\data_count_reg[8]_i_1_n_2 ,\data_count_reg[8]_i_1_n_3 ,\NLW_data_count_reg[8]_i_1_CO_UNCONNECTED [3],\data_count_reg[8]_i_1_n_5 ,\data_count_reg[8]_i_1_n_6 ,\data_count_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\data_count_reg[8]_i_1_n_8 ,\data_count_reg[8]_i_1_n_9 ,\data_count_reg[8]_i_1_n_10 ,\data_count_reg[8]_i_1_n_11 ,\data_count_reg[8]_i_1_n_12 ,\data_count_reg[8]_i_1_n_13 ,\data_count_reg[8]_i_1_n_14 ,\data_count_reg[8]_i_1_n_15 }),
        .S(data_count_reg[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \data_count_reg[9] 
       (.C(ap_clk),
        .CE(ap_condition_184),
        .D(\data_count_reg[8]_i_1_n_14 ),
        .Q(data_count_reg[9]),
        .R(\data_count[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h01010F00)) 
    \init_data[0]_i_1 
       (.I0(tmp_4_fu_211_p2),
        .I1(tmp_6_fu_217_p2),
        .I2(\init_data[0]_i_3_n_0 ),
        .I3(tmp_5_fu_205_p2),
        .I4(tmp_3_fu_199_p2),
        .O(init_data0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7F7F7FFF)) 
    \init_data[0]_i_3 
       (.I0(tmp_1_fu_175_p2),
        .I1(enable),
        .I2(ap_start),
        .I3(dataOut_TREADY),
        .I4(p_0_in),
        .O(\init_data[0]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \init_data[0]_i_4 
       (.I0(init_data_reg[0]),
        .O(\init_data[0]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[0] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[0]_i_2_n_15 ),
        .Q(init_data_reg[0]),
        .R(\data_count[0]_i_1_n_0 ));
  CARRY8 \init_data_reg[0]_i_2 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\init_data_reg[0]_i_2_n_0 ,\init_data_reg[0]_i_2_n_1 ,\init_data_reg[0]_i_2_n_2 ,\init_data_reg[0]_i_2_n_3 ,\NLW_init_data_reg[0]_i_2_CO_UNCONNECTED [3],\init_data_reg[0]_i_2_n_5 ,\init_data_reg[0]_i_2_n_6 ,\init_data_reg[0]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\init_data_reg[0]_i_2_n_8 ,\init_data_reg[0]_i_2_n_9 ,\init_data_reg[0]_i_2_n_10 ,\init_data_reg[0]_i_2_n_11 ,\init_data_reg[0]_i_2_n_12 ,\init_data_reg[0]_i_2_n_13 ,\init_data_reg[0]_i_2_n_14 ,\init_data_reg[0]_i_2_n_15 }),
        .S({init_data_reg[7:1],\init_data[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[10] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[8]_i_1_n_13 ),
        .Q(init_data_reg[10]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[11] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[8]_i_1_n_12 ),
        .Q(init_data_reg[11]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[12] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[8]_i_1_n_11 ),
        .Q(init_data_reg[12]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[13] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[8]_i_1_n_10 ),
        .Q(init_data_reg[13]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[14] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[8]_i_1_n_9 ),
        .Q(init_data_reg[14]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[15] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[8]_i_1_n_8 ),
        .Q(init_data_reg[15]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[16] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[16]_i_1_n_15 ),
        .Q(init_data_reg[16]),
        .R(\data_count[0]_i_1_n_0 ));
  CARRY8 \init_data_reg[16]_i_1 
       (.CI(\init_data_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\init_data_reg[16]_i_1_n_0 ,\init_data_reg[16]_i_1_n_1 ,\init_data_reg[16]_i_1_n_2 ,\init_data_reg[16]_i_1_n_3 ,\NLW_init_data_reg[16]_i_1_CO_UNCONNECTED [3],\init_data_reg[16]_i_1_n_5 ,\init_data_reg[16]_i_1_n_6 ,\init_data_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\init_data_reg[16]_i_1_n_8 ,\init_data_reg[16]_i_1_n_9 ,\init_data_reg[16]_i_1_n_10 ,\init_data_reg[16]_i_1_n_11 ,\init_data_reg[16]_i_1_n_12 ,\init_data_reg[16]_i_1_n_13 ,\init_data_reg[16]_i_1_n_14 ,\init_data_reg[16]_i_1_n_15 }),
        .S(init_data_reg[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[17] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[16]_i_1_n_14 ),
        .Q(init_data_reg[17]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[18] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[16]_i_1_n_13 ),
        .Q(init_data_reg[18]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[19] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[16]_i_1_n_12 ),
        .Q(init_data_reg[19]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[1] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[0]_i_2_n_14 ),
        .Q(init_data_reg[1]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[20] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[16]_i_1_n_11 ),
        .Q(init_data_reg[20]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[21] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[16]_i_1_n_10 ),
        .Q(init_data_reg[21]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[22] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[16]_i_1_n_9 ),
        .Q(init_data_reg[22]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[23] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[16]_i_1_n_8 ),
        .Q(init_data_reg[23]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[24] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[24]_i_1_n_15 ),
        .Q(init_data_reg[24]),
        .R(\data_count[0]_i_1_n_0 ));
  CARRY8 \init_data_reg[24]_i_1 
       (.CI(\init_data_reg[16]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_init_data_reg[24]_i_1_CO_UNCONNECTED [7],\init_data_reg[24]_i_1_n_1 ,\init_data_reg[24]_i_1_n_2 ,\init_data_reg[24]_i_1_n_3 ,\NLW_init_data_reg[24]_i_1_CO_UNCONNECTED [3],\init_data_reg[24]_i_1_n_5 ,\init_data_reg[24]_i_1_n_6 ,\init_data_reg[24]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\init_data_reg[24]_i_1_n_8 ,\init_data_reg[24]_i_1_n_9 ,\init_data_reg[24]_i_1_n_10 ,\init_data_reg[24]_i_1_n_11 ,\init_data_reg[24]_i_1_n_12 ,\init_data_reg[24]_i_1_n_13 ,\init_data_reg[24]_i_1_n_14 ,\init_data_reg[24]_i_1_n_15 }),
        .S(init_data_reg[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[25] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[24]_i_1_n_14 ),
        .Q(init_data_reg[25]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[26] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[24]_i_1_n_13 ),
        .Q(init_data_reg[26]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[27] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[24]_i_1_n_12 ),
        .Q(init_data_reg[27]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[28] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[24]_i_1_n_11 ),
        .Q(init_data_reg[28]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[29] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[24]_i_1_n_10 ),
        .Q(init_data_reg[29]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[2] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[0]_i_2_n_13 ),
        .Q(init_data_reg[2]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[30] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[24]_i_1_n_9 ),
        .Q(init_data_reg[30]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[31] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[24]_i_1_n_8 ),
        .Q(init_data_reg[31]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[3] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[0]_i_2_n_12 ),
        .Q(init_data_reg[3]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[4] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[0]_i_2_n_11 ),
        .Q(init_data_reg[4]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[5] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[0]_i_2_n_10 ),
        .Q(init_data_reg[5]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[6] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[0]_i_2_n_9 ),
        .Q(init_data_reg[6]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[7] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[0]_i_2_n_8 ),
        .Q(init_data_reg[7]),
        .R(\data_count[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[8] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[8]_i_1_n_15 ),
        .Q(init_data_reg[8]),
        .R(\data_count[0]_i_1_n_0 ));
  CARRY8 \init_data_reg[8]_i_1 
       (.CI(\init_data_reg[0]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\init_data_reg[8]_i_1_n_0 ,\init_data_reg[8]_i_1_n_1 ,\init_data_reg[8]_i_1_n_2 ,\init_data_reg[8]_i_1_n_3 ,\NLW_init_data_reg[8]_i_1_CO_UNCONNECTED [3],\init_data_reg[8]_i_1_n_5 ,\init_data_reg[8]_i_1_n_6 ,\init_data_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\init_data_reg[8]_i_1_n_8 ,\init_data_reg[8]_i_1_n_9 ,\init_data_reg[8]_i_1_n_10 ,\init_data_reg[8]_i_1_n_11 ,\init_data_reg[8]_i_1_n_12 ,\init_data_reg[8]_i_1_n_13 ,\init_data_reg[8]_i_1_n_14 ,\init_data_reg[8]_i_1_n_15 }),
        .S(init_data_reg[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \init_data_reg[9] 
       (.C(ap_clk),
        .CE(init_data0),
        .D(\init_data_reg[8]_i_1_n_14 ),
        .Q(init_data_reg[9]),
        .R(\data_count[0]_i_1_n_0 ));
endmodule

(* CHECK_LICENSE_TYPE = "ControlledBurstGen_0,ControlledBurstGen,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "ControlledBurstGen,Vivado 2017.3" *) 
(* hls_module = "yes" *) 
(* NotValidForBitStream *)
module ControlledBurstGen_0
   (ap_clk,
    ap_rst_n,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    enable,
    preamble_length,
    preamble,
    delimiter,
    burst_length,
    burst_period,
    dataOut_TVALID,
    dataOut_TREADY,
    dataOut_TDATA,
    dataOut_TDEST,
    dataOut_TKEEP,
    dataOut_TSTRB,
    dataOut_TUSER,
    dataOut_TLAST,
    dataOut_TID);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF dataOut, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) output ap_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 enable DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME enable, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *) input [0:0]enable;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 preamble_length DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME preamble_length, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) input [31:0]preamble_length;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 preamble DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME preamble, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) input [31:0]preamble;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 delimiter DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME delimiter, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) input [31:0]delimiter;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 burst_length DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME burst_length, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) input [31:0]burst_length;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 burst_period DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME burst_period, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}" *) input [31:0]burst_period;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dataOut TVALID" *) output dataOut_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dataOut TREADY" *) input dataOut_TREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dataOut TDATA" *) output [31:0]dataOut_TDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dataOut TDEST" *) output [5:0]dataOut_TDEST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dataOut TKEEP" *) output [3:0]dataOut_TKEEP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dataOut TSTRB" *) output [3:0]dataOut_TSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dataOut TUSER" *) output [1:0]dataOut_TUSER;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dataOut TLAST" *) output [0:0]dataOut_TLAST;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 dataOut TID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dataOut, SIGNAL_SET 11111111, TDATA_NUM_BYTES 4, TDEST_WIDTH 6, TID_WIDTH 5, TUSER_WIDTH 2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 2} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000" *) output [4:0]dataOut_TID;

  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst_n;
  wire ap_start;
  wire [31:0]burst_length;
  wire [31:0]burst_period;
  wire [31:0]dataOut_TDATA;
  wire [5:0]dataOut_TDEST;
  wire [4:0]dataOut_TID;
  wire [3:0]dataOut_TKEEP;
  wire [0:0]dataOut_TLAST;
  wire dataOut_TREADY;
  wire [3:0]dataOut_TSTRB;
  wire [1:0]dataOut_TUSER;
  wire dataOut_TVALID;
  wire [31:0]delimiter;
  wire [0:0]enable;
  wire [31:0]preamble;
  wire [31:0]preamble_length;

  (* ap_ST_fsm_state1 = "1'b1" *) 
  ControlledBurstGen_0_ControlledBurstGen inst
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .burst_length(burst_length),
        .burst_period(burst_period),
        .dataOut_TDATA(dataOut_TDATA),
        .dataOut_TDEST(dataOut_TDEST),
        .dataOut_TID(dataOut_TID),
        .dataOut_TKEEP(dataOut_TKEEP),
        .dataOut_TLAST(dataOut_TLAST),
        .dataOut_TREADY(dataOut_TREADY),
        .dataOut_TSTRB(dataOut_TSTRB),
        .dataOut_TUSER(dataOut_TUSER),
        .dataOut_TVALID(dataOut_TVALID),
        .delimiter(delimiter),
        .enable(enable),
        .preamble(preamble),
        .preamble_length(preamble_length));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
