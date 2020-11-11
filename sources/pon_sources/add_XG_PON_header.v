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
//              adds preamble and delemeter at the begining of the burst 
//				and a frame tail sequence at the end of the burst for burst Tx/Rx
//				over GTH-10G interface with raw transmission (no encoding)
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: configuration of the preamble and delimiter is fixed.
//						Preamble: length = 12byte, pattern = 0x05560556
//						Delimiter: length = 4byte, pattern = 0xB2C50FA1
// 			TODO: length and pattern of preamble and delimiter needs to
//				  reconfigurable through input or through parameter. This should 
//				  done in the future version.
//////////////////////////////////////////////////////////////////////////////////


module add_XG_PON_header(
    input axis_clk,
    input axis_reset,
    input enable,
    
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
    input wire axis_TREADY_in,
    input wire [31:0] preamble_duration,
    input wire [31:0] preamble_pattern,
    input wire [31:0] frtrail_pattern
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
    
    //reg [31:0] enable_till = 32'd4;
    reg en_count; 
    reg [31:0] tdata = 32'h00000000;
    reg tvalid = 1'b0;
    reg [3:0] tkeep = 4'd0;
    reg tuser = 1'b0;
    reg tlast = 1'b0;
    //reg scrambler_rst =1'b0;
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
        
        if (count_reg == preamble_duration)
            stop <= 1;
        else
            stop <= 0; 
            
        if (en_count && (count_reg<preamble_duration)) begin
            tdata <= preamble_pattern;
            tkeep <= 4'd15;
            tvalid <= 1'b1;
            tlast <= 1'b0;
            tuser <= 1'b0;
            //scrambler_rst<=1'b0;
        end else if(en_count && (count_reg==preamble_duration)) begin
            tdata <= 32'hb2c50fa1;
            tkeep <= 4'd15;
            tvalid <= 1'b1;
            tlast <= 1'b0;
            tuser <= 1'b0;
            //scrambler_rst<=1'b1;
        end else begin
            tdata <= 32'h00000000;
            tkeep <= 4'd0;
            tvalid <= 1'b0;
            tlast <= 1'b0;
            tuser <= 1'b0;
            //scrambler_rst<=1'b0;          
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
    wire [8:0] delay_amount; 
    assign delay_amount = preamble_duration[8:0]-1; // 1 clk cycle for scrambler
    //----------- variable delay line for AXIS ---//
    variableDelay variableDelay_inst (
      .A(delay_amount),      // input wire [3 : 0] A
      .D({axis_TDATA_in, axis_TVALID_in, axis_TKEEP_in, axis_TLAST_in, axis_TUSER_in}),      // input wire [37 : 0] D
      .CLK(axis_clk),  // input wire CLK
      .Q({axis_TDATA_delyd, axis_TVALID_delyd, axis_TKEEP_delyd, axis_TLAST_delyd, axis_TUSER_delyd})      // output wire [37 : 0] Q
    );

    /*wire [31:0] axis_TDATA_scrambled;
    scrambler scrambler_inst(
        .data_in(axis_TDATA_delyd)
        ,.scram_en(axis_TVALID_delyd)
        ,.scram_rst(scrambler_rst)
        ,.data_out(axis_TDATA_scrambled)
        ,.rst(axis_reset)
        ,.clk(axis_clk)
    );*/
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
    
    reg [31:0] axis_TDATA_L;
    reg axis_TVALID_L;
    reg [3:0] axis_TKEEP_L;
    reg axis_TLAST_L;
    reg axis_TUSER_L;    
    always@(*) begin
        axis_TVALID_L = axis_TVALID;
        axis_TKEEP_L = axis_TVALID ? axis_TKEEP : 4'h0;
        axis_TLAST_L = axis_TLAST;
        axis_TUSER_L = axis_TUSER;
        case (axis_TKEEP)
            4'b0000 : axis_TDATA_L = axis_TVALID ? axis_TDATA : 32'h00000000;
            4'b0001 : axis_TDATA_L = axis_TVALID ? (axis_TDATA & 32'h000000FF) : 32'h00000000;
            4'b0011 : axis_TDATA_L = axis_TVALID ? (axis_TDATA & 32'h0000FFFF) : 32'h00000000;
            4'b0111 : axis_TDATA_L = axis_TVALID ? (axis_TDATA & 32'h00FFFFFF) : 32'h00000000;
            4'b1111 : axis_TDATA_L = axis_TVALID ? (axis_TDATA & 32'hFFFFFFFF) : 32'h00000000;
            default : axis_TDATA_L = axis_TVALID ? axis_TDATA : 32'h00000000;
        endcase
    end
    
    reg axis_TLAST_in_1clk_dely;
    always@(posedge axis_clk) begin
        axis_TLAST_in_1clk_dely<=axis_TLAST_L;
    end
    
    //We are assigh the pattern 32'h82D6 F416 as the frame trailer sequence to determine the 
    //frame end. this sequence is based on the grey coding. However, we can also use the generic
    //sequence 32'haaaaaaaa. which has some probability of occurance in the frame.
    assign axis_TDATA_out = axis_TLAST_in_1clk_dely ? frtrail_pattern : axis_TDATA_L;
    assign axis_TVALID_out = axis_TLAST_in_1clk_dely ? 1'b1 : axis_TVALID_L;
    assign axis_TLAST_out = axis_TLAST_in_1clk_dely;
    assign axis_TKEEP_out = axis_TLAST_in_1clk_dely ? 4'hf : axis_TKEEP_L;
    assign axis_TUSER_out = axis_TLAST_in_1clk_dely ? 1'b0 : axis_TUSER_L;
    

endmodule
