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
module xxv_ethernet_0_core_support
(
  input  wire [1-1:0] gt_rxp_in,
  input  wire [1-1:0] gt_rxn_in,
  output wire [1-1:0] gt_txp_out,
  output wire [1-1:0] gt_txn_out,
  output wire tx_clk_out_0,

  input  wire rx_core_clk_0,
  output wire rx_clk_out_0,
  input  wire [2:0] gt_loopback_in_0,
  output wire rxrecclkout_0,
  
//// RX_0 User Interface Signals

  output wire rx_axis_tvalid_0,
  output wire [31:0] rx_axis_tdata_0,
  output wire rx_axis_tlast_0,
  output wire [3:0] rx_axis_tkeep_0,
  output wire rx_axis_tuser_0,

//// RX_0 Control Signals
  input  wire ctl_rx_test_pattern_0,
  input  wire ctl_rx_test_pattern_enable_0,
  input  wire ctl_rx_data_pattern_select_0,
  input  wire ctl_rx_enable_0,
  input  wire ctl_rx_delete_fcs_0,
  input  wire ctl_rx_ignore_fcs_0,
  input  wire [14:0] ctl_rx_max_packet_len_0,
  input  wire [7:0] ctl_rx_min_packet_len_0,
  input  wire ctl_rx_check_sfd_0,
  input  wire ctl_rx_check_preamble_0,
  input  wire ctl_rx_process_lfi_0,
  input  wire ctl_rx_force_resync_0,

//// RX_0 Stats Signals
  output wire stat_rx_block_lock_0,
  output wire stat_rx_framing_err_valid_0,
  output wire stat_rx_framing_err_0,
  output wire stat_rx_hi_ber_0,
  output wire stat_rx_valid_ctrl_code_0,
  output wire stat_rx_bad_code_0,
  output wire [1:0] stat_rx_total_packets_0,
  output wire stat_rx_total_good_packets_0,
  output wire [3:0] stat_rx_total_bytes_0,
  output wire [13:0] stat_rx_total_good_bytes_0,
  output wire stat_rx_packet_small_0,
  output wire stat_rx_jabber_0,
  output wire stat_rx_packet_large_0,
  output wire stat_rx_oversize_0,
  output wire stat_rx_undersize_0,
  output wire stat_rx_toolong_0,
  output wire stat_rx_fragment_0,
  output wire stat_rx_packet_64_bytes_0,
  output wire stat_rx_packet_65_127_bytes_0,
  output wire stat_rx_packet_128_255_bytes_0,
  output wire stat_rx_packet_256_511_bytes_0,
  output wire stat_rx_packet_512_1023_bytes_0,
  output wire stat_rx_packet_1024_1518_bytes_0,
  output wire stat_rx_packet_1519_1522_bytes_0,
  output wire stat_rx_packet_1523_1548_bytes_0,
  output wire [1:0] stat_rx_bad_fcs_0,
  output wire stat_rx_packet_bad_fcs_0,
  output wire [1:0] stat_rx_stomped_fcs_0,
  output wire stat_rx_packet_1549_2047_bytes_0,
  output wire stat_rx_packet_2048_4095_bytes_0,
  output wire stat_rx_packet_4096_8191_bytes_0,
  output wire stat_rx_packet_8192_9215_bytes_0,
  output wire stat_rx_bad_preamble_0,
  output wire stat_rx_bad_sfd_0,
  output wire stat_rx_got_signal_os_0,
  output wire stat_rx_test_pattern_mismatch_0,
  output wire stat_rx_truncated_0,
  output wire stat_rx_local_fault_0,
  output wire stat_rx_remote_fault_0,
  output wire stat_rx_internal_local_fault_0,
  output wire stat_rx_received_local_fault_0,
  output wire stat_rx_status_0,
  
//// TX_0 User Interface Signals
  output wire tx_axis_tready_0,
  input  wire tx_axis_tvalid_0,
  input  wire [31:0] tx_axis_tdata_0,
  input  wire tx_axis_tlast_0,
  input  wire [3:0] tx_axis_tkeep_0,
  input  wire tx_axis_tuser_0,
  output wire tx_unfout_0,


//// TX_0 Control Signals
  input  wire ctl_tx_test_pattern_0,
  input  wire ctl_tx_test_pattern_enable_0,
  input  wire ctl_tx_test_pattern_select_0,
  input  wire ctl_tx_data_pattern_select_0,
  input  wire [57:0] ctl_tx_test_pattern_seed_a_0,
  input  wire [57:0] ctl_tx_test_pattern_seed_b_0,
  input  wire ctl_tx_enable_0,
  input  wire ctl_tx_fcs_ins_enable_0,
  input  wire ctl_tx_send_lfi_0,
  input  wire ctl_tx_send_rfi_0,
  input  wire ctl_tx_send_idle_0,
  input  wire ctl_tx_ignore_fcs_0,


//// TX_0 Stats Signals
  output wire stat_tx_total_packets_0,
  output wire [2:0] stat_tx_total_bytes_0,
  output wire stat_tx_total_good_packets_0,
  output wire [13:0] stat_tx_total_good_bytes_0,
  output wire stat_tx_packet_64_bytes_0,
  output wire stat_tx_packet_65_127_bytes_0,
  output wire stat_tx_packet_128_255_bytes_0,
  output wire stat_tx_packet_256_511_bytes_0,
  output wire stat_tx_packet_512_1023_bytes_0,
  output wire stat_tx_packet_1024_1518_bytes_0,
  output wire stat_tx_packet_1519_1522_bytes_0,
  output wire stat_tx_packet_1523_1548_bytes_0,
  output wire stat_tx_packet_small_0,
  output wire stat_tx_packet_large_0,
  output wire stat_tx_packet_1549_2047_bytes_0,
  output wire stat_tx_packet_2048_4095_bytes_0,
  output wire stat_tx_packet_4096_8191_bytes_0,
  output wire stat_tx_packet_8192_9215_bytes_0,
  output wire stat_tx_bad_fcs_0,
  output wire stat_tx_frame_error_0,
  output wire stat_tx_local_fault_0,





//// GT Debug interface ports
  output wire [16:0] gt_dmonitorout_0,
  output wire [0:0] gt_eyescandataerror_0,
  input  wire [0:0] gt_eyescanreset_0,
  input  wire [0:0] gt_eyescantrigger_0,
  input  wire [15:0] gt_pcsrsvdin_0,
  input  wire [0:0] gt_rxbufreset_0,
  output wire [2:0] gt_rxbufstatus_0,
  input  wire [0:0] gt_rxcdrhold_0,
  input  wire [0:0] gt_rxcommadeten_0,
  input  wire [0:0] gt_rxdfeagchold_0,
  input  wire [0:0] gt_rxdfelpmreset_0,
  input  wire [0:0] gt_rxlatclk_0,
  input  wire [0:0] gt_rxlpmen_0,
  input  wire [0:0] gt_rxpcsreset_0,
  input  wire [0:0] gt_rxpmareset_0,
  input  wire [0:0] gt_rxpolarity_0,
  input  wire [0:0] gt_rxprbscntreset_0,
  output wire [0:0] gt_rxprbserr_0,
  input  wire [3:0] gt_rxprbssel_0,
  input  wire [2:0] gt_rxrate_0,
  input  wire [0:0] gt_rxslide_in_0,
  output wire [1:0] gt_rxstartofseq_0,
  output wire [1:0] gt_txbufstatus_0,
  input  wire [4:0] gt_txdiffctrl_0,
  input  wire [0:0] gt_txinhibit_0,
  input  wire [0:0] gt_txlatclk_0,
  input  wire [6:0] gt_txmaincursor_0,
  input  wire [0:0] gt_txpcsreset_0,
  input  wire [0:0] gt_txpmareset_0,
  input  wire [0:0] gt_txpolarity_0,
  input  wire [4:0] gt_txpostcursor_0,
  input  wire [0:0] gt_txprbsforceerr_0,
  input  wire [3:0] gt_txprbssel_0,
  input  wire [4:0] gt_txprecursor_0,
//// GT DRP interface ports
  output wire [15:0] gt_drpdo_0,
  output wire [0:0] gt_drprdy_0,
  input  wire [0:0] gt_drpen_0,
  input  wire [0:0] gt_drpwe_0,
  input  wire [9:0] gt_drpaddr_0,
  input  wire [15:0] gt_drpdi_0,
  input wire gt_drpclk_0,
  output wire gtpowergood_out_0,
  input wire [2:0] txoutclksel_in_0,
  input wire [2:0] rxoutclksel_in_0,
  
  output wire gtwiz_reset_tx_done,
  output wire gtwiz_reset_rx_done,
  input wire rx_core_reset,
  input wire tx_core_reset,
  input wire rx_serdes_reset_0,
  input wire gtwiz_reset_tx_datapath,
  input wire gtwiz_reset_rx_datapath,

  input wire qpll0lock,
  input wire qpll0outclk,
  input wire qpll0outrefclk,
  input wire qpll1lock,
  input wire qpll1outclk,
  input wire qpll1outrefclk,
  output wire gtwiz_reset_qpll0reset_out,
  output wire gtwiz_reset_qpll1reset_out,
  input wire gtwiz_reset_all_0,

  input  wire sys_reset,
  input  wire dclk
);

  //wire gtpowergood_out_0;

  wire tx_core_clk_0;
  wire rx_serdes_clk_0;
  wire [0:0] rxgearboxslip_in_0;
  wire [1:0] rxdatavalid_out_0;
  wire [5:0] rxheader_out_0;
  wire [1:0] rxheadervalid_out_0;
  wire [127:0] rx_serdes_data_out_0;
  wire [127:0] tx_serdes_data_in_0;
  wire [5:0] txheader_in_0;
  wire [0:0] tx_serdes_headervalid0_out_0;



xxv_ethernet_0 DUT
(



  .rx_reset_0 (rx_core_reset),

//// RX User Interface Signals
  .rx_axis_tvalid_0 (rx_axis_tvalid_0),
  .rx_axis_tdata_0 (rx_axis_tdata_0),
  .rx_axis_tlast_0 (rx_axis_tlast_0),
  .rx_axis_tkeep_0 (rx_axis_tkeep_0),
  .rx_axis_tuser_0 (rx_axis_tuser_0),

//// RX Control Signals

  .ctl_rx_test_pattern_0 (ctl_rx_test_pattern_0),
  .ctl_rx_test_pattern_enable_0 (ctl_rx_test_pattern_enable_0),
  .ctl_rx_data_pattern_select_0 (ctl_rx_data_pattern_select_0),
  .ctl_rx_enable_0 (ctl_rx_enable_0),
  .ctl_rx_delete_fcs_0 (ctl_rx_delete_fcs_0),
  .ctl_rx_ignore_fcs_0 (ctl_rx_ignore_fcs_0),
  .ctl_rx_max_packet_len_0 (ctl_rx_max_packet_len_0),
  .ctl_rx_min_packet_len_0 (ctl_rx_min_packet_len_0),
  .ctl_rx_check_preamble_0 (ctl_rx_check_preamble_0),
  .ctl_rx_check_sfd_0 (ctl_rx_check_sfd_0),
  .ctl_rx_process_lfi_0 (ctl_rx_process_lfi_0),
  .ctl_rx_force_resync_0 (ctl_rx_force_resync_0),



//// RX Stats Signals
  .stat_rx_block_lock_0 (stat_rx_block_lock_0),
  .stat_rx_framing_err_valid_0 (stat_rx_framing_err_valid_0),
  .stat_rx_framing_err_0 (stat_rx_framing_err_0),
  .stat_rx_hi_ber_0 (stat_rx_hi_ber_0),
  .stat_rx_valid_ctrl_code_0 (stat_rx_valid_ctrl_code_0),
  .stat_rx_bad_code_0 (stat_rx_bad_code_0),
  .stat_rx_total_packets_0 (stat_rx_total_packets_0),
  .stat_rx_total_good_packets_0 (stat_rx_total_good_packets_0),
  .stat_rx_total_bytes_0 (stat_rx_total_bytes_0),
  .stat_rx_total_good_bytes_0 (stat_rx_total_good_bytes_0),
  .stat_rx_packet_small_0 (stat_rx_packet_small_0),
  .stat_rx_jabber_0 (stat_rx_jabber_0),
  .stat_rx_packet_large_0 (stat_rx_packet_large_0),
  .stat_rx_oversize_0 (stat_rx_oversize_0),
  .stat_rx_undersize_0 (stat_rx_undersize_0),
  .stat_rx_toolong_0 (stat_rx_toolong_0),
  .stat_rx_fragment_0 (stat_rx_fragment_0),
  .stat_rx_packet_64_bytes_0 (stat_rx_packet_64_bytes_0),
  .stat_rx_packet_65_127_bytes_0 (stat_rx_packet_65_127_bytes_0),
  .stat_rx_packet_128_255_bytes_0 (stat_rx_packet_128_255_bytes_0),
  .stat_rx_packet_256_511_bytes_0 (stat_rx_packet_256_511_bytes_0),
  .stat_rx_packet_512_1023_bytes_0 (stat_rx_packet_512_1023_bytes_0),
  .stat_rx_packet_1024_1518_bytes_0 (stat_rx_packet_1024_1518_bytes_0),
  .stat_rx_packet_1519_1522_bytes_0 (stat_rx_packet_1519_1522_bytes_0),
  .stat_rx_packet_1523_1548_bytes_0 (stat_rx_packet_1523_1548_bytes_0),
  .stat_rx_bad_fcs_0 (stat_rx_bad_fcs_0),
  .stat_rx_packet_bad_fcs_0 (stat_rx_packet_bad_fcs_0),
  .stat_rx_stomped_fcs_0 (stat_rx_stomped_fcs_0),
  .stat_rx_packet_1549_2047_bytes_0 (stat_rx_packet_1549_2047_bytes_0),
  .stat_rx_packet_2048_4095_bytes_0 (stat_rx_packet_2048_4095_bytes_0),
  .stat_rx_packet_4096_8191_bytes_0 (stat_rx_packet_4096_8191_bytes_0),
  .stat_rx_packet_8192_9215_bytes_0 (stat_rx_packet_8192_9215_bytes_0),
  .stat_rx_bad_preamble_0 (stat_rx_bad_preamble_0),
  .stat_rx_bad_sfd_0 (stat_rx_bad_sfd_0),
  .stat_rx_got_signal_os_0 (stat_rx_got_signal_os_0),
  .stat_rx_test_pattern_mismatch_0 (stat_rx_test_pattern_mismatch_0),
  .stat_rx_truncated_0 (stat_rx_truncated_0),
  .stat_rx_local_fault_0 (stat_rx_local_fault_0),
  .stat_rx_remote_fault_0 (stat_rx_remote_fault_0),
  .stat_rx_internal_local_fault_0 (stat_rx_internal_local_fault_0),
  .stat_rx_received_local_fault_0 (stat_rx_received_local_fault_0),

  .stat_rx_status_0 (stat_rx_status_0),
  .tx_reset_0 (tx_core_reset),

//// TX User Interface Signals
  .tx_axis_tready_0 (tx_axis_tready_0),
  .tx_axis_tvalid_0 (tx_axis_tvalid_0),
  .tx_axis_tdata_0 (tx_axis_tdata_0),
  .tx_axis_tlast_0 (tx_axis_tlast_0),
  .tx_axis_tkeep_0 (tx_axis_tkeep_0),
  .tx_axis_tuser_0 (tx_axis_tuser_0),
  .tx_unfout_0 (tx_unfout_0),

//// TX Control Signals
  .ctl_tx_test_pattern_0 (ctl_tx_test_pattern_0),
  .ctl_tx_test_pattern_enable_0 (ctl_tx_test_pattern_enable_0),
  .ctl_tx_test_pattern_select_0 (ctl_tx_test_pattern_select_0),
  .ctl_tx_data_pattern_select_0 (ctl_tx_data_pattern_select_0),
  .ctl_tx_test_pattern_seed_a_0 (ctl_tx_test_pattern_seed_a_0),
  .ctl_tx_test_pattern_seed_b_0 (ctl_tx_test_pattern_seed_b_0),
  .ctl_tx_enable_0 (ctl_tx_enable_0),
  .ctl_tx_fcs_ins_enable_0 (ctl_tx_fcs_ins_enable_0),
  .ctl_tx_send_lfi_0 (ctl_tx_send_lfi_0),
  .ctl_tx_send_rfi_0 (ctl_tx_send_rfi_0),
  .ctl_tx_send_idle_0 (ctl_tx_send_idle_0),
  .ctl_tx_ignore_fcs_0 (ctl_tx_ignore_fcs_0),


//// TX Stats Signals
  .stat_tx_total_packets_0 (stat_tx_total_packets_0),
  .stat_tx_total_bytes_0 (stat_tx_total_bytes_0),
  .stat_tx_total_good_packets_0 (stat_tx_total_good_packets_0),
  .stat_tx_total_good_bytes_0 (stat_tx_total_good_bytes_0),
  .stat_tx_packet_64_bytes_0 (stat_tx_packet_64_bytes_0),
  .stat_tx_packet_65_127_bytes_0 (stat_tx_packet_65_127_bytes_0),
  .stat_tx_packet_128_255_bytes_0 (stat_tx_packet_128_255_bytes_0),
  .stat_tx_packet_256_511_bytes_0 (stat_tx_packet_256_511_bytes_0),
  .stat_tx_packet_512_1023_bytes_0 (stat_tx_packet_512_1023_bytes_0),
  .stat_tx_packet_1024_1518_bytes_0 (stat_tx_packet_1024_1518_bytes_0),
  .stat_tx_packet_1519_1522_bytes_0 (stat_tx_packet_1519_1522_bytes_0),
  .stat_tx_packet_1523_1548_bytes_0 (stat_tx_packet_1523_1548_bytes_0),
  .stat_tx_packet_small_0 (stat_tx_packet_small_0),
  .stat_tx_packet_large_0 (stat_tx_packet_large_0),
  .stat_tx_packet_1549_2047_bytes_0 (stat_tx_packet_1549_2047_bytes_0),
  .stat_tx_packet_2048_4095_bytes_0 (stat_tx_packet_2048_4095_bytes_0),
  .stat_tx_packet_4096_8191_bytes_0 (stat_tx_packet_4096_8191_bytes_0),
  .stat_tx_packet_8192_9215_bytes_0 (stat_tx_packet_8192_9215_bytes_0),
  .stat_tx_bad_fcs_0 (stat_tx_bad_fcs_0),
  .stat_tx_frame_error_0 (stat_tx_frame_error_0),
  .stat_tx_local_fault_0 (stat_tx_local_fault_0),




  .tx_core_clk_0 (tx_core_clk_0),
  .rx_core_clk_0 (rx_core_clk_0),
  .rx_serdes_clk_0 (rx_serdes_clk_0),
  .rx_serdes_reset_0 (rx_serdes_reset_0),
  .rxgearboxslip_in_0 (rxgearboxslip_in_0),
  .rxdatavalid_out_0 (rxdatavalid_out_0),
  .rxheader_out_0 (rxheader_out_0),
  .rxheadervalid_out_0 (rxheadervalid_out_0),
  .rx_serdes_data_out_0 (rx_serdes_data_out_0),
  .tx_serdes_data_in_0 (tx_serdes_data_in_0),
    .tx_serdes_headervalid0_out_0 (tx_serdes_headervalid0_out_0),
  .txheader_in_0 (txheader_in_0)

);


  wire gt_rxp_int_0;
  wire gt_rxn_int_0;
  wire gt_txp_int_0;
  wire gt_txn_int_0;

  assign gt_rxp_int_0  =  gt_rxp_in[0];
  assign gt_rxn_int_0  =  gt_rxn_in[0];
  assign gt_txp_out[0] =  gt_txp_int_0;
  assign gt_txn_out[0] =  gt_txn_int_0;

xxv_ethernet_0_gt_wrapper_0 i_xxv_ethernet_0_gt_wrapper_0(
  .gt_rxp_in (gt_rxp_int_0),
  .gt_rxn_in (gt_rxn_int_0),
  .gt_txp_out (gt_txp_int_0),
  .gt_txn_out (gt_txn_int_0),
  .tx_clk_out (tx_clk_out_0),
  .rx_clk_out (rx_clk_out_0),
  .gt_loopback_in (gt_loopback_in_0),
  .gtwiz_reset_all (gtwiz_reset_all_0),
  .rxrecclkout (rxrecclkout_0),

////GT Transceiver debug interface ports
  .gt_dmonitorout (gt_dmonitorout_0),
  .gtpowergood_out (gtpowergood_out_0),
  .gt_eyescandataerror (gt_eyescandataerror_0),
  .gt_eyescanreset (gt_eyescanreset_0),
  .gt_eyescantrigger (gt_eyescantrigger_0),
  .gt_pcsrsvdin (gt_pcsrsvdin_0),
  .gt_rxbufreset (gt_rxbufreset_0),
  .gt_rxbufstatus (gt_rxbufstatus_0),
  .gt_rxcdrhold (gt_rxcdrhold_0),
  .gt_rxcommadeten (gt_rxcommadeten_0),
  .gt_rxdfeagchold (gt_rxdfeagchold_0),
  .gt_rxdfelpmreset (gt_rxdfelpmreset_0),
  .gt_rxlatclk (gt_rxlatclk_0),
  .gt_rxlpmen (gt_rxlpmen_0),
  .gt_rxpcsreset (gt_rxpcsreset_0),
  .gt_rxpmareset (gt_rxpmareset_0),
  .gt_rxpolarity (gt_rxpolarity_0),
  .gt_rxprbscntreset (gt_rxprbscntreset_0),
  .gt_rxprbserr (gt_rxprbserr_0),
  .gt_rxprbssel (gt_rxprbssel_0),
  .gt_rxrate (gt_rxrate_0),
  .gt_rxslide_in (gt_rxslide_in_0),
  .gt_rxstartofseq (gt_rxstartofseq_0),
  .gt_txbufstatus (gt_txbufstatus_0),
  .gt_txdiffctrl (gt_txdiffctrl_0),
  .gt_txinhibit (gt_txinhibit_0),
  .gt_txlatclk (gt_txlatclk_0),
  .gt_txmaincursor (gt_txmaincursor_0),
  .gt_txpcsreset (gt_txpcsreset_0),
  .gt_txpmareset (gt_txpmareset_0),
  .gt_txpolarity (gt_txpolarity_0),
  .gt_txpostcursor (gt_txpostcursor_0),
  .gt_txprbsforceerr (gt_txprbsforceerr_0),
  .gt_txprbssel (gt_txprbssel_0),
  .gt_txprecursor (gt_txprecursor_0),
  .gtwiz_reset_tx_datapath (gtwiz_reset_tx_datapath),
  .gtwiz_reset_rx_datapath (gtwiz_reset_rx_datapath),
  .txoutclksel_in (txoutclksel_in_0),
  .rxoutclksel_in (rxoutclksel_in_0),

////GT DRP ports 
  .gt_drpclk (gt_drpclk_0),
  .gt_drpdo (gt_drpdo_0),
  .gt_drprdy (gt_drprdy_0),
  .gt_drpen (drpen_in_0),
  .gt_drpwe (gt_drpwe_0),
  .gt_drpaddr (gt_drpaddr_0),
  .gt_drpdi (gt_drpdi_0),


  .gtwiz_reset_tx_done (gtwiz_reset_tx_done),
  .gtwiz_reset_rx_done (gtwiz_reset_rx_done),
  .rx_serdes_clk (rx_serdes_clk_0),
  .tx_core_clk (tx_core_clk_0),
  .rxgearboxslip_in (rxgearboxslip_in_0),
  .rxdatavalid_out (rxdatavalid_out_0),
  .rxheader_out (rxheader_out_0),
  .rxheadervalid_out (rxheadervalid_out_0),
  .rx_serdes_data_out (rx_serdes_data_out_0),
  .tx_serdes_data_in (tx_serdes_data_in_0),
  .tx_serdes_headervalid0_out (tx_serdes_headervalid0_out_0),
  .txheader_in (txheader_in_0),

////  Ports present when shared logic is implemented outside core
  .qpll0clk_in (qpll0outclk),
  .qpll0refclk_in (qpll0outrefclk),
  .qpll1clk_in (qpll1outclk),
  .qpll1refclk_in (qpll1outrefclk),
  .gtwiz_reset_qpll0lock_in (qpll0lock),
  .gtwiz_reset_qpll0reset_out (gtwiz_reset_qpll0reset_out),
  .gtwiz_reset_qpll1lock_in (qpll1lock),
  .gtwiz_reset_qpll1reset_out (gtwiz_reset_qpll1reset_out),
  .sys_reset (sys_reset),
  .dclk (dclk)

);

endmodule



