`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2019 10:23:46 AM
// Design Name: 
// Module Name: vio_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vio_wrapper(
    input wire [0:0] hb_gtwiz_reset_clk_freerun_buf_int
    ,input wire [0:0] hb0_gtwiz_userclk_tx_usrclk2_int
    ,input wire [0:0] hb0_gtwiz_userclk_rx_usrclk2_int
    ,input wire [0:0] gtpowergood_int
    ,input wire [0:0] txpmaresetdone_int
    ,input wire [0:0] rxpmaresetdone_int
    ,input wire [0:0] gtwiz_reset_tx_done_int
    ,input wire [0:0] gtwiz_reset_rx_done_int
    ,input wire [0:0] gtwiz_buffbypass_rx_done_int
    ,input wire [0:0] gtwiz_buffbypass_rx_error_int
    ,input wire [0:0] link_status_out
    ,input wire [0:0] link_down_latched_out
    ,input wire [0:0] init_done_int
    ,input wire [3:0] init_retry_ctr_int
    ,output wire [0:0] hb_gtwiz_reset_all_vio_int
    ,output wire [0:0] hb0_gtwiz_reset_tx_pll_and_datapath_int
    ,output wire [0:0] hb0_gtwiz_reset_tx_datapath_int
    ,output wire [0:0] hb_gtwiz_reset_rx_pll_and_datapath_vio_int
    ,output wire [0:0] hb_gtwiz_reset_rx_datapath_vio_int
    ,output wire [0:0] BCDR_in_sop
    );
    
    // ===================================================================================================================
    // VIO FOR HARDWARE BRING-UP AND DEBUG
    // ===================================================================================================================
  
    // Synchronize gtpowergood into the free-running clock domain for VIO usage
    wire [0:0] gtpowergood_vio_sync;
  
    (* DONT_TOUCH = "TRUE" *)
    bit_sync bit_sync_gtpowergood_0_inst (
      .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
      .i_in   (gtpowergood_int[0]),
      .o_out  (gtpowergood_vio_sync[0])
    );
  
    // Synchronize txpmaresetdone into the free-running clock domain for VIO usage
    wire [0:0] txpmaresetdone_vio_sync;
    
    (* DONT_TOUCH = "TRUE" *)
    bit_sync bit_sync_vio_txpmaresetdone_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (txpmaresetdone_int[0]),
    .o_out  (txpmaresetdone_vio_sync[0])
    );


    // Synchronize rxpmaresetdone into the free-running clock domain for VIO usage
    wire [0:0] rxpmaresetdone_vio_sync;
    
    (* DONT_TOUCH = "TRUE" *)
    bit_sync bit_sync_vio_rxpmaresetdone_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (rxpmaresetdone_int[0]),
    .o_out  (rxpmaresetdone_vio_sync[0])
    );
        
    // Synchronize gtwiz_reset_tx_done into the free-running clock domain for VIO usage
    wire [0:0] gtwiz_reset_tx_done_vio_sync;
    
    (* DONT_TOUCH = "TRUE" *)
    bit_sync bit_sync_vio_gtwiz_reset_tx_done_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (gtwiz_reset_tx_done_int[0]),
    .o_out  (gtwiz_reset_tx_done_vio_sync[0])
    );
    
    // Synchronize gtwiz_reset_rx_done into the free-running clock domain for VIO usage
    wire [0:0] gtwiz_reset_rx_done_vio_sync;
    
    (* DONT_TOUCH = "TRUE" *)
    bit_sync bit_sync_vio_gtwiz_reset_rx_done_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (gtwiz_reset_rx_done_int[0]),
    .o_out  (gtwiz_reset_rx_done_vio_sync[0])
    );

  // Synchronize gtwiz_buffbypass_rx_done into the free-running clock domain for VIO usage
  wire [0:0] gtwiz_buffbypass_rx_done_vio_sync;

  (* DONT_TOUCH = "TRUE" *)
  bit_sync bit_sync_vio_gtwiz_buffbypass_rx_done_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (gtwiz_buffbypass_rx_done_int[0]),
    .o_out  (gtwiz_buffbypass_rx_done_vio_sync[0])
  );

  // Synchronize gtwiz_buffbypass_rx_error into the free-running clock domain for VIO usage
  wire [0:0] gtwiz_buffbypass_rx_error_vio_sync;

  (* DONT_TOUCH = "TRUE" *)
  bit_sync bit_sync_vio_gtwiz_buffbypass_rx_error_0_inst (
    .clk_in (hb_gtwiz_reset_clk_freerun_buf_int),
    .i_in   (gtwiz_buffbypass_rx_error_int[0]),
    .o_out  (gtwiz_buffbypass_rx_error_vio_sync[0])
  );

    // Instantiate the VIO IP core for hardware bring-up and debug purposes, connecting relevant debug and analysis
    // signals which have been enabled during Wizard IP customization. This initial set of connected signals is
    // provided as a convenience and example, but more or fewer ports can be used as needed; simply re-customize and
    // re-generate the VIO instance, then connect any exposed signals that are needed. Signals which are synchronous to
    // clocks other than the free-running clock will require synchronization. For usage, refer to Vivado Design Suite
    // User Guide: Programming and Debugging (UG908)
    vio vio_inst (
      .clk (hb_gtwiz_reset_clk_freerun_buf_int)
      ,.probe_in0 (link_status_out)
      ,.probe_in1 (link_down_latched_out)
      ,.probe_in2 (init_done_int)
      ,.probe_in3 (init_retry_ctr_int)
      ,.probe_in4 (gtpowergood_vio_sync)
      ,.probe_in5 (txpmaresetdone_vio_sync)
      ,.probe_in6 (rxpmaresetdone_vio_sync)
      ,.probe_in7 (gtwiz_reset_tx_done_vio_sync)
      ,.probe_in8 (gtwiz_reset_rx_done_vio_sync)
      ,.probe_in9 (gtwiz_buffbypass_rx_done_vio_sync)
      ,.probe_in10(gtwiz_buffbypass_rx_error_vio_sync)
      ,.probe_out0 (hb_gtwiz_reset_all_vio_int)
      ,.probe_out1 (hb0_gtwiz_reset_tx_pll_and_datapath_int)
      ,.probe_out2 (hb0_gtwiz_reset_tx_datapath_int)
      ,.probe_out3 (hb_gtwiz_reset_rx_pll_and_datapath_vio_int)
      ,.probe_out4 (hb_gtwiz_reset_rx_datapath_vio_int)
      ,.probe_out5 (BCDR_in_sop)
    );
    
endmodule
