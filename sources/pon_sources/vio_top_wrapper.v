`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2019 10:23:46 AM
// Design Name: 
// Module Name: vio_wrapper
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


module vio_top_wrapper(
    input wire [0:0] hb0_gtwiz_userclk_tx_usrclk2_int
    ,output wire [31:0] preamble_length_vio_int
    ,output wire [31:0] burst_length_vio_int
    ,output wire [31:0] burst_period_vio_int
	,output wire [0:0] b2bcontrol
	,output wire [2:0] gt_loopback_control
	,output wire [0:0] eth_sys_reset_vio
    );
    
 
	
    // ===================================================================================================================
    // VIO FOR HARDWARE BRING-UP AND DEBUG
    // ===================================================================================================================
    // Instantiate the VIO IP core for hardware bring-up and debug purposes, connecting relevant debug and analysis
    // signals which have been enabled during Wizard IP customization. This initial set of connected signals is
    // provided as a convenience and example, but more or fewer ports can be used as needed; simply re-customize and
    // re-generate the VIO instance, then connect any exposed signals that are needed. Signals which are synchronous to
    // clocks other than the free-running clock will require synchronization. For usage, refer to Vivado Design Suite
    // User Guide: Programming and Debugging (UG908)
    vio_top vio_top_inst (
      .clk (hb0_gtwiz_userclk_tx_usrclk2_int)
      ,.probe_out0 (b2bcontrol)
      ,.probe_out1 (preamble_length_vio_int)
      ,.probe_out2 (burst_length_vio_int)
      ,.probe_out3 (burst_period_vio_int)
      ,.probe_out4 (gt_loopback_control)
      ,.probe_out5 (eth_sys_reset_vio )
    );
    
endmodule
