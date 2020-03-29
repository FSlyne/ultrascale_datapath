`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CONNECT
// Author: SANDIP DAS
// 
// Create Date: 21.03.2020 23:15:47
// Design Name: 
// Module Name: axis_fifo_rw_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module helps to gurrantee continous transfer of data over 10G
//				GTH interface in case of interfacing to the GT core with asynchronous clocks.
//				For example, if the tx userclk of gt-ultrascale core is faster than the
//				clk rate of the incoming data source, it generates control signal to buffer
//              sufficient data in the input fifo, then asserts fifo_read_enable to read
//				from the fifo as continous stream of data for the entire frame (till TLAST) 
//				
// Dependencies: This module should be interfaced with a axi-stream-fifo with programmable full
//				 threshold selected as the appropriate value (which should be determined by user).
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////


module axis_fifo_rw_control # (

  parameter FREQUENCY = 512

)(
	 input clk 
    ,input wire axis_in_TLAST
    ,input wire fifo_min_data_write_done 
    ,input wire GT_Tx_active
	
    ,output wire fifo_rd_enable 
);
    reg fifo_rd_en =1'b0;
    reg axis_in_TLAST_delayed =1'b0;
    wire axis_in_TLAST_posedge;

    always @(posedge clk) 
    begin
        axis_in_TLAST_delayed <= axis_in_TLAST;
    end
    assign axis_in_TLAST_posedge= axis_in_TLAST & ~axis_in_TLAST_delayed;
    
    assign fifo_rd_enable = (fifo_rd_en==1'b1);
    always @(posedge clk) 
    begin
        if(GT_Tx_active) begin
            if(fifo_min_data_write_done==1'b1) begin
                fifo_rd_en =1'b1;
            end
            if(axis_in_TLAST_posedge ==1'b1) begin
                fifo_rd_en =1'b0;
            end         
        end
    end
    
endmodule