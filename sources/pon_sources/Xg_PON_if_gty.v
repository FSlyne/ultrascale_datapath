`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CONNECT
// Author: SANDIP DAS
// 
// Create Date: 21.03.2020 23:15:47
// Design Name: 
// Module Name: add_XG_PON_header
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This is the top module for gth 10g burst TxRx. This module accepts
//				data over AXI stream interface. takes care of asynchronous clocking.
//              adds preamble and delemeter at the begining of the burst 
//				and a frame tail sequence at the end of the burst for burst Tx/Rx
//				over GTH-10G interface with raw transmission (no encoding). Upon
//				reception, performs burst clock and data recovery(BCDR) with PLL quicklock
//				using gt-drp interfae. Followed by frame sync through preamble detection
//				and delimiter align. Finally performs protocol conversion to output over
//				AXI stream interface.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: partly uses xilinx example design for gt.
//
//////////////////////////////////////////////////////////////////////////////////

// =====================================================================================================================
// This example design top module instantiates the example design wrapper; slices vectored ports for per-channel
// assignment; and instantiates example resources such as buffers, pattern generators, and pattern checkers for core
// demonstration purposes
// =====================================================================================================================

module FMC_GTH_top (

  // Differential reference clock inputs used only when
  // FMC GTH core is used on gt bank 230 for xg-pon if
   input wire qpll0clk_in
  ,input wire qpll0refclk_in
  ,input wire qpll1clk_in
  ,input wire qpll1refclk_in
  ,input wire gtwiz_reset_qpll0lock_in
  ,output wire gtwiz_reset_qpll0reset_out

  // Differential reference clock inputs for gty channel used 
  // only when qsfp gty core is used on gt bank for xg-pon if
  ,input  wire mgtrefclk0_x0y3_p
  ,input  wire mgtrefclk0_x0y3_n

  // Serial data ports for transceiver channel 0
  ,input  wire ch0_gthrxn_in
  ,input  wire ch0_gthrxp_in
  ,output wire ch0_gthtxn_out
  ,output wire ch0_gthtxp_out

  // User-provided ports for reset helper block(s)
  ,input  wire hb_gtwiz_reset_clk_freerun_buf_int
  ,input  wire hb_gtwiz_reset_all_in
  ,output  wire hb_gtwiz_reset_all_out
  ,output wire gth_core_tx_usrclk2_out
  ,output wire gth_core_rx_usrclk2_out

  // PRBS-based link status ports
  ,input  wire link_down_latched_reset_in
  ,output wire link_status_out
  ,output wire  link_down_latched_out
  
  //User DATA TxRx compatible with AXI streaming
  ,input wire [31:0] axis_usrtx_TDATA
  ,output wire axis_usrtx_TREADY
  ,input wire axis_usrtx_TVALID
  ,input wire axis_usrtx_TLAST
  ,input wire axis_usrtx_aresetn
  ,input wire axis_usrrx_aresetn
    
  //User DATA TxRx compatible with AXI streaming
  ,output wire [31:0] axis_usrrx_TDATA
  ,input wire axis_usrrx_TREADY
  ,output wire axis_usrrx_TVALID
  
  ,input wire [31:0] preamble_pattern
  ,input wire axis_aclk_gt_tx_usrclk
  ,input wire axis_aclk_gt_rx_usrclk

);

   
  // ===================================================================================================================
  // PER-CHANNEL SIGNAL ASSIGNMENTS
  // ===================================================================================================================

  // The core and example design wrapper vectorize ports across all enabled transceiver channel and common instances for
  // simplicity and compactness. This example design top module assigns slices of each vector to individual, per-channel
  // signal vectors for use if desired. Signals which connect to helper blocks are prefixed "hb#", signals which connect
  // to transceiver common primitives are prefixed "cm#", and signals which connect to transceiver channel primitives
  // are prefixed "ch#", where "#" is the sequential resource number.

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtyrxn_int;
  assign gtyrxn_int[0:0] = ch0_gthrxn_in;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtyrxp_int;
  assign gtyrxp_int[0:0] = ch0_gthrxp_in;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtytxn_int;
  assign ch0_gthtxn_out = gtytxn_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtytxp_int;
  assign ch0_gthtxp_out = gtytxp_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtrefclk00_int;
  wire [0:0] cm0_gtrefclk00_int;
  assign gtrefclk00_int[0:0] = cm0_gtrefclk00_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] qpll0outclk_int;
  wire [0:0] cm0_qpll0outclk_int;
  assign cm0_qpll0outclk_int = qpll0outclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] qpll0outrefclk_int;
  wire [0:0] cm0_qpll0outrefclk_int;
  assign cm0_qpll0outrefclk_int = qpll0outrefclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_tx_reset_int;
  wire [0:0] hb0_gtwiz_userclk_tx_reset_int;
  assign gtwiz_userclk_tx_reset_int[0:0] = hb0_gtwiz_userclk_tx_reset_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_tx_srcclk_int;
  wire [0:0] hb0_gtwiz_userclk_tx_srcclk_int;
  assign hb0_gtwiz_userclk_tx_srcclk_int = gtwiz_userclk_tx_srcclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_tx_usrclk_int;
  wire [0:0] hb0_gtwiz_userclk_tx_usrclk_int;
  assign hb0_gtwiz_userclk_tx_usrclk_int = gtwiz_userclk_tx_usrclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_tx_usrclk2_int;
  wire [0:0] hb0_gtwiz_userclk_tx_usrclk2_int;
  assign hb0_gtwiz_userclk_tx_usrclk2_int = gtwiz_userclk_tx_usrclk2_int[0:0];
  assign gth_core_tx_usrclk2_out = gtwiz_userclk_tx_usrclk2_int[0:0];
  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_tx_active_int;
  
  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_rx_reset_int;
  wire [0:0] hb0_gtwiz_userclk_rx_reset_int;
  assign gtwiz_userclk_rx_reset_int[0:0] = hb0_gtwiz_userclk_rx_reset_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_rx_srcclk_int;
  wire [0:0] hb0_gtwiz_userclk_rx_srcclk_int;
  assign hb0_gtwiz_userclk_rx_srcclk_int = gtwiz_userclk_rx_srcclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_rx_usrclk_int;
  wire [0:0] hb0_gtwiz_userclk_rx_usrclk_int;
  assign hb0_gtwiz_userclk_rx_usrclk_int = gtwiz_userclk_rx_usrclk_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_rx_usrclk2_int;
  wire [0:0] hb0_gtwiz_userclk_rx_usrclk2_int;
  assign hb0_gtwiz_userclk_rx_usrclk2_int = gtwiz_userclk_rx_usrclk2_int[0:0];
  assign gth_core_rx_usrclk2_out = gtwiz_userclk_rx_usrclk2_int[0:0];
  
  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_userclk_rx_active_int;
  wire [0:0] hb0_gtwiz_userclk_rx_active_int;
  assign hb0_gtwiz_userclk_rx_active_int = gtwiz_userclk_rx_active_int[0:0];
  
  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_buffbypass_rx_reset_int;
  wire [0:0] hb0_gtwiz_buffbypass_rx_reset_int;
  assign gtwiz_buffbypass_rx_reset_int[0:0] = hb0_gtwiz_buffbypass_rx_reset_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire Packet_detected_posedge;
  wire [0:0] gtwiz_buffbypass_rx_start_user_int;
  //wire [0:0] hb0_gtwiz_buffbypass_rx_start_user_int = 1'b0;
  
  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_buffbypass_rx_done_int;
  wire [0:0] hb0_gtwiz_buffbypass_rx_done_int;
  assign hb0_gtwiz_buffbypass_rx_done_int = gtwiz_buffbypass_rx_done_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_buffbypass_rx_error_int;
  wire [0:0] hb0_gtwiz_buffbypass_rx_error_int;
  assign hb0_gtwiz_buffbypass_rx_error_int = gtwiz_buffbypass_rx_error_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_clk_freerun_int;
  wire [0:0] hb0_gtwiz_reset_clk_freerun_int = 1'b0;
  assign gtwiz_reset_clk_freerun_int[0:0] = hb0_gtwiz_reset_clk_freerun_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_all_int;
  wire [0:0] hb0_gtwiz_reset_all_int = 1'b0;
  assign gtwiz_reset_all_int[0:0] = hb0_gtwiz_reset_all_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_tx_pll_and_datapath_int;
  wire [0:0] hb0_gtwiz_reset_tx_pll_and_datapath_int;
  assign gtwiz_reset_tx_pll_and_datapath_int[0:0] = hb0_gtwiz_reset_tx_pll_and_datapath_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_tx_datapath_int;
  wire [0:0] hb0_gtwiz_reset_tx_datapath_int;
  assign gtwiz_reset_tx_datapath_int[0:0] = hb0_gtwiz_reset_tx_datapath_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_rx_pll_and_datapath_int;
  wire [0:0] hb0_gtwiz_reset_rx_pll_and_datapath_int = 1'b0;
  assign gtwiz_reset_rx_pll_and_datapath_int[0:0] = hb0_gtwiz_reset_rx_pll_and_datapath_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_rx_datapath_int;
  wire [0:0] hb0_gtwiz_reset_rx_datapath_int = 1'b0;
  assign gtwiz_reset_rx_datapath_int[0:0] = hb0_gtwiz_reset_rx_datapath_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_rx_cdr_stable_int;
  wire [0:0] hb0_gtwiz_reset_rx_cdr_stable_int;
  assign hb0_gtwiz_reset_rx_cdr_stable_int = gtwiz_reset_rx_cdr_stable_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_tx_done_int;
  wire [0:0] hb0_gtwiz_reset_tx_done_int;
  assign hb0_gtwiz_reset_tx_done_int = gtwiz_reset_tx_done_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtwiz_reset_rx_done_int;
  wire [0:0] hb0_gtwiz_reset_rx_done_int;
  assign hb0_gtwiz_reset_rx_done_int = gtwiz_reset_rx_done_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [31:0] gtwiz_userdata_tx_int;
  //--------------------------------------------------------------------------------------------------------------------
  wire [31:0] gtwiz_userdata_rx_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] dmonfiforeset_int;
  wire [0:0] ch0_dmonfiforeset_int = 1'b0;
  assign dmonfiforeset_int[0:0] = ch0_dmonfiforeset_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [8:0] drpaddr_int;
  wire [8:0] ch0_drpaddr_int;
  assign drpaddr_int[8:0] = ch0_drpaddr_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] drpclk_int;
  wire [0:0] ch0_drpclk_int;
  assign drpclk_int[0:0] = ch0_drpclk_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [15:0] drpdi_int;
  wire [15:0] ch0_drpdi_int;
  assign drpdi_int[15:0] = ch0_drpdi_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] drpen_int;
  wire [0:0] ch0_drpen_int;
  assign drpen_int[0:0] = ch0_drpen_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] drpwe_int;
  wire [0:0] ch0_drpwe_int;
  assign drpwe_int[0:0] = ch0_drpwe_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rxcdrovrden_int;
  wire [0:0] ch0_rxcdrovrden_int;
  assign rxcdrovrden_int[0:0] = ch0_rxcdrovrden_int;

  wire [0:0] rxcdrhold_int;
  
//  //--------------------------------------------------------------------------------------------------------------------
//  wire [0:0] rxlpmen_int;
//  wire [0:0] ch0_rxlpmen_int = 1'b1;
//  assign rxlpmen_int[0:0] = ch0_rxlpmen_int;
//  //--------------------------------------------------------------------------------------------------------------------
//  wire [0:0] rxlpmgcovrden_int;
//  wire [0:0] ch0_rxlpmgcovrden_int = 1'b0;
//  assign rxlpmgcovrden_int[0:0] = ch0_rxlpmgcovrden_int;
  
//  //--------------------------------------------------------------------------------------------------------------------
//  wire [0:0] rxlpmhfovrden_int;
//  wire [0:0] ch0_rxlpmhfovrden_int = 1'b0;
//  assign rxlpmhfovrden_int[0:0] = ch0_rxlpmhfovrden_int;
  
//  //--------------------------------------------------------------------------------------------------------------------
//  wire [0:0] rxlpmlfklovrden_int;
//  wire [0:0] ch0_rxlpmlfklovrden_int = 1'b0;
//  assign rxlpmlfklovrden_int[0:0] = ch0_rxlpmlfklovrden_int;
  
  //--------------------------------------------------------------------------------------------------------------------
  wire [16:0] dmonitorout_int;
  wire [16:0] ch0_dmonitorout_int;
  assign ch0_dmonitorout_int = dmonitorout_int[16:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] dmonitorclk_int;
  wire [0:0] ch0_dmonitorclk_int;
  assign dmonitorclk_int[0:0] = ch0_dmonitorclk_int;

  //--------------------------------------------------------------------------------------------------------------------
  wire [15:0] drpdo_int;
  wire [15:0] ch0_drpdo_int;
  assign ch0_drpdo_int = drpdo_int[15:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] drprdy_int;
  wire [0:0] ch0_drprdy_int;
  assign ch0_drprdy_int = drprdy_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] gtpowergood_int;
  wire [0:0] ch0_gtpowergood_int;
  assign ch0_gtpowergood_int = gtpowergood_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] rxpmaresetdone_int;
  wire [0:0] ch0_rxpmaresetdone_int;
  assign ch0_rxpmaresetdone_int = rxpmaresetdone_int[0:0];

  //--------------------------------------------------------------------------------------------------------------------
  wire [0:0] txpmaresetdone_int;
  wire [0:0] ch0_txpmaresetdone_int;
  assign ch0_txpmaresetdone_int = txpmaresetdone_int[0:0];


  // ===================================================================================================================
  // BUFFERS
  // ===================================================================================================================
  // Differential reference clock buffer for MGTREFCLK0_X0Y3
  wire mgtrefclk0_x0y3_int;

  IBUFDS_GTE3 #(
    .REFCLK_EN_TX_PATH  (1'b0),
    .REFCLK_HROW_CK_SEL (2'b00),
    .REFCLK_ICNTL_RX    (2'b00)
  ) IBUFDS_GTE3_MGTREFCLK0_X0Y3_INST (
    .I     (mgtrefclk0_x0y3_p),
    .IB    (mgtrefclk0_x0y3_n),
    .CEB   (1'b0),
    .O     (mgtrefclk0_x0y3_int),
    .ODIV2 ()
  );

  assign cm0_gtrefclk00_int = mgtrefclk0_x0y3_int;

  // Buffer the hb_gtwiz_reset_all_in input and logically combine it with the internal signal from the example
  // initialization block as well as the VIO-sourced reset
  wire hb_gtwiz_reset_all_vio_int;
  wire hb_gtwiz_reset_all_buf_int;
  wire hb_gtwiz_reset_all_init_int;
  wire hb_gtwiz_reset_all_int;
  IBUF ibuf_hb_gtwiz_reset_all_inst (
    .I (hb_gtwiz_reset_all_in),
    .O (hb_gtwiz_reset_all_buf_int)
  );

  assign hb_gtwiz_reset_all_int = hb_gtwiz_reset_all_buf_int || hb_gtwiz_reset_all_init_int || hb_gtwiz_reset_all_vio_int;
  assign hb_gtwiz_reset_all_out = hb_gtwiz_reset_all_int;
  // Instantiate a differential reference clock buffer for each reference clock differential pair in this configuration,
  // and assign the single-ended output of each differential reference clock buffer to the appropriate PLL input signal


  // ===================================================================================================================
  // USER CLOCKING RESETS
  // ===================================================================================================================

  // The TX user clocking helper block should be held in reset until the clock source of that block is known to be
  // stable. The following assignment is an example of how that stability can be determined, based on the selected TX
  // user clock source. Replace the assignment with the appropriate signal or logic to achieve that behavior as needed.
  assign hb0_gtwiz_userclk_tx_reset_int = ~(&txpmaresetdone_int);

  // The RX user clocking helper block should be held in reset until the clock source of that block is known to be
  // stable. The following assignment is an example of how that stability can be determined, based on the selected RX
  // user clock source. Replace the assignment with the appropriate signal or logic to achieve that behavior as needed.
  assign hb0_gtwiz_userclk_rx_reset_int = ~(&rxpmaresetdone_int);

  // ===================================================================================================================
  // BUFFER BYPASS CONTROLLER RESETS
  // ===================================================================================================================

  // The RX buffer bypass controller helper block should be held in reset until the RX user clocking network helper
  // block which drives it is active
  (* DONT_TOUCH = "TRUE" *)
  reset_sync reset_sync_buffbypass_rx_reset_inst (
    .clk_in  (hb0_gtwiz_userclk_rx_usrclk2_int),
    .rst_in  (~hb0_gtwiz_userclk_rx_active_int),
    .rst_out (hb0_gtwiz_buffbypass_rx_reset_int)
  );


  // ===================================================================================================================
  // INITIALIZATION
  // ===================================================================================================================

  // Declare the receiver reset signals that interface to the reset controller helper block. For this configuration,
  // which uses the same PLL type for transmitter and receiver, the "reset RX PLL and datapath" feature is not used.
  wire hb_gtwiz_reset_rx_pll_and_datapath_int = 1'b0;
  wire hb_gtwiz_reset_rx_datapath_int;

  // Declare signals which connect the VIO instance to the initialization module for debug purposes
  wire       init_done_int;
  wire [3:0] init_retry_ctr_int;

  // Combine the receiver reset signals form the initialization module and the VIO to drive the appropriate reset
  // controller helper block reset input
  wire hb_gtwiz_reset_rx_pll_and_datapath_vio_int;
  wire hb_gtwiz_reset_rx_datapath_vio_int;
  wire hb_gtwiz_reset_rx_datapath_init_int;

  assign hb_gtwiz_reset_rx_datapath_int = hb_gtwiz_reset_rx_datapath_init_int || hb_gtwiz_reset_rx_datapath_vio_int;

  // The example initialization module interacts with the reset controller helper block and other example design logic
  // to retry failed reset attempts in order to mitigate bring-up issues such as initially-unavilable reference clocks
  // or data connections. It also resets the receiver in the event of link loss in an attempt to regain link, so please
  // note the possibility that this behavior can have the effect of overriding or disturbing user-provided inputs that
  // destabilize the data stream. It is a demonstration only and can be modified to suit your system needs.
  gth_core_init_seq gth_core_init_seq_inst (
    .clk_freerun_in  (hb_gtwiz_reset_clk_freerun_buf_int),
    .reset_all_in    (hb_gtwiz_reset_all_int),
    .tx_init_done_in (gtwiz_reset_tx_done_int),
    .rx_init_done_in (gtwiz_reset_rx_done_int && gtwiz_buffbypass_rx_done_int),
    .rx_data_good_in (link_status_out),
    .reset_all_out   (hb_gtwiz_reset_all_init_int),
    .reset_rx_out    (hb_gtwiz_reset_rx_datapath_init_int),
    .init_done_out   (init_done_int),
    .retry_ctr_out   (init_retry_ctr_int)
  );
    wire fifo_min_data_write_done;
    wire fifo_rd_enable;
    wire fifo_empty;
    wire m_axis_usrtx_TLAST;
    axis_fifo_rw_control axis_fifo_rw_control_inst(
    .clk(axis_aclk_gt_tx_usrclk)
    ,.axis_in_TLAST(m_axis_usrtx_TLAST)
    ,.fifo_min_data_write_done(fifo_min_data_write_done)
    ,.GT_Tx_active(gtwiz_userclk_tx_active_int)
    ,.fifo_rd_enable(fifo_rd_enable)
    );
    
    wire m_axis_tvalid;
    wire [31:0] m_axis_tdata;
    standard_rw_fifo AXIS_Tx_gateway_fifo (
      .s_aclk(axis_aclk_gt_tx_usrclk),                  // input wire s_aclk
      .s_aresetn(axis_usrtx_aresetn),            // input wire s_aresetn
      .s_axis_tvalid(axis_usrtx_TVALID),    // input wire s_axis_tvalid
      .s_axis_tready(axis_usrtx_TREADY),    // output wire s_axis_tready
      .s_axis_tdata(axis_usrtx_TDATA),      // input wire [31 : 0] s_axis_tdata
      .s_axis_tkeep(4'd15),      // input wire [3 : 0] s_axis_tkeep
      .s_axis_tlast(axis_usrtx_TLAST),      // input wire s_axis_tlast
      .s_axis_tuser(1'b0),      // input wire [0 : 0] s_axis_tuser
      .m_axis_tvalid(m_axis_tvalid),    // output wire m_axis_tvalid
      .m_axis_tready(fifo_rd_enable),    // input wire m_axis_tready
      .m_axis_tdata(m_axis_tdata),      // output wire [31 : 0] m_axis_tdata
      .m_axis_tkeep(),      // output wire [3 : 0] m_axis_tkeep
      .m_axis_tlast(m_axis_usrtx_TLAST),      // output wire m_axis_tlast
      .m_axis_tuser(),      // output wire [0 : 0] m_axis_tuser
      .axis_prog_full(fifo_min_data_write_done)  // output wire axis_prog_full
    );
    assign gtwiz_userdata_tx_int = fifo_rd_enable ? m_axis_tdata : 32'h00000000;
  // ===================================================================================================================
  // VIO FOR HARDWARE BRING-UP AND DEBUG
  // ===================================================================================================================
  // Instantiate the VIO wrapper for hardware bring-up and debug purposes, 
  wire [0:0] BCDR_in_sop_vio;
  wire BCDR_sop_sel_vio;
  wire Tx_PD_sel;
  wire [6:0] BCDR_SOP_det_th_vio;
  vio_wrapper vio_wrapped_inst (
    .hb_gtwiz_reset_clk_freerun_buf_int (hb_gtwiz_reset_clk_freerun_buf_int)
    ,.hb0_gtwiz_userclk_tx_usrclk2_int (hb0_gtwiz_userclk_tx_usrclk2_int)
    ,.hb0_gtwiz_userclk_rx_usrclk2_int (hb0_gtwiz_userclk_rx_usrclk2_int)
    ,.gtpowergood_int (gtpowergood_int)
    ,.txpmaresetdone_int (txpmaresetdone_int)
    ,.rxpmaresetdone_int (rxpmaresetdone_int)
    ,.gtwiz_reset_tx_done_int (gtwiz_reset_tx_done_int)
    ,.gtwiz_reset_rx_done_int (gtwiz_reset_rx_done_int)
    ,.gtwiz_buffbypass_rx_done_int (gtwiz_buffbypass_rx_done_int)
    ,.gtwiz_buffbypass_rx_error_int (gtwiz_buffbypass_rx_error_int)
    ,.link_status_out (link_status_out)
    ,.link_down_latched_out (link_down_latched_out)
    ,.init_done_int (init_done_int)
    ,.init_retry_ctr_int (init_retry_ctr_int)
    ,.hb_gtwiz_reset_all_vio_int (hb_gtwiz_reset_all_vio_int)
    ,.hb0_gtwiz_reset_tx_pll_and_datapath_int (hb0_gtwiz_reset_tx_pll_and_datapath_int)
    ,.hb0_gtwiz_reset_tx_datapath_int (hb0_gtwiz_reset_tx_datapath_int)
    ,.hb_gtwiz_reset_rx_pll_and_datapath_vio_int (hb_gtwiz_reset_rx_pll_and_datapath_vio_int)
    ,.hb_gtwiz_reset_rx_datapath_vio_int (hb_gtwiz_reset_rx_datapath_vio_int)
    ,.BCDR_SOP   (BCDR_in_sop_vio) //output
    ,.BCDR_sop_sel_vio (BCDR_sop_sel_vio) //output
    ,.Tx_PD_sel_vio(Tx_PD_sel)
    ,.BCDR_SOP_det_th(BCDR_SOP_det_th_vio)
  );

    
    wire SOP_detected_posedge;
    wire Packet_detected;
    /*(* DONT_TOUCH = "TRUE" *)
    SOPDetect_0 Det_SOP_inst (
        .SOP_detected_ap_vld(SOP_detected_ap_vld)// output wire SOP_detected_ap_vld
        ,.ap_clk(axis_aclk_gt_rx_usrclk)         // input wire ap_clk
        ,.ap_rst(hb_gtwiz_reset_all_int)         // input wire ap_rst
        ,.enable(gtwiz_userclk_rx_active_int)    // input wire [0 : 0] enable
        ,.TDATAin_V(gtwiz_userdata_rx_int)       // input wire [31 : 0] TDATAin_V
        ,.Thresholdin_V(8'h08)                   // input wire [7 : 0] Thresholdin_V
        ,.SOP_detected(SOP_detected_posedge)     // output wire [0 : 0] SOP_detected
        ,.Packet_detected(Packet_detected)       // output wire [0 : 0] Packet_detected
    );*/
    //sync preamble pattern in gt rx usrclk domain
    wire [31:0] preamble_pattern_sync;
    (* DONT_TOUCH = "TRUE" *)
    cdc_sync_2stage 
      #(
        .WIDTH        (32)
      ) preamble_pat_cdc_sync_2stage_syncer (
        .clk          (axis_aclk_gt_rx_usrclk),
        .signal_in    (preamble_pattern),
        .signal_out   (preamble_pattern_sync)
      );
    //sync BCDR_SOP_det_th in gt rx usrclk domain
    wire [6:0]BCDR_SOP_det_th;
    (* DONT_TOUCH = "TRUE" *)
    cdc_sync_2stage 
      #(
        .WIDTH        (7)
      ) BCDR_SOP_det_th_cdc_sync_2stage_syncer (
        .clk          (axis_aclk_gt_rx_usrclk),
        .signal_in    (BCDR_SOP_det_th_vio),
        .signal_out   (BCDR_SOP_det_th)
      );

    wire SOP_detected;
    (* DONT_TOUCH = "TRUE" *)
    Burst_Mode_Synchronizer Preamble_Det_SOP_inst (
        .in_data                   (gtwiz_userdata_rx_int)
        ,.in_syncword              (preamble_pattern_sync)
        ,.in_threshold             (BCDR_SOP_det_th)
        ,.in_enable                (gtwiz_userclk_rx_active_int)
        ,.in_reset                 (1'b0)
        ,.in_clock                 (axis_aclk_gt_rx_usrclk)
        ,.out_data                 ()
        ,.out_detected             (SOP_detected)
        ,.out_data_double_buffer   ()
        ,.out_threshold_comparator ()
    );
    
    SOP_CDR_Control_0 your_instance_name (
        .ap_clk(axis_aclk_gt_rx_usrclk)                    // input wire ap_clk
        ,.ap_rst(1'b0)                    // input wire ap_rst
        ,.enable(gtwiz_userclk_rx_active_int)                    // input wire [0 : 0] enable
        ,.TDATAin_V(gtwiz_userdata_rx_int)              // input wire [31 : 0] TDATAin_V
        ,.SOP_in(SOP_detected)                    // input wire [0 : 0] SOP_in
        ,.CDRHOLD_out(rxcdrhold_int)          // output wire [0 : 0] CDRHOLD_out
        ,.PacketValid_out(Packet_detected)  // output wire [0 : 0] PacketValid_out
    );

    //get the positive edge of the start and align it to one clock cycle
    //-----------------Positive Edge Detector--------------------//
    reg Packet_detected_next [1:0];
    //wire Packet_detected_posedge;
    always@(posedge axis_aclk_gt_rx_usrclk) begin
        Packet_detected_next[0] <= Packet_detected; 
        Packet_detected_next[1] <= Packet_detected_next[0];
    end
    assign Packet_detected_posedge = Packet_detected && (~Packet_detected_next[1]);


  wire drpClk_buffered;
  wire [0:0] BCDR_in_sop;
  assign BCDR_in_sop = BCDR_sop_sel_vio ? BCDR_in_sop_vio : Packet_detected_posedge;
  BUFG drpClk_BUFG 
    (.I(hb_gtwiz_reset_clk_freerun_buf_int), 
     .O(drpClk_buffered));
  BUFG dmonClk_BUFG_0 
   (.I(ch0_dmonitorout_int[16]), 
    .O(ch0_dmonitorclk_int));
  
  wire [12:0] ch0_BCDR_out_debug;
  BCDR_QuickLock gty_BCDR_inst_0(
    .drpDout                        (ch0_drpdo_int)
    ,.waitTime                      (6'b000110)
    ,.dmonClk                       (ch0_dmonitorclk_int)
    ,.threshold                     (7'b0000110)
    ,.enable                        (1'b1)
    ,.stepSize                      (7'b0010000)
    ,.cdrPiCode                     (ch0_dmonitorout_int[6:0])
    ,.drpClk                        (drpClk_buffered)
    ,.reset                         (hb_gtwiz_reset_all_int)
    ,.sop                           (BCDR_in_sop)    //ch0_BCDR_in_sop
    ,.drpRdy                        (ch0_drprdy_int)

    ,.drpDin                        (ch0_drpdi_int)
    ,.debug                         (ch0_BCDR_out_debug)
    ,.cdrOvrd                       (ch0_rxcdrovrden_int)
    ,.drpAddr                       (ch0_drpaddr_int)
    ,.drpWe                         (ch0_drpwe_int)
    ,.drpEn                         (ch0_drpen_int)
  );
  //Use delayed version of Packet_detected_posedge to assert rxphdlyreset to align xclk with usrclk
  // we use 10 clock cycle delayed version of Packet_detected_posedge signal
  wire xphdlyreset_usr_in;
  reg [0:0] delay_buff[9:0];
  genvar idx_delay;
  always @(posedge hb0_gtwiz_userclk_tx_usrclk2_int)
        delay_buff[0] <= Packet_detected_posedge;
  generate
      for (idx_delay = 1; idx_delay < 10; idx_delay = idx_delay + 1) begin : fifo_buffer
          always @(posedge hb0_gtwiz_userclk_tx_usrclk2_int) begin
              delay_buff[idx_delay] <= delay_buff[idx_delay-1];
          end
      end
  endgenerate
  assign xphdlyreset_usr_in = delay_buff[9];
  assign gtwiz_buffbypass_rx_start_user_int[0:0] = delay_buff[9];

  // ===================================================================================================================
  // EXAMPLE WRAPPER INSTANCE
  // ===================================================================================================================

  // Instantiate the example design wrapper, mapping its enabled ports to per-channel internal signals and example
  // resources as appropriate
  wire [0:0] rxcdrlock_out;
  wire [0 : 0] rxphaligndone_out;
  wire [0 : 0] rxsyncdone_out;
  wire [0:0] rxdlysresetdone_out;
  wire [0 : 0] txelecidle_in;
  wire [1 : 0] txpd_in;
  reg [0:0] delay_buffer[2:0];
  reg [0:0] m_axis_tvalid_delayed;
  always @(posedge hb0_gtwiz_userclk_tx_usrclk2_int) begin
      delay_buffer[0] <= m_axis_tvalid;
      m_axis_tvalid_delayed <= delay_buffer[2];
  end

  assign txpd_in[0] = Tx_PD_sel? (~m_axis_tvalid_delayed) : 1'b0; //~m_axis_tvalid;
  assign txpd_in[1] = Tx_PD_sel? (~m_axis_tvalid_delayed) : 1'b0; //~m_axis_tvalid;
  assign txelecidle_in = (txpd_in[0] & txpd_in[1]);
  /*FMC_GTH_BCDR_gtbnk230_x0y26_inst GTH_BCDR_core_wrapped_inst (
    .gthrxn_in                               (gthrxn_int)
   ,.gthrxp_in                               (gthrxp_int)
   ,.gthtxn_out                              (gthtxn_int)
   ,.gthtxp_out                              (gthtxp_int)
   ,.gtwiz_userclk_tx_reset_in               (gtwiz_userclk_tx_reset_int)
   ,.gtwiz_userclk_tx_srcclk_out             (gtwiz_userclk_tx_srcclk_int)
   ,.gtwiz_userclk_tx_usrclk_out             (gtwiz_userclk_tx_usrclk_int)
   ,.gtwiz_userclk_tx_usrclk2_out            (gtwiz_userclk_tx_usrclk2_int)
   ,.gtwiz_userclk_tx_active_out             (gtwiz_userclk_tx_active_int)
   ,.gtwiz_userclk_rx_reset_in               (gtwiz_userclk_rx_reset_int)
   ,.gtwiz_userclk_rx_srcclk_out             (gtwiz_userclk_rx_srcclk_int)
   ,.gtwiz_userclk_rx_usrclk_out             (gtwiz_userclk_rx_usrclk_int)
   ,.gtwiz_userclk_rx_usrclk2_out            (gtwiz_userclk_rx_usrclk2_int)
   ,.gtwiz_userclk_rx_active_out             (gtwiz_userclk_rx_active_int)
   ,.gtwiz_buffbypass_rx_reset_in            (gtwiz_buffbypass_rx_reset_int)
   ,.gtwiz_buffbypass_rx_start_user_in       (gtwiz_buffbypass_rx_start_user_int)
   ,.gtwiz_buffbypass_rx_done_out            (gtwiz_buffbypass_rx_done_int)
   ,.gtwiz_buffbypass_rx_error_out           (gtwiz_buffbypass_rx_error_int)
   ,.gtwiz_reset_clk_freerun_in              ({1{hb_gtwiz_reset_clk_freerun_buf_int}})
   ,.gtwiz_reset_all_in                      ({1{hb_gtwiz_reset_all_int}})
   ,.gtwiz_reset_tx_pll_and_datapath_in      (gtwiz_reset_tx_pll_and_datapath_int)
   ,.gtwiz_reset_tx_datapath_in              (gtwiz_reset_tx_datapath_int)
   ,.gtwiz_reset_rx_pll_and_datapath_in      ({1{hb_gtwiz_reset_rx_pll_and_datapath_int}})
   ,.gtwiz_reset_rx_datapath_in              ({1{hb_gtwiz_reset_rx_datapath_int}})
   ,.gtwiz_reset_rx_cdr_stable_out           (gtwiz_reset_rx_cdr_stable_int)
   ,.gtwiz_reset_tx_done_out                 (gtwiz_reset_tx_done_int)
   ,.gtwiz_reset_rx_done_out                 (gtwiz_reset_rx_done_int)
   ,.gtwiz_userdata_tx_in                    (gtwiz_userdata_tx_int)
   ,.gtwiz_userdata_rx_out                   (gtwiz_userdata_rx_int)
   ,.dmonfiforeset_in                        (dmonfiforeset_int)
   ,.dmonitorclk_in                          (dmonitorclk_int)
   ,.drpaddr_in                              (drpaddr_int)
   ,.drpclk_in                               (drpclk_int)
   ,.drpdi_in                                (drpdi_int)
   ,.drpen_in                                (drpen_int)
   ,.drpwe_in                                (drpwe_int)
   ,.rxcdrovrden_in                          (rxcdrovrden_int)
   ,.dmonitorout_out                         (dmonitorout_int)
   ,.drpdo_out                               (drpdo_int)
   ,.drprdy_out                              (drprdy_int)
   ,.gtpowergood_out                         (gtpowergood_int)
   ,.rxpmaresetdone_out                      (rxpmaresetdone_int)
   ,.txpmaresetdone_out                      (txpmaresetdone_int)
   
   //Power Down and Electrical Idle Signals
   ,.txelecidle_in                           (txelecidle_in)// input wire [0 : 0] txelecidle_in
   ,.txpd_in                                 (txpd_in)// input wire [1 : 0] txpd_in
   ,.rxcdrlock_out                           (rxcdrlock_out)
   ,.rxphaligndone_out                       (rxphaligndone_out) // output wire [0 : 0] rxphaligndone_out
   ,.rxsyncdone_out                          (rxsyncdone_out)// output wire [0 : 0] rxsyncdone_out
   
   ,.qpll0clk_in                             (qpll0clk_in)
   ,.qpll0refclk_in                          (qpll0refclk_in)
   ,.qpll1clk_in                             (qpll1clk_in)
   ,.qpll1refclk_in                          (qpll1refclk_in)
   ,.gtwiz_reset_qpll0lock_in                (gtwiz_reset_qpll0lock_in)
   ,.gtwiz_reset_qpll0reset_out              (gtwiz_reset_qpll0reset_out)
);*/
    
  gty_BCDR_example_wrapper example_wrapper_inst (
    .gtyrxn_in                               (gtyrxn_int)
   ,.gtyrxp_in                               (gtyrxp_int)
   ,.gtytxn_out                              (gtytxn_int)
   ,.gtytxp_out                              (gtytxp_int)
   ,.gtwiz_userclk_tx_reset_in               (gtwiz_userclk_tx_reset_int)
   ,.gtwiz_userclk_tx_srcclk_out             (gtwiz_userclk_tx_srcclk_int)
   ,.gtwiz_userclk_tx_usrclk_out             (gtwiz_userclk_tx_usrclk_int)
   ,.gtwiz_userclk_tx_usrclk2_out            (gtwiz_userclk_tx_usrclk2_int)
   ,.gtwiz_userclk_tx_active_out             (gtwiz_userclk_tx_active_int)
   ,.gtwiz_userclk_rx_reset_in               (gtwiz_userclk_rx_reset_int)
   ,.gtwiz_userclk_rx_srcclk_out             (gtwiz_userclk_rx_srcclk_int)
   ,.gtwiz_userclk_rx_usrclk_out             (gtwiz_userclk_rx_usrclk_int)
   ,.gtwiz_userclk_rx_usrclk2_out            (gtwiz_userclk_rx_usrclk2_int)
   ,.gtwiz_userclk_rx_active_out             (gtwiz_userclk_rx_active_int)
   ,.gtwiz_buffbypass_rx_reset_in            (gtwiz_buffbypass_rx_reset_int)
   ,.gtwiz_buffbypass_rx_start_user_in       (gtwiz_buffbypass_rx_start_user_int)
   ,.gtwiz_buffbypass_rx_done_out            (gtwiz_buffbypass_rx_done_int)
   ,.gtwiz_buffbypass_rx_error_out           (gtwiz_buffbypass_rx_error_int)
   ,.gtwiz_reset_clk_freerun_in              ({1{hb_gtwiz_reset_clk_freerun_buf_int}})
   ,.gtwiz_reset_all_in                      ({1{hb_gtwiz_reset_all_int}})
   ,.gtwiz_reset_tx_pll_and_datapath_in      (gtwiz_reset_tx_pll_and_datapath_int)
   ,.gtwiz_reset_tx_datapath_in              (gtwiz_reset_tx_datapath_int)
   ,.gtwiz_reset_rx_pll_and_datapath_in      ({1{hb_gtwiz_reset_rx_pll_and_datapath_int}})
   ,.gtwiz_reset_rx_datapath_in              ({1{hb_gtwiz_reset_rx_datapath_int}})
   ,.gtwiz_reset_rx_cdr_stable_out           (gtwiz_reset_rx_cdr_stable_int)
   ,.gtwiz_reset_tx_done_out                 (gtwiz_reset_tx_done_int)
   ,.gtwiz_reset_rx_done_out                 (gtwiz_reset_rx_done_int)
   ,.gtwiz_userdata_tx_in                    (gtwiz_userdata_tx_int)
   ,.gtwiz_userdata_rx_out                   (gtwiz_userdata_rx_int)
   ,.gtrefclk00_in                           (gtrefclk00_int)
   ,.qpll0outclk_out                         (qpll0outclk_int)
   ,.qpll0outrefclk_out                      (qpll0outrefclk_int)
   ,.dmonfiforeset_in                        (dmonfiforeset_int)
   ,.dmonitorclk_in                          (dmonitorclk_int)
   ,.drpaddr_in                              (drpaddr_int)
   ,.drpclk_in                               (drpclk_int)
   ,.drpdi_in                                (drpdi_int)
   ,.drpen_in                                (drpen_int)
   ,.drpwe_in                                (drpwe_int)
   ,.rxcdrhold_in                            (rxcdrhold_int)
   ,.rxcdrovrden_in                          (rxcdrovrden_int)
   ,.dmonitorout_out                         (dmonitorout_int)
   ,.txelecidle_in                           (txelecidle_in)// input wire [0 : 0] txelecidle_in
   ,.txpd_in                                 (txpd_in)// input wire [1 : 0] txpd_in
   ,.drpdo_out                               (drpdo_int)
   ,.drprdy_out                              (drprdy_int)
   ,.gtpowergood_out                         (gtpowergood_int)
   //CDR check ports
   ,.xphdlyreset_usr_in                      (1'b0) //xphdlyreset_usr_in
   ,.rxcdrlock_out                           (rxcdrlock_out)
   ,.rxphaligndone_out                       (rxphaligndone_out) // output wire [0 : 0] rxphaligndone_out
   ,.rxsyncdone_out                          (rxsyncdone_out)// output wire [0 : 0] rxsyncdone_out
   ,.rxdlysresetdone_out                     (rxdlysresetdone_out)
   
   ,.rxpmaresetdone_out                      (rxpmaresetdone_int)
   ,.txpmaresetdone_out                      (txpmaresetdone_int)
);

    AXIS_RX_Gateway # ( 
        .C_M_AXIS_TDATA_WIDTH(32)
    ) AXIS_Rx_gateway_inst (
        .GT_RX_ACTIVE(gtwiz_userclk_rx_active_int), //input
        .GT_RX_DATA(gtwiz_userdata_rx_int), //output
        .M_AXIS_ACLK(axis_aclk_gt_rx_usrclk), //clk input
        .M_AXIS_ARESETN(axis_usrrx_aresetn), //reset (usrclk2 domain)
        .M_AXIS_TREADY(axis_usrrx_TREADY), //AXIS
        .M_AXIS_TDATA(axis_usrrx_TDATA),
        .M_AXIS_TSTRB(),
        .M_AXIS_TLAST(),
        .M_AXIS_TVALID(axis_usrrx_TVALID)
    );

    if(1) begin : xgpon_gt_txrx_if_debug
    //----------- ILA debug instantiation ---//  
    axis_ila xgpon_gt_tx_axis_ila(
        .clk(axis_aclk_gt_tx_usrclk), // input wire clk    
        .probe0(1'b1), // input wire [0:0] TREADY  
        .probe1(gtwiz_userdata_tx_int), // input wire [31:0]  TDATA 
        .probe2(4'd0), // input wire [3:0]  TSTRB 
        .probe3(gtwiz_userclk_tx_active_int), // input wire [0:0]  TVALID 
        .probe4(1'b0), // input wire [0:0]  TLAST 
        .probe5(1'b0), // input wire [0:0]  TUSER 
        .probe6(4'd15), // input wire [3:0]  TKEEP 
        .probe7(1'b0), // input wire [0:0]  TDEST  
        .probe8(1'b0) // input wire [0:0]  TID
    );
    axis_ila xgpon_gt_rx_axis_ila(
        .clk(axis_aclk_gt_rx_usrclk), // input wire clk    
        .probe0(BCDR_in_sop), // input wire [0:0] TREADY  
        .probe1(gtwiz_userdata_rx_int), // input wire [31:0]  TDATA 
        .probe2(ch0_dmonitorout_int[3:0]), // input wire [3:0]  TSTRB 
        .probe3(ch0_dmonitorout_int[4]), // input wire [0:0]  TVALID 
        .probe4(ch0_dmonitorout_int[5]), // input wire [0:0]  TLAST 
        .probe5(rxcdrlock_out), // input wire [0:0]  TUSER 
        .probe6(rxphaligndone_out), // input wire [3:0]  TKEEP 
        .probe7(rxsyncdone_out), // input wire [0:0]  TDEST  
        .probe8(rxdlysresetdone_out) // input wire [0:0]  TID
    );
    end

endmodule
