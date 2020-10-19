////------------------------------------------------------------------------------
////  (c) Copyright 2013 Xilinx, Inc. All rights reserved.
////
////  This file contains confidential and proprietary information
////  of Xilinx, Inc. and is protected under U.S. and
////  international copyright and other intellectual property
////  laws.
////
////  DISCLAIMER
////  This disclaimer is not a license and does not grant any
////  rights to the materials distributed herewith. Except as
////  otherwise provided in a valid license issued to you by
////  Xilinx, and to the maximum extent permitted by applicable
////  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
////  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
////  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
////  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
////  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
////  (2) Xilinx shall not be liable (whether in contract or tort,
////  including negligence, or under any other theory of
////  liability) for any loss or damage of any kind or nature
////  related to, arising under or in connection with these
////  materials, including for any direct, or any indirect,
////  special, incidental, or consequential loss or damage
////  (including loss of data, profits, goodwill, or any type of
////  loss or damage suffered as a result of any action brought
////  by a third party) even if such damage or loss was
////  reasonably foreseeable or Xilinx had been advised of the
////  possibility of the same.
////
////  CRITICAL APPLICATIONS
////  Xilinx products are not designed or intended to be fail-
////  safe, or for use in any application requiring fail-safe
////  performance, such as life-support or safety devices or
////  systems, Class III medical devices, nuclear facilities,
////  applications related to the deployment of airbags, or any
////  other applications that could lead to death, personal
////  injury, or severe property or environmental damage
////  (individually and collectively, "Critical
////  Applications"). Customer assumes the sole risk and
////  liability of any use of Xilinx products in Critical
////  Applications, subject only to applicable laws and
////  regulations governing limitations on product liability.
////
////  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
////  PART OF THIS FILE AT ALL TIMES.
////------------------------------------------------------------------------------


`timescale 1fs/1fs

(* DowngradeIPIdentifiedWarnings="yes" *)
module eth_10G_gtbnk230_x0y25_gt_wrapper(
   input  wire gt_rxp_in,
   input  wire gt_rxn_in,
   output wire gt_txp_out,
   output wire gt_txn_out,
   output wire tx_clk_out,
   output wire rx_clk_out,
   input  wire [2:0] gt_loopback_in,

   input wire gtwiz_reset_all,

   output wire rxrecclkout,
   input wire gtwiz_reset_tx_datapath,
   input wire gtwiz_reset_rx_datapath,
   output wire gtpowergood_out,
   input wire [2:0] txoutclksel_in,
   input wire [2:0] rxoutclksel_in,
   input wire  gt_drpclk,
////GT Transceiver debug interface ports
//// GT Debug interface ports
   output wire [16:0] gt_dmonitorout,
   output wire [0:0] gt_eyescandataerror,
   input  wire [0:0] gt_eyescanreset,
   input  wire [0:0] gt_eyescantrigger,
   input  wire [15:0] gt_pcsrsvdin,
   input  wire [0:0] gt_rxbufreset,
   output wire [2:0] gt_rxbufstatus,
   input  wire [0:0] gt_rxcdrhold,
   input  wire [0:0] gt_rxcommadeten,
   input  wire [0:0] gt_rxdfeagchold,
   input  wire [0:0] gt_rxdfelpmreset,
   input  wire [0:0] gt_rxlatclk,
   input  wire [0:0] gt_rxlpmen,
   input  wire [0:0] gt_rxpcsreset,
   input  wire [0:0] gt_rxpmareset,
   input  wire [0:0] gt_rxpolarity,
   input  wire [0:0] gt_rxprbscntreset,
   output wire [0:0] gt_rxprbserr,
   input  wire [3:0] gt_rxprbssel,
   input  wire [2:0] gt_rxrate,
   input  wire [0:0] gt_rxslide_in,
   output wire [1:0] gt_rxstartofseq,
   output wire [1:0] gt_txbufstatus,
   input  wire [4:0] gt_txdiffctrl,
   input  wire [0:0] gt_txinhibit,
   input  wire [0:0] gt_txlatclk,
   input  wire [6:0] gt_txmaincursor,
   input  wire [0:0] gt_txpcsreset,
   input  wire [0:0] gt_txpmareset,
   input  wire [0:0] gt_txpolarity,
   input  wire [4:0] gt_txpostcursor,
   input  wire [0:0] gt_txprbsforceerr,
   input  wire [3:0] gt_txprbssel,
   input  wire [4:0] gt_txprecursor,
////GT DRP ports 
   output wire [15:0] gt_drpdo,
   output wire [0:0] gt_drprdy,
   input  wire [0:0] gt_drpen,
   input  wire [0:0] gt_drpwe,
   input  wire [9:0] gt_drpaddr,
   input  wire [15:0] gt_drpdi,

   output wire gtwiz_reset_tx_done,
   output wire gtwiz_reset_rx_done,
   output wire tx_core_clk,
   output wire rx_serdes_clk,
   input  wire [0:0] rxgearboxslip_in,
   output wire [1:0] rxdatavalid_out,
   output wire [5:0] rxheader_out,
   output wire [1:0] rxheadervalid_out,
   output wire [127:0] rx_serdes_data_out,
   input  wire [127:0] tx_serdes_data_in,
   input  wire [0:0]   tx_serdes_headervalid0_out,
   input  wire [5:0] txheader_in,

////  Ports present when shared logic is implemented outside core
   input  wire qpll0clk_in,
   input  wire qpll0refclk_in,
   input  wire qpll1clk_in,
   input  wire qpll1refclk_in,
   input  wire gtwiz_reset_qpll0lock_in,
   output wire gtwiz_reset_qpll0reset_out,
   input  wire gtwiz_reset_qpll1lock_in,
   output wire gtwiz_reset_qpll1reset_out,
   input  wire sys_reset,
   input  wire dclk

);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//// Insert GT interface here
  wire [0:0]     gt_txusrclk2 ;
  wire [0:0]     gt_rxusrclk2 ;
  wire [15:0]    drpdi_in ;
  wire [0:0]     drpen_in ;
  wire [0:0]     drpwe_in ;
  wire [0:0]     drpclk_in ;
  wire [15:0]    drpdo_out ;
  wire [0:0]     drprdy_out ;
  wire [8:0]     drpaddr_in ;
  wire [0:0]     gt_rxn_int ;
  wire [0:0]     gt_rxp_int ;
  wire [0:0]     gt_txn_int ;
  wire [0:0]     gt_txp_int ;

  wire [0:0]     gthrxn_in ;
  wire [0:0]     gthrxp_in ;
  wire [0:0]     gthtxn_out ;
  wire [0:0]     gthtxp_out ;
  wire [0:0]     rxpmaresetdone_out ;
  wire [0:0]     txprgdivresetdone_out ;
  wire [0:0]     txpmaresetdone_out ;
  wire [0:0]     rxprgdivresetdone_out ;
  wire [0:0]     gtwiz_userclk_rx_usrclk_out ;
  wire [0:0]     gtwiz_userclk_rx_srcclk_out ;
  wire [0:0]     gtwiz_userclk_rx_usrclk2_out ;
  wire [0:0]     txusrclk_in ;
  wire [0:0]     txusrclk2_in ;
  wire [0:0]     rxusrclk_in ;
  wire [0:0]     rxusrclk2_in ;

  wire [127:0]   txdata_in ;
  wire [127:0]   rxdata_out ;
  wire [2:0]     loopback_in ;
  wire [0:0]     gtwiz_reset_rx_data_good_in ;
  wire [0:0]     gtwiz_reset_clk_freerun_in ;
  wire [0:0]     gtwiz_reset_all_in ;
  wire [0:0]     gtwiz_reset_tx_pll_and_datapath_in ;
  wire [0:0]     gtwiz_reset_tx_datapath_in ;
  wire [0:0]     gtwiz_reset_tx_done_out ;
  wire [0:0]     gtwiz_reset_rx_pll_and_datapath_in ;
  wire [0:0]     gtwiz_reset_rx_datapath_in ;
  wire [0:0]     gtwiz_reset_rx_cdr_stable_out ;
  wire [0:0]     gtwiz_reset_rx_done_out ;
  wire [0:0]     gtwiz_userclk_tx_active_in ;
  wire [0:0]     core_gtwiz_userclk_tx_reset_in ;
  wire [0:0]     gtwiz_userclk_tx_srcclk_out ;
  wire [0:0]     gtwiz_userclk_tx_usrclk_out ;
  wire [0:0]     gtwiz_userclk_tx_usrclk2_out ;
  wire [0:0]     core_gtwiz_userclk_tx_active_out ;
  wire [0:0]     gtwiz_userclk_rx_active_in ;
  wire [0:0]     core_gtwiz_userclk_rx_reset_in ;
  wire [0:0]     core_gtwiz_userclk_rx_active_out ;
  wire [6:0]      txsequence_int = 7'b0;
  wire [6:0]      txsequence_in;
  assign     txsequence_in = {txsequence_int[5:0],~tx_serdes_headervalid0_out};

  wire [16:0]    dmonitorout_out ;
  wire [0:0]     eyescandataerror_out ;
  wire [0:0]     eyescanreset_in ;
  wire [0:0]     eyescantrigger_in ;
  wire [15:0]    pcsrsvdin_in ;
  wire [0:0]     rxbufreset_in ;
  wire [2:0]     rxbufstatus_out ;
  wire [0:0]     rxcommadeten_in ;
  wire [0:0]     rxdfeagchold_in ;
  wire [0:0]     rxdfelpmreset_in ;     
  wire [0:0]     rxlatclk_in ;
  wire [0:0]     rxlpmen_in ;
  wire [0:0]     rxpcsreset_in ;
  wire [0:0]     rxpmareset_in ;
  wire [0:0]     rxpolarity_in ;
  wire [0:0]     rxprbscntreset_in ;
  wire [0:0]     rxprbserr_out ;
  wire [3:0]     rxprbssel_in ;
  wire [2:0]     rxrate_in ;
  wire [0:0]     rxslide_in ;
  wire [1:0]     rxstartofseq_out ;
  wire [1:0]     txbufstatus_out ;
  wire [3:0]     txdiffctrl_in ;
  wire [0:0]     txinhibit_in ;
  wire [0:0]     txlatclk_in ;
  wire [6:0]     txmaincursor_in ;
  wire [0:0]     txpcsreset_in ;
  wire [0:0]     txpmareset_in ;
  wire [0:0]     txpolarity_in ;
  wire [4:0]     txpostcursor_in ;
  wire [0:0]     txprbsforceerr_in ;
  wire [3:0]     txprbssel_in ;
  wire [4:0]     txprecursor_in ;
  wire [0:0]     rxrecclkout_out;
  assign rxrecclkout = rxrecclkout_out;
  wire [0:0]     qpll0outclk_out;
  wire [0:0]     qpll0outrefclk_out; 
  wire [0:0]     rxcdrhold_in ;
  wire [0:0]     rxdfelfhold_in;
  wire [0:0]     rxlpmlfhold_in;
  assign rxdfelfhold_in = 1'b0;
  assign rxlpmlfhold_in = 1'b0;
  assign rxcdrhold_in = gt_rxcdrhold ;
  assign rxdfelpmreset_in = gt_rxdfelpmreset;
  assign rxpmareset_in = gt_rxpmareset;
  assign rxlpmen_in =  gt_rxlpmen;
  assign  txdata_in  = tx_serdes_data_in;
  assign  rx_serdes_data_out = rxdata_out;
  assign  loopback_in  = gt_loopback_in ;
  assign  gtwiz_reset_all_in  = gtwiz_reset_all ;
  assign  gtwiz_reset_tx_datapath_in  = gtwiz_reset_tx_datapath;
  assign  gtwiz_reset_rx_datapath_in  = gtwiz_reset_rx_datapath;
  assign  gt_dmonitorout  = dmonitorout_out ;
  assign  gt_eyescandataerror  = eyescandataerror_out ;
  assign  eyescanreset_in  = gt_eyescanreset ;
  assign  eyescantrigger_in = gt_eyescantrigger ;
  assign  pcsrsvdin_in  = gt_pcsrsvdin ;
  assign  rxbufreset_in  = gt_rxbufreset ;
  assign  gt_rxbufstatus  = rxbufstatus_out ;
  assign  rxcommadeten_in  = gt_rxcommadeten ;
  assign  rxdfeagchold_in  = gt_rxdfeagchold ;
  assign  rxlatclk_in  = gt_rxlatclk ;
  assign  txlatclk_in  = gt_txlatclk ;
  assign  rxpcsreset_in  = gt_rxpcsreset ;
  assign  rxpolarity_in  = gt_rxpolarity ;
  assign  rxprbscntreset_in  =gt_rxprbscntreset ;
  assign  gt_rxprbserr  = rxprbserr_out ;
  assign  rxprbssel_in  = gt_rxprbssel ;
  assign  rxrate_in  = gt_rxrate ;
  assign  rxslide_in  = gt_rxslide_in ;
  assign  gt_rxstartofseq  = rxstartofseq_out ;
  assign  gt_txbufstatus  = txbufstatus_out ;
  assign  txdiffctrl_in  = gt_txdiffctrl [3:0] ;
  assign  txinhibit_in  = gt_txinhibit ;
  assign  txmaincursor_in  = gt_txmaincursor ;
  assign  txpcsreset_in  = gt_txpcsreset ;
  assign  txpmareset_in  = gt_txpmareset ;
  assign  txpolarity_in  = gt_txpolarity ;
  assign  txpostcursor_in  = gt_txpostcursor ;
  assign  txprbsforceerr_in  = gt_txprbsforceerr ;
  assign  txprbssel_in  = gt_txprbssel ;
  assign  txprecursor_in  = gt_txprecursor ;
  assign  drpaddr_in  = gt_drpaddr [8:0];
  assign  drpdi_in  = gt_drpdi ;
  assign  gt_drpdo  = drpdo_out ;
  assign  drpen_in  = gt_drpen ;
  assign  gt_drprdy  = drprdy_out ;
  assign  drpwe_in  = gt_drpwe ;
  assign  drpclk_in  = gt_drpclk ;

  assign  gt_rxn_int  = gt_rxn_in ;
  assign  gt_rxp_int  = gt_rxp_in ;
  assign  gt_txn_out  = gt_txn_int ;
  assign  gt_txp_out  = gt_txp_int ;

  ////assign inputs to GT
  assign  gtwiz_reset_clk_freerun_in  = dclk;
  assign  gtwiz_reset_tx_pll_and_datapath_in  = 1'b0;
  assign  gtwiz_reset_rx_pll_and_datapath_in  = 1'b0;
  assign  gtwiz_reset_rx_data_good_in  = 1'b1;
  assign  gthrxn_in  = gt_rxn_int ;
  assign  gthrxp_in  = gt_rxp_int ;

  ////outputs from GT
  assign  gt_txn_int  = gthtxn_out ;
  assign  gt_txp_int  = gthtxp_out ;

  //// ===================================================================================================================
  //// TX/RX USER CLOCKING Helper block integration
  //// ===================================================================================================================

  wire [0:0]      txoutclk_out ;
  wire [0:0]      rxoutclk_out ;

  //// ===================================================================================================================
  //// USER CLOCKING RESETS
  //// ===================================================================================================================

  //// The TX user clocking helper block should be held in reset until the clock source of that block is known to be
  //// stable. The following assignment is an example of how that stability can be determined, based on the selected TX
  //// user clock source. Replace the assignment with the appropriate signal or logic to achieve that behavior as needed.


  //// The RX user clocking helper block should be held in reset until the clock source of that block is known to be
  //// stable. The following assignment is an example of how that stability can be determined, based on the selected RX
  //// user clock source. Replace the assignment with the appropriate signal or logic to achieve that behavior as needed.
  //// Note that, if the clock source is derived from the received data, this is indicated by a combination of the
  //// appropriate reset done signal and the reset helper block's RX CDR stable indicator.

  //// ===================================================================================================================
  //// USER CLOCKING Source clocks
  //// ===================================================================================================================

  assign  gtwiz_userclk_tx_srcclk_out  = txoutclk_out ;
  assign  gtwiz_userclk_rx_srcclk_out  = rxoutclk_out ;

  //// Instantiate a single instance of the transmitter user clocking network helper block
  assign  core_gtwiz_userclk_tx_reset_in  = ~((txprgdivresetdone_out ) & (txpmaresetdone_out ));
  assign  core_gtwiz_userclk_rx_reset_in  = ~rxpmaresetdone_out ;
  //// Generate a single module instance which is driven by a clock source associated with the master transmitter channel,
  //// and which drives TXUSRCLK and TXUSRCLK2 for all channels
  //// The source clock is TXOUTCLK from the master transmitter channel
  eth_10G_gtbnk230_x0y25_ultrascale_tx_userclk
  #(
    .P_CONTENTS                     (0),
    .P_FREQ_RATIO_SOURCE_TO_USRCLK  (1),
    .P_FREQ_RATIO_USRCLK_TO_USRCLK2 (1)
  ) i_eth_10G_gtbnk230_x0y25_core_gtwiz_userclk_tx_inst  (
    .gtwiz_userclk_tx_srcclk_in   (gtwiz_userclk_tx_srcclk_out ),
    .gtwiz_userclk_tx_reset_in    (core_gtwiz_userclk_tx_reset_in ),
    .gtwiz_userclk_tx_usrclk_out  (gtwiz_userclk_tx_usrclk_out ),
    .gtwiz_userclk_tx_usrclk2_out (gtwiz_userclk_tx_usrclk2_out ),
    .gtwiz_userclk_tx_active_out  (core_gtwiz_userclk_tx_active_out )
  );

  //// Generate a single module instance which is driven by a clock source associated with the master receiver channel,
  //// and which drives RXUSRCLK and RXUSRCLK2 for all channels
  //// The source clock is RXOUTCLK from the master receiver channel
  eth_10G_gtbnk230_x0y25_ultrascale_rx_userclk
  #(
    .P_CONTENTS                     (0),
    .P_FREQ_RATIO_SOURCE_TO_USRCLK  (1),
    .P_FREQ_RATIO_USRCLK_TO_USRCLK2 (1)
  ) i_eth_10G_gtbnk230_x0y25_core_gtwiz_userclk_rx_inst  (
      .gtwiz_userclk_rx_srcclk_in   (gtwiz_userclk_rx_srcclk_out ),
      .gtwiz_userclk_rx_reset_in    (core_gtwiz_userclk_rx_reset_in ),
      .gtwiz_userclk_rx_usrclk_out  (gtwiz_userclk_rx_usrclk_out ),
      .gtwiz_userclk_rx_usrclk2_out (gtwiz_userclk_rx_usrclk2_out ),
      .gtwiz_userclk_rx_active_out  (core_gtwiz_userclk_rx_active_out )
    );

  //// Drive TXUSRCLK and TXUSRCLK2 for all channels with the respective helper block outputs
  assign  txusrclk_in                      = gtwiz_userclk_tx_usrclk_out ;
  assign  txusrclk2_in                     = gtwiz_userclk_tx_usrclk2_out ;
  assign  gtwiz_userclk_tx_active_in       = core_gtwiz_userclk_tx_active_out ;

  //// Drive RXUSRCLK and RXUSRCLK2 for each channel with the respective outputs of the associated helper block
  assign  rxusrclk_in                      = gtwiz_userclk_rx_usrclk_out ;
  assign  rxusrclk2_in                     = gtwiz_userclk_rx_usrclk2_out ;
  assign  gtwiz_userclk_rx_active_in       = core_gtwiz_userclk_rx_active_out ;

  //// GT Subcore Instatiataion 

  gth_eth_10G_gtbnk230_x0y25_gt gth_eth_10G_gtbnk230_x0y25_gt_ins
  (
   .dmonitorout_out(dmonitorout_out),
   .gtpowergood_out(gtpowergood_out),
    .txoutclksel_in (txoutclksel_in),
    .rxoutclksel_in (rxoutclksel_in),
   .drpaddr_in(drpaddr_in),
   .drpclk_in(drpclk_in),
   .drpdi_in(drpdi_in),
   .drpdo_out(drpdo_out),
   .drpen_in(drpen_in),
   .drprdy_out(drprdy_out),
   .drpwe_in(drpwe_in),
   .eyescandataerror_out(eyescandataerror_out),
   .eyescanreset_in(eyescanreset_in),
   .eyescantrigger_in(eyescantrigger_in),
   .gtwiz_reset_all_in(gtwiz_reset_all_in),
   .gtwiz_reset_clk_freerun_in(gtwiz_reset_clk_freerun_in),
   .gtwiz_reset_qpll0lock_in(gtwiz_reset_qpll0lock_in),
   .gtwiz_reset_qpll0reset_out(gtwiz_reset_qpll0reset_out),
   .gtwiz_reset_rx_cdr_stable_out(gtwiz_reset_rx_cdr_stable_out),
   .gtwiz_reset_rx_datapath_in(gtwiz_reset_rx_datapath_in),
   .gtwiz_reset_rx_done_out(gtwiz_reset_rx_done_out),
   .gtwiz_reset_rx_pll_and_datapath_in(gtwiz_reset_rx_pll_and_datapath_in),
   .gtwiz_reset_tx_datapath_in(gtwiz_reset_tx_datapath_in),
   .gtwiz_reset_tx_done_out(gtwiz_reset_tx_done_out),
   .gtwiz_reset_tx_pll_and_datapath_in(gtwiz_reset_tx_pll_and_datapath_in),
   .gtwiz_userclk_rx_active_in(gtwiz_userclk_rx_active_in),
   .gtwiz_userclk_tx_active_in(gtwiz_userclk_tx_active_in),
   .gthrxn_in(gthrxn_in),
   .gthrxp_in(gthrxp_in),
   .gthtxn_out(gthtxn_out),
   .gthtxp_out(gthtxp_out),
   .loopback_in(loopback_in),
   .pcsrsvdin_in(pcsrsvdin_in),
   .qpll0clk_in(qpll0clk_in),
   .qpll0refclk_in(qpll0refclk_in),
   .qpll1clk_in(qpll1clk_in),
   .qpll1refclk_in(qpll1refclk_in),
   .rxbufreset_in(rxbufreset_in),
   .rxrecclkout_out(rxrecclkout_out),
   .rxbufstatus_out(rxbufstatus_out),
   .rxcdrhold_in(rxcdrhold_in),
   .rxdfelfhold_in(rxdfelfhold_in),
   .rxlpmlfhold_in(rxlpmlfhold_in),
   .rxcommadeten_in(rxcommadeten_in),
   .rxdata_out(rxdata_out),
   .txdata_in(txdata_in),
   .rxdatavalid_out(rxdatavalid_out),
   .rxdfeagchold_in(rxdfeagchold_in),
   .rxdfelpmreset_in(rxdfelpmreset_in),
   .rxgearboxslip_in(rxgearboxslip_in),
   .rxheader_out(rxheader_out),
   .rxheadervalid_out(rxheadervalid_out),
   .rxlatclk_in(rxlatclk_in),
   .rxlpmen_in(rxlpmen_in),
   .rxoutclk_out(rxoutclk_out),
   .rxpcsreset_in(rxpcsreset_in),
   .rxpmareset_in(rxpmareset_in),
   .rxpmaresetdone_out(rxpmaresetdone_out),
   .rxpolarity_in(rxpolarity_in),
   .rxprbscntreset_in(rxprbscntreset_in),
   .rxprbserr_out(rxprbserr_out),
   .rxprbssel_in(rxprbssel_in),
   .rxprgdivresetdone_out(rxprgdivresetdone_out),
   .rxrate_in(rxrate_in),
   .rxslide_in(rxslide_in),
   .rxstartofseq_out(rxstartofseq_out),
   .rxusrclk2_in(rxusrclk2_in),
   .rxusrclk_in(rxusrclk_in),
   .txbufstatus_out(txbufstatus_out),
   .txdiffctrl_in(txdiffctrl_in),
   .txheader_in(txheader_in),
   .txinhibit_in(txinhibit_in),
   .txlatclk_in(txlatclk_in),
   .txmaincursor_in(txmaincursor_in),
   .txoutclk_out(txoutclk_out),
   .txpcsreset_in(txpcsreset_in),
   .txpmareset_in(txpmareset_in),
   .txpmaresetdone_out(txpmaresetdone_out),
   .txpolarity_in(txpolarity_in),
   .txpostcursor_in(txpostcursor_in),
   .txprbsforceerr_in(txprbsforceerr_in),
   .txprbssel_in(txprbssel_in),
   .txprecursor_in(txprecursor_in),
   .txprgdivresetdone_out(txprgdivresetdone_out),
   .txsequence_in(txsequence_in),
   .txusrclk2_in(txusrclk2_in),
   .txusrclk_in(txusrclk_in)
  );

  assign  tx_clk_out = gtwiz_userclk_tx_usrclk2_out;
  assign  rx_clk_out = gtwiz_userclk_rx_usrclk2_out;
  assign  gt_txusrclk2 = gtwiz_userclk_tx_usrclk2_out;
  assign  gt_rxusrclk2 = gtwiz_userclk_rx_usrclk2_out;
  assign  gtwiz_reset_tx_done = gtwiz_reset_tx_done_out;
  assign  gtwiz_reset_rx_done = gtwiz_reset_rx_done_out;
  assign  rx_serdes_clk = gt_rxusrclk2; 
  assign  tx_core_clk = gt_txusrclk2; 
 
endmodule



