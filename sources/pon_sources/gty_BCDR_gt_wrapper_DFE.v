//------------------------------------------------------------------------------
//  (c) Copyright 2013-2015 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------


`timescale 1ps/1ps

// =====================================================================================================================
// This example design wrapper module instantiates the core and any helper blocks which the user chose to exclude from
// the core, connects them as appropriate, and maps enabled ports
// =====================================================================================================================

module gty_BCDR_example_wrapper (
  input  wire [0:0] gtyrxn_in
 ,input  wire [0:0] gtyrxp_in
 ,output wire [0:0] gtytxn_out
 ,output wire [0:0] gtytxp_out
 ,input  wire [0:0] gtwiz_userclk_tx_reset_in
 ,output wire [0:0] gtwiz_userclk_tx_srcclk_out
 ,output wire [0:0] gtwiz_userclk_tx_usrclk_out
 ,output wire [0:0] gtwiz_userclk_tx_usrclk2_out
 ,output wire [0:0] gtwiz_userclk_tx_active_out
 ,input  wire [0:0] gtwiz_userclk_rx_reset_in
 ,output wire [0:0] gtwiz_userclk_rx_srcclk_out
 ,output wire [0:0] gtwiz_userclk_rx_usrclk_out
 ,output wire [0:0] gtwiz_userclk_rx_usrclk2_out
 ,output wire [0:0] gtwiz_userclk_rx_active_out
 ,input  wire [0:0] gtwiz_buffbypass_rx_reset_in
 ,input  wire [0:0] gtwiz_buffbypass_rx_start_user_in
 ,output wire [0:0] gtwiz_buffbypass_rx_done_out
 ,output wire [0:0] gtwiz_buffbypass_rx_error_out
 ,input  wire [0:0] gtwiz_reset_clk_freerun_in
 ,input  wire [0:0] gtwiz_reset_all_in
 ,input  wire [0:0] gtwiz_reset_tx_pll_and_datapath_in
 ,input  wire [0:0] gtwiz_reset_tx_datapath_in
 ,input  wire [0:0] gtwiz_reset_rx_pll_and_datapath_in
 ,input  wire [0:0] gtwiz_reset_rx_datapath_in
 ,output wire [0:0] gtwiz_reset_rx_cdr_stable_out
 ,output wire [0:0] gtwiz_reset_tx_done_out
 ,output wire [0:0] gtwiz_reset_rx_done_out
 ,input  wire [31:0] gtwiz_userdata_tx_in
 ,output wire [31:0] gtwiz_userdata_rx_out
 ,input  wire [0:0] gtrefclk00_in
 ,output wire [0:0] qpll0outclk_out
 ,output wire [0:0] qpll0outrefclk_out
 ,input  wire [0:0] dmonfiforeset_in
 ,input  wire [0:0] dmonitorclk_in
 ,input  wire [9:0] drpaddr_in
 ,input  wire [0:0] drpclk_in
 ,input  wire [15:0] drpdi_in
 ,input  wire [0:0] drpen_in
 ,input  wire [0:0] drpwe_in
 ,output wire [15:0] drpdo_out
 ,output wire [0:0] drprdy_out
 ,output wire [0:0] gtpowergood_out
 ,input wire [0 : 0] rxcdrhold_in
 ,input  wire [0:0] rxcdrovrden_in
 ,input wire [0:0] xphdlyreset_usr_in
 ,output wire [16:0] dmonitorout_out
 //electrical idle and PD ports
 ,input wire [0 : 0] txelecidle_in
 ,input wire [1 : 0] txpd_in
 //CDR check ports
 ,output wire [0:0] rxcdrlock_out
 ,output wire [0 : 0] rxphaligndone_out
 ,output wire [0 : 0] rxsyncdone_out
 ,output wire [0 : 0] rxdlysresetdone_out
 ,output wire [0:0] rxpmaresetdone_out
 ,output wire [0:0] txpmaresetdone_out
 );


  // ===================================================================================================================
  // PARAMETERS AND FUNCTIONS
  // ===================================================================================================================

  // Declare and initialize local parameters and functions used for HDL generation
  localparam [191:0] P_CHANNEL_ENABLE = 192'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111000000000000;
  `include "gty_BCDR_example_wrapper_functions.v"
  localparam integer P_TX_MASTER_CH_PACKED_IDX = f_calc_pk_mc_idx(15);
  localparam integer P_RX_MASTER_CH_PACKED_IDX = f_calc_pk_mc_idx(15);


  // ===================================================================================================================
  // HELPER BLOCKS
  // ===================================================================================================================

  // Any helper blocks which the user chose to exclude from the core will appear below. In addition, some signal
  // assignments related to optionally-enabled ports may appear below.

  // -------------------------------------------------------------------------------------------------------------------
  // Receiver buffer bypass controller helper block
  // -------------------------------------------------------------------------------------------------------------------

  wire [0:0] rxphaligndone_int;
  wire [0:0] rxdlysresetdone_int;
  wire [0:0] rxsyncout_int;
  wire [0:0] rxsyncdone_int;
  wire [0:0] rxphdlyreset_int;
  wire [0:0] rxphalign_int;
  wire [0:0] rxphalignen_int;
  wire [0:0] rxphdlypd_int;
  wire [0:0] rxphovrden_int;
  wire [0:0] rxdlysreset_int;
  wire [0:0] rxdlybypass_int;
  wire [0:0] rxdlyen_int;
  wire [0:0] rxdlyovrden_int;
  wire [0:0] rxsyncmode_int;
  wire [0:0] rxsyncallin_int;
  wire [0:0] rxsyncin_int;
  assign rxsyncdone_out = rxsyncdone_int;
  assign rxphaligndone_out = rxphaligndone_int;
  assign rxdlysresetdone_out = rxdlysresetdone_int;
  
  wire [0:0] rxphdlyreset_in;
  
  /*wire [0:0] xphdlyreset_usr_in_sync;  
  //sync xphdlyreset_usr_in to gt usrclk2 domain
  (* DONT_TOUCH = "TRUE" *)
  reset_sync reset_synchronizer_resetdone_inst (
    .clk_in  (gtwiz_userclk_rx_usrclk2_out),
    .rst_in  (xphdlyreset_usr_in),
    .rst_out (xphdlyreset_usr_in_sync)
  );*/
  assign rxphdlyreset_in = rxphdlyreset_int || xphdlyreset_usr_in;
  // Generate a single module instance which uses the designated receiver master channel as the receive buffer bypass
  // master channel, and all other channels as receive buffer bypass slave channels

  // Depending on the number of reset controller helper blocks, either use the single reset done indicator or the
  // logical combination of per-channel reset done indicators as the reset done indicator for use in this block
  wire gtwiz_buffbypass_rx_resetdone_int;

  assign gtwiz_buffbypass_rx_resetdone_int = gtwiz_reset_rx_done_out;

  (* DONT_TOUCH = "TRUE" *)
  gty_BCDR_DFE_example_gtwiz_buffbypass_rx #(
    .P_TOTAL_NUMBER_OF_CHANNELS (1),
    .P_MASTER_CHANNEL_POINTER   (P_RX_MASTER_CH_PACKED_IDX)
  ) gtwiz_buffbypass_rx_inst (
    .gtwiz_buffbypass_rx_clk_in        (gtwiz_userclk_rx_usrclk2_out),
    .gtwiz_buffbypass_rx_reset_in      (gtwiz_buffbypass_rx_reset_in),
    .gtwiz_buffbypass_rx_start_user_in (gtwiz_buffbypass_rx_start_user_in),
    .gtwiz_buffbypass_rx_resetdone_in  (gtwiz_buffbypass_rx_resetdone_int),
    .gtwiz_buffbypass_rx_done_out      (gtwiz_buffbypass_rx_done_out),
    .gtwiz_buffbypass_rx_error_out     (gtwiz_buffbypass_rx_error_out),
    .rxphaligndone_in                  (rxphaligndone_int),
    .rxdlysresetdone_in                (rxdlysresetdone_int),
    .rxsyncout_in                      (rxsyncout_int),
    .rxsyncdone_in                     (rxsyncdone_int),
    .rxphdlyreset_out                  (rxphdlyreset_int),
    .rxphalign_out                     (rxphalign_int),
    .rxphalignen_out                   (rxphalignen_int),
    .rxphdlypd_out                     (rxphdlypd_int),
    .rxphovrden_out                    (rxphovrden_int),
    .rxdlysreset_out                   (rxdlysreset_int),
    .rxdlybypass_out                   (rxdlybypass_int),
    .rxdlyen_out                       (rxdlyen_int),
    .rxdlyovrden_out                   (rxdlyovrden_int),
    .rxsyncmode_out                    (rxsyncmode_int),
    .rxsyncallin_out                   (rxsyncallin_int),
    .rxsyncin_out                      (rxsyncin_int)
  );
  wire [0:0] gtpowergood_int;

  // Required assignment to expose the GTPOWERGOOD port per user request
  assign gtpowergood_out = gtpowergood_int;
  wire [0:0] rxcdrlock_int;

  // Required assignment to expose the RXCDRLOCK port per user request
  assign rxcdrlock_out = rxcdrlock_int;
  
   //comments this DFE related ports and uncomment LPM ports when LPM is enabled in the core.
   wire rxdfeagcovrden_in;
   assign rxdfeagcovrden_in = 1'b1; //~rxcdrhold_in
   wire rxdfelfovrden_in;
   assign rxdfelfovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap10ovrden_in;
   assign rxdfetap10ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap11ovrden_in;
   assign rxdfetap11ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap12ovrden_in;
   assign rxdfetap12ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap13ovrden_in;
   assign rxdfetap13ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap14ovrden_in;
   assign rxdfetap14ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap15ovrden_in;
   assign rxdfetap15ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap2ovrden_in;
   assign rxdfetap2ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap3ovrden_in;
   assign rxdfetap3ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap4ovrden_in;
   assign rxdfetap4ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap5ovrden_in;
   assign rxdfetap5ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap6ovrden_in;
   assign rxdfetap6ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap7ovrden_in;
   assign rxdfetap7ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap8ovrden_in;
   assign rxdfetap8ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfetap9ovrden_in;
   assign rxdfetap9ovrden_in = 1'b1; //~rxcdrhold_in;
   wire rxdfeutovrden_in;
   assign rxdfeutovrden_in = 1'b0;
   wire rxdfevpovrden_in;
   assign rxdfevpovrden_in = 1'b0;
   
   wire rxdfeagchold_in;
   assign rxdfeagchold_in = 1'b0; //rxcdrhold_in;
   wire rxdfelfhold_in;
   assign rxdfelfhold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap10hold_in;
   assign rxdfetap10hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap11hold_in;
   assign rxdfetap11hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap12hold_in;
   assign rxdfetap12hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap13hold_in;
   assign rxdfetap13hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap14hold_in;
   assign rxdfetap14hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap15hold_in;
   assign rxdfetap15hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap2hold_in;
   assign rxdfetap2hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap3hold_in;
   assign rxdfetap3hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap4hold_in;
   assign rxdfetap4hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap5hold_in;
   assign rxdfetap5hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap6hold_in;
   assign rxdfetap6hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap7hold_in;
   assign rxdfetap7hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap8hold_in;
   assign rxdfetap8hold_in = 1'b0; //rxcdrhold_in;
   wire rxdfetap9hold_in;
   assign rxdfetap9hold_in = 1'b0; //rxcdrhold_in;
   /*wire rxdfeuthold_in;
   assign rxdfeuthold_in = rxcdrhold_in;
   wire rxdfevphold_in;
   assign rxdfevphold_in = rxcdrhold_in;*/
   wire rxdfexyden_in;
   assign rxdfexyden_in = 1'b1;
      
   wire rxcdrovrden_int;
   assign rxcdrovrden_int = rxcdrovrden_in ;//& (~rxcdrhold_in);
   
   //comments this LPM related ports and uncomment DFE ports when DFE is enabled in the core.
   /*wire [0:0] rxlpmen_in = 1'b1;
   wire [0:0] rxlpmgcovrden_in  = 1'b0;
   wire [0:0] rxlpmhfovrden_in = 1'b0;
   wire [0:0] rxlpmlfklovrden_in = 1'b0;*/

  // ===================================================================================================================
  // CORE INSTANCE
  // ===================================================================================================================

  // Instantiate the core, mapping its enabled ports to example design ports and helper blocks as appropriate
  gty_BCDR_DFE gty_BCDR_inst (
    .gtyrxn_in                               (gtyrxn_in)
   ,.gtyrxp_in                               (gtyrxp_in)
   ,.gtytxn_out                              (gtytxn_out)
   ,.gtytxp_out                              (gtytxp_out)
   ,.gtwiz_userclk_tx_reset_in               (gtwiz_userclk_tx_reset_in)
   ,.gtwiz_userclk_tx_srcclk_out             (gtwiz_userclk_tx_srcclk_out)
   ,.gtwiz_userclk_tx_usrclk_out             (gtwiz_userclk_tx_usrclk_out)
   ,.gtwiz_userclk_tx_usrclk2_out            (gtwiz_userclk_tx_usrclk2_out)
   ,.gtwiz_userclk_tx_active_out             (gtwiz_userclk_tx_active_out)
   ,.gtwiz_userclk_rx_reset_in               (gtwiz_userclk_rx_reset_in)
   ,.gtwiz_userclk_rx_srcclk_out             (gtwiz_userclk_rx_srcclk_out)
   ,.gtwiz_userclk_rx_usrclk_out             (gtwiz_userclk_rx_usrclk_out)
   ,.gtwiz_userclk_rx_usrclk2_out            (gtwiz_userclk_rx_usrclk2_out)
   ,.gtwiz_userclk_rx_active_out             (gtwiz_userclk_rx_active_out)
   ,.gtwiz_reset_clk_freerun_in              (gtwiz_reset_clk_freerun_in)
   ,.gtwiz_reset_all_in                      (gtwiz_reset_all_in)
   ,.gtwiz_reset_tx_pll_and_datapath_in      (gtwiz_reset_tx_pll_and_datapath_in)
   ,.gtwiz_reset_tx_datapath_in              (gtwiz_reset_tx_datapath_in)
   ,.gtwiz_reset_rx_pll_and_datapath_in      (gtwiz_reset_rx_pll_and_datapath_in)
   ,.gtwiz_reset_rx_datapath_in              (gtwiz_reset_rx_datapath_in)
   ,.gtwiz_reset_rx_cdr_stable_out           (gtwiz_reset_rx_cdr_stable_out)
   ,.gtwiz_reset_tx_done_out                 (gtwiz_reset_tx_done_out)
   ,.gtwiz_reset_rx_done_out                 (gtwiz_reset_rx_done_out)
   ,.gtwiz_userdata_tx_in                    (gtwiz_userdata_tx_in)
   ,.gtwiz_userdata_rx_out                   (gtwiz_userdata_rx_out)
   ,.gtrefclk00_in                           (gtrefclk00_in)
   ,.qpll0outclk_out                         (qpll0outclk_out)
   ,.qpll0outrefclk_out                      (qpll0outrefclk_out)
   ,.dmonfiforeset_in                        (dmonfiforeset_in)
   ,.dmonitorclk_in                          (dmonitorclk_in)
   ,.drpaddr_in                              (drpaddr_in)
   ,.drpclk_in                               (drpclk_in)
   ,.drpdi_in                                (drpdi_in)
   ,.drpen_in                                (drpen_in)
   ,.drpwe_in                                (drpwe_in)
   ,.rxcdrhold_in                            (rxcdrhold_in)   
   ,.rxcdrovrden_in                          (rxcdrovrden_int)
   ,.rxdfeagchold_in						(rxdfeagchold_in)
   ,.rxdfeagcovrden_in					(rxdfeagcovrden_in)
   ,.rxdfelfhold_in						(rxdfelfhold_in)
   ,.rxdfelfovrden_in					(rxdfelfovrden_in)
   ,.rxdfetap10hold_in					(rxdfetap10hold_in)
   ,.rxdfetap10ovrden_in			(rxdfetap10ovrden_in)
   ,.rxdfetap11hold_in				(rxdfetap11hold_in)
   ,.rxdfetap11ovrden_in			(rxdfetap11ovrden_in)
   ,.rxdfetap12hold_in				(rxdfetap12hold_in)
   ,.rxdfetap12ovrden_in			(rxdfetap12ovrden_in)
   ,.rxdfetap13hold_in				(rxdfetap13hold_in)
   ,.rxdfetap13ovrden_in			(rxdfetap13ovrden_in)
   ,.rxdfetap14hold_in				(rxdfetap14hold_in)
   ,.rxdfetap14ovrden_in			(rxdfetap14ovrden_in)
   ,.rxdfetap15hold_in				(rxdfetap15hold_in)
   ,.rxdfetap15ovrden_in			(rxdfetap15ovrden_in)
   ,.rxdfetap2hold_in				(rxdfetap2hold_in)
   ,.rxdfetap2ovrden_in(rxdfetap2ovrden_in)
   ,.rxdfetap3hold_in(rxdfetap3hold_in)
   ,.rxdfetap3ovrden_in(rxdfetap3ovrden_in)
   ,.rxdfetap4hold_in(rxdfetap4hold_in)
   ,.rxdfetap4ovrden_in(rxdfetap4ovrden_in)
   ,.rxdfetap5hold_in(rxdfetap5hold_in)
   ,.rxdfetap5ovrden_in(rxdfetap5ovrden_in)
   ,.rxdfetap6hold_in(rxdfetap6hold_in)
   ,.rxdfetap6ovrden_in(rxdfetap6ovrden_in)
   ,.rxdfetap7hold_in(rxdfetap7hold_in)
   ,.rxdfetap7ovrden_in(rxdfetap7ovrden_in)
   ,.rxdfetap8hold_in(rxdfetap8hold_in)
   ,.rxdfetap8ovrden_in(rxdfetap8ovrden_in)
   ,.rxdfetap9hold_in(rxdfetap9hold_in)
   ,.rxdfetap9ovrden_in(rxdfetap9ovrden_in)
   //,.rxdfeuthold_in(rxdfeuthold_in)
   ,.rxdfeutovrden_in(rxdfeutovrden_in)
   //,.rxdfevphold_in(rxdfevphold_in)
   ,.rxdfevpovrden_in(rxdfevpovrden_in)
   ,.rxdfexyden_in(rxdfexyden_in)
   ,.rxdlybypass_in                          (rxdlybypass_int)
   ,.rxdlyen_in                              (rxdlyen_int)
   ,.rxdlyovrden_in                          (rxdlyovrden_int)
   ,.rxdlysreset_in                          (rxdlysreset_int)
   ,.rxphalign_in                            (rxphalign_int)
   ,.rxphalignen_in                          (rxphalignen_int)
   ,.rxphdlypd_in                            (rxphdlypd_int)
   ,.rxphdlyreset_in                         (rxphdlyreset_in)
   ,.rxphovrden_in                           (rxphovrden_int)
   ,.rxsyncallin_in                          (rxsyncallin_int)
   ,.rxsyncin_in                             (rxsyncin_int)
   ,.rxsyncmode_in                           (rxsyncmode_int)
   ,.txelecidle_in(txelecidle_in)
   ,.txpd_in(txpd_in)
   ,.dmonitorout_out(dmonitorout_out)
   ,.drpdo_out(drpdo_out)
   ,.drprdy_out(drprdy_out)
   ,.gtpowergood_out(gtpowergood_int)
   ,.rxcdrlock_out(rxcdrlock_int)
   ,.rxdlysresetdone_out                     (rxdlysresetdone_int)
   ,.rxphaligndone_out(rxphaligndone_int)
   ,.rxpmaresetdone_out(rxpmaresetdone_out)
   ,.rxsyncdone_out(rxsyncdone_int)
   ,.rxsyncout_out                           (rxsyncout_int)
   ,.txpmaresetdone_out(txpmaresetdone_out)
);

endmodule
