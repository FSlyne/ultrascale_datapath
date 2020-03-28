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
    
    (* DONT_TOUCH = "TRUE" *)
    Burst_Mode_Synchronizer Preamble_Synchronizer_inst (
        .in_data                   (axis_TDATA_in)
        ,.in_syncword              (32'h05560556)
        ,.in_threshold             (7'b0000101)
        ,.in_enable                (axis_TVALID_in)
        ,.in_reset                 (reset_in)
        ,.in_clock                 (clk_in)
        ,.out_data                 (rxdata_preamble_synced_out)
        ,.out_detected             (preamble_detected)
        ,.out_data_double_buffer   (out_data_double_buffer)
        ,.out_threshold_comparator (out_threshold_comp)
    );
    
    (* DONT_TOUCH = "TRUE" *)
    Burst_Mode_Synchronizer Delimiter_Synchronizer_inst (
        .in_data                   (rxdata_preamble_synced_out)
        ,.in_syncword              (32'hb2c50fa1)
        ,.in_threshold             (7'b0000101)
        ,.in_enable                (axis_TVALID_in)
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
        ,.in_syncword              (32'haaaaaaaa)
        ,.in_threshold             (7'b0000011)
        ,.in_enable                (axis_TVALID_in)
        ,.in_reset                 (reset_in)
        ,.in_clock                 (clk_in)
        ,.out_data                 (rxdata_tlast_synced_out)
        ,.out_detected             (tlast_detected)
        ,.out_data_double_buffer   ()
        ,.out_threshold_comparator ()
    );

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
        axis_sidechnls_delay_compensated <= delay_buffer[8];
    end
    assign axis_TKEEP_out = axis_sidechnls_delay_compensated[5:2];
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
        delimiter_detected_delay_compensated <= delay_buffer_1[8];
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
    
    reg [31:0] enable_till = 32'h0000010f;
    reg en_count; 
    reg [31:0] tdata = 32'h00000000;
    reg tvalid = 1'b0;
    reg [3:0] tkeep = 4'd0;
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
    
endmodule
