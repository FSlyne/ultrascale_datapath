``timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CONNECT
// Author: SANDIP DAS
// 
// Create Date: 21.03.2020 23:15:47
// Design Name: 
// Module Name: axis_ms_slv_loopback
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module is just a wrapper over the axi-stream-fifo.
//				: redundant module. need to be removed later
//				
// Dependencies: 
//				 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: TODO: the module name needs to be changed in the next revision
//////////////////////////////////////////////////////////////////////////////////


module axis_ms_slv_loopback(

    input             axis_tx_clk             ,
    input             axis_rx_clk             ,
    input             axis_resetn          , //active low reset input

    input             slvlb_en_l2_addr_swap, // inputs to control the swap of first 12 bytes 
                                             // in the received ethernet frame.
    output            mtrlb_activity_flash , 

    input      [31:0] s_axis_slvlb_d_tdata , 
    input      [ 3:0] s_axis_slvlb_d_tkeep , 
    input             s_axis_slvlb_d_tvalid, 
    input             s_axis_slvlb_d_tlast ,
    input             s_axis_slvlb_d_tuser ,
    output wire        s_axis_slvlb_d_tready, 

    output wire [31:0] m_axis_slvlb_d_tdata , 
    output wire [ 3:0] m_axis_slvlb_d_tkeep , 
    output wire        m_axis_slvlb_d_tvalid, 
    output wire        m_axis_slvlb_d_tlast ,
    output wire        m_axis_slvlb_d_tuser ,
    input  wire        m_axis_slvlb_d_tready

);

wire [37:0] fdi, fdo;
wire wre, rde, fifof, fifoe; // write enable, read enable, fifo full, and fifo empty signals

reg        en_rx_on_saxis = 1, en_tx_on_maxis = 0;
reg        rde_q, wre_q;
reg  [15:0] frame_activity_count;
reg [63:0] ptp_cmd = 64'hFDEC_DBCA_7564_0001;

//assign fifo wirte, read enable and fifo data input signals

assign mtrlb_activity_flash = frame_activity_count[13];



////count the number of frames that is received in the fifo.
//always @(posedge axis_rx_clk) begin
//    if (!axis_resetn) begin
//        frame_activity_count <= 0;
//    end else begin
//        frame_activity_count <= (s_axis_slvlb_d_tlast) ? (frame_activity_count + 1) : frame_activity_count;
//    end
//end

//// assign read and write control in axis Slave and master port.
//always @(posedge axis_rx_clk) begin
//    if (axis_resetn == 0) begin
//        en_rx_on_saxis <= 1;
//        wre_q <= 0;
//    end else begin
//        wre_q <= wre;
//        en_rx_on_saxis <= ((tx_cnt == 0 && !en_tx_on_maxis) ? 1 : ((rx_cnt == 0) ? 0 : en_rx_on_saxis));
//    end
//end

//always @(posedge axis_tx_clk) begin
//    if (axis_resetn == 0) begin
//        en_tx_on_maxis <= 0;
//        rde_q <= 0;
//    end else begin
//        rde_q <= rde;
//        en_tx_on_maxis <= ((rx_cnt == 2) && wre_q) ? 1 : (((tx_cnt == 1) && rde_q) ? 0 : en_tx_on_maxis);
//    end
//end

//// use read and write control signal assigned above to assign S_axis_TREADY and M_axis_TREADY.
//// perform the swap of first six bytes with next six bytes (12 byte scr dest address swap)
//reg m_axis_slvlb_d_tlast_reg;
//always @ (posedge axis_tx_clk) begin
//    m_axis_slvlb_d_tkeep  = fdo[3:0];
//    m_axis_slvlb_d_tlast_reg  = fdo[36];
//    m_axis_slvlb_d_tuser  = fdo[37];
//    case (tx_cnt)
//        0       : m_axis_slvlb_d_tvalid = en_tx_on_maxis;
//        default : m_axis_slvlb_d_tvalid = !fifoe || fdo[36];
//    endcase
// end
//    //get the positive edge of the start and align it to one clock cycle
//    //-----------------Positive Edge Detector--------------------//
//    reg m_axis_slvlb_d_tlast_reg_next;
//    wire m_axis_slvlb_d_tlast_reg;
//    always@(posedge axis_tx_clk)
//        m_axis_slvlb_d_tlast_reg_next<=m_axis_slvlb_d_tlast_reg; 
//    assign m_axis_slvlb_d_tlast = m_axis_slvlb_d_tlast_reg&&(~m_axis_slvlb_d_tlast_reg_next);
//     //----------------------------------------------------------//
   
//always @ (*) begin
    
//    case (tx_cnt)
//        0 : begin
//            m_axis_slvlb_d_tdata[ 7: 0] = (slvlb_en_l2_addr_swap) ? rx_srcbyte1 : fdo[11: 4];
//            m_axis_slvlb_d_tdata[15: 8] = (slvlb_en_l2_addr_swap) ? rx_srcbyte2 : fdo[19:12];
//            m_axis_slvlb_d_tdata[23:16] = (slvlb_en_l2_addr_swap) ? rx_srcbyte3 : fdo[27:20];
//            m_axis_slvlb_d_tdata[31:24] = (slvlb_en_l2_addr_swap) ? rx_srcbyte4 : fdo[35:28];
//        end
//        1 : begin
//            m_axis_slvlb_d_tdata[ 7: 0] = (slvlb_en_l2_addr_swap) ? rx_srcbyte5 : fdo[11: 4];
//            m_axis_slvlb_d_tdata[15: 8] = (slvlb_en_l2_addr_swap) ? rx_srcbyte6 : fdo[19:12];
//            m_axis_slvlb_d_tdata[23:16] = (slvlb_en_l2_addr_swap) ? rx_dstbyte1 : fdo[27:20];
//            m_axis_slvlb_d_tdata[31:24] = (slvlb_en_l2_addr_swap) ? rx_dstbyte2 : fdo[35:28];
//        end
//        2 : begin
//            m_axis_slvlb_d_tdata[ 7: 0] = (slvlb_en_l2_addr_swap) ? rx_dstbyte3 : fdo[11: 4];
//            m_axis_slvlb_d_tdata[15: 8] = (slvlb_en_l2_addr_swap) ? rx_dstbyte4 : fdo[19:12];
//            m_axis_slvlb_d_tdata[23:16] = (slvlb_en_l2_addr_swap) ? rx_dstbyte5 : fdo[27:20];
//            m_axis_slvlb_d_tdata[31:24] = (slvlb_en_l2_addr_swap) ? rx_dstbyte6 : fdo[35:28];
//        end
//        3: begin
//            m_axis_slvlb_d_tdata = fdo[35:4];
//        end
//        4: begin
//            m_axis_slvlb_d_tdata = fdo[35:4];
//        end
//        default : begin
//            m_axis_slvlb_d_tdata = fdo[35:4];
//        end
//    endcase
//end

////Intermediate storage of first 12 bytes in source and destination bytes register so that it can be used
//// in the byte swapping process above
//always @(posedge axis_rx_clk) begin
//    if (axis_resetn == 0) begin
//        rx_cnt <= 0;
//        rx_srcbyte6 <= 0; rx_srcbyte5 <= 0; rx_srcbyte4 <= 0; rx_srcbyte3 <= 0; rx_srcbyte2 <= 0; rx_srcbyte1 <= 0;
//        rx_dstbyte6 <= 0; rx_dstbyte5 <= 0; rx_dstbyte4 <= 0; rx_dstbyte3 <= 0; rx_dstbyte2 <= 0; rx_dstbyte1 <= 0;
//    end else begin
//        rx_cnt <= (wre) ? (s_axis_slvlb_d_tlast ? 0 : ((rx_cnt > 2) ? 3 : (rx_cnt + 1))) : rx_cnt;
//        rx_dstbyte1 <= ((rx_cnt == 0) && wre) ? s_axis_slvlb_d_tdata[ 7: 0] : rx_dstbyte1;
//        rx_dstbyte2 <= ((rx_cnt == 0) && wre) ? s_axis_slvlb_d_tdata[15: 8] : rx_dstbyte2;
//        rx_dstbyte3 <= ((rx_cnt == 0) && wre) ? s_axis_slvlb_d_tdata[23:16] : rx_dstbyte3;
//        rx_dstbyte4 <= ((rx_cnt == 0) && wre) ? s_axis_slvlb_d_tdata[31:24] : rx_dstbyte4;
//        rx_dstbyte5 <= ((rx_cnt == 1) && wre) ? s_axis_slvlb_d_tdata[ 7: 0] : rx_dstbyte5;
//        rx_dstbyte6 <= ((rx_cnt == 1) && wre) ? s_axis_slvlb_d_tdata[15: 8] : rx_dstbyte6;
//        rx_srcbyte1 <= ((rx_cnt == 1) && wre) ? s_axis_slvlb_d_tdata[23:16] : rx_srcbyte1;
//        rx_srcbyte2 <= ((rx_cnt == 1) && wre) ? s_axis_slvlb_d_tdata[31:24] : rx_srcbyte2;
//        rx_srcbyte3 <= ((rx_cnt == 2) && wre) ? s_axis_slvlb_d_tdata[ 7: 0] : rx_srcbyte3;
//        rx_srcbyte4 <= ((rx_cnt == 2) && wre) ? s_axis_slvlb_d_tdata[15: 8] : rx_srcbyte4;
//        rx_srcbyte5 <= ((rx_cnt == 2) && wre) ? s_axis_slvlb_d_tdata[23:16] : rx_srcbyte5;
//        rx_srcbyte6 <= ((rx_cnt == 2) && wre) ? s_axis_slvlb_d_tdata[31:24] : rx_srcbyte6;
//    end
//end

//always @(posedge axis_tx_clk) begin
//    if (axis_resetn == 0) begin
//        tx_cnt <= 0;
//    end else begin
//        tx_cnt <= (rde) ? (m_axis_slvlb_d_tlast_reg ? 0 : ((tx_cnt > 2) ? 3 : (tx_cnt + 1))) : tx_cnt;
//    end
//end
//connection declaration of the loopback fifo.
axis_master_slave_lb_fifo lb_fifo_inst (
  .m_aclk(axis_tx_clk),                    // input wire m_aclk
  .s_aclk(axis_rx_clk),                    // input wire s_aclk
  .s_aresetn(axis_resetn),              // input wire s_aresetn
  .s_axis_tvalid(s_axis_slvlb_d_tvalid),      // input wire s_axis_tvalid
  .s_axis_tready(s_axis_slvlb_d_tready),      // output wire s_axis_tready
  .s_axis_tdata(s_axis_slvlb_d_tdata),        // input wire [31 : 0] s_axis_tdata
  .s_axis_tkeep(s_axis_slvlb_d_tkeep),        // input wire [3 : 0] s_axis_tkeep
  .s_axis_tlast(s_axis_slvlb_d_tlast),        // input wire s_axis_tlast
  .s_axis_tuser(s_axis_slvlb_d_tuser),        // input wire [0 : 0] s_axis_tuser
  .m_axis_tvalid(m_axis_slvlb_d_tvalid),      // output wire m_axis_tvalid
  .m_axis_tready(m_axis_slvlb_d_tready),      // input wire m_axis_tready
  .m_axis_tdata(m_axis_slvlb_d_tdata),        // output wire [31 : 0] m_axis_tdata
  .m_axis_tkeep(m_axis_slvlb_d_tkeep),        // output wire [3 : 0] m_axis_tkeep
  .m_axis_tlast(m_axis_slvlb_d_tlast),        // output wire m_axis_tlast
  .m_axis_tuser(m_axis_slvlb_d_tuser),        // output wire [0 : 0] m_axis_tuser
  .axis_prog_full(fifof),    // output wire axis_prog_full
  .axis_prog_empty(fifoe)  // output wire axis_prog_empty
);
endmodule 

