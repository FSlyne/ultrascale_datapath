`timescale 1ns / 1ps

module config_enable(
    input wire clk_in,
    input wire reset_in,
    
    input wire start, //pulse
    input wire stop, //stop pulse
    input wire [31:0] enable_till, //enable till this count or at stop pulse
    output wire enable_out //config enable output 
);

//instantiation template:
//--begin cut and paste from here
//config_enable Your_instantce_name(
//    .clk_in(clk_in)             //input wire clk_in
//    ,.reset_in(reset_in)        //input wire reset_in
//    ,.start(start)              //input wire start
//    ,.stop(stop)                //input wire stop
//    ,.enable_till(enable_till)  //input wire [31:0] enable_till
//    ,.enable_out(enable_out)    //input wire enable_out
//);

//--End of instantiation template

     //---------Signal Declarations-------------------------//
    reg en_out_next;
    reg [31:0] count_reg, count_reg_next;
    
    reg en_count; 
    reg stop_reg;
    //-----------Configurable Enable at posedge-START-----------//
    always@(posedge clk_in) begin
        if (reset_in || stop_reg) begin
            en_count<=0;
            count_reg<=32'd0;
        end else if (start) begin
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
        
        if (count_reg == enable_till || stop)
            stop_reg <= 1;
        else
            stop_reg <= 0; 
    end
    //-------------------------------------------------------------//
    assign enable_out = en_count;
    
endmodule
