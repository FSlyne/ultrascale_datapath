// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Wed Feb 12 14:41:03 2020
// Host        : Christian running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top ControlledBurstGen_0 -prefix
//               ControlledBurstGen_0_ ControlledBurstGen_0_stub.v
// Design      : ControlledBurstGen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu095-ffva2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ControlledBurstGen,Vivado 2017.3" *)
module ControlledBurstGen_0(ap_clk, ap_rst_n, ap_start, ap_done, ap_idle, 
  ap_ready, enable, preamble_length, preamble, delimiter, burst_length, burst_period, 
  dataOut_TVALID, dataOut_TREADY, dataOut_TDATA, dataOut_TDEST, dataOut_TKEEP, dataOut_TSTRB, 
  dataOut_TUSER, dataOut_TLAST, dataOut_TID)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,enable[0:0],preamble_length[31:0],preamble[31:0],delimiter[31:0],burst_length[31:0],burst_period[31:0],dataOut_TVALID,dataOut_TREADY,dataOut_TDATA[31:0],dataOut_TDEST[5:0],dataOut_TKEEP[3:0],dataOut_TSTRB[3:0],dataOut_TUSER[1:0],dataOut_TLAST[0:0],dataOut_TID[4:0]" */;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [0:0]enable;
  input [31:0]preamble_length;
  input [31:0]preamble;
  input [31:0]delimiter;
  input [31:0]burst_length;
  input [31:0]burst_period;
  output dataOut_TVALID;
  input dataOut_TREADY;
  output [31:0]dataOut_TDATA;
  output [5:0]dataOut_TDEST;
  output [3:0]dataOut_TKEEP;
  output [3:0]dataOut_TSTRB;
  output [1:0]dataOut_TUSER;
  output [0:0]dataOut_TLAST;
  output [4:0]dataOut_TID;
endmodule
