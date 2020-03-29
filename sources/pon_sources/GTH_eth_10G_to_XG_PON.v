`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CONNECT
// Author: Sandip Das
// 
// Create Date: 28.11.2019 15:20:34
// Design Name: 
// Module Name: GTH_eth_10G_to_XG-PON
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

module GTH_eth_10G_to_XG_PON_if(
    
    input  wire hb_gtwiz_reset_all_in,
  
    // PRBS-based link status ports
    input  wire link_down_latched_reset_in,
    
    input  wire eth_gt_rxp_in,
    input  wire eth_gt_rxn_in,
    output wire eth_gt_txp_out,
    output wire eth_gt_txn_out,
    
    input  wire xg_pon_burst_gt_rxp_in,
    input  wire xg_pon_burst_gt_rxn_in,
    output wire xg_pon_burst_gt_txp_out,
    output wire xg_pon_burst_gt_txn_out,
    
    input wire  eth_restart_tx_rx,
    input wire send_continous_pkts,   // This port can be used to send continous packets 
    output wire eth_rx_gt_locked_led,     // Indicates GT LOCK
    output wire eth_rx_block_lock_led,    // Indicates Core Block Lock
    output wire [4:0] eth_completion_status,
    
    input xgpon_gt_clk_freerun_p,
    input xgpon_gt_clk_freerun_n,

    input             eth_sys_reset_phy,
    input  wire       dclk_p,
    input  wire       dclk_n,
    output wire       dclk_buf_out, //free running clock output for connecting to other modules
    output wire tx_clk_out_0,
    output wire rx_clk_out_0,
    input wire rx_core_clk_0,
    //// RX_0 Signals
    output wire rx_reset_out_0,
    input wire user_rx_reset_0,
    output wire gtwiz_reset_rx_done_out_0,
     
    //// TX_0 Signals
    output wire tx_reset_out_0,
    input wire user_tx_reset_0,
    output wire gtwiz_reset_tx_done_out_0,
        
    //sharedlogic ports
    output wire gtpowergood_out_0,
    input wire rx_serdes_reset_0,
    input wire rx_core_reset,
    input wire tx_core_reset,
    input wire qpll0lock,
    input wire qpll0outclk,
    input wire qpll0outrefclk,
    input wire qpll1lock,
    input wire qpll1outclk,
    input wire qpll1outrefclk,
    output wire gtwiz_reset_qpll0reset_out,
    output wire gtwiz_reset_qpll1reset_out,
    input wire gtwiz_reset_all_0,
    input wire gt_refclk_in
//    output wire ResetL,
//    output wire LPMode
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
    wire eth_sys_reset;
    wire eth_sys_reset_vio;
    assign eth_sys_reset = eth_sys_reset_phy; // eth_sys_reset_phy||eth_sys_reset_vio;   
    wire dclk;
    assign dclk_buf_out = dclk;
    IBUFGDS 
      #(.DIFF_TERM("FALSE"))
      bufg_dclk_inst
       (
         .I(dclk_p),
         .IB(dclk_n),
         .O(dclk)
       ); 
    
    wire xgpon_gt_clk_freerun_buf_int;
    IBUFGDS 
      #(.DIFF_TERM("FALSE"))
    bufg_clk_freerun_inst(
          .I(xgpon_gt_clk_freerun_p),
          .IB(xgpon_gt_clk_freerun_n),
          .O(xgpon_gt_clk_freerun_buf_int)
    );

    // ===================================================================================================================
    // PRBS GENERATOR, CHECKER, AND LINK MANAGEMENT
    // ===================================================================================================================
  
    // PRBS generator
    // -------------------------------------------------------------------------------------------------------------------
    //preamble length, burst_length and burst_period are inputs coming from vio
    /*wire [31:0] preamble_length_vio_int;
    wire [31:0] burst_length_vio_int;
    wire [31:0] burst_period_vio_int;
    wire [31:0] axis_usrtx_TDATA;
    wire axis_usrtx_TREADY;
    wire axis_usrtx_TVALID;
    wire axis_usrtx_TLAST;
    wire axis_usrtx_TUSER;
    wire [3:0] axis_usrtx_TKEEP;
  
    (* DONT_TOUCH = "TRUE" *)
    PRBS_Generator PRBS_Generator_inst (
      .gtwiz_userdata_tx_axis_TDATA       (axis_usrtx_TDATA),
      .axis_dataOut_TVALID                (axis_usrtx_TVALID),
      .axis_dataOut_TLAST                 (axis_usrtx_TLAST),
      .axis_dataOut_TUSER                 (axis_usrtx_TUSER),
      .axis_dataOut_TKEEP                 (axis_usrtx_TKEEP),
      .reset_in                           (eth_sys_reset),
      .tx_axis_usrclk                     (eth_tx_axis_usrclk),
      .axis_dataOut_TREADY                (eth_axis_usrtx_TREADY),
      .preamble_length                    (preamble_length_vio_int),
      .burst_length                       (burst_length_vio_int),
      .burst_period                       (burst_period_vio_int)                               
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
     );*/
  
    // Link management
    // -------------------------------------------------------------------------------------------------------------------
    /*wire b2bcontrol;
    wire [2:0] gt_loopback_config;
    vio_top_wrapper vio_top_wrapper_inst(
        .hb0_gtwiz_userclk_tx_usrclk2_int(eth_tx_axis_usrclk)
        ,.preamble_length_vio_int(preamble_length_vio_int)
        ,.burst_length_vio_int(burst_length_vio_int)
        ,.burst_period_vio_int(burst_period_vio_int)
        ,.b2bcontrol(b2bcontrol)
        ,.gt_loopback_control(gt_loopback_config)
        ,.eth_sys_reset_vio(eth_sys_reset_vio)
    );*/

    //User DATA TxRx compatible with AXI streaming
    wire [31:0] lb_eth_axis_usrtx_TDATA;
    wire lb_eth_axis_usrtx_TREADY;
    wire lb_eth_axis_usrtx_TVALID;
    wire lb_eth_axis_usrtx_TLAST;
    wire lb_eth_axis_usrtx_TUSER;
    wire [3:0] lb_eth_axis_usrtx_TKEEP;
    
    reg [2:0] gt_loopback_config = 3'b000; //no loopback
    
    (* DONT_TOUCH = "TRUE" *) 
    xxv_ethernet_0_exdes xxv_ethernet_0_top_inst(
		.gt_rxp_in(eth_gt_rxp_in)
        ,.gt_rxn_in(eth_gt_rxn_in)
		,.gt_txp_out(eth_gt_txp_out)
		,.gt_txn_out(eth_gt_txn_out)
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
		
		,.gt_loopback_in_0(gt_loopback_config)
		
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

    wire [31:0] xg_PON_axis_usrtx_TDATA;
    wire [3:0] xg_PON_axis_usrtx_TKEEP;
    wire xg_PON_axis_usrtx_TLAST;
    wire xg_PON_axis_usrtx_TUSER;
    wire xg_PON_axis_usrtx_TVALID;

    add_XG_PON_header add_XG_PON_header_inst(
        .axis_clk(eth_rx_axis_usrclk)
        ,.axis_reset(eth_sys_reset)
        
        ,.axis_TDATA_in(eth_axis_usrrx_TDATA)
        ,.axis_TVALID_in(eth_axis_usrrx_TVALID)
        ,.axis_TKEEP_in(eth_axis_usrrx_TKEEP)
        ,.axis_TLAST_in(eth_axis_usrrx_TLAST)
        ,.axis_TUSER_in(eth_axis_usrrx_TUSER)
        ,.axis_TREADY_out()
        
        ,.axis_TDATA_out(xg_PON_axis_usrtx_TDATA)
        ,.axis_TVALID_out(xg_PON_axis_usrtx_TVALID)
        ,.axis_TKEEP_out(xg_PON_axis_usrtx_TKEEP)
        ,.axis_TLAST_out(xg_PON_axis_usrtx_TLAST)
        ,.axis_TUSER_out(xg_PON_axis_usrtx_TUSER)
        ,.axis_TREADY_in(1'b1)  
    );

    ////////////////////////////////////////////////////////////////////
    ///****************************************************************/
    ////////////////////////////////////////////////////////////////////
    wire axis_aclk_gt_tx_usrclk;
    wire axis_aclk_gt_rx_usrclk;
    wire [31:0] xg_PON_axis_usrrx_TDATA;
    wire xg_PON_axis_usrrx_TVALID;
    wire xg_PON_axis_usrrx_TREADY;

    wire [31:0] cdc_xg_PON_axis_usrtx_TDATA;
    wire cdc_xg_PON_axis_usrtx_TVALID;
    wire cdc_xg_PON_axis_usrtx_TREADY;
    wire cdc_xg_PON_axis_usrtx_TLAST;
    
    (* DONT_TOUCH = "TRUE" *)
    axis_ms_slv_loopback axis_fifo_inst(
        .axis_tx_clk                 (axis_aclk_gt_tx_usrclk)
        ,.axis_rx_clk                (eth_rx_axis_usrclk)
        ,.axis_resetn                (~eth_sys_reset) //eth_sys_reset is a active high reset
    
        ,.slvlb_en_l2_addr_swap      (1'b0) // inputs to control the swap of first 12 bytes 
                                             // in the received ethernet frame.
        ,.mtrlb_activity_flash       ()
    
        ,.s_axis_slvlb_d_tdata       (xg_PON_axis_usrtx_TDATA) 
        ,.s_axis_slvlb_d_tkeep       (xg_PON_axis_usrtx_TKEEP) 
        ,.s_axis_slvlb_d_tvalid      (xg_PON_axis_usrtx_TVALID) 
        ,.s_axis_slvlb_d_tlast       (xg_PON_axis_usrtx_TLAST)
        ,.s_axis_slvlb_d_tuser       (xg_PON_axis_usrtx_TUSER) 
        ,.s_axis_slvlb_d_tready      (xg_PON_axis_usrtx_TREADY)
         
        ,.m_axis_slvlb_d_tdata       (cdc_xg_PON_axis_usrtx_TDATA) 
        ,.m_axis_slvlb_d_tkeep       (cdc_xg_PON_axis_usrtx_TKEEP) 
        ,.m_axis_slvlb_d_tvalid      (cdc_xg_PON_axis_usrtx_TVALID) 
        ,.m_axis_slvlb_d_tlast       (cdc_xg_PON_axis_usrtx_TLAST)
        ,.m_axis_slvlb_d_tuser       (cdc_xg_PON_axis_usrtx_TUSER)
        ,.m_axis_slvlb_d_tready      (1'b1)
    );
    
    FMC_GTH_top FMC_GTH_top_inst(
        .qpll0clk_in                             (qpll0outclk),
        .qpll0refclk_in                          (qpll0outrefclk),
        .qpll1clk_in                             (qpll1outclk),
        .qpll1refclk_in                          (qpll1outrefclk),
        .gtwiz_reset_qpll0lock_in                (qpll0lock),
        .gtwiz_reset_qpll0reset_out              (),
        .ch0_gthrxn_in(xg_pon_burst_gt_rxn_in),
        .ch0_gthrxp_in(xg_pon_burst_gt_rxp_in),
        .ch0_gthtxn_out(xg_pon_burst_gt_txn_out),
        .ch0_gthtxp_out(xg_pon_burst_gt_txp_out),
        .hb_gtwiz_reset_clk_freerun_buf_int(xgpon_gt_clk_freerun_buf_int),
        .hb_gtwiz_reset_all_in(hb_gtwiz_reset_all_in),
        .hb_gtwiz_reset_all_out(hb_gtwiz_reset_all),
        .gth_core_tx_usrclk2_out(axis_aclk_gt_tx_usrclk),
        .gth_core_rx_usrclk2_out(axis_aclk_gt_rx_usrclk),
        .link_down_latched_reset_in(link_down_latched_reset_in),
        .link_status_out(link_status_out),
        .link_down_latched_out(link_down_latched_out),
        .axis_usrtx_TDATA(cdc_xg_PON_axis_usrtx_TDATA),
        .axis_usrtx_TREADY(),
        .axis_usrtx_TLAST(cdc_xg_PON_axis_usrtx_TLAST),
        .axis_usrtx_TVALID(cdc_xg_PON_axis_usrtx_TVALID),
        .axis_usrtx_aresetn(axis_usrtx_aresetn),
        .axis_usrrx_TDATA(xg_PON_axis_usrrx_TDATA),
        .axis_usrrx_TREADY(1'b1),
        .axis_usrrx_TVALID(xg_PON_axis_usrrx_TVALID),
        .axis_aclk_gt_tx_usrclk(axis_aclk_gt_tx_usrclk),
        .axis_aclk_gt_rx_usrclk(axis_aclk_gt_rx_usrclk)
    );



    wire [31:0] xg_PON_to_eth_axis_usrtx_TDATA;
    wire [3:0] xg_PON_to_eth_axis_usrtx_TKEEP;
    wire xg_PON_to_eth_axis_usrtx_TLAST;
    wire xg_PON_to_eth_axis_usrtx_TUSER;
    wire xg_PON_to_eth_axis_usrtx_TVALID;
    wire xg_PON_to_eth_axis_usrtx_TREADY;
    xg_PON_frame_sync xg_PON_frame_sync_inst(
        .clk_in             (axis_aclk_gt_rx_usrclk)
        ,.reset_in          (eth_sys_reset)
    
        ,.axis_TDATA_in     (xg_PON_axis_usrrx_TDATA)
        ,.axis_TVALID_in    (xg_PON_axis_usrrx_TVALID)
        ,.axis_TKEEP_in     (4'd15)
        ,.axis_TLAST_in     (1'b0)
        ,.axis_TUSER_in     (1'b0)
        ,.axis_TREADY_out   (xg_PON_axis_usrrx_TREADY)
    
        ,.axis_TDATA_out    (xg_PON_to_eth_axis_usrtx_TDATA)
        ,.axis_TVALID_out   (xg_PON_to_eth_axis_usrtx_TVALID)
        ,.axis_TKEEP_out    (xg_PON_to_eth_axis_usrtx_TKEEP)
        ,.axis_TLAST_out    (xg_PON_to_eth_axis_usrtx_TLAST)
        ,.axis_TUSER_out    (xg_PON_to_eth_axis_usrtx_TUSER)
        ,.axis_TREADY_in    (xg_PON_to_eth_axis_usrtx_TREADY)  
    );


    (* DONT_TOUCH = "TRUE" *)
    axis_ms_slv_loopback axis_ms_slv_loopback_inst(
        .axis_tx_clk                (eth_tx_axis_usrclk)
        ,.axis_rx_clk                (axis_aclk_gt_rx_usrclk)
        ,.axis_resetn                (~eth_sys_reset) //eth_sys_reset is a active high reset
    
        ,.slvlb_en_l2_addr_swap      (1'b0) // inputs to control the swap of first 12 bytes 
                                             // in the received ethernet frame.
        ,.mtrlb_activity_flash       ()
    
        ,.s_axis_slvlb_d_tdata       (xg_PON_to_eth_axis_usrtx_TDATA) 
        ,.s_axis_slvlb_d_tkeep       (xg_PON_to_eth_axis_usrtx_TKEEP) 
        ,.s_axis_slvlb_d_tvalid      (xg_PON_to_eth_axis_usrtx_TVALID) 
        ,.s_axis_slvlb_d_tlast       (xg_PON_to_eth_axis_usrtx_TLAST)
        ,.s_axis_slvlb_d_tuser       (xg_PON_to_eth_axis_usrtx_TUSER) 
        ,.s_axis_slvlb_d_tready      (xg_PON_to_eth_axis_usrtx_TREADY)
         
        ,.m_axis_slvlb_d_tdata       (lb_eth_axis_usrtx_TDATA) 
        ,.m_axis_slvlb_d_tkeep       (lb_eth_axis_usrtx_TKEEP) 
        ,.m_axis_slvlb_d_tvalid      (lb_eth_axis_usrtx_TVALID) 
        ,.m_axis_slvlb_d_tlast       (lb_eth_axis_usrtx_TLAST)
        ,.m_axis_slvlb_d_tuser       (lb_eth_axis_usrtx_TUSER)
        ,.m_axis_slvlb_d_tready      (eth_axis_usrtx_TREADY)
    );
    
    /*assign eth_axis_usrtx_TDATA = b2bcontrol ? lb_eth_axis_usrtx_TDATA : axis_usrtx_TDATA;
    assign eth_axis_usrtx_TVALID = b2bcontrol ? lb_eth_axis_usrtx_TVALID : axis_usrtx_TVALID;
    assign eth_axis_usrtx_TLAST = b2bcontrol ? lb_eth_axis_usrtx_TLAST : axis_usrtx_TLAST;
    assign eth_axis_usrtx_TUSER = b2bcontrol ? lb_eth_axis_usrtx_TUSER : axis_usrtx_TUSER;
    assign eth_axis_usrtx_TKEEP = b2bcontrol ? lb_eth_axis_usrtx_TKEEP : axis_usrtx_TKEEP;*/
    assign eth_axis_usrtx_TDATA = lb_eth_axis_usrtx_TDATA;
    assign eth_axis_usrtx_TVALID = lb_eth_axis_usrtx_TVALID;
    assign eth_axis_usrtx_TLAST = lb_eth_axis_usrtx_TLAST;
    assign eth_axis_usrtx_TUSER = lb_eth_axis_usrtx_TUSER;
    assign eth_axis_usrtx_TKEEP = lb_eth_axis_usrtx_TKEEP;
    
    if(1) begin : eth10g_to_xgpon_if_debug
    //----------- ILA debus instantiation ---//  
    axis_ila eth10gif_tx_axis_ila(
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
    axis_ila eth10gif_rx_axis_ila(
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
