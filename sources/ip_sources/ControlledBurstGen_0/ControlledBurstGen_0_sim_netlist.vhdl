-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Wed Feb 12 14:41:03 2020
-- Host        : Christian running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top ControlledBurstGen_0 -prefix
--               ControlledBurstGen_0_ ControlledBurstGen_0_sim_netlist.vhdl
-- Design      : ControlledBurstGen_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcvu095-ffva2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ControlledBurstGen_0_ControlledBurstGen is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    enable : in STD_LOGIC;
    preamble_length : in STD_LOGIC_VECTOR ( 31 downto 0 );
    preamble : in STD_LOGIC_VECTOR ( 31 downto 0 );
    delimiter : in STD_LOGIC_VECTOR ( 31 downto 0 );
    burst_length : in STD_LOGIC_VECTOR ( 31 downto 0 );
    burst_period : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dataOut_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dataOut_TVALID : out STD_LOGIC;
    dataOut_TREADY : in STD_LOGIC;
    dataOut_TKEEP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dataOut_TSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dataOut_TUSER : out STD_LOGIC_VECTOR ( 1 downto 0 );
    dataOut_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    dataOut_TID : out STD_LOGIC_VECTOR ( 4 downto 0 );
    dataOut_TDEST : out STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of ControlledBurstGen_0_ControlledBurstGen : entity is "1'b1";
  attribute hls_module : string;
  attribute hls_module of ControlledBurstGen_0_ControlledBurstGen : entity is "yes";
end ControlledBurstGen_0_ControlledBurstGen;

architecture STRUCTURE of ControlledBurstGen_0_ControlledBurstGen is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal ap_condition_184 : STD_LOGIC;
  signal \^ap_ready\ : STD_LOGIC;
  signal ap_ready_INST_0_i_10_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_11_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_12_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_13_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_14_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_15_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_16_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_17_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_18_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_19_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_1_n_1 : STD_LOGIC;
  signal ap_ready_INST_0_i_1_n_2 : STD_LOGIC;
  signal ap_ready_INST_0_i_1_n_3 : STD_LOGIC;
  signal ap_ready_INST_0_i_1_n_5 : STD_LOGIC;
  signal ap_ready_INST_0_i_1_n_6 : STD_LOGIC;
  signal ap_ready_INST_0_i_1_n_7 : STD_LOGIC;
  signal ap_ready_INST_0_i_20_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_21_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_22_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_23_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_24_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_25_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_26_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_27_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_28_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_29_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_2_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_30_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_31_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_32_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_33_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_34_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_35_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_36_n_2 : STD_LOGIC;
  signal ap_ready_INST_0_i_36_n_3 : STD_LOGIC;
  signal ap_ready_INST_0_i_36_n_5 : STD_LOGIC;
  signal ap_ready_INST_0_i_36_n_6 : STD_LOGIC;
  signal ap_ready_INST_0_i_36_n_7 : STD_LOGIC;
  signal ap_ready_INST_0_i_37_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_37_n_1 : STD_LOGIC;
  signal ap_ready_INST_0_i_37_n_2 : STD_LOGIC;
  signal ap_ready_INST_0_i_37_n_3 : STD_LOGIC;
  signal ap_ready_INST_0_i_37_n_5 : STD_LOGIC;
  signal ap_ready_INST_0_i_37_n_6 : STD_LOGIC;
  signal ap_ready_INST_0_i_37_n_7 : STD_LOGIC;
  signal ap_ready_INST_0_i_38_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_38_n_1 : STD_LOGIC;
  signal ap_ready_INST_0_i_38_n_2 : STD_LOGIC;
  signal ap_ready_INST_0_i_38_n_3 : STD_LOGIC;
  signal ap_ready_INST_0_i_38_n_5 : STD_LOGIC;
  signal ap_ready_INST_0_i_38_n_6 : STD_LOGIC;
  signal ap_ready_INST_0_i_38_n_7 : STD_LOGIC;
  signal ap_ready_INST_0_i_39_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_39_n_1 : STD_LOGIC;
  signal ap_ready_INST_0_i_39_n_2 : STD_LOGIC;
  signal ap_ready_INST_0_i_39_n_3 : STD_LOGIC;
  signal ap_ready_INST_0_i_39_n_5 : STD_LOGIC;
  signal ap_ready_INST_0_i_39_n_6 : STD_LOGIC;
  signal ap_ready_INST_0_i_39_n_7 : STD_LOGIC;
  signal ap_ready_INST_0_i_3_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_3_n_1 : STD_LOGIC;
  signal ap_ready_INST_0_i_3_n_2 : STD_LOGIC;
  signal ap_ready_INST_0_i_3_n_3 : STD_LOGIC;
  signal ap_ready_INST_0_i_3_n_5 : STD_LOGIC;
  signal ap_ready_INST_0_i_3_n_6 : STD_LOGIC;
  signal ap_ready_INST_0_i_3_n_7 : STD_LOGIC;
  signal ap_ready_INST_0_i_40_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_41_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_42_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_43_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_44_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_45_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_46_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_47_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_48_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_49_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_4_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_50_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_51_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_52_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_53_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_54_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_55_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_56_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_57_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_58_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_59_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_5_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_60_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_61_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_62_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_63_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_64_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_65_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_66_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_67_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_68_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_69_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_6_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_70_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_7_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_8_n_0 : STD_LOGIC;
  signal ap_ready_INST_0_i_9_n_0 : STD_LOGIC;
  signal ap_reg_ioackin_dataOut_TREADY_i_1_n_0 : STD_LOGIC;
  signal ap_reg_ioackin_dataOut_TREADY_i_2_n_0 : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_13_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_14_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_15_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_16_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_17_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_18_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_19_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_20_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_21_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_22_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_23_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_23_n_1\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_23_n_2\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_23_n_3\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_23_n_5\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_23_n_6\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_23_n_7\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_24_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_25_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_26_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_27_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_28_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_29_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_30_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_31_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_32_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_33_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_34_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_35_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_36_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_37_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_38_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_39_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_40_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_41_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_42_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_43_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_44_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_45_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_46_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_47_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_48_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_49_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_4_n_1\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_4_n_2\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_4_n_3\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_4_n_5\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_4_n_6\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_4_n_7\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_50_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_5_n_6\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_5_n_7\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_6_n_1\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_6_n_2\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_6_n_3\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_6_n_5\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_6_n_6\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_6_n_7\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \dataOut_TDATA[31]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_10_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_11_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_12_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_13_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_14_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_15_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_16_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_17_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_18_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_19_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_1_n_6 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_1_n_7 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_20_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_21_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_22_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_23_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_24_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_25_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_26_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_27_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_28_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_29_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_2_n_1 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_2_n_2 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_2_n_3 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_2_n_5 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_2_n_6 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_2_n_7 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_30_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_31_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_32_n_2 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_32_n_3 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_32_n_5 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_32_n_6 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_32_n_7 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_33_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_33_n_1 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_33_n_2 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_33_n_3 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_33_n_5 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_33_n_6 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_33_n_7 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_34_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_35_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_36_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_37_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_38_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_39_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_3_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_3_n_1 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_3_n_2 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_3_n_3 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_3_n_5 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_3_n_6 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_3_n_7 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_40_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_41_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_42_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_43_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_44_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_45_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_46_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_47_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_48_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_49_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_4_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_50_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_50_n_1 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_50_n_2 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_50_n_3 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_50_n_5 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_50_n_6 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_50_n_7 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_51_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_51_n_1 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_51_n_2 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_51_n_3 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_51_n_5 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_51_n_6 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_51_n_7 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_52_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_53_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_54_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_55_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_56_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_57_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_58_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_59_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_5_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_60_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_61_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_62_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_63_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_64_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_65_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_66_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_67_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_68_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_69_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_6_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_70_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_71_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_72_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_73_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_74_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_75_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_76_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_77_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_78_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_79_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_7_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_7_n_1 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_7_n_2 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_7_n_3 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_7_n_5 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_7_n_6 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_7_n_7 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_80_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_81_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_82_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_8_n_0 : STD_LOGIC;
  signal dataOut_TVALID_INST_0_i_9_n_0 : STD_LOGIC;
  signal \data_count[0]_i_1_n_0\ : STD_LOGIC;
  signal \data_count[0]_i_4_n_0\ : STD_LOGIC;
  signal data_count_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \data_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_10\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_11\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_12\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_13\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_14\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_15\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_8\ : STD_LOGIC;
  signal \data_count_reg[0]_i_3_n_9\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \data_count_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_10\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_11\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_12\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_13\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_8\ : STD_LOGIC;
  signal \data_count_reg[24]_i_1_n_9\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \data_count_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal init_data0 : STD_LOGIC;
  signal \init_data[0]_i_3_n_0\ : STD_LOGIC;
  signal \init_data[0]_i_4_n_0\ : STD_LOGIC;
  signal init_data_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \init_data_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \init_data_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \init_data_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_10\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_11\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_12\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_13\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_8\ : STD_LOGIC;
  signal \init_data_reg[24]_i_1_n_9\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \init_data_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal tmp_1_fu_175_p2 : STD_LOGIC;
  signal tmp_2_fu_193_p2 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal tmp_3_fu_199_p2 : STD_LOGIC;
  signal tmp_4_fu_211_p2 : STD_LOGIC;
  signal tmp_5_fu_205_p2 : STD_LOGIC;
  signal tmp_6_fu_217_p2 : STD_LOGIC;
  signal tmp_fu_169_p2 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal NLW_ap_ready_INST_0_i_1_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_ap_ready_INST_0_i_1_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_ap_ready_INST_0_i_3_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_ap_ready_INST_0_i_3_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_ap_ready_INST_0_i_36_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal NLW_ap_ready_INST_0_i_36_DI_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_ap_ready_INST_0_i_36_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_ap_ready_INST_0_i_36_S_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_ap_ready_INST_0_i_37_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_ap_ready_INST_0_i_38_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_ap_ready_INST_0_i_39_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_dataOut_TDATA[31]_INST_0_i_23_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_dataOut_TDATA[31]_INST_0_i_23_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_dataOut_TDATA[31]_INST_0_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_dataOut_TDATA[31]_INST_0_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_dataOut_TDATA[31]_INST_0_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_dataOut_TDATA[31]_INST_0_i_5_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_dataOut_TDATA[31]_INST_0_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_dataOut_TDATA[31]_INST_0_i_5_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_dataOut_TDATA[31]_INST_0_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_dataOut_TDATA[31]_INST_0_i_6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_dataOut_TVALID_INST_0_i_1_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal NLW_dataOut_TVALID_INST_0_i_1_DI_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal NLW_dataOut_TVALID_INST_0_i_1_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_dataOut_TVALID_INST_0_i_1_S_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal NLW_dataOut_TVALID_INST_0_i_2_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_dataOut_TVALID_INST_0_i_2_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_dataOut_TVALID_INST_0_i_3_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_dataOut_TVALID_INST_0_i_3_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_dataOut_TVALID_INST_0_i_32_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal NLW_dataOut_TVALID_INST_0_i_32_DI_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_dataOut_TVALID_INST_0_i_32_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_dataOut_TVALID_INST_0_i_32_S_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_dataOut_TVALID_INST_0_i_33_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_dataOut_TVALID_INST_0_i_50_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_dataOut_TVALID_INST_0_i_51_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_dataOut_TVALID_INST_0_i_7_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_dataOut_TVALID_INST_0_i_7_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_data_count_reg[0]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_data_count_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_data_count_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_data_count_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_init_data_reg[0]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_init_data_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_init_data_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_init_data_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ap_idle_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of ap_reg_ioackin_dataOut_TREADY_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \dataOut_TLAST[0]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \init_data[0]_i_3\ : label is "soft_lutpair0";
begin
  ap_done <= \^ap_ready\;
  ap_ready <= \^ap_ready\;
  dataOut_TDEST(5) <= \<const0>\;
  dataOut_TDEST(4) <= \<const0>\;
  dataOut_TDEST(3) <= \<const0>\;
  dataOut_TDEST(2) <= \<const0>\;
  dataOut_TDEST(1) <= \<const0>\;
  dataOut_TDEST(0) <= \<const0>\;
  dataOut_TID(4) <= \<const0>\;
  dataOut_TID(3) <= \<const0>\;
  dataOut_TID(2) <= \<const0>\;
  dataOut_TID(1) <= \<const0>\;
  dataOut_TID(0) <= \<const0>\;
  dataOut_TKEEP(3) <= \<const1>\;
  dataOut_TKEEP(2) <= \<const1>\;
  dataOut_TKEEP(1) <= \<const1>\;
  dataOut_TKEEP(0) <= \<const1>\;
  dataOut_TSTRB(3) <= \<const0>\;
  dataOut_TSTRB(2) <= \<const0>\;
  dataOut_TSTRB(1) <= \<const0>\;
  dataOut_TSTRB(0) <= \<const0>\;
  dataOut_TUSER(1) <= \<const0>\;
  dataOut_TUSER(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
ap_idle_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_start,
      O => ap_idle
    );
ap_ready_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFF00000000"
    )
        port map (
      I0 => tmp_1_fu_175_p2,
      I1 => p_0_in(0),
      I2 => dataOut_TREADY,
      I3 => ap_ready_INST_0_i_2_n_0,
      I4 => enable,
      I5 => ap_start,
      O => \^ap_ready\
    );
ap_ready_INST_0_i_1: unisim.vcomponents.CARRY8
     port map (
      CI => ap_ready_INST_0_i_3_n_0,
      CI_TOP => '0',
      CO(7) => tmp_1_fu_175_p2,
      CO(6) => ap_ready_INST_0_i_1_n_1,
      CO(5) => ap_ready_INST_0_i_1_n_2,
      CO(4) => ap_ready_INST_0_i_1_n_3,
      CO(3) => NLW_ap_ready_INST_0_i_1_CO_UNCONNECTED(3),
      CO(2) => ap_ready_INST_0_i_1_n_5,
      CO(1) => ap_ready_INST_0_i_1_n_6,
      CO(0) => ap_ready_INST_0_i_1_n_7,
      DI(7) => ap_ready_INST_0_i_4_n_0,
      DI(6) => ap_ready_INST_0_i_5_n_0,
      DI(5) => ap_ready_INST_0_i_6_n_0,
      DI(4) => ap_ready_INST_0_i_7_n_0,
      DI(3) => ap_ready_INST_0_i_8_n_0,
      DI(2) => ap_ready_INST_0_i_9_n_0,
      DI(1) => ap_ready_INST_0_i_10_n_0,
      DI(0) => ap_ready_INST_0_i_11_n_0,
      O(7 downto 0) => NLW_ap_ready_INST_0_i_1_O_UNCONNECTED(7 downto 0),
      S(7) => ap_ready_INST_0_i_12_n_0,
      S(6) => ap_ready_INST_0_i_13_n_0,
      S(5) => ap_ready_INST_0_i_14_n_0,
      S(4) => ap_ready_INST_0_i_15_n_0,
      S(3) => ap_ready_INST_0_i_16_n_0,
      S(2) => ap_ready_INST_0_i_17_n_0,
      S(1) => ap_ready_INST_0_i_18_n_0,
      S(0) => ap_ready_INST_0_i_19_n_0
    );
ap_ready_INST_0_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(18),
      I1 => data_count_reg(18),
      I2 => data_count_reg(19),
      I3 => tmp_fu_169_p2(19),
      O => ap_ready_INST_0_i_10_n_0
    );
ap_ready_INST_0_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(16),
      I1 => data_count_reg(16),
      I2 => data_count_reg(17),
      I3 => tmp_fu_169_p2(17),
      O => ap_ready_INST_0_i_11_n_0
    );
ap_ready_INST_0_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(31),
      I1 => tmp_fu_169_p2(31),
      I2 => tmp_fu_169_p2(30),
      I3 => data_count_reg(30),
      O => ap_ready_INST_0_i_12_n_0
    );
ap_ready_INST_0_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(29),
      I1 => tmp_fu_169_p2(29),
      I2 => tmp_fu_169_p2(28),
      I3 => data_count_reg(28),
      O => ap_ready_INST_0_i_13_n_0
    );
ap_ready_INST_0_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(27),
      I1 => tmp_fu_169_p2(27),
      I2 => tmp_fu_169_p2(26),
      I3 => data_count_reg(26),
      O => ap_ready_INST_0_i_14_n_0
    );
ap_ready_INST_0_i_15: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(25),
      I1 => tmp_fu_169_p2(25),
      I2 => tmp_fu_169_p2(24),
      I3 => data_count_reg(24),
      O => ap_ready_INST_0_i_15_n_0
    );
ap_ready_INST_0_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(23),
      I1 => tmp_fu_169_p2(23),
      I2 => tmp_fu_169_p2(22),
      I3 => data_count_reg(22),
      O => ap_ready_INST_0_i_16_n_0
    );
ap_ready_INST_0_i_17: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(21),
      I1 => tmp_fu_169_p2(21),
      I2 => tmp_fu_169_p2(20),
      I3 => data_count_reg(20),
      O => ap_ready_INST_0_i_17_n_0
    );
ap_ready_INST_0_i_18: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(19),
      I1 => tmp_fu_169_p2(19),
      I2 => tmp_fu_169_p2(18),
      I3 => data_count_reg(18),
      O => ap_ready_INST_0_i_18_n_0
    );
ap_ready_INST_0_i_19: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(17),
      I1 => tmp_fu_169_p2(17),
      I2 => tmp_fu_169_p2(16),
      I3 => data_count_reg(16),
      O => ap_ready_INST_0_i_19_n_0
    );
ap_ready_INST_0_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => tmp_5_fu_205_p2,
      I1 => tmp_3_fu_199_p2,
      O => ap_ready_INST_0_i_2_n_0
    );
ap_ready_INST_0_i_20: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(14),
      I1 => data_count_reg(14),
      I2 => data_count_reg(15),
      I3 => tmp_fu_169_p2(15),
      O => ap_ready_INST_0_i_20_n_0
    );
ap_ready_INST_0_i_21: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(12),
      I1 => data_count_reg(12),
      I2 => data_count_reg(13),
      I3 => tmp_fu_169_p2(13),
      O => ap_ready_INST_0_i_21_n_0
    );
ap_ready_INST_0_i_22: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(10),
      I1 => data_count_reg(10),
      I2 => data_count_reg(11),
      I3 => tmp_fu_169_p2(11),
      O => ap_ready_INST_0_i_22_n_0
    );
ap_ready_INST_0_i_23: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(8),
      I1 => data_count_reg(8),
      I2 => data_count_reg(9),
      I3 => tmp_fu_169_p2(9),
      O => ap_ready_INST_0_i_23_n_0
    );
ap_ready_INST_0_i_24: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(6),
      I1 => data_count_reg(6),
      I2 => data_count_reg(7),
      I3 => tmp_fu_169_p2(7),
      O => ap_ready_INST_0_i_24_n_0
    );
ap_ready_INST_0_i_25: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(4),
      I1 => data_count_reg(4),
      I2 => data_count_reg(5),
      I3 => tmp_fu_169_p2(5),
      O => ap_ready_INST_0_i_25_n_0
    );
ap_ready_INST_0_i_26: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(2),
      I1 => data_count_reg(2),
      I2 => data_count_reg(3),
      I3 => tmp_fu_169_p2(3),
      O => ap_ready_INST_0_i_26_n_0
    );
ap_ready_INST_0_i_27: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F01"
    )
        port map (
      I0 => data_count_reg(0),
      I1 => burst_period(0),
      I2 => data_count_reg(1),
      I3 => tmp_fu_169_p2(1),
      O => ap_ready_INST_0_i_27_n_0
    );
ap_ready_INST_0_i_28: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(15),
      I1 => tmp_fu_169_p2(15),
      I2 => tmp_fu_169_p2(14),
      I3 => data_count_reg(14),
      O => ap_ready_INST_0_i_28_n_0
    );
ap_ready_INST_0_i_29: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(13),
      I1 => tmp_fu_169_p2(13),
      I2 => tmp_fu_169_p2(12),
      I3 => data_count_reg(12),
      O => ap_ready_INST_0_i_29_n_0
    );
ap_ready_INST_0_i_3: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => ap_ready_INST_0_i_3_n_0,
      CO(6) => ap_ready_INST_0_i_3_n_1,
      CO(5) => ap_ready_INST_0_i_3_n_2,
      CO(4) => ap_ready_INST_0_i_3_n_3,
      CO(3) => NLW_ap_ready_INST_0_i_3_CO_UNCONNECTED(3),
      CO(2) => ap_ready_INST_0_i_3_n_5,
      CO(1) => ap_ready_INST_0_i_3_n_6,
      CO(0) => ap_ready_INST_0_i_3_n_7,
      DI(7) => ap_ready_INST_0_i_20_n_0,
      DI(6) => ap_ready_INST_0_i_21_n_0,
      DI(5) => ap_ready_INST_0_i_22_n_0,
      DI(4) => ap_ready_INST_0_i_23_n_0,
      DI(3) => ap_ready_INST_0_i_24_n_0,
      DI(2) => ap_ready_INST_0_i_25_n_0,
      DI(1) => ap_ready_INST_0_i_26_n_0,
      DI(0) => ap_ready_INST_0_i_27_n_0,
      O(7 downto 0) => NLW_ap_ready_INST_0_i_3_O_UNCONNECTED(7 downto 0),
      S(7) => ap_ready_INST_0_i_28_n_0,
      S(6) => ap_ready_INST_0_i_29_n_0,
      S(5) => ap_ready_INST_0_i_30_n_0,
      S(4) => ap_ready_INST_0_i_31_n_0,
      S(3) => ap_ready_INST_0_i_32_n_0,
      S(2) => ap_ready_INST_0_i_33_n_0,
      S(1) => ap_ready_INST_0_i_34_n_0,
      S(0) => ap_ready_INST_0_i_35_n_0
    );
ap_ready_INST_0_i_30: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(11),
      I1 => tmp_fu_169_p2(11),
      I2 => tmp_fu_169_p2(10),
      I3 => data_count_reg(10),
      O => ap_ready_INST_0_i_30_n_0
    );
ap_ready_INST_0_i_31: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(9),
      I1 => tmp_fu_169_p2(9),
      I2 => tmp_fu_169_p2(8),
      I3 => data_count_reg(8),
      O => ap_ready_INST_0_i_31_n_0
    );
ap_ready_INST_0_i_32: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(7),
      I1 => tmp_fu_169_p2(7),
      I2 => tmp_fu_169_p2(6),
      I3 => data_count_reg(6),
      O => ap_ready_INST_0_i_32_n_0
    );
ap_ready_INST_0_i_33: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(5),
      I1 => tmp_fu_169_p2(5),
      I2 => tmp_fu_169_p2(4),
      I3 => data_count_reg(4),
      O => ap_ready_INST_0_i_33_n_0
    );
ap_ready_INST_0_i_34: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(3),
      I1 => tmp_fu_169_p2(3),
      I2 => tmp_fu_169_p2(2),
      I3 => data_count_reg(2),
      O => ap_ready_INST_0_i_34_n_0
    );
ap_ready_INST_0_i_35: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6006"
    )
        port map (
      I0 => burst_period(0),
      I1 => data_count_reg(0),
      I2 => tmp_fu_169_p2(1),
      I3 => data_count_reg(1),
      O => ap_ready_INST_0_i_35_n_0
    );
ap_ready_INST_0_i_36: unisim.vcomponents.CARRY8
     port map (
      CI => ap_ready_INST_0_i_37_n_0,
      CI_TOP => '0',
      CO(7 downto 6) => NLW_ap_ready_INST_0_i_36_CO_UNCONNECTED(7 downto 6),
      CO(5) => ap_ready_INST_0_i_36_n_2,
      CO(4) => ap_ready_INST_0_i_36_n_3,
      CO(3) => NLW_ap_ready_INST_0_i_36_CO_UNCONNECTED(3),
      CO(2) => ap_ready_INST_0_i_36_n_5,
      CO(1) => ap_ready_INST_0_i_36_n_6,
      CO(0) => ap_ready_INST_0_i_36_n_7,
      DI(7) => NLW_ap_ready_INST_0_i_36_DI_UNCONNECTED(7),
      DI(6) => '0',
      DI(5 downto 0) => burst_period(30 downto 25),
      O(7) => NLW_ap_ready_INST_0_i_36_O_UNCONNECTED(7),
      O(6 downto 0) => tmp_fu_169_p2(31 downto 25),
      S(7) => NLW_ap_ready_INST_0_i_36_S_UNCONNECTED(7),
      S(6) => ap_ready_INST_0_i_40_n_0,
      S(5) => ap_ready_INST_0_i_41_n_0,
      S(4) => ap_ready_INST_0_i_42_n_0,
      S(3) => ap_ready_INST_0_i_43_n_0,
      S(2) => ap_ready_INST_0_i_44_n_0,
      S(1) => ap_ready_INST_0_i_45_n_0,
      S(0) => ap_ready_INST_0_i_46_n_0
    );
ap_ready_INST_0_i_37: unisim.vcomponents.CARRY8
     port map (
      CI => ap_ready_INST_0_i_38_n_0,
      CI_TOP => '0',
      CO(7) => ap_ready_INST_0_i_37_n_0,
      CO(6) => ap_ready_INST_0_i_37_n_1,
      CO(5) => ap_ready_INST_0_i_37_n_2,
      CO(4) => ap_ready_INST_0_i_37_n_3,
      CO(3) => NLW_ap_ready_INST_0_i_37_CO_UNCONNECTED(3),
      CO(2) => ap_ready_INST_0_i_37_n_5,
      CO(1) => ap_ready_INST_0_i_37_n_6,
      CO(0) => ap_ready_INST_0_i_37_n_7,
      DI(7 downto 0) => burst_period(24 downto 17),
      O(7 downto 0) => tmp_fu_169_p2(24 downto 17),
      S(7) => ap_ready_INST_0_i_47_n_0,
      S(6) => ap_ready_INST_0_i_48_n_0,
      S(5) => ap_ready_INST_0_i_49_n_0,
      S(4) => ap_ready_INST_0_i_50_n_0,
      S(3) => ap_ready_INST_0_i_51_n_0,
      S(2) => ap_ready_INST_0_i_52_n_0,
      S(1) => ap_ready_INST_0_i_53_n_0,
      S(0) => ap_ready_INST_0_i_54_n_0
    );
ap_ready_INST_0_i_38: unisim.vcomponents.CARRY8
     port map (
      CI => ap_ready_INST_0_i_39_n_0,
      CI_TOP => '0',
      CO(7) => ap_ready_INST_0_i_38_n_0,
      CO(6) => ap_ready_INST_0_i_38_n_1,
      CO(5) => ap_ready_INST_0_i_38_n_2,
      CO(4) => ap_ready_INST_0_i_38_n_3,
      CO(3) => NLW_ap_ready_INST_0_i_38_CO_UNCONNECTED(3),
      CO(2) => ap_ready_INST_0_i_38_n_5,
      CO(1) => ap_ready_INST_0_i_38_n_6,
      CO(0) => ap_ready_INST_0_i_38_n_7,
      DI(7 downto 0) => burst_period(16 downto 9),
      O(7 downto 0) => tmp_fu_169_p2(16 downto 9),
      S(7) => ap_ready_INST_0_i_55_n_0,
      S(6) => ap_ready_INST_0_i_56_n_0,
      S(5) => ap_ready_INST_0_i_57_n_0,
      S(4) => ap_ready_INST_0_i_58_n_0,
      S(3) => ap_ready_INST_0_i_59_n_0,
      S(2) => ap_ready_INST_0_i_60_n_0,
      S(1) => ap_ready_INST_0_i_61_n_0,
      S(0) => ap_ready_INST_0_i_62_n_0
    );
ap_ready_INST_0_i_39: unisim.vcomponents.CARRY8
     port map (
      CI => burst_period(0),
      CI_TOP => '0',
      CO(7) => ap_ready_INST_0_i_39_n_0,
      CO(6) => ap_ready_INST_0_i_39_n_1,
      CO(5) => ap_ready_INST_0_i_39_n_2,
      CO(4) => ap_ready_INST_0_i_39_n_3,
      CO(3) => NLW_ap_ready_INST_0_i_39_CO_UNCONNECTED(3),
      CO(2) => ap_ready_INST_0_i_39_n_5,
      CO(1) => ap_ready_INST_0_i_39_n_6,
      CO(0) => ap_ready_INST_0_i_39_n_7,
      DI(7 downto 0) => burst_period(8 downto 1),
      O(7 downto 0) => tmp_fu_169_p2(8 downto 1),
      S(7) => ap_ready_INST_0_i_63_n_0,
      S(6) => ap_ready_INST_0_i_64_n_0,
      S(5) => ap_ready_INST_0_i_65_n_0,
      S(4) => ap_ready_INST_0_i_66_n_0,
      S(3) => ap_ready_INST_0_i_67_n_0,
      S(2) => ap_ready_INST_0_i_68_n_0,
      S(1) => ap_ready_INST_0_i_69_n_0,
      S(0) => ap_ready_INST_0_i_70_n_0
    );
ap_ready_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(30),
      I1 => data_count_reg(30),
      I2 => data_count_reg(31),
      I3 => tmp_fu_169_p2(31),
      O => ap_ready_INST_0_i_4_n_0
    );
ap_ready_INST_0_i_40: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(31),
      O => ap_ready_INST_0_i_40_n_0
    );
ap_ready_INST_0_i_41: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(30),
      O => ap_ready_INST_0_i_41_n_0
    );
ap_ready_INST_0_i_42: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(29),
      O => ap_ready_INST_0_i_42_n_0
    );
ap_ready_INST_0_i_43: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(28),
      O => ap_ready_INST_0_i_43_n_0
    );
ap_ready_INST_0_i_44: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(27),
      O => ap_ready_INST_0_i_44_n_0
    );
ap_ready_INST_0_i_45: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(26),
      O => ap_ready_INST_0_i_45_n_0
    );
ap_ready_INST_0_i_46: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(25),
      O => ap_ready_INST_0_i_46_n_0
    );
ap_ready_INST_0_i_47: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(24),
      O => ap_ready_INST_0_i_47_n_0
    );
ap_ready_INST_0_i_48: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(23),
      O => ap_ready_INST_0_i_48_n_0
    );
ap_ready_INST_0_i_49: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(22),
      O => ap_ready_INST_0_i_49_n_0
    );
ap_ready_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(28),
      I1 => data_count_reg(28),
      I2 => data_count_reg(29),
      I3 => tmp_fu_169_p2(29),
      O => ap_ready_INST_0_i_5_n_0
    );
ap_ready_INST_0_i_50: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(21),
      O => ap_ready_INST_0_i_50_n_0
    );
ap_ready_INST_0_i_51: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(20),
      O => ap_ready_INST_0_i_51_n_0
    );
ap_ready_INST_0_i_52: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(19),
      O => ap_ready_INST_0_i_52_n_0
    );
ap_ready_INST_0_i_53: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(18),
      O => ap_ready_INST_0_i_53_n_0
    );
ap_ready_INST_0_i_54: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(17),
      O => ap_ready_INST_0_i_54_n_0
    );
ap_ready_INST_0_i_55: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(16),
      O => ap_ready_INST_0_i_55_n_0
    );
ap_ready_INST_0_i_56: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(15),
      O => ap_ready_INST_0_i_56_n_0
    );
ap_ready_INST_0_i_57: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(14),
      O => ap_ready_INST_0_i_57_n_0
    );
ap_ready_INST_0_i_58: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(13),
      O => ap_ready_INST_0_i_58_n_0
    );
ap_ready_INST_0_i_59: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(12),
      O => ap_ready_INST_0_i_59_n_0
    );
ap_ready_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(26),
      I1 => data_count_reg(26),
      I2 => data_count_reg(27),
      I3 => tmp_fu_169_p2(27),
      O => ap_ready_INST_0_i_6_n_0
    );
ap_ready_INST_0_i_60: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(11),
      O => ap_ready_INST_0_i_60_n_0
    );
ap_ready_INST_0_i_61: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(10),
      O => ap_ready_INST_0_i_61_n_0
    );
ap_ready_INST_0_i_62: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(9),
      O => ap_ready_INST_0_i_62_n_0
    );
ap_ready_INST_0_i_63: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(8),
      O => ap_ready_INST_0_i_63_n_0
    );
ap_ready_INST_0_i_64: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(7),
      O => ap_ready_INST_0_i_64_n_0
    );
ap_ready_INST_0_i_65: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(6),
      O => ap_ready_INST_0_i_65_n_0
    );
ap_ready_INST_0_i_66: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(5),
      O => ap_ready_INST_0_i_66_n_0
    );
ap_ready_INST_0_i_67: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(4),
      O => ap_ready_INST_0_i_67_n_0
    );
ap_ready_INST_0_i_68: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(3),
      O => ap_ready_INST_0_i_68_n_0
    );
ap_ready_INST_0_i_69: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(2),
      O => ap_ready_INST_0_i_69_n_0
    );
ap_ready_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(24),
      I1 => data_count_reg(24),
      I2 => data_count_reg(25),
      I3 => tmp_fu_169_p2(25),
      O => ap_ready_INST_0_i_7_n_0
    );
ap_ready_INST_0_i_70: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_period(1),
      O => ap_ready_INST_0_i_70_n_0
    );
ap_ready_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(22),
      I1 => data_count_reg(22),
      I2 => data_count_reg(23),
      I3 => tmp_fu_169_p2(23),
      O => ap_ready_INST_0_i_8_n_0
    );
ap_ready_INST_0_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_fu_169_p2(20),
      I1 => data_count_reg(20),
      I2 => data_count_reg(21),
      I3 => tmp_fu_169_p2(21),
      O => ap_ready_INST_0_i_9_n_0
    );
ap_reg_ioackin_dataOut_TREADY_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA020000"
    )
        port map (
      I0 => ap_rst_n,
      I1 => tmp_5_fu_205_p2,
      I2 => tmp_3_fu_199_p2,
      I3 => ap_reg_ioackin_dataOut_TREADY_i_2_n_0,
      I4 => p_0_in(0),
      O => ap_reg_ioackin_dataOut_TREADY_i_1_n_0
    );
ap_reg_ioackin_dataOut_TREADY_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => ap_start,
      I1 => enable,
      I2 => tmp_1_fu_175_p2,
      O => ap_reg_ioackin_dataOut_TREADY_i_2_n_0
    );
ap_reg_ioackin_dataOut_TREADY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_reg_ioackin_dataOut_TREADY_i_1_n_0,
      Q => p_0_in(0),
      R => '0'
    );
\dataOut_TDATA[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(0),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(0),
      I4 => init_data_reg(0),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(0)
    );
\dataOut_TDATA[10]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(10),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(10),
      I4 => init_data_reg(10),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(10)
    );
\dataOut_TDATA[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(11),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(11),
      I4 => init_data_reg(11),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(11)
    );
\dataOut_TDATA[12]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(12),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(12),
      I4 => init_data_reg(12),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(12)
    );
\dataOut_TDATA[13]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(13),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(13),
      I4 => init_data_reg(13),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(13)
    );
\dataOut_TDATA[14]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(14),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(14),
      I4 => init_data_reg(14),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(14)
    );
\dataOut_TDATA[15]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(15),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(15),
      I4 => init_data_reg(15),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(15)
    );
\dataOut_TDATA[16]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(16),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(16),
      I4 => init_data_reg(16),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(16)
    );
\dataOut_TDATA[17]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(17),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(17),
      I4 => init_data_reg(17),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(17)
    );
\dataOut_TDATA[18]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(18),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(18),
      I4 => init_data_reg(18),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(18)
    );
\dataOut_TDATA[19]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(19),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(19),
      I4 => init_data_reg(19),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(19)
    );
\dataOut_TDATA[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(1),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(1),
      I4 => init_data_reg(1),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(1)
    );
\dataOut_TDATA[20]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(20),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(20),
      I4 => init_data_reg(20),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(20)
    );
\dataOut_TDATA[21]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(21),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(21),
      I4 => init_data_reg(21),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(21)
    );
\dataOut_TDATA[22]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(22),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(22),
      I4 => init_data_reg(22),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(22)
    );
\dataOut_TDATA[23]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(23),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(23),
      I4 => init_data_reg(23),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(23)
    );
\dataOut_TDATA[24]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(24),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(24),
      I4 => init_data_reg(24),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(24)
    );
\dataOut_TDATA[25]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(25),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(25),
      I4 => init_data_reg(25),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(25)
    );
\dataOut_TDATA[26]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(26),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(26),
      I4 => init_data_reg(26),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(26)
    );
\dataOut_TDATA[27]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(27),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(27),
      I4 => init_data_reg(27),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(27)
    );
\dataOut_TDATA[28]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(28),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(28),
      I4 => init_data_reg(28),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(28)
    );
\dataOut_TDATA[29]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(29),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(29),
      I4 => init_data_reg(29),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(29)
    );
\dataOut_TDATA[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(2),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(2),
      I4 => init_data_reg(2),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(2)
    );
\dataOut_TDATA[30]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(30),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(30),
      I4 => init_data_reg(30),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(30)
    );
\dataOut_TDATA[31]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(31),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(31),
      I4 => init_data_reg(31),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(31)
    );
\dataOut_TDATA[31]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => tmp_4_fu_211_p2,
      I1 => tmp_3_fu_199_p2,
      I2 => ap_start,
      I3 => enable,
      I4 => tmp_1_fu_175_p2,
      O => \dataOut_TDATA[31]_INST_0_i_1_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(24),
      I1 => data_count_reg(24),
      I2 => data_count_reg(25),
      I3 => preamble_length(25),
      O => \dataOut_TDATA[31]_INST_0_i_10_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(22),
      I1 => data_count_reg(22),
      I2 => data_count_reg(23),
      I3 => preamble_length(23),
      O => \dataOut_TDATA[31]_INST_0_i_11_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(20),
      I1 => data_count_reg(20),
      I2 => data_count_reg(21),
      I3 => preamble_length(21),
      O => \dataOut_TDATA[31]_INST_0_i_12_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(18),
      I1 => data_count_reg(18),
      I2 => data_count_reg(19),
      I3 => preamble_length(19),
      O => \dataOut_TDATA[31]_INST_0_i_13_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(16),
      I1 => data_count_reg(16),
      I2 => data_count_reg(17),
      I3 => preamble_length(17),
      O => \dataOut_TDATA[31]_INST_0_i_14_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => preamble_length(31),
      I1 => data_count_reg(31),
      I2 => preamble_length(30),
      I3 => data_count_reg(30),
      O => \dataOut_TDATA[31]_INST_0_i_15_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => preamble_length(29),
      I1 => data_count_reg(29),
      I2 => preamble_length(28),
      I3 => data_count_reg(28),
      O => \dataOut_TDATA[31]_INST_0_i_16_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(27),
      I1 => preamble_length(27),
      I2 => data_count_reg(26),
      I3 => preamble_length(26),
      O => \dataOut_TDATA[31]_INST_0_i_17_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(25),
      I1 => preamble_length(25),
      I2 => data_count_reg(24),
      I3 => preamble_length(24),
      O => \dataOut_TDATA[31]_INST_0_i_18_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => preamble_length(23),
      I1 => data_count_reg(23),
      I2 => preamble_length(22),
      I3 => data_count_reg(22),
      O => \dataOut_TDATA[31]_INST_0_i_19_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => tmp_4_fu_211_p2,
      I1 => tmp_6_fu_217_p2,
      I2 => tmp_3_fu_199_p2,
      I3 => ap_start,
      I4 => enable,
      I5 => tmp_1_fu_175_p2,
      O => \dataOut_TDATA[31]_INST_0_i_2_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(21),
      I1 => preamble_length(21),
      I2 => data_count_reg(20),
      I3 => preamble_length(20),
      O => \dataOut_TDATA[31]_INST_0_i_20_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(19),
      I1 => preamble_length(19),
      I2 => data_count_reg(18),
      I3 => preamble_length(18),
      O => \dataOut_TDATA[31]_INST_0_i_21_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_22\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => preamble_length(17),
      I1 => data_count_reg(17),
      I2 => preamble_length(16),
      I3 => data_count_reg(16),
      O => \dataOut_TDATA[31]_INST_0_i_22_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_23\: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => \dataOut_TDATA[31]_INST_0_i_23_n_0\,
      CO(6) => \dataOut_TDATA[31]_INST_0_i_23_n_1\,
      CO(5) => \dataOut_TDATA[31]_INST_0_i_23_n_2\,
      CO(4) => \dataOut_TDATA[31]_INST_0_i_23_n_3\,
      CO(3) => \NLW_dataOut_TDATA[31]_INST_0_i_23_CO_UNCONNECTED\(3),
      CO(2) => \dataOut_TDATA[31]_INST_0_i_23_n_5\,
      CO(1) => \dataOut_TDATA[31]_INST_0_i_23_n_6\,
      CO(0) => \dataOut_TDATA[31]_INST_0_i_23_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \NLW_dataOut_TDATA[31]_INST_0_i_23_O_UNCONNECTED\(7 downto 0),
      S(7) => \dataOut_TDATA[31]_INST_0_i_43_n_0\,
      S(6) => \dataOut_TDATA[31]_INST_0_i_44_n_0\,
      S(5) => \dataOut_TDATA[31]_INST_0_i_45_n_0\,
      S(4) => \dataOut_TDATA[31]_INST_0_i_46_n_0\,
      S(3) => \dataOut_TDATA[31]_INST_0_i_47_n_0\,
      S(2) => \dataOut_TDATA[31]_INST_0_i_48_n_0\,
      S(1) => \dataOut_TDATA[31]_INST_0_i_49_n_0\,
      S(0) => \dataOut_TDATA[31]_INST_0_i_50_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_24\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => preamble_length(31),
      I1 => data_count_reg(31),
      I2 => preamble_length(30),
      I3 => data_count_reg(30),
      O => \dataOut_TDATA[31]_INST_0_i_24_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => data_count_reg(27),
      I1 => preamble_length(27),
      I2 => data_count_reg(28),
      I3 => preamble_length(28),
      I4 => data_count_reg(29),
      I5 => preamble_length(29),
      O => \dataOut_TDATA[31]_INST_0_i_25_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => preamble_length(26),
      I1 => data_count_reg(26),
      I2 => preamble_length(24),
      I3 => data_count_reg(24),
      I4 => data_count_reg(25),
      I5 => preamble_length(25),
      O => \dataOut_TDATA[31]_INST_0_i_26_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_27\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(14),
      I1 => data_count_reg(14),
      I2 => data_count_reg(15),
      I3 => preamble_length(15),
      O => \dataOut_TDATA[31]_INST_0_i_27_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_28\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(12),
      I1 => data_count_reg(12),
      I2 => data_count_reg(13),
      I3 => preamble_length(13),
      O => \dataOut_TDATA[31]_INST_0_i_28_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_29\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(10),
      I1 => data_count_reg(10),
      I2 => data_count_reg(11),
      I3 => preamble_length(11),
      O => \dataOut_TDATA[31]_INST_0_i_29_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => tmp_6_fu_217_p2,
      I1 => tmp_4_fu_211_p2,
      I2 => tmp_3_fu_199_p2,
      I3 => ap_start,
      I4 => enable,
      I5 => tmp_1_fu_175_p2,
      O => \dataOut_TDATA[31]_INST_0_i_3_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_30\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(8),
      I1 => data_count_reg(8),
      I2 => data_count_reg(9),
      I3 => preamble_length(9),
      O => \dataOut_TDATA[31]_INST_0_i_30_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_31\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(6),
      I1 => data_count_reg(6),
      I2 => data_count_reg(7),
      I3 => preamble_length(7),
      O => \dataOut_TDATA[31]_INST_0_i_31_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_32\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(4),
      I1 => data_count_reg(4),
      I2 => data_count_reg(5),
      I3 => preamble_length(5),
      O => \dataOut_TDATA[31]_INST_0_i_32_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_33\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(2),
      I1 => data_count_reg(2),
      I2 => data_count_reg(3),
      I3 => preamble_length(3),
      O => \dataOut_TDATA[31]_INST_0_i_33_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_34\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(0),
      I1 => data_count_reg(0),
      I2 => data_count_reg(1),
      I3 => preamble_length(1),
      O => \dataOut_TDATA[31]_INST_0_i_34_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_35\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(15),
      I1 => preamble_length(15),
      I2 => data_count_reg(14),
      I3 => preamble_length(14),
      O => \dataOut_TDATA[31]_INST_0_i_35_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_36\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(13),
      I1 => preamble_length(13),
      I2 => data_count_reg(12),
      I3 => preamble_length(12),
      O => \dataOut_TDATA[31]_INST_0_i_36_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_37\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => preamble_length(11),
      I1 => data_count_reg(11),
      I2 => preamble_length(10),
      I3 => data_count_reg(10),
      O => \dataOut_TDATA[31]_INST_0_i_37_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_38\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(9),
      I1 => preamble_length(9),
      I2 => data_count_reg(8),
      I3 => preamble_length(8),
      O => \dataOut_TDATA[31]_INST_0_i_38_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_39\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(7),
      I1 => preamble_length(7),
      I2 => data_count_reg(6),
      I3 => preamble_length(6),
      O => \dataOut_TDATA[31]_INST_0_i_39_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_4\: unisim.vcomponents.CARRY8
     port map (
      CI => \dataOut_TDATA[31]_INST_0_i_6_n_0\,
      CI_TOP => '0',
      CO(7) => tmp_4_fu_211_p2,
      CO(6) => \dataOut_TDATA[31]_INST_0_i_4_n_1\,
      CO(5) => \dataOut_TDATA[31]_INST_0_i_4_n_2\,
      CO(4) => \dataOut_TDATA[31]_INST_0_i_4_n_3\,
      CO(3) => \NLW_dataOut_TDATA[31]_INST_0_i_4_CO_UNCONNECTED\(3),
      CO(2) => \dataOut_TDATA[31]_INST_0_i_4_n_5\,
      CO(1) => \dataOut_TDATA[31]_INST_0_i_4_n_6\,
      CO(0) => \dataOut_TDATA[31]_INST_0_i_4_n_7\,
      DI(7) => \dataOut_TDATA[31]_INST_0_i_7_n_0\,
      DI(6) => \dataOut_TDATA[31]_INST_0_i_8_n_0\,
      DI(5) => \dataOut_TDATA[31]_INST_0_i_9_n_0\,
      DI(4) => \dataOut_TDATA[31]_INST_0_i_10_n_0\,
      DI(3) => \dataOut_TDATA[31]_INST_0_i_11_n_0\,
      DI(2) => \dataOut_TDATA[31]_INST_0_i_12_n_0\,
      DI(1) => \dataOut_TDATA[31]_INST_0_i_13_n_0\,
      DI(0) => \dataOut_TDATA[31]_INST_0_i_14_n_0\,
      O(7 downto 0) => \NLW_dataOut_TDATA[31]_INST_0_i_4_O_UNCONNECTED\(7 downto 0),
      S(7) => \dataOut_TDATA[31]_INST_0_i_15_n_0\,
      S(6) => \dataOut_TDATA[31]_INST_0_i_16_n_0\,
      S(5) => \dataOut_TDATA[31]_INST_0_i_17_n_0\,
      S(4) => \dataOut_TDATA[31]_INST_0_i_18_n_0\,
      S(3) => \dataOut_TDATA[31]_INST_0_i_19_n_0\,
      S(2) => \dataOut_TDATA[31]_INST_0_i_20_n_0\,
      S(1) => \dataOut_TDATA[31]_INST_0_i_21_n_0\,
      S(0) => \dataOut_TDATA[31]_INST_0_i_22_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_40\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => preamble_length(5),
      I1 => data_count_reg(5),
      I2 => preamble_length(4),
      I3 => data_count_reg(4),
      O => \dataOut_TDATA[31]_INST_0_i_40_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_41\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(3),
      I1 => preamble_length(3),
      I2 => data_count_reg(2),
      I3 => preamble_length(2),
      O => \dataOut_TDATA[31]_INST_0_i_41_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_42\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(1),
      I1 => preamble_length(1),
      I2 => data_count_reg(0),
      I3 => preamble_length(0),
      O => \dataOut_TDATA[31]_INST_0_i_42_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_43\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => data_count_reg(21),
      I1 => preamble_length(21),
      I2 => data_count_reg(22),
      I3 => preamble_length(22),
      I4 => data_count_reg(23),
      I5 => preamble_length(23),
      O => \dataOut_TDATA[31]_INST_0_i_43_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_44\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => preamble_length(20),
      I1 => data_count_reg(20),
      I2 => preamble_length(18),
      I3 => data_count_reg(18),
      I4 => data_count_reg(19),
      I5 => preamble_length(19),
      O => \dataOut_TDATA[31]_INST_0_i_44_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_45\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => data_count_reg(15),
      I1 => preamble_length(15),
      I2 => data_count_reg(16),
      I3 => preamble_length(16),
      I4 => data_count_reg(17),
      I5 => preamble_length(17),
      O => \dataOut_TDATA[31]_INST_0_i_45_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_46\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => preamble_length(14),
      I1 => data_count_reg(14),
      I2 => preamble_length(12),
      I3 => data_count_reg(12),
      I4 => data_count_reg(13),
      I5 => preamble_length(13),
      O => \dataOut_TDATA[31]_INST_0_i_46_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_47\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => data_count_reg(9),
      I1 => preamble_length(9),
      I2 => data_count_reg(10),
      I3 => preamble_length(10),
      I4 => data_count_reg(11),
      I5 => preamble_length(11),
      O => \dataOut_TDATA[31]_INST_0_i_47_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_48\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => preamble_length(8),
      I1 => data_count_reg(8),
      I2 => preamble_length(6),
      I3 => data_count_reg(6),
      I4 => data_count_reg(7),
      I5 => preamble_length(7),
      O => \dataOut_TDATA[31]_INST_0_i_48_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_49\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => data_count_reg(3),
      I1 => preamble_length(3),
      I2 => data_count_reg(4),
      I3 => preamble_length(4),
      I4 => data_count_reg(5),
      I5 => preamble_length(5),
      O => \dataOut_TDATA[31]_INST_0_i_49_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_5\: unisim.vcomponents.CARRY8
     port map (
      CI => \dataOut_TDATA[31]_INST_0_i_23_n_0\,
      CI_TOP => '0',
      CO(7 downto 3) => \NLW_dataOut_TDATA[31]_INST_0_i_5_CO_UNCONNECTED\(7 downto 3),
      CO(2) => tmp_6_fu_217_p2,
      CO(1) => \dataOut_TDATA[31]_INST_0_i_5_n_6\,
      CO(0) => \dataOut_TDATA[31]_INST_0_i_5_n_7\,
      DI(7 downto 3) => \NLW_dataOut_TDATA[31]_INST_0_i_5_DI_UNCONNECTED\(7 downto 3),
      DI(2 downto 0) => B"000",
      O(7 downto 0) => \NLW_dataOut_TDATA[31]_INST_0_i_5_O_UNCONNECTED\(7 downto 0),
      S(7 downto 3) => \NLW_dataOut_TDATA[31]_INST_0_i_5_S_UNCONNECTED\(7 downto 3),
      S(2) => \dataOut_TDATA[31]_INST_0_i_24_n_0\,
      S(1) => \dataOut_TDATA[31]_INST_0_i_25_n_0\,
      S(0) => \dataOut_TDATA[31]_INST_0_i_26_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_50\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => preamble_length(2),
      I1 => data_count_reg(2),
      I2 => preamble_length(0),
      I3 => data_count_reg(0),
      I4 => data_count_reg(1),
      I5 => preamble_length(1),
      O => \dataOut_TDATA[31]_INST_0_i_50_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_6\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \dataOut_TDATA[31]_INST_0_i_6_n_0\,
      CO(6) => \dataOut_TDATA[31]_INST_0_i_6_n_1\,
      CO(5) => \dataOut_TDATA[31]_INST_0_i_6_n_2\,
      CO(4) => \dataOut_TDATA[31]_INST_0_i_6_n_3\,
      CO(3) => \NLW_dataOut_TDATA[31]_INST_0_i_6_CO_UNCONNECTED\(3),
      CO(2) => \dataOut_TDATA[31]_INST_0_i_6_n_5\,
      CO(1) => \dataOut_TDATA[31]_INST_0_i_6_n_6\,
      CO(0) => \dataOut_TDATA[31]_INST_0_i_6_n_7\,
      DI(7) => \dataOut_TDATA[31]_INST_0_i_27_n_0\,
      DI(6) => \dataOut_TDATA[31]_INST_0_i_28_n_0\,
      DI(5) => \dataOut_TDATA[31]_INST_0_i_29_n_0\,
      DI(4) => \dataOut_TDATA[31]_INST_0_i_30_n_0\,
      DI(3) => \dataOut_TDATA[31]_INST_0_i_31_n_0\,
      DI(2) => \dataOut_TDATA[31]_INST_0_i_32_n_0\,
      DI(1) => \dataOut_TDATA[31]_INST_0_i_33_n_0\,
      DI(0) => \dataOut_TDATA[31]_INST_0_i_34_n_0\,
      O(7 downto 0) => \NLW_dataOut_TDATA[31]_INST_0_i_6_O_UNCONNECTED\(7 downto 0),
      S(7) => \dataOut_TDATA[31]_INST_0_i_35_n_0\,
      S(6) => \dataOut_TDATA[31]_INST_0_i_36_n_0\,
      S(5) => \dataOut_TDATA[31]_INST_0_i_37_n_0\,
      S(4) => \dataOut_TDATA[31]_INST_0_i_38_n_0\,
      S(3) => \dataOut_TDATA[31]_INST_0_i_39_n_0\,
      S(2) => \dataOut_TDATA[31]_INST_0_i_40_n_0\,
      S(1) => \dataOut_TDATA[31]_INST_0_i_41_n_0\,
      S(0) => \dataOut_TDATA[31]_INST_0_i_42_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(30),
      I1 => data_count_reg(30),
      I2 => data_count_reg(31),
      I3 => preamble_length(31),
      O => \dataOut_TDATA[31]_INST_0_i_7_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(28),
      I1 => data_count_reg(28),
      I2 => data_count_reg(29),
      I3 => preamble_length(29),
      O => \dataOut_TDATA[31]_INST_0_i_8_n_0\
    );
\dataOut_TDATA[31]_INST_0_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => preamble_length(26),
      I1 => data_count_reg(26),
      I2 => data_count_reg(27),
      I3 => preamble_length(27),
      O => \dataOut_TDATA[31]_INST_0_i_9_n_0\
    );
\dataOut_TDATA[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(3),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(3),
      I4 => init_data_reg(3),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(3)
    );
\dataOut_TDATA[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(4),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(4),
      I4 => init_data_reg(4),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(4)
    );
\dataOut_TDATA[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(5),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(5),
      I4 => init_data_reg(5),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(5)
    );
\dataOut_TDATA[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(6),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(6),
      I4 => init_data_reg(6),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(6)
    );
\dataOut_TDATA[7]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(7),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(7),
      I4 => init_data_reg(7),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(7)
    );
\dataOut_TDATA[8]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(8),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(8),
      I4 => init_data_reg(8),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(8)
    );
\dataOut_TDATA[9]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888FFFFF888F888"
    )
        port map (
      I0 => \dataOut_TDATA[31]_INST_0_i_1_n_0\,
      I1 => preamble(9),
      I2 => \dataOut_TDATA[31]_INST_0_i_2_n_0\,
      I3 => delimiter(9),
      I4 => init_data_reg(9),
      I5 => \dataOut_TDATA[31]_INST_0_i_3_n_0\,
      O => dataOut_TDATA(9)
    );
\dataOut_TLAST[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => tmp_3_fu_199_p2,
      I1 => tmp_5_fu_205_p2,
      I2 => tmp_1_fu_175_p2,
      I3 => enable,
      I4 => ap_start,
      O => dataOut_TLAST(0)
    );
dataOut_TVALID_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5400000000000000"
    )
        port map (
      I0 => p_0_in(0),
      I1 => tmp_5_fu_205_p2,
      I2 => tmp_3_fu_199_p2,
      I3 => tmp_1_fu_175_p2,
      I4 => enable,
      I5 => ap_start,
      O => dataOut_TVALID
    );
dataOut_TVALID_INST_0_i_1: unisim.vcomponents.CARRY8
     port map (
      CI => dataOut_TVALID_INST_0_i_3_n_0,
      CI_TOP => '0',
      CO(7 downto 3) => NLW_dataOut_TVALID_INST_0_i_1_CO_UNCONNECTED(7 downto 3),
      CO(2) => tmp_5_fu_205_p2,
      CO(1) => dataOut_TVALID_INST_0_i_1_n_6,
      CO(0) => dataOut_TVALID_INST_0_i_1_n_7,
      DI(7 downto 3) => NLW_dataOut_TVALID_INST_0_i_1_DI_UNCONNECTED(7 downto 3),
      DI(2 downto 0) => B"000",
      O(7 downto 0) => NLW_dataOut_TVALID_INST_0_i_1_O_UNCONNECTED(7 downto 0),
      S(7 downto 3) => NLW_dataOut_TVALID_INST_0_i_1_S_UNCONNECTED(7 downto 3),
      S(2) => dataOut_TVALID_INST_0_i_4_n_0,
      S(1) => dataOut_TVALID_INST_0_i_5_n_0,
      S(0) => dataOut_TVALID_INST_0_i_6_n_0
    );
dataOut_TVALID_INST_0_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(26),
      I1 => data_count_reg(26),
      I2 => data_count_reg(27),
      I3 => tmp_2_fu_193_p2(27),
      O => dataOut_TVALID_INST_0_i_10_n_0
    );
dataOut_TVALID_INST_0_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(24),
      I1 => data_count_reg(24),
      I2 => data_count_reg(25),
      I3 => tmp_2_fu_193_p2(25),
      O => dataOut_TVALID_INST_0_i_11_n_0
    );
dataOut_TVALID_INST_0_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(22),
      I1 => data_count_reg(22),
      I2 => data_count_reg(23),
      I3 => tmp_2_fu_193_p2(23),
      O => dataOut_TVALID_INST_0_i_12_n_0
    );
dataOut_TVALID_INST_0_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(20),
      I1 => data_count_reg(20),
      I2 => data_count_reg(21),
      I3 => tmp_2_fu_193_p2(21),
      O => dataOut_TVALID_INST_0_i_13_n_0
    );
dataOut_TVALID_INST_0_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(18),
      I1 => data_count_reg(18),
      I2 => data_count_reg(19),
      I3 => tmp_2_fu_193_p2(19),
      O => dataOut_TVALID_INST_0_i_14_n_0
    );
dataOut_TVALID_INST_0_i_15: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(16),
      I1 => data_count_reg(16),
      I2 => data_count_reg(17),
      I3 => tmp_2_fu_193_p2(17),
      O => dataOut_TVALID_INST_0_i_15_n_0
    );
dataOut_TVALID_INST_0_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(31),
      I1 => data_count_reg(31),
      I2 => tmp_2_fu_193_p2(30),
      I3 => data_count_reg(30),
      O => dataOut_TVALID_INST_0_i_16_n_0
    );
dataOut_TVALID_INST_0_i_17: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(29),
      I1 => tmp_2_fu_193_p2(29),
      I2 => data_count_reg(28),
      I3 => tmp_2_fu_193_p2(28),
      O => dataOut_TVALID_INST_0_i_17_n_0
    );
dataOut_TVALID_INST_0_i_18: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(26),
      I1 => tmp_2_fu_193_p2(26),
      I2 => data_count_reg(27),
      I3 => tmp_2_fu_193_p2(27),
      O => dataOut_TVALID_INST_0_i_18_n_0
    );
dataOut_TVALID_INST_0_i_19: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(25),
      I1 => data_count_reg(25),
      I2 => tmp_2_fu_193_p2(24),
      I3 => data_count_reg(24),
      O => dataOut_TVALID_INST_0_i_19_n_0
    );
dataOut_TVALID_INST_0_i_2: unisim.vcomponents.CARRY8
     port map (
      CI => dataOut_TVALID_INST_0_i_7_n_0,
      CI_TOP => '0',
      CO(7) => tmp_3_fu_199_p2,
      CO(6) => dataOut_TVALID_INST_0_i_2_n_1,
      CO(5) => dataOut_TVALID_INST_0_i_2_n_2,
      CO(4) => dataOut_TVALID_INST_0_i_2_n_3,
      CO(3) => NLW_dataOut_TVALID_INST_0_i_2_CO_UNCONNECTED(3),
      CO(2) => dataOut_TVALID_INST_0_i_2_n_5,
      CO(1) => dataOut_TVALID_INST_0_i_2_n_6,
      CO(0) => dataOut_TVALID_INST_0_i_2_n_7,
      DI(7) => dataOut_TVALID_INST_0_i_8_n_0,
      DI(6) => dataOut_TVALID_INST_0_i_9_n_0,
      DI(5) => dataOut_TVALID_INST_0_i_10_n_0,
      DI(4) => dataOut_TVALID_INST_0_i_11_n_0,
      DI(3) => dataOut_TVALID_INST_0_i_12_n_0,
      DI(2) => dataOut_TVALID_INST_0_i_13_n_0,
      DI(1) => dataOut_TVALID_INST_0_i_14_n_0,
      DI(0) => dataOut_TVALID_INST_0_i_15_n_0,
      O(7 downto 0) => NLW_dataOut_TVALID_INST_0_i_2_O_UNCONNECTED(7 downto 0),
      S(7) => dataOut_TVALID_INST_0_i_16_n_0,
      S(6) => dataOut_TVALID_INST_0_i_17_n_0,
      S(5) => dataOut_TVALID_INST_0_i_18_n_0,
      S(4) => dataOut_TVALID_INST_0_i_19_n_0,
      S(3) => dataOut_TVALID_INST_0_i_20_n_0,
      S(2) => dataOut_TVALID_INST_0_i_21_n_0,
      S(1) => dataOut_TVALID_INST_0_i_22_n_0,
      S(0) => dataOut_TVALID_INST_0_i_23_n_0
    );
dataOut_TVALID_INST_0_i_20: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(23),
      I1 => tmp_2_fu_193_p2(23),
      I2 => data_count_reg(22),
      I3 => tmp_2_fu_193_p2(22),
      O => dataOut_TVALID_INST_0_i_20_n_0
    );
dataOut_TVALID_INST_0_i_21: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(20),
      I1 => tmp_2_fu_193_p2(20),
      I2 => data_count_reg(21),
      I3 => tmp_2_fu_193_p2(21),
      O => dataOut_TVALID_INST_0_i_21_n_0
    );
dataOut_TVALID_INST_0_i_22: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(19),
      I1 => data_count_reg(19),
      I2 => tmp_2_fu_193_p2(18),
      I3 => data_count_reg(18),
      O => dataOut_TVALID_INST_0_i_22_n_0
    );
dataOut_TVALID_INST_0_i_23: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(17),
      I1 => tmp_2_fu_193_p2(17),
      I2 => data_count_reg(16),
      I3 => tmp_2_fu_193_p2(16),
      O => dataOut_TVALID_INST_0_i_23_n_0
    );
dataOut_TVALID_INST_0_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(22),
      I1 => data_count_reg(22),
      I2 => tmp_2_fu_193_p2(23),
      I3 => data_count_reg(23),
      I4 => data_count_reg(21),
      I5 => tmp_2_fu_193_p2(21),
      O => dataOut_TVALID_INST_0_i_24_n_0
    );
dataOut_TVALID_INST_0_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => data_count_reg(20),
      I1 => tmp_2_fu_193_p2(20),
      I2 => data_count_reg(18),
      I3 => tmp_2_fu_193_p2(18),
      I4 => data_count_reg(19),
      I5 => tmp_2_fu_193_p2(19),
      O => dataOut_TVALID_INST_0_i_25_n_0
    );
dataOut_TVALID_INST_0_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(15),
      I1 => data_count_reg(15),
      I2 => tmp_2_fu_193_p2(16),
      I3 => data_count_reg(16),
      I4 => data_count_reg(17),
      I5 => tmp_2_fu_193_p2(17),
      O => dataOut_TVALID_INST_0_i_26_n_0
    );
dataOut_TVALID_INST_0_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => data_count_reg(14),
      I1 => tmp_2_fu_193_p2(14),
      I2 => data_count_reg(12),
      I3 => tmp_2_fu_193_p2(12),
      I4 => data_count_reg(13),
      I5 => tmp_2_fu_193_p2(13),
      O => dataOut_TVALID_INST_0_i_27_n_0
    );
dataOut_TVALID_INST_0_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(10),
      I1 => data_count_reg(10),
      I2 => tmp_2_fu_193_p2(11),
      I3 => data_count_reg(11),
      I4 => data_count_reg(9),
      I5 => tmp_2_fu_193_p2(9),
      O => dataOut_TVALID_INST_0_i_28_n_0
    );
dataOut_TVALID_INST_0_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => data_count_reg(8),
      I1 => tmp_2_fu_193_p2(8),
      I2 => data_count_reg(6),
      I3 => tmp_2_fu_193_p2(6),
      I4 => data_count_reg(7),
      I5 => tmp_2_fu_193_p2(7),
      O => dataOut_TVALID_INST_0_i_29_n_0
    );
dataOut_TVALID_INST_0_i_3: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => dataOut_TVALID_INST_0_i_3_n_0,
      CO(6) => dataOut_TVALID_INST_0_i_3_n_1,
      CO(5) => dataOut_TVALID_INST_0_i_3_n_2,
      CO(4) => dataOut_TVALID_INST_0_i_3_n_3,
      CO(3) => NLW_dataOut_TVALID_INST_0_i_3_CO_UNCONNECTED(3),
      CO(2) => dataOut_TVALID_INST_0_i_3_n_5,
      CO(1) => dataOut_TVALID_INST_0_i_3_n_6,
      CO(0) => dataOut_TVALID_INST_0_i_3_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => NLW_dataOut_TVALID_INST_0_i_3_O_UNCONNECTED(7 downto 0),
      S(7) => dataOut_TVALID_INST_0_i_24_n_0,
      S(6) => dataOut_TVALID_INST_0_i_25_n_0,
      S(5) => dataOut_TVALID_INST_0_i_26_n_0,
      S(4) => dataOut_TVALID_INST_0_i_27_n_0,
      S(3) => dataOut_TVALID_INST_0_i_28_n_0,
      S(2) => dataOut_TVALID_INST_0_i_29_n_0,
      S(1) => dataOut_TVALID_INST_0_i_30_n_0,
      S(0) => dataOut_TVALID_INST_0_i_31_n_0
    );
dataOut_TVALID_INST_0_i_30: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(4),
      I1 => data_count_reg(4),
      I2 => tmp_2_fu_193_p2(5),
      I3 => data_count_reg(5),
      I4 => data_count_reg(3),
      I5 => tmp_2_fu_193_p2(3),
      O => dataOut_TVALID_INST_0_i_30_n_0
    );
dataOut_TVALID_INST_0_i_31: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000900990090000"
    )
        port map (
      I0 => data_count_reg(2),
      I1 => tmp_2_fu_193_p2(2),
      I2 => data_count_reg(1),
      I3 => tmp_2_fu_193_p2(1),
      I4 => data_count_reg(0),
      I5 => burst_length(0),
      O => dataOut_TVALID_INST_0_i_31_n_0
    );
dataOut_TVALID_INST_0_i_32: unisim.vcomponents.CARRY8
     port map (
      CI => dataOut_TVALID_INST_0_i_33_n_0,
      CI_TOP => '0',
      CO(7 downto 6) => NLW_dataOut_TVALID_INST_0_i_32_CO_UNCONNECTED(7 downto 6),
      CO(5) => dataOut_TVALID_INST_0_i_32_n_2,
      CO(4) => dataOut_TVALID_INST_0_i_32_n_3,
      CO(3) => NLW_dataOut_TVALID_INST_0_i_32_CO_UNCONNECTED(3),
      CO(2) => dataOut_TVALID_INST_0_i_32_n_5,
      CO(1) => dataOut_TVALID_INST_0_i_32_n_6,
      CO(0) => dataOut_TVALID_INST_0_i_32_n_7,
      DI(7) => NLW_dataOut_TVALID_INST_0_i_32_DI_UNCONNECTED(7),
      DI(6) => '0',
      DI(5 downto 0) => burst_length(30 downto 25),
      O(7) => NLW_dataOut_TVALID_INST_0_i_32_O_UNCONNECTED(7),
      O(6 downto 0) => tmp_2_fu_193_p2(31 downto 25),
      S(7) => NLW_dataOut_TVALID_INST_0_i_32_S_UNCONNECTED(7),
      S(6) => dataOut_TVALID_INST_0_i_52_n_0,
      S(5) => dataOut_TVALID_INST_0_i_53_n_0,
      S(4) => dataOut_TVALID_INST_0_i_54_n_0,
      S(3) => dataOut_TVALID_INST_0_i_55_n_0,
      S(2) => dataOut_TVALID_INST_0_i_56_n_0,
      S(1) => dataOut_TVALID_INST_0_i_57_n_0,
      S(0) => dataOut_TVALID_INST_0_i_58_n_0
    );
dataOut_TVALID_INST_0_i_33: unisim.vcomponents.CARRY8
     port map (
      CI => dataOut_TVALID_INST_0_i_50_n_0,
      CI_TOP => '0',
      CO(7) => dataOut_TVALID_INST_0_i_33_n_0,
      CO(6) => dataOut_TVALID_INST_0_i_33_n_1,
      CO(5) => dataOut_TVALID_INST_0_i_33_n_2,
      CO(4) => dataOut_TVALID_INST_0_i_33_n_3,
      CO(3) => NLW_dataOut_TVALID_INST_0_i_33_CO_UNCONNECTED(3),
      CO(2) => dataOut_TVALID_INST_0_i_33_n_5,
      CO(1) => dataOut_TVALID_INST_0_i_33_n_6,
      CO(0) => dataOut_TVALID_INST_0_i_33_n_7,
      DI(7 downto 0) => burst_length(24 downto 17),
      O(7 downto 0) => tmp_2_fu_193_p2(24 downto 17),
      S(7) => dataOut_TVALID_INST_0_i_59_n_0,
      S(6) => dataOut_TVALID_INST_0_i_60_n_0,
      S(5) => dataOut_TVALID_INST_0_i_61_n_0,
      S(4) => dataOut_TVALID_INST_0_i_62_n_0,
      S(3) => dataOut_TVALID_INST_0_i_63_n_0,
      S(2) => dataOut_TVALID_INST_0_i_64_n_0,
      S(1) => dataOut_TVALID_INST_0_i_65_n_0,
      S(0) => dataOut_TVALID_INST_0_i_66_n_0
    );
dataOut_TVALID_INST_0_i_34: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(14),
      I1 => data_count_reg(14),
      I2 => data_count_reg(15),
      I3 => tmp_2_fu_193_p2(15),
      O => dataOut_TVALID_INST_0_i_34_n_0
    );
dataOut_TVALID_INST_0_i_35: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(12),
      I1 => data_count_reg(12),
      I2 => data_count_reg(13),
      I3 => tmp_2_fu_193_p2(13),
      O => dataOut_TVALID_INST_0_i_35_n_0
    );
dataOut_TVALID_INST_0_i_36: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(10),
      I1 => data_count_reg(10),
      I2 => data_count_reg(11),
      I3 => tmp_2_fu_193_p2(11),
      O => dataOut_TVALID_INST_0_i_36_n_0
    );
dataOut_TVALID_INST_0_i_37: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(8),
      I1 => data_count_reg(8),
      I2 => data_count_reg(9),
      I3 => tmp_2_fu_193_p2(9),
      O => dataOut_TVALID_INST_0_i_37_n_0
    );
dataOut_TVALID_INST_0_i_38: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(6),
      I1 => data_count_reg(6),
      I2 => data_count_reg(7),
      I3 => tmp_2_fu_193_p2(7),
      O => dataOut_TVALID_INST_0_i_38_n_0
    );
dataOut_TVALID_INST_0_i_39: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(4),
      I1 => data_count_reg(4),
      I2 => data_count_reg(5),
      I3 => tmp_2_fu_193_p2(5),
      O => dataOut_TVALID_INST_0_i_39_n_0
    );
dataOut_TVALID_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(31),
      I1 => data_count_reg(31),
      I2 => tmp_2_fu_193_p2(30),
      I3 => data_count_reg(30),
      O => dataOut_TVALID_INST_0_i_4_n_0
    );
dataOut_TVALID_INST_0_i_40: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(2),
      I1 => data_count_reg(2),
      I2 => data_count_reg(3),
      I3 => tmp_2_fu_193_p2(3),
      O => dataOut_TVALID_INST_0_i_40_n_0
    );
dataOut_TVALID_INST_0_i_41: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F01"
    )
        port map (
      I0 => burst_length(0),
      I1 => data_count_reg(0),
      I2 => data_count_reg(1),
      I3 => tmp_2_fu_193_p2(1),
      O => dataOut_TVALID_INST_0_i_41_n_0
    );
dataOut_TVALID_INST_0_i_42: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(14),
      I1 => tmp_2_fu_193_p2(14),
      I2 => data_count_reg(15),
      I3 => tmp_2_fu_193_p2(15),
      O => dataOut_TVALID_INST_0_i_42_n_0
    );
dataOut_TVALID_INST_0_i_43: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(13),
      I1 => data_count_reg(13),
      I2 => tmp_2_fu_193_p2(12),
      I3 => data_count_reg(12),
      O => dataOut_TVALID_INST_0_i_43_n_0
    );
dataOut_TVALID_INST_0_i_44: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(11),
      I1 => tmp_2_fu_193_p2(11),
      I2 => data_count_reg(10),
      I3 => tmp_2_fu_193_p2(10),
      O => dataOut_TVALID_INST_0_i_44_n_0
    );
dataOut_TVALID_INST_0_i_45: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(8),
      I1 => tmp_2_fu_193_p2(8),
      I2 => data_count_reg(9),
      I3 => tmp_2_fu_193_p2(9),
      O => dataOut_TVALID_INST_0_i_45_n_0
    );
dataOut_TVALID_INST_0_i_46: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(7),
      I1 => data_count_reg(7),
      I2 => tmp_2_fu_193_p2(6),
      I3 => data_count_reg(6),
      O => dataOut_TVALID_INST_0_i_46_n_0
    );
dataOut_TVALID_INST_0_i_47: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(5),
      I1 => tmp_2_fu_193_p2(5),
      I2 => data_count_reg(4),
      I3 => tmp_2_fu_193_p2(4),
      O => dataOut_TVALID_INST_0_i_47_n_0
    );
dataOut_TVALID_INST_0_i_48: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => data_count_reg(2),
      I1 => tmp_2_fu_193_p2(2),
      I2 => data_count_reg(3),
      I3 => tmp_2_fu_193_p2(3),
      O => dataOut_TVALID_INST_0_i_48_n_0
    );
dataOut_TVALID_INST_0_i_49: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6006"
    )
        port map (
      I0 => burst_length(0),
      I1 => data_count_reg(0),
      I2 => tmp_2_fu_193_p2(1),
      I3 => data_count_reg(1),
      O => dataOut_TVALID_INST_0_i_49_n_0
    );
dataOut_TVALID_INST_0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => tmp_2_fu_193_p2(28),
      I1 => data_count_reg(28),
      I2 => tmp_2_fu_193_p2(29),
      I3 => data_count_reg(29),
      I4 => data_count_reg(27),
      I5 => tmp_2_fu_193_p2(27),
      O => dataOut_TVALID_INST_0_i_5_n_0
    );
dataOut_TVALID_INST_0_i_50: unisim.vcomponents.CARRY8
     port map (
      CI => dataOut_TVALID_INST_0_i_51_n_0,
      CI_TOP => '0',
      CO(7) => dataOut_TVALID_INST_0_i_50_n_0,
      CO(6) => dataOut_TVALID_INST_0_i_50_n_1,
      CO(5) => dataOut_TVALID_INST_0_i_50_n_2,
      CO(4) => dataOut_TVALID_INST_0_i_50_n_3,
      CO(3) => NLW_dataOut_TVALID_INST_0_i_50_CO_UNCONNECTED(3),
      CO(2) => dataOut_TVALID_INST_0_i_50_n_5,
      CO(1) => dataOut_TVALID_INST_0_i_50_n_6,
      CO(0) => dataOut_TVALID_INST_0_i_50_n_7,
      DI(7 downto 0) => burst_length(16 downto 9),
      O(7 downto 0) => tmp_2_fu_193_p2(16 downto 9),
      S(7) => dataOut_TVALID_INST_0_i_67_n_0,
      S(6) => dataOut_TVALID_INST_0_i_68_n_0,
      S(5) => dataOut_TVALID_INST_0_i_69_n_0,
      S(4) => dataOut_TVALID_INST_0_i_70_n_0,
      S(3) => dataOut_TVALID_INST_0_i_71_n_0,
      S(2) => dataOut_TVALID_INST_0_i_72_n_0,
      S(1) => dataOut_TVALID_INST_0_i_73_n_0,
      S(0) => dataOut_TVALID_INST_0_i_74_n_0
    );
dataOut_TVALID_INST_0_i_51: unisim.vcomponents.CARRY8
     port map (
      CI => burst_length(0),
      CI_TOP => '0',
      CO(7) => dataOut_TVALID_INST_0_i_51_n_0,
      CO(6) => dataOut_TVALID_INST_0_i_51_n_1,
      CO(5) => dataOut_TVALID_INST_0_i_51_n_2,
      CO(4) => dataOut_TVALID_INST_0_i_51_n_3,
      CO(3) => NLW_dataOut_TVALID_INST_0_i_51_CO_UNCONNECTED(3),
      CO(2) => dataOut_TVALID_INST_0_i_51_n_5,
      CO(1) => dataOut_TVALID_INST_0_i_51_n_6,
      CO(0) => dataOut_TVALID_INST_0_i_51_n_7,
      DI(7 downto 0) => burst_length(8 downto 1),
      O(7 downto 0) => tmp_2_fu_193_p2(8 downto 1),
      S(7) => dataOut_TVALID_INST_0_i_75_n_0,
      S(6) => dataOut_TVALID_INST_0_i_76_n_0,
      S(5) => dataOut_TVALID_INST_0_i_77_n_0,
      S(4) => dataOut_TVALID_INST_0_i_78_n_0,
      S(3) => dataOut_TVALID_INST_0_i_79_n_0,
      S(2) => dataOut_TVALID_INST_0_i_80_n_0,
      S(1) => dataOut_TVALID_INST_0_i_81_n_0,
      S(0) => dataOut_TVALID_INST_0_i_82_n_0
    );
dataOut_TVALID_INST_0_i_52: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(31),
      O => dataOut_TVALID_INST_0_i_52_n_0
    );
dataOut_TVALID_INST_0_i_53: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(30),
      O => dataOut_TVALID_INST_0_i_53_n_0
    );
dataOut_TVALID_INST_0_i_54: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(29),
      O => dataOut_TVALID_INST_0_i_54_n_0
    );
dataOut_TVALID_INST_0_i_55: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(28),
      O => dataOut_TVALID_INST_0_i_55_n_0
    );
dataOut_TVALID_INST_0_i_56: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(27),
      O => dataOut_TVALID_INST_0_i_56_n_0
    );
dataOut_TVALID_INST_0_i_57: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(26),
      O => dataOut_TVALID_INST_0_i_57_n_0
    );
dataOut_TVALID_INST_0_i_58: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(25),
      O => dataOut_TVALID_INST_0_i_58_n_0
    );
dataOut_TVALID_INST_0_i_59: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(24),
      O => dataOut_TVALID_INST_0_i_59_n_0
    );
dataOut_TVALID_INST_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => data_count_reg(26),
      I1 => tmp_2_fu_193_p2(26),
      I2 => data_count_reg(24),
      I3 => tmp_2_fu_193_p2(24),
      I4 => data_count_reg(25),
      I5 => tmp_2_fu_193_p2(25),
      O => dataOut_TVALID_INST_0_i_6_n_0
    );
dataOut_TVALID_INST_0_i_60: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(23),
      O => dataOut_TVALID_INST_0_i_60_n_0
    );
dataOut_TVALID_INST_0_i_61: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(22),
      O => dataOut_TVALID_INST_0_i_61_n_0
    );
dataOut_TVALID_INST_0_i_62: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(21),
      O => dataOut_TVALID_INST_0_i_62_n_0
    );
dataOut_TVALID_INST_0_i_63: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(20),
      O => dataOut_TVALID_INST_0_i_63_n_0
    );
dataOut_TVALID_INST_0_i_64: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(19),
      O => dataOut_TVALID_INST_0_i_64_n_0
    );
dataOut_TVALID_INST_0_i_65: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(18),
      O => dataOut_TVALID_INST_0_i_65_n_0
    );
dataOut_TVALID_INST_0_i_66: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(17),
      O => dataOut_TVALID_INST_0_i_66_n_0
    );
dataOut_TVALID_INST_0_i_67: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(16),
      O => dataOut_TVALID_INST_0_i_67_n_0
    );
dataOut_TVALID_INST_0_i_68: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(15),
      O => dataOut_TVALID_INST_0_i_68_n_0
    );
dataOut_TVALID_INST_0_i_69: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(14),
      O => dataOut_TVALID_INST_0_i_69_n_0
    );
dataOut_TVALID_INST_0_i_7: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => dataOut_TVALID_INST_0_i_7_n_0,
      CO(6) => dataOut_TVALID_INST_0_i_7_n_1,
      CO(5) => dataOut_TVALID_INST_0_i_7_n_2,
      CO(4) => dataOut_TVALID_INST_0_i_7_n_3,
      CO(3) => NLW_dataOut_TVALID_INST_0_i_7_CO_UNCONNECTED(3),
      CO(2) => dataOut_TVALID_INST_0_i_7_n_5,
      CO(1) => dataOut_TVALID_INST_0_i_7_n_6,
      CO(0) => dataOut_TVALID_INST_0_i_7_n_7,
      DI(7) => dataOut_TVALID_INST_0_i_34_n_0,
      DI(6) => dataOut_TVALID_INST_0_i_35_n_0,
      DI(5) => dataOut_TVALID_INST_0_i_36_n_0,
      DI(4) => dataOut_TVALID_INST_0_i_37_n_0,
      DI(3) => dataOut_TVALID_INST_0_i_38_n_0,
      DI(2) => dataOut_TVALID_INST_0_i_39_n_0,
      DI(1) => dataOut_TVALID_INST_0_i_40_n_0,
      DI(0) => dataOut_TVALID_INST_0_i_41_n_0,
      O(7 downto 0) => NLW_dataOut_TVALID_INST_0_i_7_O_UNCONNECTED(7 downto 0),
      S(7) => dataOut_TVALID_INST_0_i_42_n_0,
      S(6) => dataOut_TVALID_INST_0_i_43_n_0,
      S(5) => dataOut_TVALID_INST_0_i_44_n_0,
      S(4) => dataOut_TVALID_INST_0_i_45_n_0,
      S(3) => dataOut_TVALID_INST_0_i_46_n_0,
      S(2) => dataOut_TVALID_INST_0_i_47_n_0,
      S(1) => dataOut_TVALID_INST_0_i_48_n_0,
      S(0) => dataOut_TVALID_INST_0_i_49_n_0
    );
dataOut_TVALID_INST_0_i_70: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(13),
      O => dataOut_TVALID_INST_0_i_70_n_0
    );
dataOut_TVALID_INST_0_i_71: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(12),
      O => dataOut_TVALID_INST_0_i_71_n_0
    );
dataOut_TVALID_INST_0_i_72: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(11),
      O => dataOut_TVALID_INST_0_i_72_n_0
    );
dataOut_TVALID_INST_0_i_73: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(10),
      O => dataOut_TVALID_INST_0_i_73_n_0
    );
dataOut_TVALID_INST_0_i_74: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(9),
      O => dataOut_TVALID_INST_0_i_74_n_0
    );
dataOut_TVALID_INST_0_i_75: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(8),
      O => dataOut_TVALID_INST_0_i_75_n_0
    );
dataOut_TVALID_INST_0_i_76: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(7),
      O => dataOut_TVALID_INST_0_i_76_n_0
    );
dataOut_TVALID_INST_0_i_77: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(6),
      O => dataOut_TVALID_INST_0_i_77_n_0
    );
dataOut_TVALID_INST_0_i_78: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(5),
      O => dataOut_TVALID_INST_0_i_78_n_0
    );
dataOut_TVALID_INST_0_i_79: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(4),
      O => dataOut_TVALID_INST_0_i_79_n_0
    );
dataOut_TVALID_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(30),
      I1 => data_count_reg(30),
      I2 => data_count_reg(31),
      I3 => tmp_2_fu_193_p2(31),
      O => dataOut_TVALID_INST_0_i_8_n_0
    );
dataOut_TVALID_INST_0_i_80: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(3),
      O => dataOut_TVALID_INST_0_i_80_n_0
    );
dataOut_TVALID_INST_0_i_81: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(2),
      O => dataOut_TVALID_INST_0_i_81_n_0
    );
dataOut_TVALID_INST_0_i_82: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => burst_length(1),
      O => dataOut_TVALID_INST_0_i_82_n_0
    );
dataOut_TVALID_INST_0_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => tmp_2_fu_193_p2(28),
      I1 => data_count_reg(28),
      I2 => data_count_reg(29),
      I3 => tmp_2_fu_193_p2(29),
      O => dataOut_TVALID_INST_0_i_9_n_0
    );
\data_count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"40FF"
    )
        port map (
      I0 => tmp_1_fu_175_p2,
      I1 => enable,
      I2 => ap_start,
      I3 => ap_rst_n,
      O => \data_count[0]_i_1_n_0\
    );
\data_count[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFF000000000000"
    )
        port map (
      I0 => ap_ready_INST_0_i_2_n_0,
      I1 => dataOut_TREADY,
      I2 => p_0_in(0),
      I3 => tmp_1_fu_175_p2,
      I4 => ap_start,
      I5 => enable,
      O => ap_condition_184
    );
\data_count[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => data_count_reg(0),
      O => \data_count[0]_i_4_n_0\
    );
\data_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[0]_i_3_n_15\,
      Q => data_count_reg(0),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[0]_i_3\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \data_count_reg[0]_i_3_n_0\,
      CO(6) => \data_count_reg[0]_i_3_n_1\,
      CO(5) => \data_count_reg[0]_i_3_n_2\,
      CO(4) => \data_count_reg[0]_i_3_n_3\,
      CO(3) => \NLW_data_count_reg[0]_i_3_CO_UNCONNECTED\(3),
      CO(2) => \data_count_reg[0]_i_3_n_5\,
      CO(1) => \data_count_reg[0]_i_3_n_6\,
      CO(0) => \data_count_reg[0]_i_3_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \data_count_reg[0]_i_3_n_8\,
      O(6) => \data_count_reg[0]_i_3_n_9\,
      O(5) => \data_count_reg[0]_i_3_n_10\,
      O(4) => \data_count_reg[0]_i_3_n_11\,
      O(3) => \data_count_reg[0]_i_3_n_12\,
      O(2) => \data_count_reg[0]_i_3_n_13\,
      O(1) => \data_count_reg[0]_i_3_n_14\,
      O(0) => \data_count_reg[0]_i_3_n_15\,
      S(7 downto 1) => data_count_reg(7 downto 1),
      S(0) => \data_count[0]_i_4_n_0\
    );
\data_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[8]_i_1_n_13\,
      Q => data_count_reg(10),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[8]_i_1_n_12\,
      Q => data_count_reg(11),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[8]_i_1_n_11\,
      Q => data_count_reg(12),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[8]_i_1_n_10\,
      Q => data_count_reg(13),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[8]_i_1_n_9\,
      Q => data_count_reg(14),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[8]_i_1_n_8\,
      Q => data_count_reg(15),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[16]_i_1_n_15\,
      Q => data_count_reg(16),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \data_count_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \data_count_reg[16]_i_1_n_0\,
      CO(6) => \data_count_reg[16]_i_1_n_1\,
      CO(5) => \data_count_reg[16]_i_1_n_2\,
      CO(4) => \data_count_reg[16]_i_1_n_3\,
      CO(3) => \NLW_data_count_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \data_count_reg[16]_i_1_n_5\,
      CO(1) => \data_count_reg[16]_i_1_n_6\,
      CO(0) => \data_count_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \data_count_reg[16]_i_1_n_8\,
      O(6) => \data_count_reg[16]_i_1_n_9\,
      O(5) => \data_count_reg[16]_i_1_n_10\,
      O(4) => \data_count_reg[16]_i_1_n_11\,
      O(3) => \data_count_reg[16]_i_1_n_12\,
      O(2) => \data_count_reg[16]_i_1_n_13\,
      O(1) => \data_count_reg[16]_i_1_n_14\,
      O(0) => \data_count_reg[16]_i_1_n_15\,
      S(7 downto 0) => data_count_reg(23 downto 16)
    );
\data_count_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[16]_i_1_n_14\,
      Q => data_count_reg(17),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[16]_i_1_n_13\,
      Q => data_count_reg(18),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[16]_i_1_n_12\,
      Q => data_count_reg(19),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[0]_i_3_n_14\,
      Q => data_count_reg(1),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[16]_i_1_n_11\,
      Q => data_count_reg(20),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[16]_i_1_n_10\,
      Q => data_count_reg(21),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[16]_i_1_n_9\,
      Q => data_count_reg(22),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[16]_i_1_n_8\,
      Q => data_count_reg(23),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[24]_i_1_n_15\,
      Q => data_count_reg(24),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \data_count_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_data_count_reg[24]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \data_count_reg[24]_i_1_n_1\,
      CO(5) => \data_count_reg[24]_i_1_n_2\,
      CO(4) => \data_count_reg[24]_i_1_n_3\,
      CO(3) => \NLW_data_count_reg[24]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \data_count_reg[24]_i_1_n_5\,
      CO(1) => \data_count_reg[24]_i_1_n_6\,
      CO(0) => \data_count_reg[24]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \data_count_reg[24]_i_1_n_8\,
      O(6) => \data_count_reg[24]_i_1_n_9\,
      O(5) => \data_count_reg[24]_i_1_n_10\,
      O(4) => \data_count_reg[24]_i_1_n_11\,
      O(3) => \data_count_reg[24]_i_1_n_12\,
      O(2) => \data_count_reg[24]_i_1_n_13\,
      O(1) => \data_count_reg[24]_i_1_n_14\,
      O(0) => \data_count_reg[24]_i_1_n_15\,
      S(7 downto 0) => data_count_reg(31 downto 24)
    );
\data_count_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[24]_i_1_n_14\,
      Q => data_count_reg(25),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[24]_i_1_n_13\,
      Q => data_count_reg(26),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[24]_i_1_n_12\,
      Q => data_count_reg(27),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[24]_i_1_n_11\,
      Q => data_count_reg(28),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[24]_i_1_n_10\,
      Q => data_count_reg(29),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[0]_i_3_n_13\,
      Q => data_count_reg(2),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[24]_i_1_n_9\,
      Q => data_count_reg(30),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[24]_i_1_n_8\,
      Q => data_count_reg(31),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[0]_i_3_n_12\,
      Q => data_count_reg(3),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[0]_i_3_n_11\,
      Q => data_count_reg(4),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[0]_i_3_n_10\,
      Q => data_count_reg(5),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[0]_i_3_n_9\,
      Q => data_count_reg(6),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[0]_i_3_n_8\,
      Q => data_count_reg(7),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[8]_i_1_n_15\,
      Q => data_count_reg(8),
      R => \data_count[0]_i_1_n_0\
    );
\data_count_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \data_count_reg[0]_i_3_n_0\,
      CI_TOP => '0',
      CO(7) => \data_count_reg[8]_i_1_n_0\,
      CO(6) => \data_count_reg[8]_i_1_n_1\,
      CO(5) => \data_count_reg[8]_i_1_n_2\,
      CO(4) => \data_count_reg[8]_i_1_n_3\,
      CO(3) => \NLW_data_count_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \data_count_reg[8]_i_1_n_5\,
      CO(1) => \data_count_reg[8]_i_1_n_6\,
      CO(0) => \data_count_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \data_count_reg[8]_i_1_n_8\,
      O(6) => \data_count_reg[8]_i_1_n_9\,
      O(5) => \data_count_reg[8]_i_1_n_10\,
      O(4) => \data_count_reg[8]_i_1_n_11\,
      O(3) => \data_count_reg[8]_i_1_n_12\,
      O(2) => \data_count_reg[8]_i_1_n_13\,
      O(1) => \data_count_reg[8]_i_1_n_14\,
      O(0) => \data_count_reg[8]_i_1_n_15\,
      S(7 downto 0) => data_count_reg(15 downto 8)
    );
\data_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ap_condition_184,
      D => \data_count_reg[8]_i_1_n_14\,
      Q => data_count_reg(9),
      R => \data_count[0]_i_1_n_0\
    );
\init_data[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01010F00"
    )
        port map (
      I0 => tmp_4_fu_211_p2,
      I1 => tmp_6_fu_217_p2,
      I2 => \init_data[0]_i_3_n_0\,
      I3 => tmp_5_fu_205_p2,
      I4 => tmp_3_fu_199_p2,
      O => init_data0
    );
\init_data[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F7F7FFF"
    )
        port map (
      I0 => tmp_1_fu_175_p2,
      I1 => enable,
      I2 => ap_start,
      I3 => dataOut_TREADY,
      I4 => p_0_in(0),
      O => \init_data[0]_i_3_n_0\
    );
\init_data[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => init_data_reg(0),
      O => \init_data[0]_i_4_n_0\
    );
\init_data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[0]_i_2_n_15\,
      Q => init_data_reg(0),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \init_data_reg[0]_i_2_n_0\,
      CO(6) => \init_data_reg[0]_i_2_n_1\,
      CO(5) => \init_data_reg[0]_i_2_n_2\,
      CO(4) => \init_data_reg[0]_i_2_n_3\,
      CO(3) => \NLW_init_data_reg[0]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \init_data_reg[0]_i_2_n_5\,
      CO(1) => \init_data_reg[0]_i_2_n_6\,
      CO(0) => \init_data_reg[0]_i_2_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \init_data_reg[0]_i_2_n_8\,
      O(6) => \init_data_reg[0]_i_2_n_9\,
      O(5) => \init_data_reg[0]_i_2_n_10\,
      O(4) => \init_data_reg[0]_i_2_n_11\,
      O(3) => \init_data_reg[0]_i_2_n_12\,
      O(2) => \init_data_reg[0]_i_2_n_13\,
      O(1) => \init_data_reg[0]_i_2_n_14\,
      O(0) => \init_data_reg[0]_i_2_n_15\,
      S(7 downto 1) => init_data_reg(7 downto 1),
      S(0) => \init_data[0]_i_4_n_0\
    );
\init_data_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[8]_i_1_n_13\,
      Q => init_data_reg(10),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[8]_i_1_n_12\,
      Q => init_data_reg(11),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[8]_i_1_n_11\,
      Q => init_data_reg(12),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[8]_i_1_n_10\,
      Q => init_data_reg(13),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[8]_i_1_n_9\,
      Q => init_data_reg(14),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[8]_i_1_n_8\,
      Q => init_data_reg(15),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[16]_i_1_n_15\,
      Q => init_data_reg(16),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \init_data_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \init_data_reg[16]_i_1_n_0\,
      CO(6) => \init_data_reg[16]_i_1_n_1\,
      CO(5) => \init_data_reg[16]_i_1_n_2\,
      CO(4) => \init_data_reg[16]_i_1_n_3\,
      CO(3) => \NLW_init_data_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \init_data_reg[16]_i_1_n_5\,
      CO(1) => \init_data_reg[16]_i_1_n_6\,
      CO(0) => \init_data_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \init_data_reg[16]_i_1_n_8\,
      O(6) => \init_data_reg[16]_i_1_n_9\,
      O(5) => \init_data_reg[16]_i_1_n_10\,
      O(4) => \init_data_reg[16]_i_1_n_11\,
      O(3) => \init_data_reg[16]_i_1_n_12\,
      O(2) => \init_data_reg[16]_i_1_n_13\,
      O(1) => \init_data_reg[16]_i_1_n_14\,
      O(0) => \init_data_reg[16]_i_1_n_15\,
      S(7 downto 0) => init_data_reg(23 downto 16)
    );
\init_data_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[16]_i_1_n_14\,
      Q => init_data_reg(17),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[16]_i_1_n_13\,
      Q => init_data_reg(18),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[16]_i_1_n_12\,
      Q => init_data_reg(19),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[0]_i_2_n_14\,
      Q => init_data_reg(1),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[16]_i_1_n_11\,
      Q => init_data_reg(20),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[16]_i_1_n_10\,
      Q => init_data_reg(21),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[16]_i_1_n_9\,
      Q => init_data_reg(22),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[16]_i_1_n_8\,
      Q => init_data_reg(23),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[24]_i_1_n_15\,
      Q => init_data_reg(24),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \init_data_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_init_data_reg[24]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \init_data_reg[24]_i_1_n_1\,
      CO(5) => \init_data_reg[24]_i_1_n_2\,
      CO(4) => \init_data_reg[24]_i_1_n_3\,
      CO(3) => \NLW_init_data_reg[24]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \init_data_reg[24]_i_1_n_5\,
      CO(1) => \init_data_reg[24]_i_1_n_6\,
      CO(0) => \init_data_reg[24]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \init_data_reg[24]_i_1_n_8\,
      O(6) => \init_data_reg[24]_i_1_n_9\,
      O(5) => \init_data_reg[24]_i_1_n_10\,
      O(4) => \init_data_reg[24]_i_1_n_11\,
      O(3) => \init_data_reg[24]_i_1_n_12\,
      O(2) => \init_data_reg[24]_i_1_n_13\,
      O(1) => \init_data_reg[24]_i_1_n_14\,
      O(0) => \init_data_reg[24]_i_1_n_15\,
      S(7 downto 0) => init_data_reg(31 downto 24)
    );
\init_data_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[24]_i_1_n_14\,
      Q => init_data_reg(25),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[24]_i_1_n_13\,
      Q => init_data_reg(26),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[24]_i_1_n_12\,
      Q => init_data_reg(27),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[24]_i_1_n_11\,
      Q => init_data_reg(28),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[24]_i_1_n_10\,
      Q => init_data_reg(29),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[0]_i_2_n_13\,
      Q => init_data_reg(2),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[24]_i_1_n_9\,
      Q => init_data_reg(30),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[24]_i_1_n_8\,
      Q => init_data_reg(31),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[0]_i_2_n_12\,
      Q => init_data_reg(3),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[0]_i_2_n_11\,
      Q => init_data_reg(4),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[0]_i_2_n_10\,
      Q => init_data_reg(5),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[0]_i_2_n_9\,
      Q => init_data_reg(6),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[0]_i_2_n_8\,
      Q => init_data_reg(7),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[8]_i_1_n_15\,
      Q => init_data_reg(8),
      R => \data_count[0]_i_1_n_0\
    );
\init_data_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \init_data_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \init_data_reg[8]_i_1_n_0\,
      CO(6) => \init_data_reg[8]_i_1_n_1\,
      CO(5) => \init_data_reg[8]_i_1_n_2\,
      CO(4) => \init_data_reg[8]_i_1_n_3\,
      CO(3) => \NLW_init_data_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \init_data_reg[8]_i_1_n_5\,
      CO(1) => \init_data_reg[8]_i_1_n_6\,
      CO(0) => \init_data_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \init_data_reg[8]_i_1_n_8\,
      O(6) => \init_data_reg[8]_i_1_n_9\,
      O(5) => \init_data_reg[8]_i_1_n_10\,
      O(4) => \init_data_reg[8]_i_1_n_11\,
      O(3) => \init_data_reg[8]_i_1_n_12\,
      O(2) => \init_data_reg[8]_i_1_n_13\,
      O(1) => \init_data_reg[8]_i_1_n_14\,
      O(0) => \init_data_reg[8]_i_1_n_15\,
      S(7 downto 0) => init_data_reg(15 downto 8)
    );
\init_data_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => init_data0,
      D => \init_data_reg[8]_i_1_n_14\,
      Q => init_data_reg(9),
      R => \data_count[0]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ControlledBurstGen_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    enable : in STD_LOGIC_VECTOR ( 0 to 0 );
    preamble_length : in STD_LOGIC_VECTOR ( 31 downto 0 );
    preamble : in STD_LOGIC_VECTOR ( 31 downto 0 );
    delimiter : in STD_LOGIC_VECTOR ( 31 downto 0 );
    burst_length : in STD_LOGIC_VECTOR ( 31 downto 0 );
    burst_period : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dataOut_TVALID : out STD_LOGIC;
    dataOut_TREADY : in STD_LOGIC;
    dataOut_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dataOut_TDEST : out STD_LOGIC_VECTOR ( 5 downto 0 );
    dataOut_TKEEP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dataOut_TSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dataOut_TUSER : out STD_LOGIC_VECTOR ( 1 downto 0 );
    dataOut_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    dataOut_TID : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ControlledBurstGen_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ControlledBurstGen_0 : entity is "ControlledBurstGen_0,ControlledBurstGen,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ControlledBurstGen_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ControlledBurstGen_0 : entity is "ControlledBurstGen,Vivado 2017.3";
  attribute hls_module : string;
  attribute hls_module of ControlledBurstGen_0 : entity is "yes";
end ControlledBurstGen_0;

architecture STRUCTURE of ControlledBurstGen_0 is
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of inst : label is "1'b1";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF dataOut, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute X_INTERFACE_INFO of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute X_INTERFACE_INFO of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute X_INTERFACE_PARAMETER of ap_ready : signal is "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute X_INTERFACE_INFO of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute X_INTERFACE_INFO of dataOut_TREADY : signal is "xilinx.com:interface:axis:1.0 dataOut TREADY";
  attribute X_INTERFACE_INFO of dataOut_TVALID : signal is "xilinx.com:interface:axis:1.0 dataOut TVALID";
  attribute X_INTERFACE_INFO of burst_length : signal is "xilinx.com:signal:data:1.0 burst_length DATA";
  attribute X_INTERFACE_PARAMETER of burst_length : signal is "XIL_INTERFACENAME burst_length, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  attribute X_INTERFACE_INFO of burst_period : signal is "xilinx.com:signal:data:1.0 burst_period DATA";
  attribute X_INTERFACE_PARAMETER of burst_period : signal is "XIL_INTERFACENAME burst_period, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  attribute X_INTERFACE_INFO of dataOut_TDATA : signal is "xilinx.com:interface:axis:1.0 dataOut TDATA";
  attribute X_INTERFACE_INFO of dataOut_TDEST : signal is "xilinx.com:interface:axis:1.0 dataOut TDEST";
  attribute X_INTERFACE_INFO of dataOut_TID : signal is "xilinx.com:interface:axis:1.0 dataOut TID";
  attribute X_INTERFACE_PARAMETER of dataOut_TID : signal is "XIL_INTERFACENAME dataOut, SIGNAL_SET 11111111, TDATA_NUM_BYTES 4, TDEST_WIDTH 6, TID_WIDTH 5, TUSER_WIDTH 2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 2} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of dataOut_TKEEP : signal is "xilinx.com:interface:axis:1.0 dataOut TKEEP";
  attribute X_INTERFACE_INFO of dataOut_TLAST : signal is "xilinx.com:interface:axis:1.0 dataOut TLAST";
  attribute X_INTERFACE_INFO of dataOut_TSTRB : signal is "xilinx.com:interface:axis:1.0 dataOut TSTRB";
  attribute X_INTERFACE_INFO of dataOut_TUSER : signal is "xilinx.com:interface:axis:1.0 dataOut TUSER";
  attribute X_INTERFACE_INFO of delimiter : signal is "xilinx.com:signal:data:1.0 delimiter DATA";
  attribute X_INTERFACE_PARAMETER of delimiter : signal is "XIL_INTERFACENAME delimiter, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  attribute X_INTERFACE_INFO of enable : signal is "xilinx.com:signal:data:1.0 enable DATA";
  attribute X_INTERFACE_PARAMETER of enable : signal is "XIL_INTERFACENAME enable, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  attribute X_INTERFACE_INFO of preamble : signal is "xilinx.com:signal:data:1.0 preamble DATA";
  attribute X_INTERFACE_PARAMETER of preamble : signal is "XIL_INTERFACENAME preamble, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  attribute X_INTERFACE_INFO of preamble_length : signal is "xilinx.com:signal:data:1.0 preamble_length DATA";
  attribute X_INTERFACE_PARAMETER of preamble_length : signal is "XIL_INTERFACENAME preamble_length, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
begin
inst: entity work.ControlledBurstGen_0_ControlledBurstGen
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      burst_length(31 downto 0) => burst_length(31 downto 0),
      burst_period(31 downto 0) => burst_period(31 downto 0),
      dataOut_TDATA(31 downto 0) => dataOut_TDATA(31 downto 0),
      dataOut_TDEST(5 downto 0) => dataOut_TDEST(5 downto 0),
      dataOut_TID(4 downto 0) => dataOut_TID(4 downto 0),
      dataOut_TKEEP(3 downto 0) => dataOut_TKEEP(3 downto 0),
      dataOut_TLAST(0) => dataOut_TLAST(0),
      dataOut_TREADY => dataOut_TREADY,
      dataOut_TSTRB(3 downto 0) => dataOut_TSTRB(3 downto 0),
      dataOut_TUSER(1 downto 0) => dataOut_TUSER(1 downto 0),
      dataOut_TVALID => dataOut_TVALID,
      delimiter(31 downto 0) => delimiter(31 downto 0),
      enable => enable(0),
      preamble(31 downto 0) => preamble(31 downto 0),
      preamble_length(31 downto 0) => preamble_length(31 downto 0)
    );
end STRUCTURE;
