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


module add_XgPON_header #(
    parameter [31:0]    MAX_PKT_LEN    = 32'd8192, //Max possible length of the packet ( = VALUE x 4 (byte))
    parameter [15:0]    MIN_IFG        = 16'd32,  //Min Inter-frame gap between packets ( = VALUE x 4 (byte))
    parameter [31:0]    START_ON_BUFF_OCCUP = 32'd10 //Start the framing after this many samples have been received on the buffer
)(
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
    
    //Place Every incoming frame into a Axis-Stream FIFO
    //-----------------AXI-Stream FIFO--------------------//
    wire m_axis_TVALID;
    wire m_axis_TREADY;
    wire [31 : 0] m_axis_TDATA;
    wire [3 : 0] m_axis_TKEEP;
    wire m_axis_TLAST;
    wire [0 : 0] m_axis_TUSER;
    wire [31 : 0] axis_data_count;
    wire [31 : 0] axis_wr_data_count;
    wire [31 : 0] axis_rd_data_count;
    /*axis_packet_fifo_0 eth_fr_temp_buffer (
        .s_axis_aresetn(~axis_reset)          // input wire s_axis_aresetn
        ,.s_axis_aclk(axis_clk)                // input wire s_axis_aclk
        ,.s_axis_tvalid(axis_TVALID_in)            // input wire s_axis_tvalid
        ,.s_axis_tready(axis_TREADY_out)            // output wire s_axis_tready
        ,.s_axis_tdata(axis_TDATA_in)              // input wire [31 : 0] s_axis_tdata
        ,.s_axis_tkeep(axis_TKEEP_in)              // input wire [3 : 0] s_axis_tkeep
        ,.s_axis_tlast(axis_TLAST_in)              // input wire s_axis_tlast
        ,.s_axis_tuser(axis_TUSER_in)              // input wire [0 : 0] s_axis_tuser
        ,.m_axis_tvalid(m_axis_TVALID)            // output wire m_axis_tvalid
        ,.m_axis_tready(m_axis_TREADY)            // input wire m_axis_tready
        ,.m_axis_tdata(m_axis_TDATA)              // output wire [31 : 0] m_axis_tdata
        ,.m_axis_tkeep(m_axis_TKEEP)              // output wire [3 : 0] m_axis_tkeep
        ,.m_axis_tlast(m_axis_TLAST)              // output wire m_axis_tlast
        ,.m_axis_tuser(m_axis_TUSER)              // output wire [0 : 0] m_axis_tuser
        ,.axis_data_count(axis_data_count)        // output wire [31 : 0] axis_data_count
        ,.axis_wr_data_count(axis_wr_data_count)  // output wire [31 : 0] axis_wr_data_count
        ,.axis_rd_data_count(axis_rd_data_count)  // output wire [31 : 0] axis_rd_data_count
    );*/
    
    wire axis_prog_full;
    eth_fr_temp_buff_0 eth_fr_temp_buffer (
      .s_aclk(axis_clk)                  // input wire s_aclk
      ,.s_aresetn(~axis_reset)            // input wire s_aresetn
      ,.s_axis_tvalid(axis_TVALID_in)            // input wire s_axis_tvalid
      ,.s_axis_tready(axis_TREADY_out)            // output wire s_axis_tready
      ,.s_axis_tdata(axis_TDATA_in)              // input wire [31 : 0] s_axis_tdata
      ,.s_axis_tkeep(axis_TKEEP_in)              // input wire [3 : 0] s_axis_tkeep
      ,.s_axis_tlast(axis_TLAST_in)              // input wire s_axis_tlast
      ,.s_axis_tuser(axis_TUSER_in)              // input wire [0 : 0] s_axis_tuser
      ,.m_axis_tvalid(m_axis_TVALID)            // output wire m_axis_tvalid
      ,.m_axis_tready(m_axis_TREADY)            // input wire m_axis_tready
      ,.m_axis_tdata(m_axis_TDATA)              // output wire [31 : 0] m_axis_tdata
      ,.m_axis_tkeep(m_axis_TKEEP)              // output wire [3 : 0] m_axis_tkeep
      ,.m_axis_tlast(m_axis_TLAST)              // output wire m_axis_tlast
      ,.m_axis_tuser(m_axis_TUSER)              // output wire [0 : 0] m_axis_tuser
      ,.axis_prog_full(axis_prog_full)  // output wire axis_prog_full
    );
    reg axis_TVALID_in_next;
    wire axis_TVALID_in_posedge;
    always@(posedge axis_clk)
        axis_TVALID_in_next <= axis_TVALID_in; 
    assign axis_TVALID_in_posedge = axis_TVALID_in && (~axis_TVALID_in_next);
    
    //----------------------------------------------------------//
    //--Generate-Preamble pattern Whenever the packet FIFO started to fill
    //--With Incoming DATA packet--//

    reg gem_read=1'b0;
    reg ploamu_done;
    //reg header_phase; // This is needed to tell burst that data is being sent
        
    reg [31:0]  freeRunCounter      = 32'h00000fff;
    reg [31:0]  freeRunCounterNext  = 32'h00000fff;
    reg         PRBS_Data_gen_enable_next = 1'b0;
        
    wire [31:0] GEM_data =32'd0;
    
    wire [31:0] preamble_gain_pattern ; //= 64'h0000ffff0000ffff; // Preamble pattern used for gain control // !!CHANGED FOR BURST TESTS!!
    wire [31:0] preamble_init_pattern ; // Initial Preamble patter for gain control is different
    //reg [7:0]  preamble_length      = 8'd64;        // the number of bytes in Preamble (I always assume 64 so this is unused it comes from PON protocol
    
    reg [15:0] trailer_repeat       = 16'h0003;
    reg [15:0] interframe_gap       = 16'h000A;        // Zeros sent after Frame
    wire [15:0] preamble_CDR_repeat;   // How many PRBS words should be included for CDR
    //reg [7:0] delimiter_length      = 8'd64;       // I assume 64 - PON allows others but not supported here
    reg [31:0] buffer_occupancy     = 32'hFFFFFFFF;
    reg        continue_burst       = 1'b0;
    reg [1:0] burst_profile         = 2'b00; //2'b10
    
    
    parameter [3:0] IDLE         =4'd0,
                    PREAMBLE_INIT=4'd1,
                    PREAMBLE_CDR =4'd3,
                    DELIMITER    =4'd4,
                    DATA         =4'd7,
                    TRAILER      =4'd8,
                    ENDFRAMING   =4'd9,
                    RESET        =4'd10,
                    IFG          =4'd11;
        // signals
        // TODO: add DBRU stuff
    reg         burst_now =1'b0; // SEND a burst now. Stop burst when this goes low
    reg         local_reset =1'b0;
    //reg         bypass_reset_scramble_next;     
    //reg         header_phase_next;
    reg         gem_read_next =1'b0;
    reg [3:0]   state=4'd0, state_next=4'd0;
    reg [15:0]  counter=16'h0000, counter_next=16'h0000;
    wire [31:0] delimiter_pattern;     // PSYNC delimiter pattern used to mark start of data
    reg [31:0] data_out=32'd0, data_out_next=32'd0;
    reg [0:0] tvalid_out=1'b0, tvalid_out_next=1'b0;
    reg [3:0] tkeep_out=4'd0, tkeep_out_next=4'd0;
    reg [0:0] tlast_out=1'b0, tlast_out_next=1'b0;
    reg [0:0] tuser_out=1'b0, tuser_out_next=1'b0;
    
    
    assign delimiter_pattern = 32'hB2C50FA1;
    assign preamble_init_pattern = preamble_pattern;
    //assign preamble_gain_pattern = preambleWord;
    assign preamble_CDR_repeat = preamble_duration[15:0];
    assign m_axis_TREADY = gem_read;
    //assign GEM_data = PRBSdata;
    
    
    //get the positive edge of the start and align it to one clock cycle
    //-----------------Positive Edge Detector--------------------//
    /*reg start_next;
    always@(posedge axis_clk)
        start_next<=PRBS_Data_gen_enable; 
    assign start_posedge = PRBS_Data_gen_enable&&(~start_next);*/
    //----------------------------------------------------------//    
    
    always@(posedge axis_clk) begin
        if (axis_reset) begin
            data_out    <= 32'b0;
            tvalid_out  <= 1'b0;
            tkeep_out   <= 4'd0;
            tlast_out   <= 1'b0;
            tuser_out   <= 1'b0;
            gem_read    <= 1'b0;
            state       <= IDLE;
            counter     <= 16'b0;
            //bypass_reset_scramble<=1'b0;
            ploamu_done <=1'b0;
            //header_phase<=1'b0;
            freeRunCounter<= 32'h00000000;
        end else begin    
            data_out    <= data_out_next;
            tvalid_out  <= tvalid_out_next;
            tkeep_out   <= tkeep_out_next;
            tlast_out   <= tlast_out_next;
            tuser_out   <= tuser_out_next;
            gem_read    <= gem_read_next;
            state       <= state_next;
            counter     <= counter_next;
            //bypass_reset_scramble<=bypass_reset_scramble_next;
            //header_phase<=header_phase_next;
            freeRunCounter<=freeRunCounterNext;
        end
    end
    
    
    always@(
        freeRunCounterNext,
        freeRunCounter,
        enable      
    ) begin
        if (enable) begin
            if (freeRunCounter == MAX_PKT_LEN-1)
                freeRunCounterNext <= 32'h00000000;
            else
                freeRunCounterNext <= freeRunCounter +1;
            end
        else
                freeRunCounterNext <= 32'h00000000;    
        end
        
    always@(posedge axis_clk) begin
        if (axis_prog_full) 
            burst_now <= 1'b1;
        else 
            burst_now <= 1'b0; 
        end
    
         
    // create data_out
    always@(
        burst_now,
        state,
        counter,
        preamble_init_pattern,
        preamble_pattern,
        frtrail_pattern,
        m_axis_TVALID,
        m_axis_TKEEP,
        m_axis_TLAST,
        m_axis_TUSER,
        //preamble_gain_pattern,
        trailer_repeat,
        preamble_CDR_repeat,
        delimiter_pattern
        //GEM_data
        //bypass_reset_scramble,
        //header_phase,
    )begin
        data_out_next       = 32'h0;
        gem_read_next       = 1'b0;
        state_next          = state;
        counter_next        = 16'b0;
        // check to see if it is our time to transmit
        case (state)
            IDLE:
                begin
                    //bypass_reset_scramble_next = disable_idle_scramble;
                    if (burst_now) begin
                        data_out_next = 32'h0;
                        tvalid_out_next  = 1'b0;
                        tkeep_out_next   = 4'd0;
                        tlast_out_next   = 1'b0;
                        tuser_out_next   = 1'b0;
                        state_next = PREAMBLE_CDR;
                        //header_phase_next=1'b1;
                    end else begin
                        data_out_next = 32'h0;
                        tvalid_out_next  = 1'b0;
                        tkeep_out_next   = 4'd0;
                        tlast_out_next   = 1'b0;
                        tuser_out_next   = 1'b0;
                        state_next = IDLE;
                    end
                end
                                
            PREAMBLE_INIT:
                begin
                    counter_next = counter+1;
                    data_out_next = preamble_init_pattern;
                    tvalid_out_next  = 1'b1;
                    tkeep_out_next   = 4'hf;
                    tlast_out_next   = 1'b0;
                    tuser_out_next   = 1'b0;
                    //bypass_reset_scramble_next=1'b1;
                    /*if (counter >= preamble_repeat-6 && counter <= preamble_repeat-1) begin
                        gem_read_next = 1'b1; //this condition is created to sync the data incoming from  gty ex stimulus raw  delete when you re doing something else
                    end
                    if (counter == preamble_repeat-1) begin
                        counter_next = 16'b0;
                        state_next = DELIMITER;//!!CHANGED FOR BURST TESTS!! PREAMBLE_CDR; 
                    end*/
                end                
            PREAMBLE_CDR:
                begin
                    counter_next = counter+1;
                    data_out_next = preamble_pattern;
                    tvalid_out_next  = 1'b1;
                    tkeep_out_next   = 4'hf;
                    tlast_out_next   = 1'b0;
                    tuser_out_next   = 1'b0;
                    //bypass_reset_scramble_next=1'b0;
                    if(counter <= preamble_CDR_repeat-1) begin // This is an experimental change to see if I can reduce overhead after registration.
                        state_next = PREAMBLE_CDR; // add another prreamble
                        //header_phase_next=1'b0;
                    end else begin
                        state_next = DELIMITER;  // goto add delimiter
                        counter_next = 16'b0;
                    end
                end
                        
            DELIMITER:
                begin
                    data_out_next = delimiter_pattern;
                    tvalid_out_next  = 1'b1;
                    tkeep_out_next   = 4'hf;
                    tlast_out_next   = 1'b0;
                    tuser_out_next   = 1'b0;
                    //bypass_reset_scramble_next=1'b1;
                    state_next = DATA;  //XGTC_HEAD; // !!CHANGED FOR BURST TESTS!!
                    gem_read_next=1'b1;// !!CHANGED FOR BURST TESTS!!
                    counter_next = 16'b0;
                end
                                
            DATA:
                begin
                    counter_next = counter+1;
                    //bypass_reset_scramble_next=1'b0;
                    tvalid_out_next  = m_axis_TVALID;
                    tkeep_out_next   = m_axis_TKEEP;
                    tlast_out_next   = 0;
                    tuser_out_next   = m_axis_TUSER;
                    gem_read_next=1'b1;
                    if (m_axis_TLAST) begin // Finish this burst
                        case (m_axis_TKEEP)
                            4'b0000 : data_out_next = 32'h00000000;
                            4'b0001 : data_out_next = m_axis_TDATA & 32'h000000FF;
                            4'b0011 : data_out_next = m_axis_TDATA & 32'h0000FFFF;
                            4'b0111 : data_out_next = m_axis_TDATA & 32'h00FFFFFF;
                            4'b1111 : data_out_next = m_axis_TDATA & 32'hFFFFFFFF;
                            default : data_out_next = m_axis_TDATA;
                        endcase
                        state_next = TRAILER;
                        gem_read_next=1'b0;
                        counter_next = 16'b0;
                    end else begin //Continue the burst: keep reading the fifo buffer
                        data_out_next = m_axis_TDATA;
                        gem_read_next=1'b1;
                        state_next = DATA; 
                    end
                end
                
            TRAILER:
                begin
                    counter_next = counter+1;
                    //bypass_reset_scramble_next=1'b0;
                    //state_next = IDLE; //IFG;// !!CHANGED FOR BURST TESTS!!
                    data_out_next=frtrail_pattern;
                    tvalid_out_next  <= 1'b1;
                    tkeep_out_next   <= 4'hf;
                    tlast_out_next   <= 1'b0;
                    tuser_out_next   <= 1'b0;

                    if (counter == trailer_repeat-1) begin
                        counter_next = 16'b0;
                        tlast_out_next   <= 1'b1;
                        state_next = IFG;//!!CHANGED FOR BURST TESTS!! PREAMBLE_CDR; 
                    end
                end               
                
            IFG:
                begin
                    counter_next = counter+1;
                    data_out_next = 32'b0;
                    tvalid_out_next  <= 1'b0;
                    tkeep_out_next   <= 4'h0;
                    tlast_out_next   <= 1'b0;
                    tuser_out_next   <= 1'b0;

                    //bypass_reset_scramble_next=1'b1;
                    if (counter == interframe_gap) begin
                        counter_next = 16'b0;
                        state_next = IDLE;
                    end
                end

            default:
                begin
                    //bypass_reset_scramble_next=1'b1;
                    data_out_next = 32'b0;
                    //ploamu_read_next = 1'b0;
                    gem_read_next = 1'b0;
                    state_next = IDLE;
                end

        endcase
        
    end
    
    assign axis_TDATA_out = data_out;
    assign axis_TVALID_out = tvalid_out;
    assign axis_TKEEP_out = tkeep_out;
    assign axis_TLAST_out = tlast_out;
    assign axis_TUSER_out = tuser_out;
    /*assign PRBS_Data_gen_enable = gem_read;
    assign state_out = state;*/

endmodule
