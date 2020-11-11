`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2020 17:53:43
// Design Name: 
// Module Name: Xg-PONFrameSync
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


module xg_PON_frame_sync(
    input wire clk_in,
    input wire reset_in,
    
    input wire [31:0] axis_TDATA_in,
    input wire axis_TVALID_in,
    input wire [3:0] axis_TKEEP_in,
    input wire axis_TLAST_in,
    input wire axis_TUSER_in,
    input wire [31:0] preamble_pattern,
    input wire [31:0] preamble_duration,
    output wire axis_TREADY_out,
    
    output wire [31:0] axis_TDATA_out,
    output wire axis_TVALID_out,
    output wire [3:0] axis_TKEEP_out,
    output wire axis_TLAST_out,
    output wire axis_TUSER_out,
    input wire axis_TREADY_in    
);
    
    
    wire [31:0] rxdata_preamble_synced_out;
    wire [31:0] rxdata_delimiter_synced_out;
    wire [31:0] rxdata_tlast_synced_out;
    wire preamble_detected;
    wire delimiter_detected;
    wire [63:0] out_data_double_buffer;
    wire [6:0] out_threshold_comp;
    
    wire [31:0] preamble_pattern_sync;
    wire [31:0] preamble_duration_sync;
    
    (* DONT_TOUCH = "TRUE" *)
    xgpongt_frsync_cdc_sync_2stage 
      #(
        .WIDTH        (32)
      ) xgpongt_frsync_cdc_sync_2stage_syncer (
        .clk          (clk_in),
        .signal_in    (preamble_pattern),
        .signal_out   (preamble_pattern_sync)
      );
    
    (* DONT_TOUCH = "TRUE" *)
    xgpongt_frsync_cdc_sync_2stage 
      #(
        .WIDTH        (32)
      ) xgpongt_frsync_cdc_sync_2stage_syncer_1 (
        .clk          (clk_in),
        .signal_in    (preamble_duration),
        .signal_out   (preamble_duration_sync)
      );
    
    (* DONT_TOUCH = "TRUE" *)
    Burst_Mode_Synchronizer Preamble_Synchronizer_inst (
        .in_data                   (axis_TDATA_in)
        ,.in_syncword              (preamble_pattern_sync)
        ,.in_threshold             (7'b0000100)
        ,.in_enable                (axis_TVALID_in)
        ,.in_reset                 (reset_in)
        ,.in_clock                 (clk_in)
        ,.out_data                 (rxdata_preamble_synced_out)
        ,.out_detected             (preamble_detected)
        ,.out_data_double_buffer   (out_data_double_buffer)
        ,.out_threshold_comparator (out_threshold_comp)
    );
    
    //get the positive edge of the start and align it to one clock cycle
    //-----------------Positive Edge Detector--------------------//
    reg preamble_detected_next;
    wire preamble_detected_posedge;
    always@(posedge clk_in)
        preamble_detected_next <= preamble_detected; 
    assign preamble_detected_posedge = preamble_detected && (~preamble_detected_next);
    //----------------------------------------------------------//
    wire delim_det_enable;
    wire [31:0] delim_enable_duration;
    assign delim_enable_duration = preamble_duration_sync + 32'h0000000A;
    config_enable DelimiterDetect_enable(
        .clk_in(clk_in)             //input wire clk_in
        ,.reset_in(reset_in)        //input wire reset_in
        ,.start(preamble_detected_posedge)              //input wire start
        ,.stop(1'b0)                //input wire stop
        ,.enable_till(delim_enable_duration)  //input wire [31:0] enable_till
        ,.enable_out(delim_det_enable)    //input wire enable_out
    );

    
    (* DONT_TOUCH = "TRUE" *)
    Burst_Mode_Synchronizer Delimiter_Synchronizer_inst (
        .in_data                   (axis_TDATA_in)
        ,.in_syncword              (32'hb2c50fa1)
        ,.in_threshold             (7'b0000010)
        ,.in_enable                (delim_det_enable)
        ,.in_reset                 (reset_in)
        ,.in_clock                 (clk_in)
        ,.out_data                 (rxdata_delimiter_synced_out)
        ,.out_detected             (delimiter_detected)
        ,.out_data_double_buffer   ()
        ,.out_threshold_comparator ()
    );
    
    wire tlast_detected;
    (* DONT_TOUCH = "TRUE" *)
    Burst_Mode_Synchronizer fcs_checker_inst (
        .in_data                   (rxdata_delimiter_synced_out)
        ,.in_syncword              (32'h82D6F416)
        ,.in_threshold             (7'b00000011)
        ,.in_enable                (axis_TVALID_in)
        ,.in_reset                 (delimiter_detected)
        ,.in_clock                 (clk_in)
        ,.out_data                 (rxdata_tlast_synced_out)
        ,.out_detected             (tlast_detected)
        ,.out_data_double_buffer   ()
        ,.out_threshold_comparator ()
    );
    /*wire [31:0] rxdata_delimiter_synced_descrmb;
    reg [0:0] delimiter_detected_delyed;
    wire descrambler_rst;
    always@(posedge clk_in) begin
        delimiter_detected_delyed <= delimiter_detected; 
    end
    assign descrambler_rst = delimiter_detected_delyed;
    scrambler descrambler_inst(
        .data_in(rxdata_delimiter_synced_out)
        ,.scram_en(axis_TVALID_in)
        ,.scram_rst(descrambler_rst)
        ,.data_out(rxdata_delimiter_synced_descrmb)
        ,.rst(reset_in)
        ,.clk(clk_in)
    );*/
    //get the positive edge of the start and align it to one clock cycle
    //-----------------Positive Edge Detector--------------------//
    reg tlast_detected_next;
    wire tlast_detected_posedge;
    always@(posedge clk_in)
        tlast_detected_next <= tlast_detected; 
    assign tlast_detected_posedge = tlast_detected && (~tlast_detected_next);
    //----------------------------------------------------------//

    //----------------------------------------
    // Calibrated-delay Data FIFO buffer
    //----------------------------------------
    reg [32+4+2-1:0] delay_buffer[20:0];
    reg [32+4+2-1:0] axis_sidechnls_delay_compensated;
    always @(posedge clk_in) begin
        delay_buffer[0] <= {rxdata_delimiter_synced_out, axis_TKEEP_in, axis_TLAST_in, axis_TUSER_in};
        axis_sidechnls_delay_compensated <= delay_buffer[7+1+1]; //delay_buffer[7+1] for simulation validity
    end
    reg[3:0] tkeep;
    always @(*) begin
        if(tlast_detected_posedge) begin
            if((axis_sidechnls_delay_compensated[37:6] & 32'hFFFFFF00) == 32'h00000000) begin
                tkeep<=4'hf;
            end else if ((axis_sidechnls_delay_compensated[37:6] & 32'hFFFF0000) == 32'h00000000) begin
                tkeep<=4'h3;
            end else if ((axis_sidechnls_delay_compensated[37:6] & 32'hFF000000) == 32'h00000000) begin
                tkeep<=4'h7;
            end else begin
                tkeep<=4'hf;
            end
        end else begin
            tkeep <= 4'd15;
        end
    end
    assign axis_TKEEP_out = tkeep;
    assign axis_TLAST_out = tlast_detected_posedge;
    assign axis_TUSER_out = axis_sidechnls_delay_compensated[0];
    assign axis_TDATA_out = axis_sidechnls_delay_compensated[37:6];
    

    genvar idx_delay;
    generate
        for (idx_delay = 1; idx_delay < 20; idx_delay = idx_delay + 1) begin : fifo_buffer
            always @(posedge clk_in) begin
                delay_buffer[idx_delay] <= delay_buffer[idx_delay-1];
            end
        end
    endgenerate

    //----------------------------------------
    // Calibrated-delay Data FIFO buffer
    //----------------------------------------
    reg [0:0] delay_buffer_1[10:0];
    reg [0:0] delimiter_detected_delay_compensated;
    always @(posedge clk_in) begin
        delay_buffer_1[0] <= delimiter_detected;
        delimiter_detected_delay_compensated <= delay_buffer_1[7+1+1]; //delay_buffer_1[7+1] for simulation validity
    end

    genvar idx_delay_1;
    generate
        for (idx_delay_1 = 1; idx_delay_1 < 20; idx_delay_1 = idx_delay_1 + 1) begin : fifo_buffer_1
            always @(posedge clk_in) begin
                delay_buffer_1[idx_delay_1] <= delay_buffer_1[idx_delay_1 - 1];
            end
        end
    endgenerate
      
    //---------Signal Declarations-------------------------//
    reg en_out_next, stop;
    reg [31:0] count_reg, count_reg_next;
    
    reg [31:0] enable_till = 32'h00000800;
    reg en_count; 
    reg [31:0] tdata = 32'h00000000;
    reg tvalid = 1'b0;
//    reg [3:0] tkeep = 4'd0;
    reg tuser = 1'b0;
    reg tlast = 1'b0;
    
    //-----------Configurable Enable at posedge-START-----------//
    always@(posedge clk_in) begin
        if (reset_in || stop) begin
            en_count<=0;
            count_reg<=32'd0;
        end else if (delimiter_detected_delay_compensated) begin
            en_count<=1'b1;
            count_reg<=32'd1;
        end else begin
            en_count<=en_out_next;
            count_reg<=count_reg_next;
        end
    end
    
    
    always@(*) begin
        if (reset_in) begin
            count_reg_next<=32'd0;
            en_out_next <=1'b0;
        end else if (en_count) begin
            count_reg_next <= count_reg + 1;
            en_out_next <=1'b1;
        end else begin
            count_reg_next <= count_reg;
            en_out_next <= en_count;
        end
        
        if (count_reg == enable_till || tlast_detected_posedge)
            stop <= 1;
        else
            stop <= 0; 
    end
    //-------------------------------------------------------------//
    assign axis_TVALID_out = en_count;
    
    if(1) begin : xgpon_rx_fr_sync_debug
    axis_ila xgpon_gt_tx_axis_ila(
        .clk(clk_in), // input wire clk    
        .probe0(preamble_detected_posedge), // input wire [0:0] TREADY  
        .probe1(axis_TDATA_out), // input wire [31:0]  TDATA 
        .probe2(4'd0), // input wire [3:0]  TSTRB 
        .probe3(axis_TVALID_out), // input wire [0:0]  TVALID 
        .probe4(preamble_detected), // input wire [0:0]  TLAST 
        .probe5(delimiter_detected), // input wire [0:0]  TUSER 
        .probe6(axis_TKEEP_out), // input wire [3:0]  TKEEP 
        .probe7(tlast_detected), // input wire [0:0]  TDEST  
        .probe8(tlast_detected_posedge) // input wire [0:0]  TID
    );
    end
    
endmodule


(* DowngradeIPIdentifiedWarnings="yes" *)
module xgpongt_frsync_cdc_sync_2stage
#(
 parameter WIDTH  = 1
)
(
 input  clk,
 input  [WIDTH-1:0] signal_in,
 output wire [WIDTH-1:0]  signal_out
);

                          wire [WIDTH-1:0] sig_in_cdc_from;
 (* ASYNC_REG = "TRUE" *) reg  [WIDTH-1:0] s_out_d2_cdc_to;
 (* ASYNC_REG = "TRUE" *) reg  [WIDTH-1:0] data_out_d3;

assign sig_in_cdc_from = signal_in;
assign signal_out      = data_out_d3;

always @(posedge clk) 
begin
  s_out_d2_cdc_to  <= sig_in_cdc_from;
  data_out_d3      <= s_out_d2_cdc_to;
end

endmodule