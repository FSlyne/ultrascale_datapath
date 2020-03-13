-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
-- Date        : Wed Feb 12 14:41:03 2020
-- Host        : Christian running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top ControlledBurstGen_0 -prefix
--               ControlledBurstGen_0_ ControlledBurstGen_0_stub.vhdl
-- Design      : ControlledBurstGen_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu095-ffva2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlledBurstGen_0 is
  Port ( 
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

end ControlledBurstGen_0;

architecture stub of ControlledBurstGen_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,enable[0:0],preamble_length[31:0],preamble[31:0],delimiter[31:0],burst_length[31:0],burst_period[31:0],dataOut_TVALID,dataOut_TREADY,dataOut_TDATA[31:0],dataOut_TDEST[5:0],dataOut_TKEEP[3:0],dataOut_TSTRB[3:0],dataOut_TUSER[1:0],dataOut_TLAST[0:0],dataOut_TID[4:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ControlledBurstGen,Vivado 2017.3";
begin
end;
