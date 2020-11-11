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


module vio_config_par_wrapper(
	input wire [0:0] hb0_gtwiz_userclk_tx_usrclk2_int
	,input wire [0:0] vio_clk
	,input wire [0:0] vio_in1
    ,output wire [31:0] preamble_length_config_vio
    ,output wire [31:0] preamble_pattern_config_vio
    ,output wire [31:0] frtrail_pattern_config_vio
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
	vio_config_par vio_config_par_inst (
		.clk(vio_clk)                // input wire clk
		,.probe_in0(vio_in1)    // input wire [0 : 0] probe_in0
		,.probe_out0(preamble_length_config_vio)  // output wire [31 : 0] probe_out0
		,.probe_out1(preamble_pattern_config_vio)  // output wire [31 : 0] probe_out1
		,.probe_out2(frtrail_pattern_config_vio)  // output wire [31 : 0] probe_out2
	);
    
endmodule
