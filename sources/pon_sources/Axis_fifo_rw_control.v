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