module axis_fifo_rw_control # (

  parameter FREQUENCY = 512

)(
	 input clk 
    ,input wire axis_in_TVALID
    ,input wire axis_in_TLAST
    ,input wire fifo_min_data_write_done 
    ,input wire GT_Tx_active
	
    ,output wire fifo_rd_enable 
);
    reg fifo_rd_en =1'b0;
    reg drain_fifo =1'b0;
    reg fifo_drained =1'b0;
    reg axis_in_TLAST_delayed =1'b0;
    wire axis_in_TLAST_posedge;
    reg [3:0] drain_fifo_cntr = 4'd0;
    always @(posedge clk) 
    begin
        axis_in_TLAST_delayed <= axis_in_TLAST;
    end
    assign axis_in_TLAST_posedge= axis_in_TLAST & ~axis_in_TLAST_delayed;
    
    assign fifo_rd_enable = (fifo_rd_en==1'b1)||(drain_fifo==1'b1);
    always @(posedge clk) 
    begin
        if(axis_in_TVALID && GT_Tx_active) begin
            if(fifo_min_data_write_done==1'b1) begin
                fifo_rd_en =1'b1;
            end
            
            if(fifo_drained ==1'b1) begin
                fifo_rd_en =1'b0;
            end
            
            if(axis_in_TLAST_posedge == 1'b1) begin
                drain_fifo =1'b1;
            end
            if(fifo_drained ==1'b1) begin
                drain_fifo =1'b0;
            end
        end
    end
    
    
    
    always @(posedge clk) begin
        if(drain_fifo ==1'b1) begin
            if(drain_fifo_cntr < 4'd14) begin
                drain_fifo_cntr = drain_fifo_cntr+1;
                fifo_drained = 1'b0;
            end else begin
                drain_fifo_cntr=4'd0;
                fifo_drained = 1'b1;
            end
        end else begin
            fifo_drained = 1'b0;
        end
    end

    
endmodule