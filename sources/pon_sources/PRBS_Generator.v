`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2019 11:35:53 AM
// Design Name: 
// Module Name: PRBS_Generator
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


module PRBS_Generator(
    output wire [31:0] gtwiz_userdata_tx_axis_TDATA
    ,output wire axis_dataOut_TVALID
    ,output wire axis_dataOut_TLAST
    ,output wire axis_dataOut_TUSER
    ,output wire [3:0] axis_dataOut_TKEEP
    ,input wire reset_in
    ,input wire tx_axis_usrclk
    ,input wire axis_dataOut_TREADY
    ,input  wire [31:0]  preamble_length
    ,input  wire [31:0]  burst_length
    ,input  wire [31:0]  burst_period
    );
    
    wire [31:0] hb0_gtwiz_userdata_tx_axis_TDATA_int;
    assign gtwiz_userdata_tx_axis_TDATA[31:0] = hb0_gtwiz_userdata_tx_axis_TDATA_int;
    
    //as preamble_length , burst_length and burst period signals are coming from vio, they are in clk_free_run domain
    //sync preamble_length , burst_length and burst period to tx usrclk2 domain for input to PRBS generator block
    wire [31:0]  preamble_length_sync=preamble_length;
    wire [31:0]  burst_length_sync=burst_length;
    wire [31:0]  burst_period_sync=burst_period;
    wire [3:0]   dataOut_TKEEP;
    assign axis_dataOut_TKEEP = dataOut_TKEEP;
 /*   (* DONT_TOUCH = "TRUE" *)
    bit_sync bit_sync_vio_preamble_length_inst (
     .clk_in (hb0_gtwiz_userclk_tx_usrclk2_int),
     .i_in   (preamble_length),
     .o_out  (preamble_length_sync)
    );

    (* DONT_TOUCH = "TRUE" *)
    bit_sync bit_sync_vio_burst_length_inst (
     .clk_in (hb0_gtwiz_userclk_tx_usrclk2_int),
     .i_in   (burst_length),
     .o_out  (burst_length_sync)
    );

    (* DONT_TOUCH = "TRUE" *)
    bit_sync bit_sync_vio_burst_period_inst (
     .clk_in (hb0_gtwiz_userclk_tx_usrclk2_int),
     .i_in   (burst_period),
     .o_out  (burst_period_sync)
    );*/
    // ===================================================================================================================
    // PRBS GENERATOR
    // ===================================================================================================================


  // -------------------------------------------------------------------------------------------------------------------
  // Reset synchronizer
  // -------------------------------------------------------------------------------------------------------------------

  // Synchronize the example stimulus reset condition into the txusrclk2 domain
  wire example_stimulus_reset_int = reset_in;
  wire example_stimulus_reset_sync;

  (* DONT_TOUCH = "TRUE" *)
  reset_sync reset_synchronizer_inst (
    .clk_in  (tx_axis_usrclk),
    .rst_in  (example_stimulus_reset_int),
    .rst_out (example_stimulus_reset_sync)
  );


  // -------------------------------------------------------------------------------------------------------------------
  // PRBS generator output enable and sideband control generation
  // -------------------------------------------------------------------------------------------------------------------

  // For raw mode data transmission, the PRBS generator is always enabled
  wire prbs_any_gen_en_int = 1'b1;

  ControlledBurstGen_0 ControlledBurstGen_inst(
    .axis_dataOut_TVALID_ap_vld(axis_dataOut_TVALID_ap_vld),  // output wire axis_dataOut_TVALID_ap_vld
    .ap_clk (tx_axis_usrclk),
    .ap_rst_n (~example_stimulus_reset_sync),
    //optional control ports -- fixing it for now
    .ap_start(1'b1),                // input wire ap_start
    .ap_done(),                  // output wire ap_done
    .ap_idle(),                  // output wire ap_idle
    .ap_ready(),                // output wire ap_ready
    .enable (example_stimulus_reset_sync^1'b1),  // input wire [0 : 0] enable
    .preamble_length(preamble_length),
    .add_delimiter(1'b0),                            // input wire [0 : 0] add_delimiter
    .preamble(32'h05560556),
    .delimiter(32'hB2C50FA1),
    .burst_period(burst_period),
    .burst_length(burst_length),
    .dataOut_TVALID(),    // output wire dataOut_TVALID
    .dataOut_TREADY(axis_dataOut_TREADY),    // input wire dataOut_TREADY
    .dataOut_TDATA(hb0_gtwiz_userdata_tx_axis_TDATA_int),      // output wire [31 : 0] dataOut_TDATA
    .dataOut_TDEST(),      // output wire [5 : 0] dataOut_TDEST
    .dataOut_TKEEP(dataOut_TKEEP),      // output wire [3 : 0] dataOut_TKEEP
    .dataOut_TSTRB(),      // output wire [3 : 0] dataOut_TSTRB
    .dataOut_TUSER(axis_dataOut_TUSER),      // output wire [1 : 0] dataOut_TUSER
    .dataOut_TLAST(axis_dataOut_TLAST),      // output wire [0 : 0] dataOut_TLAST
    .dataOut_TID(),          // output wire [4 : 0] dataOut_TID
    .axis_dataOut_TVALID(axis_dataOut_TVALID)                // output wire [0 : 0] axis_dataOut_TVALID
  );


endmodule
