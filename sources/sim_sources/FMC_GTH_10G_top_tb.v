////------------------------------------------------------------------------------
////  (c) Copyright 2013 Xilinx, Inc. All rights reserved.
////
////  This file contains confidential and proprietary information
////  of Xilinx, Inc. and is protected under U.S. and
////  international copyright and other intellectual property
////  laws.
////
////  DISCLAIMER
////  This disclaimer is not a license and does not grant any
////  rights to the materials distributed herewith. Except as
////  otherwise provided in a valid license issued to you by
////  Xilinx, and to the maximum extent permitted by applicable
////  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
////  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
////  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
////  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
////  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
////  (2) Xilinx shall not be liable (whether in contract or tort,
////  including negligence, or under any other theory of
////  liability) for any loss or damage of any kind or nature
////  related to, arising under or in connection with these
////  materials, including for any direct, or any indirect,
////  special, incidental, or consequential loss or damage
////  (including loss of data, profits, goodwill, or any type of
////  loss or damage suffered as a result of any action brought
////  by a third party) even if such damage or loss was
////  reasonably foreseeable or Xilinx had been advised of the
////  possibility of the same.
////
////  CRITICAL APPLICATIONS
////  Xilinx products are not designed or intended to be fail-
////  safe, or for use in any application requiring fail-safe
////  performance, such as life-support or safety devices or
////  systems, Class III medical devices, nuclear facilities,
////  applications related to the deployment of airbags, or any
////  other applications that could lead to death, personal
////  injury, or severe property or environmental damage
////  (individually and collectively, "Critical
////  Applications"). Customer assumes the sole risk and
////  liability of any use of Xilinx products in Critical
////  Applications, subject only to applicable laws and
////  regulations governing limitations on product liability.
////
////  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
////  PART OF THIS FILE AT ALL TIMES.
////------------------------------------------------------------------------------


`timescale 1fs/1fs

module top_tb
(
);

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
    reg             xgpon_gt_clk_freerun;
    reg             gt_refclk_p;
    reg             gt_refclk_n;
    reg             mgtrefclk0_x0y3_p;
    reg             mgtrefclk0_x0y3_n;
    reg             sys_reset;
    wire [1-1:0] eth_gtbnk230_x0y24_rxp_in;
    wire [1-1:0] eth_gtbnk230_x0y24_rxn_in;
    wire [1-1:0] eth_gtbnk230_x0y24_txp_out;
    wire [1-1:0] eth_gtbnk230_x0y24_txn_out;

    wire [1-1:0] eth_gtbnk230_x0y25_rxp_in;
    wire [1-1:0] eth_gtbnk230_x0y25_rxn_in;
    wire [1-1:0] eth_gtbnk230_x0y25_txp_out;
    wire [1-1:0] eth_gtbnk230_x0y25_txn_out;
    
    wire [1-1:0] eth_gtbnk230_x0y27_rxp_in;
    wire [1-1:0] eth_gtbnk230_x0y27_rxn_in;
    wire [1-1:0] eth_gtbnk230_x0y27_txp_out;
    wire [1-1:0] eth_gtbnk230_x0y27_txn_out;
    
    wire xg_pon_burst_gt_txp_out;
    wire xg_pon_burst_gt_txn_out;

    reg             restart_tx_rx_0;
    reg             send_continous_pkts_0;
    wire            rx_gt_locked_led_0;
    wire            rx_block_lock_led_0;

    reg             timed_out;
    reg             time_out_cntr_en;
    reg  [24 :0]    time_out_cntr;
    wire [4:0]      completion_status;


    initial
    begin
      gt_refclk_p = 0;
      gt_refclk_n = 1;
      mgtrefclk0_x0y3_p = 0;
      mgtrefclk0_x0y3_n = 1;
      dclk   = 0;
      sys_reset  = 1; 
      restart_tx_rx_0 = 0;
      send_continous_pkts_0 = 0;
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

      repeat(100) #1_000_000_000;         // wait for 100 more us
      display_result(completion_status);

      restart_tx_rx_0 = 1;                      //// Restarting packet generation.
      repeat (10) @(posedge dclk);
      restart_tx_rx_0 = 0;
      $display("INFO : PACKET GENERATION RESTARTED");
      $display("INFO : WAITING FOR COMPLETION STATUS..........");
      wait ( ( completion_status != 5'h1F ) && ( completion_status != 5'h0 ) ) ;
      if (completion_status == 5'h01)
      $display("INFO : COMPLETION_STATUS = 5'b00001");
      repeat(300) #1_000_000_000;         // wait for 300 more us
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
        forever #3200000.000   gt_refclk_p = ~ gt_refclk_p; //156.25 MHz
    end

    initial
    begin
        gt_refclk_n =0;
        forever #3200000.000   gt_refclk_n = ~ gt_refclk_n; //156.25 MHz
    end
    
    initial
    begin
        mgtrefclk0_x0y3_p =1;
        forever #3200000.000   mgtrefclk0_x0y3_p = ~ mgtrefclk0_x0y3_p; //156.25 MHz
    end

    initial
    begin
        mgtrefclk0_x0y3_n =0;
        forever #3200000.000   mgtrefclk0_x0y3_n = ~ mgtrefclk0_x0y3_n; //156.25 MHz
    end

    initial
    begin
        dclk =1;
        forever #2000000.000   dclk = ~ dclk; // 100 MHz
    end

    initial
    begin
        xgpon_gt_clk_freerun =1;
        forever #2000000.000   xgpon_gt_clk_freerun = ~ xgpon_gt_clk_freerun; // 100 MHz
    end
    
top top_DUT_inst
(
  .hb_gtwiz_reset_all_in        (1'b0)
  ,.link_down_latched_reset_in  (1'b0)
  //for this one-board simulation case, we  are connecting the first emulator 
  //in gth-x0y24 to the gth interface at "gth_eth_to_Xg_PON_if" module which
  //is at gth transceiver site- gth-x0y27.
  //The second emulator in gth-x0y25 is just looped back to itself for now.
 
  //eth 10G emulator ports : emulator in GT bank-230, gth-x0y24
  //interfacing with gth_eth at x0y27 on "gth_eth_to_Xg_PON_if" module
  ,.eth_gtbnk230_x0y24_rxp_in         (eth_gtbnk230_x0y27_txp_out)
  ,.eth_gtbnk230_x0y24_rxn_in         (eth_gtbnk230_x0y27_txn_out)
  ,.eth_gtbnk230_x0y24_txp_out        (eth_gtbnk230_x0y24_txp_out)
  ,.eth_gtbnk230_x0y24_txn_out        (eth_gtbnk230_x0y24_txn_out)

  //eth 10G emulator ports : emulator in GT bank-230, gth-x0y25
  //looping back the gt serial ports on itself.
  ,.eth_gtbnk230_x0y25_rxp_in         (eth_gtbnk230_x0y25_txp_out)
  ,.eth_gtbnk230_x0y25_rxn_in         (eth_gtbnk230_x0y25_txn_out)
  ,.eth_gtbnk230_x0y25_txp_out        (eth_gtbnk230_x0y25_txp_out)
  ,.eth_gtbnk230_x0y25_txn_out        (eth_gtbnk230_x0y25_txn_out)
  
  //eth10g to xg-pon if ports : eth10 if in GT bank-230, gth-x0y27
  //interfacing with gth_eth at x0y24 on "gth_eth_10G_emulator" module
  ,.eth_gtbnk230_x0y27_rxp_in         (eth_gtbnk230_x0y24_txp_out)
  ,.eth_gtbnk230_x0y27_rxn_in         (eth_gtbnk230_x0y24_txn_out)
  ,.eth_gtbnk230_x0y27_txp_out        (eth_gtbnk230_x0y27_txp_out)
  ,.eth_gtbnk230_x0y27_txn_out        (eth_gtbnk230_x0y27_txn_out)
  
  //10G xg-PON gty BCDR ports : gtyBCDR in GT bank-127, gty-x0y12
  //looping back the gt serial ports on itself.
  ,.xg_pon_burst_gt_txp_out     (xg_pon_burst_gt_txp_out)
  ,.xg_pon_burst_gt_txn_out     (xg_pon_burst_gt_txn_out)
  ,.xg_pon_burst_gt_rxp_in      (xg_pon_burst_gt_txp_out)
  ,.xg_pon_burst_gt_rxn_in      (xg_pon_burst_gt_txn_out)

  ,.eth_restart_tx_rx           (restart_tx_rx_0)
  ,.send_continous_pkts         (send_continous_pkts_0)
  ,.eth_rx_gt_locked_led        (rx_gt_locked_led_0)
  ,.eth_rx_block_lock_led       (rx_block_lock_led_0)
  ,.eth_completion_status       (completion_status)
  ,.eth_sys_reset_phy           (sys_reset)
  
  ,.eth_gt_refclk_p             (gt_refclk_p)
  ,.eth_gt_refclk_n             (gt_refclk_n)
  ,.mgtrefclk0_x0y3_p           (mgtrefclk0_x0y3_p)
  ,.mgtrefclk0_x0y3_n           (mgtrefclk0_x0y3_n)
  ,.dclk_p                      (dclk)
  ,.dclk_n                      (~dclk)
  ,.xgpon_gt_clk_freerun_p      (xgpon_gt_clk_freerun)
  ,.xgpon_gt_clk_freerun_n      (~xgpon_gt_clk_freerun)
);

endmodule
