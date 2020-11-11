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
	,output wire [0:0] error_accumulator_clear
	,output wire [2:0] gt_loopback_control
	,output wire [0:0] eth_sys_reset_vio
	,input wire eth_rx_gt_locked_led     // Indicates GT LOCK
    ,input wire eth_rx_block_lock_led    // Indicates Core Block Lock
    ,input wire [4:0] eth_completion_status
    ,input wire [31:0] num_frames_recvd_eth_emu1
    ,input wire [31:0] num_errors_this_fr_eth_emu1
    ,input wire [31:0] total_bits_this_fr_eth_emu1
    ,input wire [63:0] eth_emu1_accumulated_error
    ,input wire [63:0] total_bits_accumulated_eth_emu1
    
    ,input wire [31:0] num_frames_recvd_eth_emu2
    ,input wire [31:0] num_errors_this_fr_eth_emu2
    ,input wire [31:0] total_bits_this_fr_eth_emu2
    ,input wire [63:0] eth_emu2_accumulated_error
    ,input wire [63:0] total_bits_accumulated_eth_emu2
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
      ,.probe_in0(eth_rx_gt_locked_led)    // input wire [0 : 0] probe_in0
      ,.probe_in1(eth_rx_block_lock_led)    // input wire [0 : 0] probe_in1
      ,.probe_in2(eth_completion_status)    // input wire [4 : 0] probe_in2
      ,.probe_in3(num_frames_recvd_eth_emu1)    // input wire [31 : 0] probe_in3
      ,.probe_in4(num_errors_this_fr_eth_emu1)    // input wire [31 : 0] probe_in4
      ,.probe_in5(total_bits_this_fr_eth_emu1)    // input wire [31 : 0] probe_in5
      ,.probe_in6(eth_emu1_accumulated_error)    // input wire [63 : 0] probe_in6
      ,.probe_in7(total_bits_accumulated_eth_emu1)    // input wire [63 : 0] probe_in7
      ,.probe_in8(num_frames_recvd_eth_emu2)    // input wire [31 : 0] probe_in8
      ,.probe_in9(num_errors_this_fr_eth_emu2)    // input wire [31 : 0] probe_in9
      ,.probe_in10(total_bits_this_fr_eth_emu2)  // input wire [31 : 0] probe_in10
      ,.probe_in11(eth_emu2_accumulated_error)  // input wire [63 : 0] probe_in11
      ,.probe_in12(total_bits_accumulated_eth_emu2)  // input wire [63 : 0] probe_in12
      
      ,.probe_out0 (error_accumulator_clear)
      ,.probe_out1 (preamble_length_vio_int)
      ,.probe_out2 (burst_length_vio_int)
      ,.probe_out3 (burst_period_vio_int)
      ,.probe_out4 (gt_loopback_control)
      ,.probe_out5 (eth_sys_reset_vio )
    );
    
endmodule
