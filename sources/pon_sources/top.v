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
    
    input  wire eth_gtbnk230_x0y27_rxp_in, 
    input  wire eth_gtbnk230_x0y27_rxn_in,
    output wire eth_gtbnk230_x0y27_txp_out,
    output wire eth_gtbnk230_x0y27_txn_out,

    input  wire eth_gtbnk230_x0y24_rxp_in, 
    input  wire eth_gtbnk230_x0y24_rxn_in,
    output wire eth_gtbnk230_x0y24_txp_out,
    output wire eth_gtbnk230_x0y24_txn_out,

    input  wire eth_gtbnk230_x0y25_rxp_in, 
    input  wire eth_gtbnk230_x0y25_rxn_in,
    output wire eth_gtbnk230_x0y25_txp_out,
    output wire eth_gtbnk230_x0y25_txn_out,
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
    input  wire mgtrefclk0_x0y3_p,
    input  wire mgtrefclk0_x0y3_n,

    input  wire       dclk_p,
    input  wire       dclk_n,
    input  wire       xgpon_gt_clk_freerun_p,
    input  wire       xgpon_gt_clk_freerun_n,
    
    inout wire iic_fmc_hpc0_osc0_scl,
    inout wire iic_fmc_hpc0_osc0_sda,
    inout wire iic_fmc_hpc0_osc1_scl,
    inout wire iic_fmc_hpc0_osc1_sda,
    inout wire iic_fmc_hpc0_sfp0_scl,
    inout wire iic_fmc_hpc0_sfp0_sda,
    inout wire iic_main_scl,
    inout wire iic_main_sda,
    input wire microblaze_sysclk_p, 
    input wire microblaze_sysclk_n,
    input wire microblaze_reset
);

////  Ports present when shared logic is implemented outside core
//gt-common qpll clock ports (using GT bank 230 in this design)
wire [0:0] qpll0lock; //output from sharredlogic, input to each GTs
wire [0:0] qpll0outclk; //output from sharredlogic, input to each GTs
wire [0:0] qpll0outrefclk; //output from sharredlogic, input to each GTs
wire [0:0] qpll1lock; //output from sharredlogic, input to each GTs
wire [0:0] qpll1outclk; //output from sharredlogic, input to each GTs
wire [0:0] qpll1outrefclk; //output from sharredlogic, input to each GTs
wire  gt_refclk_out; //output from sharredlogic
//Signals required from gt-core to sharedlogic module
wire [0:0] gtwiz_reset_qpll0reset_out; //output from gt
wire [0:0] gtwiz_reset_qpll1reset_out; //output from gt

//dummy duplicate signals (not in use: for future conn. don't remove)
wire [0:0] qpll0clk_in;
wire [0:0] qpll0refclk_in;
wire [0:0] qpll1clk_in;
wire [0:0] qpll1refclk_in;
wire [0:0] gtwiz_reset_qpll0lock_in;
wire [0:0] gtwiz_reset_qpll1lock_in;

//tx and rx core clock ports for gth
//for GT bank 230:x0y24    
wire tx_clk_out_0;
wire rx_clk_out_0;
wire rx_core_clk_0;    
//for GT bank 230:x0y27 
wire tx_clk_out_1;
wire rx_clk_out_1;
wire rx_core_clk_1;    
//for GT bank 230:x0y25 
wire tx_clk_out_2;
wire rx_clk_out_2;    
wire rx_core_clk_2;

//as for all the gth cores in gt-bank 230 (x0y24,x0y25, and x0y27), we are
//implementing ethernet cores, therefore, we can use TxRx synchronous clocking.
assign rx_core_clk_0 = tx_clk_out_0;
assign rx_core_clk_1 = tx_clk_out_1;
assign rx_core_clk_2 = tx_clk_out_2;
//assign rx_core_clk_0 = rx_clk_out_0; //(for asynchronous clocking)

//reset ports handshake with sharedlogic (if sharedlogic implemented in ex des)
//for GT bank 230:x0y24
//from GT-core x0y24 to sharedlogic 
wire gtpowergood_out_0; //(obtained from gt-core x0y24)
wire tx_reset_0;
wire rx_reset_0;
wire gtwiz_reset_tx_done_0;
wire gtwiz_reset_rx_done_0;
//from sharedlogic to GT-core x0y24
wire user_tx_reset_0;
wire user_rx_reset_0;
wire rx_serdes_reset_0;
wire rx_core_reset_0;
wire tx_core_reset_0;
wire gtwiz_reset_all_0;

//for GT bank 230:x0y27
//from GT-core x0y27 to sharedlogic
wire gtpowergood_out_1; //(obtained from gt-core x0y24)
wire tx_reset_1;
wire rx_reset_1;
wire gtwiz_reset_tx_done_1;
wire gtwiz_reset_rx_done_1;
//from sharedlogic to GT-core x0y27
wire user_tx_reset_1;
wire user_rx_reset_1;
wire rx_serdes_reset_1;
wire rx_core_reset_1;
wire tx_core_reset_1;
wire gtwiz_reset_all_1;

//for GT bank 230:x0y25
//from GT-core x0y25 to sharedlogic
wire gtpowergood_out_2; //(obtained from gt-core x0y25)
wire tx_reset_2;
wire rx_reset_2;
wire gtwiz_reset_tx_done_2;
wire gtwiz_reset_rx_done_2;
//from sharedlogic to GT-core x0y25
wire user_tx_reset_2;
wire user_rx_reset_2;
wire rx_serdes_reset_2;
wire rx_core_reset_2;
wire tx_core_reset_2;
wire gtwiz_reset_all_2;

assign qpll0clk_in = ({2{qpll0outclk}});
assign qpll0refclk_in = ({2{qpll0outrefclk}});
assign qpll1clk_in = ({2{qpll1outclk}});
assign qpll1refclk_in = ({2{qpll1outrefclk}});
assign gtwiz_reset_qpll0lock_in = qpll0lock;
assign gtwiz_reset_qpll1lock_in = qpll1lock;
wire qpll0reset_out;
wire qpll1reset_out;
wire powergood_out;
assign powergood_out = gtpowergood_out_0 & gtpowergood_out_1 & gtpowergood_out_2; //FIXME add powergood for fmcxgpon gt
assign qpll0reset_out = powergood_out ? 1'b0 : 1'b1 ;
assign qpll1reset_out = powergood_out ? 1'b0 : 1'b1 ;


wire dclk_buf_int;

(* DONT_TOUCH = "TRUE" *)
gth_gtbnk230_sharedlogic_wrapper i_gth_gtbnk230_x0y24_x0y27_sharedlogic_wrapper(
    //GT bank common qpll clock out ports
    .gt_refclk_p (eth_gt_refclk_p),
    .gt_refclk_n (eth_gt_refclk_n),
    .refclk (gt_refclk_out),
    .qpll0reset (qpll0reset_out),       //input 
    .qpll0lock (qpll0lock),             //output
    .qpll0outclk (qpll0outclk),         //output
    .qpll0outrefclk (qpll0outrefclk),   //output
    .qpll1reset (qpll1reset_out),       //input
    .qpll1lock (qpll1lock),             //output
    .qpll1outclk (qpll1outclk),         //output
    .qpll1outrefclk (qpll1outrefclk),   //output
    
    //GT bank lane specific ports
    //GT bank 230: gt-core x0y24 user clock and reset ports
    .gt_txusrclk2_0 (tx_clk_out_0), //input 
    .gt_rxusrclk2_0 (rx_clk_out_0), //input 
    .rx_core_clk_0 (rx_core_clk_0), //input 
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
    
    //GT bank 230: gt-core x0y27 user clock and reset ports
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

    //GT bank 230: gt-core x0y25 user clock and reset ports
    .gt_txusrclk2_2 (tx_clk_out_2),
    .gt_rxusrclk2_2 (rx_clk_out_2),
    .rx_core_clk_2 (rx_core_clk_2),
    .gt_tx_reset_in_2 (gtwiz_reset_tx_done_2),
    .gt_rx_reset_in_2 (gtwiz_reset_rx_done_2),
    .tx_core_reset_in_2 (tx_reset_2),
    .rx_core_reset_in_2 (rx_reset_2),
    .tx_core_reset_out_2 (tx_core_reset_2),
    .rx_core_reset_out_2 (rx_core_reset_2),
    .rx_serdes_reset_out_2 (rx_serdes_reset_2),
    .usr_tx_reset_2 (user_tx_reset_2),
    .usr_rx_reset_2 (user_rx_reset_2),
    .gtwiz_reset_all_2 (gtwiz_reset_all_2),
    
    .sys_reset(eth_sys_reset_phy),
    .dclk(dclk_buf_int)   
);    
    
(* DONT_TOUCH = "TRUE" *)
GTH_eth_10G_emulator GTH_eth_10G_emulator_inst(
    .hb_gtwiz_reset_all_in(hb_gtwiz_reset_all_in)     
    // PRBS-based link status ports
    ,.link_down_latched_reset_in(link_down_latched_reset_in)
    
    //gt-x0y24 on gthbank230 serial differerntial ports
    ,.eth_gt_x0y24_rxp_in(eth_gtbnk230_x0y24_rxp_in)
    ,.eth_gt_x0y24_rxn_in(eth_gtbnk230_x0y24_rxn_in)
    ,.eth_gt_x0y24_txp_out(eth_gtbnk230_x0y24_txp_out)
    ,.eth_gt_x0y24_txn_out(eth_gtbnk230_x0y24_txn_out)

    //gt-x0y25 on gthbank230 serial differerntial ports
    ,.eth_gt_x0y25_rxp_in(eth_gtbnk230_x0y25_rxp_in)
    ,.eth_gt_x0y25_rxn_in(eth_gtbnk230_x0y25_rxn_in)
    ,.eth_gt_x0y25_txp_out(eth_gtbnk230_x0y25_txp_out)
    ,.eth_gt_x0y25_txn_out(eth_gtbnk230_x0y25_txn_out)

    ,.eth_restart_tx_rx(eth_restart_tx_rx)
    ,.send_continous_pkts(send_continous_pkts)   // This port can be used to send continous packets 
        
    ,.eth_sys_reset_phy(eth_sys_reset_phy)
    ,.dclk(dclk_buf_int)
    
    ////**--sharedlogic ports to bring to the top level--**////
    //GT bank common qpll clock ports
    ,.qpll0lock(qpll0lock)
    ,.qpll0outclk(qpll0outclk)
    ,.qpll0outrefclk(qpll0outrefclk)
    ,.qpll1lock(qpll1lock)
    ,.qpll1outclk(qpll1outclk)
    ,.qpll1outrefclk(qpll1outrefclk)
    //Signals required from gt-core to sharedlogic module
    //for GT bank 230:x0y24
    ,.gtwiz_reset_qpll0reset_out(gtwiz_reset_qpll0reset_out)
    ,.gtwiz_reset_qpll1reset_out(gtwiz_reset_qpll1reset_out)
    //for GT bank 230:x0y25
    ,.gtwiz_reset_qpll0reset_out_1(gtwiz_reset_qpll0reset_out_2)
    ,.gtwiz_reset_qpll1reset_out_1(gtwiz_reset_qpll1reset_out_2)

    //--for GT bank 230:x0y24--//
    //tx and rx core clock ports for gth    
    ,.rx_clk_out_0(rx_clk_out_0)
    ,.tx_clk_out_0(tx_clk_out_0)
    ,.rx_core_clk_0(rx_core_clk_0)
    //reset ports handshake with sharedlogic//
    //from GT-core x0y24 to sharedlogic 
    ,.gtpowergood_out_0(gtpowergood_out_0)       
    ,.tx_reset_out_0(tx_reset_0)
    ,.rx_reset_out_0(rx_reset_0)
    ,.gtwiz_reset_tx_done_out_0(gtwiz_reset_tx_done_0)
    ,.gtwiz_reset_rx_done_out_0(gtwiz_reset_rx_done_0)
    //from sharedlogic to GT-core x0y24
    ,.user_tx_reset_0(user_tx_reset_0)
    ,.user_rx_reset_0(user_rx_reset_0)
    ,.rx_serdes_reset_0(rx_serdes_reset_0)
    ,.rx_core_reset(rx_core_reset_0)
    ,.tx_core_reset(tx_core_reset_0)
            
    ,.gtwiz_reset_all_0(gtwiz_reset_all_0)

    //--for GT bank 230:x0y25--//
    //tx and rx core clock ports for gth    
    ,.rx_clk_out_1(rx_clk_out_2)
    ,.tx_clk_out_1(tx_clk_out_2)
    ,.rx_core_clk_1(rx_core_clk_2)
    //reset ports handshake with sharedlogic//
    //from GT-core x0y25 to sharedlogic 
    ,.gtpowergood_out_1(gtpowergood_out_2)       
    ,.tx_reset_out_1(tx_reset_2)
    ,.rx_reset_out_1(rx_reset_2)
    ,.gtwiz_reset_tx_done_out_1(gtwiz_reset_tx_done_2)
    ,.gtwiz_reset_rx_done_out_1(gtwiz_reset_rx_done_2)
    //from sharedlogic to GT-core x0y25
    ,.user_tx_reset_1(user_tx_reset_2)
    ,.user_rx_reset_1(user_rx_reset_2)
    ,.rx_serdes_reset_1(rx_serdes_reset_2)
    ,.rx_core_reset_1(rx_core_reset_2)
    ,.tx_core_reset_1(tx_core_reset_2)
            
    ,.gtwiz_reset_all_1(gtwiz_reset_all_2)

);

(* DONT_TOUCH = "TRUE" *)
GTH_eth_10G_to_XG_PON_if GTH_eth_10G_to_XG_PON_if_inst(
    .hb_gtwiz_reset_all_in(hb_gtwiz_reset_all_in)     
    // PRBS-based link status ports
    ,.link_down_latched_reset_in(link_down_latched_reset_in)
    
    //UG1066 page 59
    ,.eth_gt_rxp_in(eth_gtbnk230_x0y27_rxp_in)
    ,.eth_gt_rxn_in(eth_gtbnk230_x0y27_rxn_in)
    ,.eth_gt_txp_out(eth_gtbnk230_x0y27_txp_out)
    ,.eth_gt_txn_out(eth_gtbnk230_x0y27_txn_out)
    
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
    
    ,.xgpon_gt_clk_freerun_p(xgpon_gt_clk_freerun_p)
    ,.xgpon_gt_clk_freerun_n(xgpon_gt_clk_freerun_n)
    
    /// bringing Shared logic ports to top level
    ,.rx_clk_out_0(rx_clk_out_1)            //output
    ,.tx_clk_out_0(tx_clk_out_1)            //output
    ,.rx_core_clk_0(rx_core_clk_1)          //input
    
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
    ,.mgtrefclk0_x0y3_p(mgtrefclk0_x0y3_p)
    ,.mgtrefclk0_x0y3_n(mgtrefclk0_x0y3_n)
);

//Microblaze System controller instance
Sys_Ctrl_wrapper Microblaze_Sys_Ctrl(
    .Microblaze_sys_clk_in(dclk_buf_int)
    ,.iic_fmc_hpc0_osc0_scl_io(iic_fmc_hpc0_osc0_scl)
    ,.iic_fmc_hpc0_osc0_sda_io(iic_fmc_hpc0_osc0_sda)
    ,.iic_fmc_hpc0_osc1_scl_io(iic_fmc_hpc0_osc1_scl)
    ,.iic_fmc_hpc0_osc1_sda_io(iic_fmc_hpc0_osc1_sda)
    ,.iic_fmc_hpc0_sfp0_scl_io(iic_fmc_hpc0_sfp0_scl)
    ,.iic_fmc_hpc0_sfp0_sda_io(iic_fmc_hpc0_sfp0_sda)
    ,.iic_main_scl_io(iic_main_scl)
    ,.iic_main_sda_io(iic_main_sda)
    ,.reset(microblaze_reset)
);


endmodule
