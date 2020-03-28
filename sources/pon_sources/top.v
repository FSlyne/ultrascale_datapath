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

module top(
    
    input  wire hb_gtwiz_reset_all_in,
  
    // PRBS-based link status ports
    input  wire link_down_latched_reset_in,
    
    input  wire eth_mgthrxp3_230_in, 
    input  wire eth_mgthrxn3_230_in,
    output wire eth_mgthtxp3_230_out,
    output wire eth_mgthtxn3_230_out,

    input  wire eth_mgthrxp0_230_in, 
    input  wire eth_mgthrxn0_230_in,
    output wire eth_mgthtxp0_230_out,
    output wire eth_mgthtxn0_230_out,
    input wire  eth_restart_tx_rx,

	output wire xg_pon_burst_gt_txp_out,
    output wire xg_pon_burst_gt_txn_out,
	input wire xg_pon_burst_gt_rxp_in,
    input wire xg_pon_burst_gt_rxn_in,


    input wire send_continous_pkts,   // This port can be used to send continous packets 
	
    output wire eth_rx_gt_locked_led,     // Indicates GT LOCK
    output wire eth_rx_block_lock_led,    // Indicates Core Block Lock
    output wire [4:0] eth_completion_status,

    input             eth_sys_reset_phy,
    input             eth_gt_refclk_p,
    input             eth_gt_refclk_n,
    input  wire       dclk_p,
    input  wire       dclk_n
);
    
wire tx_clk_out_0;
wire rx_clk_out_0;    

wire tx_clk_out_1;
wire rx_clk_out_1;    

////  Ports present when shared logic is implemented outside core
wire [0:0] qpll0clk_in;
wire [0:0] qpll0refclk_in;
wire [0:0] qpll1clk_in;
wire [0:0] qpll1refclk_in;
wire [0:0] gtwiz_reset_qpll0lock_in;
wire [0:0] gtwiz_reset_qpll1lock_in;
wire [0:0] gtwiz_reset_qpll0reset_out;
wire [0:0] gtwiz_reset_qpll1reset_out;

wire [0:0] qpll0lock;
wire [0:0] qpll0outclk;
wire [0:0] qpll0outrefclk;
wire [0:0] qpll1lock;
wire [0:0] qpll1outclk;
wire [0:0] qpll1outrefclk;

wire  gt_refclk_out;
wire rx_core_clk_0;
wire rx_core_clk_1;
assign rx_core_clk_0 = tx_clk_out_0;
assign rx_core_clk_1 = tx_clk_out_1;
//assign rx_core_clk_0 = rx_clk_out_0;
wire gtpowergood_out_0;
wire tx_reset_0;
wire user_tx_reset_0;
wire rx_reset_0;
wire user_rx_reset_0;

wire gtpowergood_out_1;
wire tx_reset_1;
wire user_tx_reset_1;
wire rx_reset_1;
wire user_rx_reset_1;

assign qpll0clk_in = ({2{qpll0outclk}});
assign qpll0refclk_in = ({2{qpll0outrefclk}});
assign qpll1clk_in = ({2{qpll1outclk}});
assign qpll1refclk_in = ({2{qpll1outrefclk}});
assign gtwiz_reset_qpll0lock_in = qpll0lock;
assign gtwiz_reset_qpll1lock_in = qpll1lock;
wire qpll0reset_out;
wire qpll1reset_out;
wire powergood_out;
assign powergood_out = gtpowergood_out_0 & gtpowergood_out_1; //FIXME add powergood for fmcxgpon gt
assign qpll0reset_out = powergood_out ? 1'b0 : 1'b1 ;
assign qpll1reset_out = powergood_out ? 1'b0 : 1'b1 ;

wire gtwiz_reset_tx_done_0;
wire gtwiz_reset_rx_done_0;
wire rx_core_reset_0;
wire tx_core_reset_0;
wire rx_serdes_reset_0;
wire gtwiz_reset_all_0;

wire gtwiz_reset_tx_done_1;
wire gtwiz_reset_rx_done_1;
wire rx_core_reset_1;
wire tx_core_reset_1;
wire rx_serdes_reset_1;
wire gtwiz_reset_all_1;

wire dclk_buf_int;

(* DONT_TOUCH = "TRUE" *)
eth_10G_gtbnk230_q2_sharedlogic_wrapper i_eth_10G_gtbnk230_q2_sharedlogic_wrapper(
    .gt_refclk_p (eth_gt_refclk_p),
    .gt_refclk_n (eth_gt_refclk_n),
    .refclk (gt_refclk_out),
    .qpll0reset (qpll0reset_out),
    .qpll0lock (qpll0lock),
    .qpll0outclk (qpll0outclk),
    .qpll0outrefclk (qpll0outrefclk),
    .qpll1reset (qpll1reset_out),
    .qpll1lock (qpll1lock),
    .qpll1outclk (qpll1outclk),
    .qpll1outrefclk (qpll1outrefclk),
    
    .gt_txusrclk2_0 (tx_clk_out_0),
    .gt_rxusrclk2_0 (rx_clk_out_0),
    .rx_core_clk_0 (rx_core_clk_0),
    .gt_tx_reset_in_0 (gtwiz_reset_tx_done_0),
    .gt_rx_reset_in_0 (gtwiz_reset_rx_done_0),
    .tx_core_reset_in_0 (tx_reset_0),
    .rx_core_reset_in_0 (rx_reset_0),
    .tx_core_reset_out_0 (tx_core_reset_0),
    .rx_core_reset_out_0 (rx_core_reset_0),
    .rx_serdes_reset_out_0 (rx_serdes_reset_0),
    .usr_tx_reset_0 (user_tx_reset_0),
    .usr_rx_reset_0 (user_rx_reset_0),
    .gtwiz_reset_all_0 (gtwiz_reset_all_0),
    
    .gt_txusrclk2_1 (tx_clk_out_1),
    .gt_rxusrclk2_1 (rx_clk_out_1),
    .rx_core_clk_1 (rx_core_clk_1),
    .gt_tx_reset_in_1 (gtwiz_reset_tx_done_1),
    .gt_rx_reset_in_1 (gtwiz_reset_rx_done_1),
    .tx_core_reset_in_1 (tx_reset_1),
    .rx_core_reset_in_1 (rx_reset_1),
    .tx_core_reset_out_1 (tx_core_reset_1),
    .rx_core_reset_out_1 (rx_core_reset_1),
    .rx_serdes_reset_out_1 (rx_serdes_reset_1),
    .usr_tx_reset_1 (user_tx_reset_1),
    .usr_rx_reset_1 (user_rx_reset_1),
    .gtwiz_reset_all_1 (gtwiz_reset_all_1),
    
    .sys_reset(eth_sys_reset_phy),
    .dclk(dclk_buf_int)   
);    
    
    (* DONT_TOUCH = "TRUE" *)
	GTH_eth_10G_emulator GTH_eth_10G_emulator_inst(
        .hb_gtwiz_reset_all_in(hb_gtwiz_reset_all_in)     
        // PRBS-based link status ports
        ,.link_down_latched_reset_in(link_down_latched_reset_in)
        
        ,.eth_gt_rxp_in(eth_mgthrxp0_230_in)
        ,.eth_gt_rxn_in(eth_mgthrxn0_230_in)
        ,.eth_gt_txp_out(eth_mgthtxp0_230_out)
        ,.eth_gt_txn_out(eth_mgthtxn0_230_out)
        ,.eth_restart_tx_rx(eth_restart_tx_rx)
        ,.send_continous_pkts(send_continous_pkts)   // This port can be used to send continous packets 
            
        ,.eth_sys_reset_phy(eth_sys_reset_phy)
        ,.dclk(dclk_buf_int)
        
        /// bringing Shared logic ports to top level
        ,.rx_clk_out_0(rx_clk_out_0)
        ,.tx_clk_out_0(tx_clk_out_0)
        ,.rx_core_clk_0(rx_core_clk_0)
        
        ,.tx_reset_out_0(tx_reset_0)
        ,.rx_reset_out_0(rx_reset_0)
        ,.rx_serdes_reset_0(rx_serdes_reset_0)
        ,.tx_core_reset(tx_core_reset_0)
        ,.rx_core_reset(rx_core_reset_0)
        ,.user_rx_reset_0(user_rx_reset_0)
        ,.user_tx_reset_0(user_tx_reset_0)
        ,.gtwiz_reset_tx_done_out_0(gtwiz_reset_tx_done_0)
        ,.gtwiz_reset_rx_done_out_0(gtwiz_reset_rx_done_0)
                
        ,.gtpowergood_out_0(gtpowergood_out_0)
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
	

	(* DONT_TOUCH = "TRUE" *)
	GTH_eth_10G_to_XG_PON_if GTH_eth_10G_to_XG_PON_if_inst(
        .hb_gtwiz_reset_all_in(hb_gtwiz_reset_all_in)     
        // PRBS-based link status ports
        ,.link_down_latched_reset_in(link_down_latched_reset_in)
        
        //UG1066 page 59
        ,.eth_gt_rxp_in(eth_mgthrxp3_230_in)
        ,.eth_gt_rxn_in(eth_mgthrxn3_230_in)
        ,.eth_gt_txp_out(eth_mgthtxp3_230_out)
        ,.eth_gt_txn_out(eth_mgthtxn3_230_out)
        
        ,.xg_pon_burst_gt_rxp_in(xg_pon_burst_gt_rxp_in)
        ,.xg_pon_burst_gt_rxn_in(xg_pon_burst_gt_rxn_in)
        ,.xg_pon_burst_gt_txp_out(xg_pon_burst_gt_txp_out)
        ,.xg_pon_burst_gt_txn_out(xg_pon_burst_gt_txn_out)
                
        ,.eth_restart_tx_rx(eth_restart_tx_rx)
        ,.send_continous_pkts(send_continous_pkts)   // This port can be used to send continous packets 
        
        ,.eth_rx_gt_locked_led(eth_rx_gt_locked_led)     // Indicates GT LOCK
        ,.eth_rx_block_lock_led(eth_rx_block_lock_led)    // Indicates Core Block Lock
        ,.eth_completion_status(eth_completion_status)
    
        ,.eth_sys_reset_phy(eth_sys_reset_phy)
        ,.dclk_p(dclk_p)
        ,.dclk_n(dclk_n)
        ,.dclk_buf_out(dclk_buf_int)
        
        /// bringing Shared logic ports to top level
        ,.rx_clk_out_0(rx_clk_out_1)
        ,.tx_clk_out_0(tx_clk_out_1)
        ,.rx_core_clk_0(rx_core_clk_1)
        
        ,.tx_reset_out_0(tx_reset_1)
        ,.rx_reset_out_0(rx_reset_1)
        ,.rx_serdes_reset_0(rx_serdes_reset_1)
        ,.tx_core_reset(tx_core_reset_1)
        ,.rx_core_reset(rx_core_reset_1)
        ,.user_rx_reset_0(user_rx_reset_1)
        ,.user_tx_reset_0(user_tx_reset_1)
        ,.gtwiz_reset_tx_done_out_0(gtwiz_reset_tx_done_1)
        ,.gtwiz_reset_rx_done_out_0(gtwiz_reset_rx_done_1)
                
        ,.gtpowergood_out_0(gtpowergood_out_1)
        ,.qpll0lock(qpll0lock)
        ,.qpll0outclk(qpll0outclk)
        ,.qpll0outrefclk(qpll0outrefclk)
        ,.qpll1lock(qpll1lock)
        ,.qpll1outclk(qpll1outclk)
        ,.qpll1outrefclk(qpll1outrefclk)
        ,.gtwiz_reset_qpll0reset_out(gtwiz_reset_qpll0reset_out)
        ,.gtwiz_reset_qpll1reset_out(gtwiz_reset_qpll1reset_out)
        ,.gtwiz_reset_all_0(gtwiz_reset_all_0)
        ,.gt_refclk_in(gt_refclk_out)

    );
    

endmodule
