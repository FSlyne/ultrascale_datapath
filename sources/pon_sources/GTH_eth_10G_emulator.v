`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CONNECT
// Author: Sandip Das
// 
// Create Date: 28.11.2019 15:20:34
// Design Name: 
// Module Name: GTH_eth_10G_emu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: sends and receivs burst packets over GTH ethernet interface
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/////////// TODO:  correct the clocking pins, xdc, check pin constraints, wire and signal directions.///////////////////////////

module GTH_eth_10G_emulator(
    
    input  wire hb_gtwiz_reset_all_in,
  
    // PRBS-based link status ports
    input  wire link_down_latched_reset_in,
    //gt-x0y24 on gthbank230 serial differerntial ports
    input  wire eth_gt_x0y24_rxp_in,
    input  wire eth_gt_x0y24_rxn_in,
    output wire eth_gt_x0y24_txp_out,
    output wire eth_gt_x0y24_txn_out,

    //gt-x0y25 on gthbank230 serial differerntial ports
    input  wire eth_gt_x0y25_rxp_in,
    input  wire eth_gt_x0y25_rxn_in,
    output wire eth_gt_x0y25_txp_out,
    output wire eth_gt_x0y25_txn_out,

    input wire  eth_restart_tx_rx,
    input wire send_continous_pkts,   // This port can be used to send continous packets 
	
    input             eth_sys_reset,
    input  wire       dclk,
    output wire eth_sys_reset_vio, //reset the ethernet interface from vio or phy.    
        
    ////**--sharedlogic ports to bring to the top level--**////
    //GT bank common qpll clock ports
    input wire qpll0lock,
    input wire qpll0outclk,
    input wire qpll0outrefclk,
    input wire qpll1lock,
    input wire qpll1outclk,
    input wire qpll1outrefclk,
    //Signals required from gt-core to sharedlogic module
    //for GT bank 230:x0y24
    output wire gtwiz_reset_qpll0reset_out,
    output wire gtwiz_reset_qpll1reset_out,
    //for GT bank 230:x0y25
    output wire gtwiz_reset_qpll0reset_out_1,
    output wire gtwiz_reset_qpll1reset_out_1,
    
    //--for GT bank 230:x0y24--//
    //tx and rx core clock ports for gth    
    output wire tx_clk_out_0,
    output wire rx_clk_out_0,
    input wire rx_core_clk_0,
    //reset ports handshake with sharedlogic//
    //from GT-core x0y24 to sharedlogic 
    output wire gtpowergood_out_0,
    output wire tx_reset_out_0,
    output wire rx_reset_out_0,
    output wire gtwiz_reset_tx_done_out_0,
    output wire gtwiz_reset_rx_done_out_0,
    //from sharedlogic to GT-core x0y24
    input wire user_tx_reset_0,
    input wire user_rx_reset_0,
    input wire rx_serdes_reset_0,
    input wire rx_core_reset,
    input wire tx_core_reset,
    input wire gtwiz_reset_all_0,
    
    //--for GT bank 230:x0y25--//
    //tx and rx core clock ports for gth
    output wire tx_clk_out_1,
    output wire rx_clk_out_1,    
    input wire rx_core_clk_1,
    //reset ports handshake with sharedlogic//
    //from GT-core x0y25 to sharedlogic 
    output wire gtpowergood_out_1,
    output wire tx_reset_out_1,
    output wire rx_reset_out_1,
    output wire gtwiz_reset_tx_done_out_1,
    output wire gtwiz_reset_rx_done_out_1,
    //from sharedlogic to GT-core x0y25
    input wire user_tx_reset_1,
    input wire user_rx_reset_1,
    input wire rx_serdes_reset_1,
    input wire rx_core_reset_1,
    input wire tx_core_reset_1,
    input wire gtwiz_reset_all_1

);
    
	/*assign ResetL = 1'b1;
	assign LPMode = 1'b0;*/
    wire  link_down_latched_out;
        
    //User DATA TxRx compatible with AXI streaming
    wire [31:0] eth_axis_usrtx_TDATA;
    wire eth_axis_usrtx_TREADY;
    wire eth_axis_usrtx_TVALID;
    wire eth_axis_usrtx_TLAST;
    wire eth_axis_usrtx_TUSER;
    wire [3:0] eth_axis_usrtx_TKEEP;
    wire eth_tx_axis_usrclk;

    wire [31:0] eth_axis_usrrx_TDATA;
    wire eth_axis_usrrx_TREADY;
    wire eth_axis_usrrx_TVALID;
    wire eth_axis_usrrx_TLAST;
    wire eth_axis_usrrx_TUSER;
    wire [3:0] eth_axis_usrrx_TKEEP;
    wire eth_rx_axis_usrclk;
    
    wire axis_usrtx_aresetn;
    //User DATA TxRx compatible with AXI streaming
    wire [31:0] axis_usrrx_TDATA;
    reg axis_usrrx_TREADY =1'b1;
    wire axis_usrrx_TVALID;
    
    wire hb_gtwiz_reset_all;
    
    ///Assignment to bring shared clocking logic to top level
    assign tx_clk_out_0 = eth_tx_axis_usrclk;
    assign rx_clk_out_0 = eth_rx_axis_usrclk;
    ///---------------------------------------------ends here
    
    assign axis_usrtx_aresetn = ~hb_gtwiz_reset_all; //TEMPORARY need to be changed

    wire eth_rx_gt_locked_led;     // Indicates GT LOCK
    wire eth_rx_block_lock_led;    // Indicates Core Block Lock
    wire [4:0] eth_completion_status;
    

    // ===================================================================================================================
    // PRBS GENERATOR, CHECKER, AND LINK MANAGEMENT
    // ===================================================================================================================
  
    // PRBS generator
    // -------------------------------------------------------------------------------------------------------------------
    //preamble length, burst_length and burst_period are inputs coming from vio
    wire [31:0] preamble_length_vio_int;
    wire [31:0] burst_length_vio_int;
    wire [31:0] burst_period_vio_int;
    wire [31:0] axis_usrtx_TDATA;
    wire axis_usrtx_TREADY;
    wire axis_usrtx_TVALID;
    wire axis_usrtx_TLAST;
    wire axis_usrtx_TUSER;
    wire [3:0] axis_usrtx_TKEEP;
    wire axis_dataOut_Ch0_VALID;
    wire axis_dataOut_Ch1_VALID;
    
    //ethernet emulator2 User DATA TxRx compatible with AXI streaming
    //for gt-x0y25 at gtbank230 
    wire [31:0] eth_emu_2_axis_usrtx_TDATA;
    wire eth_emu_2_axis_usrtx_TREADY;
    wire eth_emu_2_axis_usrtx_TVALID;
    wire eth_emu_2_axis_usrtx_TLAST;
    wire eth_emu_2_axis_usrtx_TUSER;
    wire [3:0] eth_emu_2_axis_usrtx_TKEEP;
    wire eth2_tx_axis_usrclk;
    wire [31:0] eth_emu_2_axis_usrrx_TDATA;
    wire eth_emu_2_axis_usrrx_TVALID;
    wire eth_emu_2_axis_usrrx_TLAST;
    wire eth_emu_2_axis_usrrx_TUSER;
    wire [3:0] eth_emu_2_axis_usrrx_TKEEP;
    wire eth2_rx_axis_usrclk;
    ///Assignment to bring shared clocking logic to top level
    assign tx_clk_out_1 = eth2_tx_axis_usrclk;
    assign rx_clk_out_1 = eth2_rx_axis_usrclk;
    ///---------------------------------------------ends here

    assign axis_usrtx_TREADY = axis_dataOut_Ch0_VALID ? eth_axis_usrtx_TREADY : eth_emu_2_axis_usrtx_TREADY;
    (* DONT_TOUCH = "TRUE" *)
    PRBS_Generator PRBS_Generator_inst (
		.gtwiz_userdata_tx_axis_TDATA       (axis_usrtx_TDATA)
		,.axis_dataOut_TVALID                (axis_usrtx_TVALID)
		,.axis_dataOut_Ch0_VALID             (axis_dataOut_Ch0_VALID)// output wire [0 : 0] axis_dataOut_Ch0_VALID
        ,.axis_dataOut_Ch1_VALID             (axis_dataOut_Ch1_VALID)// output wire [0 : 0] axis_dataOut_Ch1_VALID
		,.axis_dataOut_TLAST                 (axis_usrtx_TLAST)
		,.axis_dataOut_TUSER                 (axis_usrtx_TUSER)
		,.axis_dataOut_TKEEP                 (axis_usrtx_TKEEP)
		,.reset_in                           (eth_sys_reset)
		,.tx_axis_usrclk                     (eth_tx_axis_usrclk)
		,.axis_dataOut_TREADY                (axis_usrtx_TREADY)
		,.preamble_length                    (preamble_length_vio_int)
		,.burst_length                       (burst_length_vio_int)
		,.burst_period                       (burst_period_vio_int)                               
    );
    wire [31:0] gtwiz_userdata_rx_synced_int;
    wire preamble_detected;
    wire [63:0] out_data_double_buffer;
    wire [6:0] out_threshold_comp;
    (* DONT_TOUCH = "TRUE" *)
    Burst_Mode_Synchronizer Preamble_Synchronizer_inst (
		.in_data                   (eth_axis_usrrx_TDATA)
		,.in_syncword              (32'h05560556)
		,.in_threshold             (7'b0000101)
		,.in_enable                (eth_axis_usrrx_TVALID)
		,.in_reset                 (hb_gtwiz_reset_all)
		,.in_clock                 (eth_rx_axis_usrclk)
		,.out_data                 (gtwiz_userdata_rx_synced_int)
		,.out_detected             (preamble_detected)
		,.out_data_double_buffer   (out_data_double_buffer)
		,.out_threshold_comparator (out_threshold_comp)
	);
  
    // Link management
    // -------------------------------------------------------------------------------------------------------------------
    wire error_accumulator_clear;
    wire [31:0] num_frames_recvd_eth_emu1;
    wire [31:0] num_errors_this_fr_eth_emu1;
    wire [31:0] total_bits_this_fr_eth_emu1;
    wire [63:0] eth_emu1_accumulated_error;
    wire [63:0] total_bits_accumulated_eth_emu1;
    
    wire [31:0] num_frames_recvd_eth_emu2;
    wire [31:0] num_errors_this_fr_eth_emu2;
    wire [31:0] total_bits_this_fr_eth_emu2;
    wire [63:0] eth_emu2_accumulated_error;
    wire [63:0] total_bits_accumulated_eth_emu2;

    wire [2:0] gt_loopback_in_0;
    vio_top_wrapper vio_top_wrapper_inst(
        .hb0_gtwiz_userclk_tx_usrclk2_int(eth_tx_axis_usrclk)
        ,.eth_rx_gt_locked_led(eth_rx_gt_locked_led)     // Indicates GT LOCK
        ,.eth_rx_block_lock_led(eth_rx_block_lock_led)    // Indicates Core Block Lock
        ,.eth_completion_status(eth_completion_status)
        
        ,.num_frames_recvd_eth_emu1(num_frames_recvd_eth_emu1)
        ,.num_errors_this_fr_eth_emu1(num_errors_this_fr_eth_emu1)
        ,.total_bits_this_fr_eth_emu1(total_bits_this_fr_eth_emu1)
        ,.eth_emu1_accumulated_error(eth_emu1_accumulated_error)
        ,.total_bits_accumulated_eth_emu1(total_bits_accumulated_eth_emu1)
        
        ,.num_frames_recvd_eth_emu2(num_frames_recvd_eth_emu2)
        ,.num_errors_this_fr_eth_emu2(num_errors_this_fr_eth_emu2)
        ,.total_bits_this_fr_eth_emu2(total_bits_this_fr_eth_emu2)
        ,.eth_emu2_accumulated_error(eth_emu2_accumulated_error)
        ,.total_bits_accumulated_eth_emu2(total_bits_accumulated_eth_emu2)
        
        ,.preamble_length_vio_int(preamble_length_vio_int)
        ,.burst_length_vio_int(burst_length_vio_int)
        ,.burst_period_vio_int(burst_period_vio_int)
        ,.error_accumulator_clear(error_accumulator_clear)
        ,.gt_loopback_control(gt_loopback_in_0)
        ,.eth_sys_reset_vio(eth_sys_reset_vio)
    );
    
    /*assign eth_axis_usrtx_TDATA = axis_dataOut_Ch0_VALID ? axis_usrtx_TDATA : 32'h00000000;
    assign eth_axis_usrtx_TVALID = axis_dataOut_Ch0_VALID ? axis_usrtx_TVALID : 1'b0;
    assign eth_axis_usrtx_TLAST = axis_dataOut_Ch0_VALID ? axis_usrtx_TLAST : 1'b0;
    assign eth_axis_usrtx_TUSER = axis_dataOut_Ch0_VALID ? axis_usrtx_TUSER : 1'b0;
    assign eth_axis_usrtx_TKEEP = axis_dataOut_Ch0_VALID ? axis_usrtx_TKEEP : 4'h0;*/
    
    assign eth_axis_usrtx_TDATA = axis_usrtx_TDATA;
    assign eth_axis_usrtx_TVALID = axis_usrtx_TVALID;
    assign eth_axis_usrtx_TLAST = axis_usrtx_TLAST;
    assign eth_axis_usrtx_TUSER = axis_usrtx_TUSER;
    assign eth_axis_usrtx_TKEEP = axis_usrtx_TKEEP;
    
    /*wire [31:0] eth_axis_usrtx_TDATA_scrmbled;
    //wire eth_axis_usrtx_TREADY_scrmb_sync;
    wire eth_axis_usrtx_TVALID_scrmb_sync;
    wire eth_axis_usrtx_TLAST_scrmb_sync;
    wire eth_axis_usrtx_TUSER_scrmb_sync;
    wire [3:0] eth_axis_usrtx_TKEEP_scrmb_sync;

    (* DONT_TOUCH = "TRUE" *) 
    lfsr_scramble #
      (
          // width of LFSR
          .LFSR_WIDTH(58)
          // LFSR polynomial
          ,.LFSR_POLY(58'h8000000001)
          // Initial state
          ,.LFSR_INIT({58{1'b1}})
          // LFSR configuration: "GALOIS", "FIBONACCI"
          ,.LFSR_CONFIG("FIBONACCI")
          // bit-reverse input and output
          ,.REVERSE(1'b0)
          // width of data bus
          ,.DATA_WIDTH(32)
          // implementation style: "AUTO", "LOOP", "REDUCTION"
          ,.STYLE("AUTO")
      )lfsr_scramble_inst(
          .clk(eth_tx_axis_usrclk)
          ,.rst(eth_axis_usrtx_TLAST)
          ,.data_in(eth_axis_usrtx_TDATA)
          ,.data_in_valid(eth_axis_usrtx_TVALID & axis_usrtx_TREADY)
          ,.data_out(eth_axis_usrtx_TDATA_scrmbled)
      );
    // 1 clock cycle delay to match the scrambler
    reg [6:0] delay_reg_1_clk[1:0];
    always@(posedge eth_tx_axis_usrclk) begin
        delay_reg_1_clk[0] <= {eth_axis_usrtx_TVALID, eth_axis_usrtx_TKEEP, eth_axis_usrtx_TLAST, eth_axis_usrtx_TUSER};
        delay_reg_1_clk[1] <=delay_reg_1_clk[0];
    end
    assign eth_axis_usrtx_TVALID_scrmb_sync = delay_reg_1_clk[0][6];
    assign eth_axis_usrtx_TLAST_scrmb_sync = delay_reg_1_clk[0][1];
    assign eth_axis_usrtx_TUSER_scrmb_sync = delay_reg_1_clk[0][0];
    assign eth_axis_usrtx_TKEEP_scrmb_sync = delay_reg_1_clk[0][5:2];*/
    
	(* DONT_TOUCH = "TRUE" *) 
	eth_10G_gtbnk230_x0y24_top eth_10G_gtbnk230_x0y24_inst(
		.gt_rxp_in(eth_gt_x0y24_rxp_in)
		,.gt_rxn_in(eth_gt_x0y24_rxn_in)
		,.gt_txp_out(eth_gt_x0y24_txp_out)
		,.gt_txn_out(eth_gt_x0y24_txn_out)
		,.restart_tx_rx_0(eth_restart_tx_rx)
		,.send_continous_pkts_0(send_continous_pkts)   // This port can be used to send continous packets 
		,.rx_gt_locked_led_0(eth_rx_gt_locked_led)     // Indicates GT LOCK
		,.rx_block_lock_led_0(eth_rx_block_lock_led)    // Indicates Core Block Lock
		,.completion_status(eth_completion_status)

		,.sys_reset(eth_sys_reset)
		,.dclk(dclk)
		
		,.rx_clk_out_0(eth_rx_axis_usrclk)
		,.tx_clk_out_0(eth_tx_axis_usrclk)
		,.rx_core_clk_0(rx_core_clk_0)
		
		,.tx_reset_out_0(tx_reset_out_0)
		,.rx_reset_out_0(rx_reset_out_0)
		,.user_rx_reset_0(user_rx_reset_0)
		,.user_tx_reset_0(user_tx_reset_0)
		,.gtwiz_reset_tx_done_out_0(gtwiz_reset_tx_done_out_0)
		,.gtwiz_reset_rx_done_out_0(gtwiz_reset_rx_done_out_0)
		
		,.gt_loopback_in_0(gt_loopback_in_0)
		
		//// RX_0 User Interface Signals
		,.rx_axis_tvalid_0(eth_axis_usrrx_TVALID)
		,.rx_axis_tdata_0(eth_axis_usrrx_TDATA)
		,.rx_axis_tlast_0(eth_axis_usrrx_TLAST)
		,.rx_axis_tkeep_0(eth_axis_usrrx_TKEEP)
		,.rx_axis_tuser_0(eth_axis_usrrx_TUSER)

		//// TX_0 User Interface Signals
		,.tx_axis_tready_0(eth_axis_usrtx_TREADY)
		,.tx_axis_tvalid_0(eth_axis_usrtx_TVALID)
		,.tx_axis_tdata_0(eth_axis_usrtx_TDATA)
		,.tx_axis_tlast_0(eth_axis_usrtx_TLAST)
		,.tx_axis_tkeep_0(eth_axis_usrtx_TKEEP)
		,.tx_axis_tuser_0(eth_axis_usrtx_TUSER)
		
		/// bringing Shared logic ports to top level
		,.gtpowergood_out_0(gtpowergood_out_0)
        ,.rx_serdes_reset_0(rx_serdes_reset_0)
        ,.rx_core_reset(rx_core_reset)
        ,.tx_core_reset(tx_core_reset)
        ,.qpll0lock(qpll0lock)
        ,.qpll0outclk(qpll0outclk)
        ,.qpll0outrefclk(qpll0outrefclk)
        ,.qpll1lock(qpll1lock)
        ,.qpll1outclk(qpll1outclk)
        ,.qpll1outrefclk(qpll1outrefclk)
        ,.gtwiz_reset_qpll0reset_out(gtwiz_reset_qpll0reset_out)
        ,.gtwiz_reset_qpll1reset_out(gtwiz_reset_qpll1reset_out)
        ,.gtwiz_reset_all_0(gtwiz_reset_all_0)
	);
	
    /*wire [31:0] eth_axis_usrrx_TDATA_scrmbled;
    //wire eth_axis_usrtx_TREADY_scrmb_sync;
    wire eth_axis_usrrx_TVALID_scrmb_sync;
    wire eth_axis_usrrx_TLAST_scrmb_sync;
    wire eth_axis_usrrx_TUSER_scrmb_sync;
    wire [3:0] eth_axis_usrrx_TKEEP_scrmb_sync;

    (* DONT_TOUCH = "TRUE" *) 
    lfsr_descramble #
      (
          // width of LFSR
          .LFSR_WIDTH(58)
          // LFSR polynomial
          ,.LFSR_POLY(58'h8000000001)
          // Initial state
          ,.LFSR_INIT({58{1'b1}})
          // LFSR configuration: "GALOIS", "FIBONACCI"
          ,.LFSR_CONFIG("FIBONACCI")
          // bit-reverse input and output
          ,.REVERSE(1'b0)
          // width of data bus
          ,.DATA_WIDTH(32)
          // implementation style: "AUTO", "LOOP", "REDUCTION"
          ,.STYLE("AUTO")
      )lfsr_descramble_inst(
          .clk(eth_rx_axis_usrclk)
          ,.rst(eth_axis_usrrx_TLAST)
          ,.data_in(eth_axis_usrrx_TDATA)
          ,.data_in_valid(eth_axis_usrrx_TVALID)
          ,.data_out(eth_axis_usrrx_TDATA_scrmbled)
      );
    // 1 clock cycle delay to match the scrambler
    reg [6:0] rx_delay_reg_1_clk[1:0];
    always@(posedge eth_tx_axis_usrclk) begin
        rx_delay_reg_1_clk[0] <= {eth_axis_usrrx_TVALID, eth_axis_usrrx_TKEEP, eth_axis_usrrx_TLAST, eth_axis_usrrx_TUSER};
        rx_delay_reg_1_clk[1] <=rx_delay_reg_1_clk[0];
    end
    assign eth_axis_usrrx_TVALID_scrmb_sync = rx_delay_reg_1_clk[0][6];
    assign eth_axis_usrrx_TLAST_scrmb_sync = rx_delay_reg_1_clk[0][1];
    assign eth_axis_usrrx_TUSER_scrmb_sync = rx_delay_reg_1_clk[0][0];
    assign eth_axis_usrrx_TKEEP_scrmb_sync = rx_delay_reg_1_clk[0][5:2];*/
   	
(* DONT_TOUCH = "TRUE" *)
ControlledBurstCheck_0 Burst_checker_eth_emu1_inst (
    .ap_clk(eth_rx_axis_usrclk),                          // input wire ap_clk
    .ap_rst(error_accumulator_clear),                      // input wire ap_rst
    .enable(1'b1),                          // input wire [0 : 0] enable
    .TVALIDin(eth_axis_usrrx_TVALID),            // input wire dataIn_TVALID
    .TDATAin_V(eth_axis_usrrx_TDATA),              // input wire [31 : 0] dataIn_TDATA
    .TKEEPin_V(eth_axis_usrrx_TKEEP),              // input wire [3 : 0] dataIn_TKEEP
    .TLASTin(eth_axis_usrrx_TLAST),              // input wire [0 : 0] dataIn_TLAST
    .num_frames_recvd_V(num_frames_recvd_eth_emu1),              // output wire [31 : 0] num_frames_recvd_V
    .num_errors_this_fr_V(num_errors_this_fr_eth_emu1),          // output wire [31 : 0] num_errors_this_fr_V
    .total_bits_this_fr_V(total_bits_this_fr_eth_emu1),          // output wire [31 : 0] total_bits_this_fr_V
    .num_errors_accumulated_V(eth_emu1_accumulated_error),  // output wire [63 : 0] num_errors_accumulated_V
    .total_bits_accumulated_V(total_bits_accumulated_eth_emu1)  // output wire [63 : 0] total_bits_accumulated_V
);

    assign eth_emu_2_axis_usrtx_TDATA = axis_dataOut_Ch1_VALID ? axis_usrtx_TDATA : 32'h00000000;
    assign eth_emu_2_axis_usrtx_TVALID = axis_dataOut_Ch1_VALID ? axis_usrtx_TVALID : 1'b0;
    assign eth_emu_2_axis_usrtx_TLAST = axis_dataOut_Ch1_VALID ? axis_usrtx_TLAST : 1'b0;
    assign eth_emu_2_axis_usrtx_TUSER = axis_dataOut_Ch1_VALID ? axis_usrtx_TUSER : 1'b0;
    assign eth_emu_2_axis_usrtx_TKEEP = axis_dataOut_Ch1_VALID ? axis_usrtx_TKEEP : 4'h0;
    wire [38:0] signal_cdc_out_sync;
    (* DONT_TOUCH = "TRUE" *)
    cdc_sync_2stage 
      #(
        .WIDTH        (39)
      ) eth_emu2_usrdata_cdc_sync_2stage_syncer (
        .clk          (eth2_tx_axis_usrclk),
        .signal_in    ({eth_emu_2_axis_usrtx_TDATA, eth_emu_2_axis_usrtx_TVALID, eth_emu_2_axis_usrtx_TLAST, eth_emu_2_axis_usrtx_TUSER, eth_emu_2_axis_usrtx_TKEEP}),
        .signal_out   (signal_cdc_out_sync)
      );
      wire [31:0] eth_emu_2_axis_usrtx_TDATA_sync;
      wire eth_emu_2_axis_usrtx_TVALID_sync;
      wire eth_emu_2_axis_usrtx_TLAST_sync;
      wire eth_emu_2_axis_usrtx_TUSER_sync;
      wire [3:0] eth_emu_2_axis_usrtx_TKEEP_sync;
      assign eth_emu_2_axis_usrtx_TDATA_sync = signal_cdc_out_sync[38:7];
      assign eth_emu_2_axis_usrtx_TVALID_sync = signal_cdc_out_sync[6];
      assign eth_emu_2_axis_usrtx_TLAST_sync = signal_cdc_out_sync[5];
      assign eth_emu_2_axis_usrtx_TUSER_sync = signal_cdc_out_sync[4];
      assign eth_emu_2_axis_usrtx_TKEEP_sync = signal_cdc_out_sync[3:0];

/*    wire [31:0] cdc_eth_emu_2_axis_usrtx_TDATA;
    wire cdc_eth_emu_2_axis_usrtx_TREADY;
    wire cdc_eth_emu_2_axis_usrtx_TVALID;
    wire cdc_eth_emu_2_axis_usrtx_TLAST;
    wire cdc_eth_emu_2_axis_usrtx_TUSER;
    wire [3:0] cdc_eth_emu_2_axis_usrtx_TKEEP;

axis_master_slave_lb_fifo cdc_fifo_inst (
      .m_aclk(tx_clk_out_1),                    // input wire m_aclk
      .s_aclk(eth_tx_axis_usrclk),                    // input wire s_aclk
      .s_aresetn(eth_sys_reset),              // input wire s_aresetn
      .s_axis_tvalid(eth_emu_2_axis_usrtx_TVALID),      // input wire s_axis_tvalid
      .s_axis_tready(eth_emu_2_axis_usrtx_TREADY),      // output wire s_axis_tready
      .s_axis_tdata(eth_emu_2_axis_usrtx_TDATA),        // input wire [31 : 0] s_axis_tdata
      .s_axis_tkeep(eth_emu_2_axis_usrtx_TKEEP),        // input wire [3 : 0] s_axis_tkeep
      .s_axis_tlast(eth_emu_2_axis_usrtx_TLAST),        // input wire s_axis_tlast
      .s_axis_tuser(eth_emu_2_axis_usrtx_TUSER),        // input wire [0 : 0] s_axis_tuser
      .m_axis_tvalid(cdc_eth_emu_2_axis_usrtx_TVALID),      // output wire m_axis_tvalid
      .m_axis_tready(cdc_eth_emu_2_axis_usrtx_TREADY),      // input wire m_axis_tready
      .m_axis_tdata(cdc_eth_emu_2_axis_usrtx_TDATA),        // output wire [31 : 0] m_axis_tdata
      .m_axis_tkeep(cdc_eth_emu_2_axis_usrtx_TKEEP),        // output wire [3 : 0] m_axis_tkeep
      .m_axis_tlast(cdc_eth_emu_2_axis_usrtx_TLAST),        // output wire m_axis_tlast
      .m_axis_tuser(cdc_eth_emu_2_axis_usrtx_TUSER),        // output wire [0 : 0] m_axis_tuser
      .axis_prog_full(fifof),    // output wire axis_prog_full
      .axis_prog_empty(fifoe)  // output wire axis_prog_empty
    );*/
	(* DONT_TOUCH = "TRUE" *) 
	eth_10G_gtbnk230_x0y25_top eth_10G_gtbnk230_x0y25_inst(
		.gt_rxp_in(eth_gt_x0y25_rxp_in)
		,.gt_rxn_in(eth_gt_x0y25_rxn_in)
		,.gt_txp_out(eth_gt_x0y25_txp_out)
		,.gt_txn_out(eth_gt_x0y25_txn_out)
		,.restart_tx_rx_0(eth_restart_tx_rx)
		,.send_continous_pkts_0(send_continous_pkts)   // This port can be used to send continous packets 
		,.rx_gt_locked_led_0(eth_rx_gt_locked_led_1)     // Indicates GT LOCK
		,.rx_block_lock_led_0(eth_rx_block_lock_led_1)    // Indicates Core Block Lock
		,.completion_status(eth_completion_status_1)

		,.sys_reset(eth_sys_reset)
		,.dclk(dclk)
				
		,.gt_loopback_in_0(gt_loopback_in_0)
		
		//// RX_0 User Interface Signals
		,.rx_axis_tvalid_0(eth_emu_2_axis_usrrx_TVALID)
		,.rx_axis_tdata_0(eth_emu_2_axis_usrrx_TDATA)
		,.rx_axis_tlast_0(eth_emu_2_axis_usrrx_TLAST)
		,.rx_axis_tkeep_0(eth_emu_2_axis_usrrx_TKEEP)
		,.rx_axis_tuser_0(eth_emu_2_axis_usrrx_TUSER)

		//// TX_0 User Interface Signals
		,.tx_axis_tready_0(eth_emu_2_axis_usrtx_TREADY)
		,.tx_axis_tvalid_0(eth_emu_2_axis_usrtx_TVALID_sync)
		,.tx_axis_tdata_0(eth_emu_2_axis_usrtx_TDATA_sync)
		,.tx_axis_tlast_0(eth_emu_2_axis_usrtx_TLAST_sync)
		,.tx_axis_tkeep_0(eth_emu_2_axis_usrtx_TKEEP_sync)
		,.tx_axis_tuser_0(eth_emu_2_axis_usrtx_TUSER_sync)
		
		/// bringing Shared logic ports to top level       
        ////**--sharedlogic ports to bring to the top level--**////
        //GT bank common qpll clock ports (i/p to GTs from sharedlogic)
        ,.qpll0lock(qpll0lock) 
        ,.qpll0outclk(qpll0outclk) 
        ,.qpll0outrefclk(qpll0outrefclk) 
        ,.qpll1lock(qpll1lock) 
        ,.qpll1outclk(qpll1outclk) 
        ,.qpll1outrefclk(qpll1outrefclk) 
        //Signals required from gt-core to sharedlogic module
        ,.gtwiz_reset_qpll0reset_out(gtwiz_reset_qpll0reset_out_1) 
        ,.gtwiz_reset_qpll1reset_out(gtwiz_reset_qpll1reset_out_1) 
        //tx and rx core clock ports for gth        
        ,.tx_clk_out_0(tx_clk_out_1)
		,.rx_clk_out_0(rx_clk_out_1)
		,.rx_core_clk_0(rx_core_clk_1)
        //reset ports handshake with sharedlogic//
        //from GT-core x0y25 to sharedlogic 
		,.gtpowergood_out_0(gtpowergood_out_1)
		,.tx_reset_out_0(tx_reset_out_1)
        ,.rx_reset_out_0(rx_reset_out_1)
		,.gtwiz_reset_tx_done_out_0(gtwiz_reset_tx_done_out_1)
        ,.gtwiz_reset_rx_done_out_0(gtwiz_reset_rx_done_out_1)
        //from sharedlogic to GT-core x0y25
        ,.user_tx_reset_0(user_tx_reset_1)
		,.user_rx_reset_0(user_rx_reset_1)
        ,.rx_serdes_reset_0(rx_serdes_reset_1)
        ,.rx_core_reset(rx_core_reset_1)
        ,.tx_core_reset(tx_core_reset_1)

        ,.gtwiz_reset_all_0(gtwiz_reset_all_0)
	);

(* DONT_TOUCH = "TRUE" *)
ControlledBurstCheck_0 Burst_checker_eth_emu2_inst (
    .ap_clk(eth2_rx_axis_usrclk),                          // input wire ap_clk
    .ap_rst(error_accumulator_clear),                      // input wire ap_rst
    .enable(1'b1),                          // input wire [0 : 0] enable
    .TVALIDin(eth_emu_2_axis_usrrx_TVALID),            // input wire dataIn_TVALID
    .TDATAin_V(eth_emu_2_axis_usrrx_TDATA),              // input wire [31 : 0] dataIn_TDATA
    .TKEEPin_V(eth_emu_2_axis_usrrx_TKEEP),              // input wire [3 : 0] dataIn_TKEEP
    .TLASTin(eth_emu_2_axis_usrrx_TLAST),              // input wire [0 : 0] dataIn_TLAST
    .num_frames_recvd_V(num_frames_recvd_eth_emu2),              // output wire [31 : 0] num_frames_recvd_V
    .num_errors_this_fr_V(num_errors_this_fr_eth_emu2),          // output wire [31 : 0] num_errors_this_fr_V
    .total_bits_this_fr_V(total_bits_this_fr_eth_emu2),          // output wire [31 : 0] total_bits_this_fr_V
    .num_errors_accumulated_V(eth_emu2_accumulated_error),  // output wire [63 : 0] num_errors_accumulated_V
    .total_bits_accumulated_V(total_bits_accumulated_eth_emu2)  // output wire [63 : 0] total_bits_accumulated_V
);

    if(1) begin : eth10g_emu_debug
    //----------- ILA debus instantiation ---//  
    axis_ila eth_tx_axis_ila(
        .clk(eth_tx_axis_usrclk), // input wire clk    
        .probe0(eth_axis_usrtx_TREADY), // input wire [0:0] TREADY  
        .probe1(eth_axis_usrtx_TDATA), // input wire [31:0]  TDATA 
        .probe2(4'd0), // input wire [3:0]  TSTRB 
        .probe3(eth_axis_usrtx_TVALID), // input wire [0:0]  TVALID 
        .probe4(eth_axis_usrtx_TLAST), // input wire [0:0]  TLAST 
        .probe5(eth_axis_usrtx_TUSER), // input wire [0:0]  TUSER 
        .probe6(eth_axis_usrtx_TKEEP), // input wire [3:0]  TKEEP 
        .probe7(1'b0), // input wire [0:0]  TDEST  
        .probe8(1'b0) // input wire [0:0]  TID
    );
    axis_ila eth_rx_axis_ila(
        .clk(eth_rx_axis_usrclk), // input wire clk    
        .probe0(1'b1), // input wire [0:0] TREADY  
        .probe1(eth_axis_usrrx_TDATA), // input wire [31:0]  TDATA 
        .probe2(4'd0), // input wire [3:0]  TSTRB 
        .probe3(eth_axis_usrrx_TVALID), // input wire [0:0]  TVALID 
        .probe4(eth_axis_usrrx_TLAST), // input wire [0:0]  TLAST 
        .probe5(eth_axis_usrrx_TUSER), // input wire [0:0]  TUSER 
        .probe6(eth_axis_usrrx_TKEEP), // input wire [3:0]  TKEEP 
        .probe7(1'b0), // input wire [0:0]  TDEST  
        .probe8(1'b0) // input wire [0:0]  TID
    );
    end
endmodule
