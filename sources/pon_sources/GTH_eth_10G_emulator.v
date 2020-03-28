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
    
    input  wire eth_gt_rxp_in,
    input  wire eth_gt_rxn_in,
    output wire eth_gt_txp_out,
    output wire eth_gt_txn_out,
    input wire  eth_restart_tx_rx,
    input wire send_continous_pkts,   // This port can be used to send continous packets 
	
    input             eth_sys_reset_phy,
    input  wire       dclk,
    
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
    input wire gtwiz_reset_all_0

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
    assign eth_sys_reset = eth_sys_reset_phy||eth_sys_reset_vio;     
    
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
  
    (* DONT_TOUCH = "TRUE" *)
    PRBS_Generator PRBS_Generator_inst (
		.gtwiz_userdata_tx_axis_TDATA       (axis_usrtx_TDATA)
		,.axis_dataOut_TVALID                (axis_usrtx_TVALID)
		,.axis_dataOut_TLAST                 (axis_usrtx_TLAST)
		,.axis_dataOut_TUSER                 (axis_usrtx_TUSER)
		,.axis_dataOut_TKEEP                 (axis_usrtx_TKEEP)
		,.reset_in                           (eth_sys_reset)
		,.tx_axis_usrclk                     (eth_tx_axis_usrclk)
		,.axis_dataOut_TREADY                (eth_axis_usrtx_TREADY)
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
    wire b2bcontrol;
    wire [2:0] gt_loopback_in_0;
    vio_top_wrapper vio_top_wrapper_inst(
        .hb0_gtwiz_userclk_tx_usrclk2_int(eth_tx_axis_usrclk)
        ,.eth_rx_gt_locked_led(eth_rx_gt_locked_led)     // Indicates GT LOCK
        ,.eth_rx_block_lock_led(eth_rx_block_lock_led)    // Indicates Core Block Lock
        ,.eth_completion_status(eth_completion_status)
        ,.preamble_length_vio_int(preamble_length_vio_int)
        ,.burst_length_vio_int(burst_length_vio_int)
        ,.burst_period_vio_int(burst_period_vio_int)
        ,.b2bcontrol(b2bcontrol)
        ,.gt_loopback_control(gt_loopback_in_0)
        ,.eth_sys_reset_vio(eth_sys_reset_vio)
    );
    
    assign eth_axis_usrtx_TDATA = axis_usrtx_TDATA;
    assign eth_axis_usrtx_TVALID = axis_usrtx_TVALID;
    assign eth_axis_usrtx_TLAST = axis_usrtx_TLAST;
    assign eth_axis_usrtx_TUSER = axis_usrtx_TUSER;
    assign eth_axis_usrtx_TKEEP = axis_usrtx_TKEEP;

	(* DONT_TOUCH = "TRUE" *) 
	eth_10G_gtbnk230_q2_exdes eth_10G_FMC_gthbnk230_q2_inst(
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
