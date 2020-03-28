`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CONNECT
// Author: SANDIP DAS
// 
// Create Date: 21.03.2020 23:15:47
// Design Name: 
// Module Name: add_XG_PON_header
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module accepts ethernet axis stream (32 bit)
//              adds preamble and delemeter for burst Tx/Rx
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module add_XG_PON_header(
    input axis_clk,
    input axis_reset,
    
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
    
    //get the positive edge of the start and align it to one clock cycle
    //-----------------Positive Edge Detector--------------------//
    reg axis_TVALID_in_next;
    wire axis_TVALID_in_posedge;
    always@(posedge axis_clk)
        axis_TVALID_in_next <= axis_TVALID_in; 
    assign axis_TVALID_in_posedge = axis_TVALID_in && (~axis_TVALID_in_next);
    //----------------------------------------------------------//

    //---------Signal Declarations-------------------------//
    reg en_out_next, stop;
    reg [31:0] count_reg, count_reg_next;
    
    reg [31:0] enable_till = 32'd4;
    reg en_count; 
    reg [31:0] tdata = 32'h00000000;
    reg tvalid = 1'b0;
    reg [3:0] tkeep = 4'd0;
    reg tuser = 1'b0;
    reg tlast = 1'b0;
    
    //-----------Configurable Enable at posedge-START-----------//
    always@(posedge axis_clk) begin
        if (axis_reset || stop) begin
            en_count<=0;
            count_reg<=32'd0;
        end else if (axis_TVALID_in_posedge) begin
            en_count<=1'b1;
            count_reg<=32'd1;
        end else begin
            en_count<=en_out_next;
            count_reg<=count_reg_next;
        end
    end
    
    
    always@(*) begin
        if (axis_reset) begin
            count_reg_next<=32'd0;
            en_out_next <=1'b0;
        end else if (en_count) begin
            count_reg_next <= count_reg + 1;
            en_out_next <=1'b1;
        end else begin
            count_reg_next <= count_reg;
            en_out_next <= en_count;
        end
        
        if (count_reg == enable_till)
            stop <= 1;
        else
            stop <= 0; 
            
        if (en_count && (count_reg<enable_till)) begin
            tdata <= 32'h05560556;
            tkeep <= 4'd15;
            tvalid <= 1'b1;
            tlast <= 1'b0;
            tuser <= 1'b0;
        end else if(en_count && (count_reg==enable_till)) begin
            tdata <= 32'hb2c50fa1;
            tkeep <= 4'd15;
            tvalid <= 1'b1;
            tlast <= 1'b0;
            tuser <= 1'b0;
        end else begin
            tdata <= 32'h00000000;
            tkeep <= 4'd0;
            tvalid <= 1'b0;
            tlast <= 1'b0;
            tuser <= 1'b0;            
        end
    end
    //-------------------------------------------------------------//
    
    /////////////////////////////////////////////////////////////////

    wire [31:0] axis_TDATA_delyd;
    wire axis_TVALID_delyd;
    wire [3:0] axis_TKEEP_delyd;
    wire axis_TLAST_delyd;
    wire axis_TUSER_delyd;
    wire axis_TREADY_delyd;
    //----------- variable delay line for AXIS ---//
    variableDelay variableDelay_inst (
      .A(4'b0011),      // input wire [3 : 0] A
      .D({axis_TDATA_in, axis_TVALID_in, axis_TKEEP_in, axis_TLAST_in, axis_TUSER_in}),      // input wire [37 : 0] D
      .CLK(axis_clk),  // input wire CLK
      .Q({axis_TDATA_delyd, axis_TVALID_delyd, axis_TKEEP_delyd, axis_TLAST_delyd, axis_TUSER_delyd})      // output wire [37 : 0] Q
    );

    wire [31:0] axis_TDATA;
    wire axis_TVALID;
    wire [3:0] axis_TKEEP;
    wire axis_TLAST;
    wire axis_TUSER;    
    assign axis_TDATA = en_count ? tdata : axis_TDATA_delyd;
    assign axis_TVALID = en_count ? tvalid : axis_TVALID_delyd;
    assign axis_TLAST = en_count ? tlast : axis_TLAST_delyd;
    assign axis_TKEEP = en_count ? tkeep : axis_TKEEP_delyd;
    assign axis_TUSER = en_count ? tuser : axis_TUSER_delyd;

    ////////////////////////////add fcs xgpon////////////////////////
    reg axis_TLAST_in_1clk_dely;
    always@(posedge axis_clk) begin
        axis_TLAST_in_1clk_dely<=axis_TLAST;
    end
    assign axis_TDATA_out = axis_TLAST_in_1clk_dely ? 32'haaaaaaaa : axis_TDATA;
    assign axis_TVALID_out = axis_TLAST_in_1clk_dely ? 1'b1 : axis_TVALID;
    assign axis_TLAST_out = axis_TLAST_in_1clk_dely;
    assign axis_TKEEP_out = axis_TLAST_in_1clk_dely ? 4'hf : axis_TKEEP;
    assign axis_TUSER_out = axis_TLAST_in_1clk_dely ? 1'b0 : axis_TUSER;
    

endmodule
