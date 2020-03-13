//------------------------------------------------------------------------------
//  (c) Copyright 2013-2015 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------


`timescale 1ps/1ps

// =====================================================================================================================
// This example design top simulation module instantiates the example design top module, provides basic stimulus to it
// while looping back transceiver data from transmit to receive, and utilizes the PRBS checker-based link status
// indicator to demonstrate simple data integrity checking of the design. This module is for use in simulation only.
// =====================================================================================================================

module FMC_GTH_top_sim ();


  // -------------------------------------------------------------------------------------------------------------------
  // Signal declarations and basic example design stimulus
  // -------------------------------------------------------------------------------------------------------------------

  // Declare wires to loop back serial data ports for transceiver channel 0
  wire ch0_gthxn;
  wire ch0_gthxp;

  // Declare wires to loop back serial data ports for transceiver channel 1
  wire ch1_gthxn;
  wire ch1_gthxp;

  // Declare wires to loop back serial data ports for transceiver channel 2
  wire ch2_gthxn;
  wire ch2_gthxp;

  // Declare wires to loop back serial data ports for transceiver channel 3
  wire ch3_gthxn;
  wire ch3_gthxp;

  // Declare register to drive reference clock at location MGTREFCLK0_X0Y5
  reg mgtrefclk0_x0y5 = 1'b0;


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////// Signal and task declaration for 10G eth-GTY ///////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  task  display_result;
        input [4:0] completion_status;
        begin
            if ( completion_status == 5'd1 ) 
               begin
                  $display("INFO : Sanity Completed and Passed");
                  $display("INFO : CORE TEST SUCCESSFULLY COMPLETED and PASSED");
                  $display("INFO : Test Completed Successfully");
               end
            else begin
               $display("%c[1;31m",27);
               $display("******");
               $display("INFO : Sanity Completed");
               case ( completion_status )
                 5'd0:  $display("ERROR@%0t : Test did not run.", $time );
                 5'd2:  $display("ERROR@%0t : No block lock on any lanes.", $time );
                 5'd3:  $display("ERROR@%0t : Not all lanes achieved block lock.", $time );
                 5'd4:  $display("ERROR@%0t : Some lanes lost block lock after achieving block lock.", $time );
                 5'd5:  $display("ERROR@%0t : No lane sync on any lanes.", $time );
                 5'd6:  $display("ERROR@%0t : Not all lanes achieved sync.", $time );
                 5'd7:  $display("ERROR@%0t : Some lanes lost sync after achieving sync.", $time );
                 5'd8:  $display("ERROR@%0t : No alignment status or rx_status was achieved.", $time );
                 5'd9:  $display("ERROR@%0t : Loss of alignment status or rx_status after both were achieved.", $time );
                 5'd10: $display("ERROR@%0t : TX timed out.", $time );
                 5'd11: $display("ERROR@%0t : No tx data was sent.", $time );
                 5'd12: $display("ERROR@%0t : Number of packets received did not equal the number of packets sent.", $time );
                 5'd13: $display("ERROR@%0t : Total number of bytes received did not equal the total number of bytes sent.", $time );
                 5'd14: $display("ERROR@%0t : An lbus protocol error was detected.", $time );
                 5'd15: $display("ERROR@%0t : Bit errors were detected in the received packets.", $time );
                 5'd31: $display("ERROR@%0t : Test is stuck in reset.", $time );
                 default: $display("ERROR@%0t : An invalid completion status (%h) was detected.", $time, completion_status );
               endcase
               $display("******");
               $display("%c[0m",27);
               $display("ERROR : All the Test Cases Completed but Failed with Errors/Warnings");
            end
        end
    endtask



    reg             dclk;
    reg             gt_refclk_p;
    reg             gt_refclk_n;
    reg             sys_reset;
    wire            gt_txp_out_0;
    wire            gt_txn_out_0;
    reg             restart_tx_rx_0;
    reg             send_continous_pkts_0;
    wire            rx_gt_locked_led_0;
    wire            rx_block_lock_led_0;

    reg             timed_out;
    reg             time_out_cntr_en;
    reg  [24 :0]    time_out_cntr;
    wire [4:0]      completion_status;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////// Drive clock and reset ports for 10G eth-GTY ///////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
    initial
    begin
      gt_refclk_p = 0;
      gt_refclk_n = 1;
      dclk   = 0;
      sys_reset  = 1; 
      restart_tx_rx_0 = 0;
      send_continous_pkts_0 = 1;
      repeat (20) @(posedge dclk);
      sys_reset = 0;
      $display("INFO : SYS_RESET RELEASED TO CORE");

      $display("INFO : WAITING FOR THE GT LOCK..........");
      time_out_cntr_en = 1;

      wait(rx_gt_locked_led_0 || timed_out);
      if (rx_gt_locked_led_0)
      $display("INFO : GT LOCKED");
      else 
      begin
          $display("ERROR: GT LOCK FAILED - Timed Out");
          $finish; 
      end
      time_out_cntr_en = 0;

      $display("INFO : WAITING FOR RX_BLOCK_LOCK..........");
      repeat (1) @(posedge dclk);
     
      time_out_cntr_en = 1;
      wait(rx_block_lock_led_0 || timed_out);
      if(rx_block_lock_led_0) 
      $display("INFO : CORE 10GE RX BLOCK LOCKED");
      else 
      begin
          $display("ERROR: CORE 10GE RX BLOCK LOCK FAILED - Timed Out");
          $finish; 
      end
      time_out_cntr_en = 0;

      $display("INFO : WAITING FOR COMPLETION STATUS..........");
      wait ( ( completion_status != 5'h1F ) && ( completion_status != 5'h0 ) ) ;
      if (completion_status == 5'h01)
      $display("INFO : COMPLETION_STATUS = 5'b00001");

      repeat(100) #1_000_000;         // wait for 100 more us
      display_result(completion_status);

      restart_tx_rx_0 = 1;                      //// Restarting packet generation.
      repeat (10) @(posedge dclk);
      restart_tx_rx_0 = 0;
      $display("INFO : PACKET GENERATION RESTARTED");
      $display("INFO : WAITING FOR COMPLETION STATUS..........");
      wait ( ( completion_status != 5'h1F ) && ( completion_status != 5'h0 ) ) ;
      if (completion_status == 5'h01)
      $display("INFO : COMPLETION_STATUS = 5'b00001");
      repeat(300) #1_000_000;         // wait for 300 more us
      display_result(completion_status);


  $finish; 

    end

    //////////////////////////////////////////////////
    ////time_out_cntr signal generation Max 26ms
    //////////////////////////////////////////////////
    always @( posedge dclk or negedge sys_reset )
    begin
        if ( sys_reset == 1'b1 )
        begin
            timed_out     <= 1'b0;
            time_out_cntr <= 24'd0;
        end
        else
        begin
            timed_out <= time_out_cntr[20];
            if (time_out_cntr_en == 1'b1)
                time_out_cntr <= time_out_cntr + 24'd1;
            else
                time_out_cntr <= 24'd0;
        end
    end


    initial
    begin
        gt_refclk_p =1;
        forever #3200.000   gt_refclk_p = ~ gt_refclk_p;
    end

    initial
    begin
        gt_refclk_n =0;
        forever #3200.000   gt_refclk_n = ~ gt_refclk_n;
    end

    initial
    begin
        dclk =1;
        forever #5000.000   dclk = ~ dclk;
    end


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////// Drive clock and reset ports for FMC-GTH ///////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // Drive that reference clock at the appropriate frequency
  // NOTE: the following simulation reference clock period may be up to +/- 2ps from its nominal value, due to rounding
  // within Verilog timescale granularity, especially when transmitter and receiver reference clock frequencies differ
  initial begin
    mgtrefclk0_x0y5 = 1'b0;
    forever
      mgtrefclk0_x0y5 = #3200 ~mgtrefclk0_x0y5;
  end

  // Declare registers to drive reset helper block(s)
  reg hb_gtwiz_reset_clk_freerun = 1'b0;
  reg hb_gtwiz_reset_all         = 1'b1;

  // Drive the helper block free running clock
  initial begin
    hb_gtwiz_reset_clk_freerun = 1'b0;
    forever
      hb_gtwiz_reset_clk_freerun = #2000 ~hb_gtwiz_reset_clk_freerun;
  end

  // Drive the helper block "reset all" input high, then low after some time
  initial begin
    hb_gtwiz_reset_all = 1'b1;
    #5E6;
    repeat (100)
      @(hb_gtwiz_reset_clk_freerun);
    hb_gtwiz_reset_all = 1'b0;
  end

  // Declare registers and wires to interface to the PRBS-based link status ports
  reg  link_down_latched_reset = 1'b0;
  wire link_status;
  wire link_down_latched;

  // -------------------------------------------------------------------------------------------------------------------
  // Basic data integrity checking, making use of PRBS-based link status ports
  // -------------------------------------------------------------------------------------------------------------------

  // Create a basic timeout indicator which is used to abort the simulation of no link is achieved after 2ms
  reg simulation_timeout_check = 1'b0;
  initial begin
    simulation_timeout_check = 1'b0;
    #2E9;
    simulation_timeout_check = 1'b1;
  end

  // Create a basic stable link monitor which is set after 2048 consecutive cycles of link up and is reset after any
  // link loss
  reg [10:0] link_up_ctr = 11'd0;
  reg        link_stable = 1'b0;
  always @(posedge hb_gtwiz_reset_clk_freerun) begin
    if (link_status !== 1'b1) begin
      link_up_ctr <= 11'd0;
      link_stable <= 1'b0;
    end
    else begin
      if (&link_up_ctr)
        link_stable <= 1'b1;
      else
        link_up_ctr <= link_up_ctr + 11'd1;
    end
  end

  // Perform basic checking of the simulation outcome based on stable link monitor
  initial begin

    // Await de-assertion of the master reset signal
    @(negedge hb_gtwiz_reset_all);

    // Await assertion of initial link indication or simulation timeout indicator
    @(posedge link_stable, simulation_timeout_check);

    // If the simulation timeout indicator was asserted, the simulation failed to achieve initial link up in a
    // reasonable time, so display an error message and quit
    if (simulation_timeout_check) begin
      $display("Time : %12d ps   FAIL: simulation timeout. Link never achieved.", $time);
      $display("** Error: Test did not complete successfully");
      $finish;
    end

    // If the initial link was achieved, display this message and continue checks as follows
    else begin
      $display("Time : %12d ps   Initial link achieved across all transceiver channels.", $time);

      // Reset the latched link down indicator, which is always set prior to initially achieving link
      $display("Time : %12d ps   Resetting latched link down indicator.", $time);
      link_down_latched_reset = 1'b1;
      repeat (5)
        @(hb_gtwiz_reset_clk_freerun);
      link_down_latched_reset = 1'b0;

      // Continue to run the simulation for long enough to detect any subsequent errors causing link loss which may
      // occur within a reasonable simulation time
      $display("Time : %12d ps   Continuing simulation for 50us to check for maintenance of link.", $time);
      #5E7;

      // At simulation completion, if the link indicator is still high and no intermittent link loss was detected,
      // display a success message. Otherwise, display a failure message. Complete the simulation in either case.
      if ((link_status === 1'b1) && (link_down_latched === 1'b0)) begin
        $display("Time : %12d ps   PASS: simulation completed with maintained link.", $time);
        $display("** Test completed successfully");
      end
      else begin
        $display("Time : %12d ps   FAIL: simulation completed with subsequent link loss after after initial link.", $time);
        $display("** Error: Test did not complete successfully");
      end

      $finish;
    end
  end

  // -------------------------------------------------------------------------------------------------------------------
  // Instantiate example design top module as the simulation DUT
  // -------------------------------------------------------------------------------------------------------------------
    reg eth_gt_b2b_conn =1'b1;
    wire unconn_eth_gt_rxp_in;
    wire unconn_eth_gt_rxn_in;
    wire eth_gt_rxp_in;
    wire eth_gt_rxn_in;
    assign eth_gt_rxp_in = eth_gt_b2b_conn ? gt_txp_out_0 : unconn_eth_gt_rxp_in;
    assign eth_gt_rxn_in = eth_gt_b2b_conn ? gt_txn_out_0 : unconn_eth_gt_rxn_in;
  FMC_GTH_top_wrap FMC_GTH_top_wrap_inst (
    .hb_gtwiz_reset_all_in (hb_gtwiz_reset_all),
    .link_down_latched_reset_in (link_down_latched_reset),
    .eth_gt_rxp_in(eth_gt_rxp_in),
    .eth_gt_rxn_in(eth_gt_rxn_in),
    .eth_gt_txp_out(gt_txp_out_0),
    .eth_gt_txn_out(gt_txn_out_0),
    .eth_restart_tx_rx(restart_tx_rx_0),
    .send_continous_pkts(send_continous_pkts_0),   // This port can be used to send continous packets 
    .eth_rx_gt_locked_led(rx_gt_locked_led_0),     // Indicates GT LOCK
    .eth_rx_block_lock_led(rx_block_lock_led_0),    // Indicates Core Block Lock
    .eth_completion_status(completion_status),

    .eth_sys_reset(sys_reset),
    .eth_gt_refclk_p(gt_refclk_p),
    .eth_gt_refclk_n(gt_refclk_n),
    .dclk_p(dclk),
    .dclk_n(~dclk)
  );


endmodule
