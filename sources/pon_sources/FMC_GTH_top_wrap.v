`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2019 15:20:34
// Design Name: 
// Module Name: FMC_GTH_top_wrap
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

/////////// TODO:  correct the clocking pins, xdc, check pin constraints, wire and signal directions.///////////////////////////

module FMC_GTH_top_wrap(
    
    input  wire hb_gtwiz_reset_all_in,
  
    // PRBS-based link status ports
    input  wire link_down_latched_reset_in,
    
    input  wire eth_gt_rxp_in,
    input  wire eth_gt_rxn_in,
    output wire eth_gt_txp_out,
    output wire eth_gt_txn_out,
    input wire  eth_restart_tx_rx,
    input wire send_continous_pkts,   // This port can be used to send continous packets 
    output wire eth_rx_gt_locked_led,     // Indicates GT LOCK
    output wire eth_rx_block_lock_led,    // Indicates Core Block Lock
    output wire [4:0] eth_completion_status,

    input             eth_sys_reset_phy,
    input             eth_gt_refclk_p,
    input             eth_gt_refclk_n,
    input  wire       dclk_p,
    input  wire       dclk_n
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
    
    assign axis_usrtx_aresetn = ~hb_gtwiz_reset_all; //TEMPORARY need to be changed
    wire eth_sys_reset;
    wire eth_sys_reset_vio;
    assign eth_sys_reset = eth_sys_reset_phy||eth_sys_reset_vio;     
    wire dclk;
    IBUFGDS 
      #(.DIFF_TERM("FALSE"))
      bufg_dclk_inst
       (
         .I(dclk_p),
         .IB(dclk_n),
         .O(dclk)
       ); 

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
     );
  
    // Link management
    // -------------------------------------------------------------------------------------------------------------------
    wire b2bcontrol;
    wire [2:0] gt_loopback_in_0;
    vio_top_wrapper vio_top_wrapper_inst(
        .hb0_gtwiz_userclk_tx_usrclk2_int(eth_tx_axis_usrclk)
        ,.preamble_length_vio_int(preamble_length_vio_int)
        ,.burst_length_vio_int(burst_length_vio_int)
        ,.burst_period_vio_int(burst_period_vio_int)
        ,.b2bcontrol(b2bcontrol)
        ,.gt_loopback_control(gt_loopback_in_0)
        ,.eth_sys_reset_vio(eth_sys_reset_vio)
    );

    //User DATA TxRx compatible with AXI streaming
    wire [31:0] lb_eth_axis_usrtx_TDATA;
    wire lb_eth_axis_usrtx_TREADY;
    wire lb_eth_axis_usrtx_TVALID;
    wire lb_eth_axis_usrtx_TLAST;
    wire lb_eth_axis_usrtx_TUSER;
    wire [3:0] lb_eth_axis_usrtx_TKEEP;
    
    assign eth_axis_usrtx_TDATA = b2bcontrol ? lb_eth_axis_usrtx_TDATA : axis_usrtx_TDATA;
    //assign eth_axis_usrtx_TREADY = b2bcontrol ? lb_eth_axis_usrtx_TREADY : axis_usrtx_TREADY;
//    assign eth_axis_usrtx_TVALID = b2bcontrol ? ((lb_eth_axis_usrtx_TVALID==1)? lb_eth_axis_usrtx_TVALID : axis_usrtx_TVALID) : axis_usrtx_TVALID;
//    assign eth_axis_usrtx_TLAST = b2bcontrol ? ((lb_eth_axis_usrtx_TVALID==1)? lb_eth_axis_usrtx_TLAST : axis_usrtx_TLAST) : axis_usrtx_TLAST;
//    assign eth_axis_usrtx_TUSER = b2bcontrol ? ((lb_eth_axis_usrtx_TVALID==1)? lb_eth_axis_usrtx_TUSER : axis_usrtx_TUSER) : axis_usrtx_TUSER;
//    assign eth_axis_usrtx_TKEEP = b2bcontrol ? ((lb_eth_axis_usrtx_TVALID==1)? lb_eth_axis_usrtx_TKEEP : axis_usrtx_TKEEP) : axis_usrtx_TKEEP;

    assign eth_axis_usrtx_TVALID = b2bcontrol ? lb_eth_axis_usrtx_TVALID : axis_usrtx_TVALID;
    assign eth_axis_usrtx_TLAST = b2bcontrol ? lb_eth_axis_usrtx_TLAST : axis_usrtx_TLAST;
    assign eth_axis_usrtx_TUSER = b2bcontrol ? lb_eth_axis_usrtx_TUSER : axis_usrtx_TUSER;
    assign eth_axis_usrtx_TKEEP = b2bcontrol ? lb_eth_axis_usrtx_TKEEP : axis_usrtx_TKEEP;

 (* DONT_TOUCH = "TRUE" *) 
 xxv_ethernet_0_exdes xxv_ethernet_0_top_inst
(
    .eth_gt_rxp_in_0(eth_gt_rxp_in),
    .eth_gt_rxn_in_0(eth_gt_rxn_in),
    .eth_gt_txp_out_0(eth_gt_txp_out),
    .eth_gt_txn_out_0(eth_gt_txn_out),
    .eth_restart_tx_rx_0(eth_restart_tx_rx),
    .send_continous_pkts_0(send_continous_pkts),   // This port can be used to send continous packets 
    .eth_rx_gt_locked_led_0(eth_rx_gt_locked_led),     // Indicates GT LOCK
    .eth_rx_block_lock_led_0(eth_rx_block_lock_led),    // Indicates Core Block Lock
    .eth_completion_status(eth_completion_status),

    .eth_sys_reset(eth_sys_reset),
    .eth_gt_refclk_p(eth_gt_refclk_p),
    .eth_gt_refclk_n(eth_gt_refclk_n),
    .dclk(dclk),
    .rx_clk_out_0(eth_rx_axis_usrclk),
    .tx_clk_out_0(eth_tx_axis_usrclk),
    .gt_loopback_in_0(gt_loopback_in_0),
    //// RX_0 User Interface Signals
    .rx_axis_tvalid_0(eth_axis_usrrx_TVALID),
    .rx_axis_tdata_0(eth_axis_usrrx_TDATA),
    .rx_axis_tlast_0(eth_axis_usrrx_TLAST),
    .rx_axis_tkeep_0(eth_axis_usrrx_TKEEP),
    .rx_axis_tuser_0(eth_axis_usrrx_TUSER),

    //// TX_0 User Interface Signals
    .tx_axis_tready_0(eth_axis_usrtx_TREADY),
    .tx_axis_tvalid_0(eth_axis_usrtx_TVALID),
    .tx_axis_tdata_0(eth_axis_usrtx_TDATA),
    .tx_axis_tlast_0(eth_axis_usrtx_TLAST),
    .tx_axis_tkeep_0(eth_axis_usrtx_TKEEP),
    .tx_axis_tuser_0(eth_axis_usrtx_TUSER)
);

(* DONT_TOUCH = "TRUE" *)
axis_ms_slv_loopback axis_ms_slv_loopback_inst(
    .axis_tx_clk                (eth_tx_axis_usrclk),
    .axis_rx_clk                (eth_rx_axis_usrclk),
    .axis_resetn                (~eth_sys_reset), //eth_sys_reset is a active high reset

    .slvlb_en_l2_addr_swap      (1'b0), // inputs to control the swap of first 12 bytes 
                                         // in the received ethernet frame.
    .mtrlb_activity_flash       (), 

    .s_axis_slvlb_d_tdata       (eth_axis_usrrx_TDATA), 
    .s_axis_slvlb_d_tkeep       (eth_axis_usrrx_TKEEP), 
    .s_axis_slvlb_d_tvalid      (eth_axis_usrrx_TVALID), 
    .s_axis_slvlb_d_tlast       (eth_axis_usrrx_TLAST),
    .s_axis_slvlb_d_tuser       (eth_axis_usrrx_TUSER), 
    .s_axis_slvlb_d_tready      (eth_axis_usrrx_TREADY),
     
    .m_axis_slvlb_d_tdata       (lb_eth_axis_usrtx_TDATA), 
    .m_axis_slvlb_d_tkeep       (lb_eth_axis_usrtx_TKEEP), 
    .m_axis_slvlb_d_tvalid      (lb_eth_axis_usrtx_TVALID), 
    .m_axis_slvlb_d_tlast       (lb_eth_axis_usrtx_TLAST),
    .m_axis_slvlb_d_tuser       (lb_eth_axis_usrtx_TUSER),
    .m_axis_slvlb_d_tready      (eth_axis_usrtx_TREADY)
);
endmodule
