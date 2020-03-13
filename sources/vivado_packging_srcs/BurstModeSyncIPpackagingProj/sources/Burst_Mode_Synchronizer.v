`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:   Tyndall National Institute
// Engineer:  Dr. Nicola Brandonisio
// 
// Create Date: 02/23/2015 06:05:59 PM
// Design Name: 
// Module Name: Burst_Mode_Synchronizer
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

//--------------------------------------------------------------------------------
// Main Module
//--------------------------------------------------------------------------------
module Burst_Mode_Synchronizer# (
  parameter [3:0]   DATA_OFFSET = 8'b00000000
)(
    in_data,
    in_syncword,
    in_threshold,
    ready,
    in_enable,
    in_reset,
    in_clock,
    out_data,
    out_detected,
    output_valid,
    out_data_double_buffer,
    out_threshold_comparator);
    
// NOTE:
// 1) in_enable    --> Enable threshold comparator and shift update. Otherwise keep previous shift.
// 2) in_reset     --> Reset to zero data shift. When it is set to 1, in_enable is ignored.
// 3) out_detected --> It is set to 1 when syncword is detected. It is updated every clock cycle.  

//----------------------------------------
// Inputs
//----------------------------------------
input [31:0]            in_data;
input [31:0]            in_syncword;
input [6:0]             in_threshold;
output                  ready; //axis control port added by sandip
input                   in_enable;
input                   in_reset;
input                   in_clock;

//----------------------------------------
// Outputs
//----------------------------------------
output [31:0]           out_data;
output                  out_detected;
output                  output_valid;
output [63:0]          out_data_double_buffer;
output [6:0]            out_threshold_comparator;

//--------------------------------------------------------------------------------
// Registers And Wires
//--------------------------------------------------------------------------------   

//----------------------------------------
// Variables
//----------------------------------------
integer                 idx_mux;

//----------------------------------------
// Registers
//----------------------------------------
reg [63:0]              data_double_buffer = 64'd0;
reg [63:0]              data_double_buffer_delayed [9:0];
reg [0:0]               in_enable_delayed [6:0];
reg [31:0]              output_shifts [31:0];
reg [31:0]              absolute_differences [31:0];
reg [4:0]               bit_adder_stage_one [31:0][1:0];
reg [5:0]               bit_adder_stage_two [31:0][1:0];
reg [6:0]               sum_absolute_differences [31:0];
reg [6:0]               min_sad_value [30:0];
reg [5:0]               min_sad_shift [30:0];
reg [5:0]               minimum_sad_shift  = 7'd0;
reg [31:0]              out_data           = 32'd0;
reg                     out_detected       = 1'b0;
reg                     output_valid;
reg                     ready = 1'b0;
//----------------------------------------
// Wires
//----------------------------------------
wire [63:0]             out_data_double_buffer;
wire [6:0]              out_threshold_comparator;

wire rst;
 (* DONT_TOUCH = "TRUE" *)
  reset_sync reset_sync_inst (
    .clk_in  (in_clock),
    .rst_in  (in_reset),
    .rst_out (rst)
  );

genvar data_outvalid_delay_idx;
  generate
      for (data_outvalid_delay_idx = 1; data_outvalid_delay_idx < 10; data_outvalid_delay_idx = data_outvalid_delay_idx + 1) begin : fifo_buffer_0
          always @(posedge in_clock) begin
              in_enable_delayed[data_outvalid_delay_idx] <= in_enable_delayed[data_outvalid_delay_idx-1];
          end
      end
  endgenerate
  always @(posedge in_clock) begin
    in_enable_delayed[0]<=in_enable;
    output_valid<=in_enable_delayed[6];
  end
//--------------------------------------------------------------------------------
// Processes
//--------------------------------------------------------------------------------

//----------------------------------------
// Data Double Buffer
//----------------------------------------
    
always @(posedge in_clock) begin
    // Data buffer  
//    data_double_buffer[63:0]      <= in_data[63:0];               // VC709 GTH 
//    data_double_buffer[126:64]    <= data_double_buffer[62:0];    // VC709 GTH

    data_double_buffer[63:32]      <= in_data[31:0];               // VC709 GTH 
    data_double_buffer[31:0]    <= data_double_buffer[63:32];    // VC709 GTH 

//      data_double_buffer[0:0]      <= data_double_buffer[64:64];    // VCU108 GTY
//      data_double_buffer[64:1]     <= in_data[63:0];                // VCU108 GTY
//      data_double_buffer[127:65]   <= data_double_buffer[62:0];     // VCU108 GTY
    // Delayed data buffer (first element)
    data_double_buffer_delayed[0] <= data_double_buffer;
end

//----------------------------------------
// Calibrated-delay Data FIFO buffer
//----------------------------------------
genvar idx_delay;
generate
    for (idx_delay = 1; idx_delay < 10; idx_delay = idx_delay + 1) begin : fifo_buffer
        always @(posedge in_clock) begin
            data_double_buffer_delayed[idx_delay] <= data_double_buffer_delayed[idx_delay-1];
        end
    end
endgenerate

//----------------------------------------
// Absolute Differences
//----------------------------------------

// Compute absolute difference for all possible 32 shifts of 1 bit (shifted input data) 
genvar idx_diff;
generate
    for (idx_diff = 0; idx_diff < 32; idx_diff = idx_diff + 1) begin : sad_subtractor
        always @(posedge in_clock) begin
            absolute_differences[idx_diff] = in_syncword ^ data_double_buffer[31+idx_diff : idx_diff];
        end
    end
endgenerate

//----------------------------------------
// Sum of Absolute Differences (SAD)
//----------------------------------------

// Compute bit summation for all possible 64 shifts of 1 bit
genvar idx_sum;
generate
    for (idx_sum = 0; idx_sum < 32; idx_sum = idx_sum + 1) begin : sad_adder
       always @(posedge in_clock) begin
            // First Adder at Stage 1
            bit_adder_stage_one[idx_sum][0]    <= absolute_differences[idx_sum][0]  + absolute_differences[idx_sum][1] +  
                                                  absolute_differences[idx_sum][2]  + absolute_differences[idx_sum][3] + 
                                                  absolute_differences[idx_sum][4]  + absolute_differences[idx_sum][5] + 
                                                  absolute_differences[idx_sum][6]  + absolute_differences[idx_sum][7] + 
                                                  absolute_differences[idx_sum][8]  + absolute_differences[idx_sum][9] + 
                                                  absolute_differences[idx_sum][10] + absolute_differences[idx_sum][11] +
                                                  absolute_differences[idx_sum][12] + absolute_differences[idx_sum][13] +
                                                  absolute_differences[idx_sum][14] + absolute_differences[idx_sum][15];
            // Second Adder at Stage 1                                
            bit_adder_stage_one[idx_sum][1]    <= absolute_differences[idx_sum][16] + absolute_differences[idx_sum][17] + 
                                                  absolute_differences[idx_sum][18] + absolute_differences[idx_sum][19] + 
                                                  absolute_differences[idx_sum][20] + absolute_differences[idx_sum][21] + 
                                                  absolute_differences[idx_sum][22] + absolute_differences[idx_sum][23] + 
                                                  absolute_differences[idx_sum][24] + absolute_differences[idx_sum][25] + 
                                                  absolute_differences[idx_sum][26] + absolute_differences[idx_sum][27] + 
                                                  absolute_differences[idx_sum][28] + absolute_differences[idx_sum][29] + 
                                                  absolute_differences[idx_sum][30] + absolute_differences[idx_sum][31];
            // 1 Final Adder
            sum_absolute_differences[idx_sum]  <= bit_adder_stage_one[idx_sum][0] + bit_adder_stage_one[idx_sum][1];
        end
    end
endgenerate

//----------------------------------------
// Minimum Finder
//----------------------------------------

// Compute minimum of SAD for all 64 shifts of 1 bit
genvar idx_finder;
generate
    // Stage 1: 16 comparators
    for (idx_finder = 0; idx_finder < 16; idx_finder = idx_finder + 1) begin : min_finder_stage1
        always @(posedge in_clock) begin
            if(sum_absolute_differences[2*idx_finder] < sum_absolute_differences[2*idx_finder+1]) begin
                // SAD value
                min_sad_value[idx_finder]     <= sum_absolute_differences[2*idx_finder];
                // Associated Shift
                min_sad_shift[idx_finder]     <= 2*idx_finder;
            end else begin
                // SAD value
                min_sad_value[idx_finder]     <= sum_absolute_differences[2*idx_finder+1];
                // Associated Shift
                min_sad_shift[idx_finder]     <= 2*idx_finder+1;
            end
        end
    end
    // Stage 2: 8 comparators
    for (idx_finder = 0; idx_finder < 8; idx_finder = idx_finder + 1) begin : min_finder_stage2
        always @(posedge in_clock) begin
            if(min_sad_value[2*idx_finder] < min_sad_value[2*idx_finder+1]) begin
                // SAD value
                min_sad_value[16+idx_finder]  <= min_sad_value[2*idx_finder];
                // Associated Shift
                min_sad_shift[16+idx_finder]  <= min_sad_shift[2*idx_finder];
            end else begin
                // SAD value
                min_sad_value[16+idx_finder]  <= min_sad_value[2*idx_finder+1];
                // Associated Shift
                min_sad_shift[16+idx_finder]  <= min_sad_shift[2*idx_finder+1];
            end
        end
    end
    // Stage 3: 4 comparators
    for (idx_finder = 0; idx_finder < 4; idx_finder = idx_finder + 1) begin : min_finder_stage3
        always @(posedge in_clock) begin
            if(min_sad_value[16+2*idx_finder] < min_sad_value[16+2*idx_finder+1]) begin
                // SAD value
                min_sad_value[24+idx_finder]  <= min_sad_value[16+2*idx_finder];
                // Associated Shift
                min_sad_shift[24+idx_finder]  <= min_sad_shift[16+2*idx_finder];
            end else begin
                // SAD value
                min_sad_value[24+idx_finder]  <= min_sad_value[16+2*idx_finder+1];
                // Associated Shift
                min_sad_shift[24+idx_finder]  <= min_sad_shift[16+2*idx_finder+1];
            end
        end
    end
    // Stage 4: 2 comparators
    for (idx_finder = 0; idx_finder < 2; idx_finder = idx_finder + 1) begin : min_finder_stage4
        always @(posedge in_clock) begin
            if(min_sad_value[24+2*idx_finder] < min_sad_value[24+2*idx_finder+1]) begin
                // SAD value
                min_sad_value[28+idx_finder]  <= min_sad_value[24+2*idx_finder];
                // Associated Shift
                min_sad_shift[28+idx_finder]  <= min_sad_shift[24+2*idx_finder];
            end else begin
                // SAD value
                min_sad_value[28+idx_finder]  <= min_sad_value[24+2*idx_finder+1];
                // Associated Shift
                min_sad_shift[28+idx_finder]  <= min_sad_shift[24+2*idx_finder+1];
            end
        end
    end    
     
    // Stage 6: 1 final comparator
    always @(posedge in_clock) begin
        if(min_sad_value[28] < min_sad_value[29]) begin
            // SAD value
            min_sad_value[30]                 <= min_sad_value[28];
            // Associated Shift
            min_sad_shift[30]                 <= min_sad_shift[28];
        end else begin
            // SAD value
            min_sad_value[30]                 <= min_sad_value[29];
            // Associated Shift
            min_sad_shift[30]                 <= min_sad_shift[29];
        end
    end
endgenerate

//----------------------------------------
// Threshold Comparator
//----------------------------------------

// Update shift associated with minimum SAD value
always @(posedge in_clock) begin
    if(rst == 1'b0) begin
        if(in_enable == 1'b1) begin
            // Enable threshold comparator and shift update
            if(min_sad_value[30] <= in_threshold) begin 
                // New shift associated with minimum SAD
                minimum_sad_shift <= min_sad_shift[30];  
                out_detected      <= 1'b1;
            end else begin
                // Keep previous shift
                minimum_sad_shift <= minimum_sad_shift;
                out_detected      <= 1'b0;
            end
        end else begin
            // Keep previous shift when comparator is not enabled
            minimum_sad_shift     <= minimum_sad_shift;
            if(min_sad_value[30] <= in_threshold)
               out_detected          <= 1'b1;
            else
               out_detected          <= 1'b0;   
        end
        ready <=1'b0;
    end else begin
        // Reset shift to zero
        minimum_sad_shift         <= 6'd0;
        out_detected              <= 1'b0;
    end
    ready <=1'b1;
end

//----------------------------------------
// Data Shifter
//----------------------------------------

// Store all possible 32 shifts of 1 bit (shifted delayed input data) 
genvar idx_shift;
generate
    for (idx_shift = 0; idx_shift < 32; idx_shift = idx_shift + 1) begin : data_shifter
        always @(posedge in_clock) begin
            output_shifts[idx_shift] = data_double_buffer_delayed[6][31+idx_shift : idx_shift];
        end
    end
endgenerate

//----------------------------------------
// Data Multiplexer
//----------------------------------------
always @(posedge in_clock) begin
    case(minimum_sad_shift+DATA_OFFSET)
        6'd0    : out_data = output_shifts[0 ];
        6'd1    : out_data = output_shifts[1 ];
        6'd2    : out_data = output_shifts[2 ];
        6'd3    : out_data = output_shifts[3 ];
        6'd4    : out_data = output_shifts[4 ];
        6'd5    : out_data = output_shifts[5 ];
        6'd6    : out_data = output_shifts[6 ];
        6'd7    : out_data = output_shifts[7 ];
        6'd8    : out_data = output_shifts[8 ];
        6'd9    : out_data = output_shifts[9 ];
        6'd10   : out_data = output_shifts[10];
        6'd11   : out_data = output_shifts[11];
        6'd12   : out_data = output_shifts[12];
        6'd13   : out_data = output_shifts[13];
        6'd14   : out_data = output_shifts[14];
        6'd15   : out_data = output_shifts[15];
        6'd16   : out_data = output_shifts[16];
        6'd17   : out_data = output_shifts[17];
        6'd18   : out_data = output_shifts[18];
        6'd19   : out_data = output_shifts[19];
        6'd20   : out_data = output_shifts[20];
        6'd21   : out_data = output_shifts[21];
        6'd22   : out_data = output_shifts[22];
        6'd23   : out_data = output_shifts[23];
        6'd24   : out_data = output_shifts[24];
        6'd25   : out_data = output_shifts[25];
        6'd26   : out_data = output_shifts[26];
        6'd27   : out_data = output_shifts[27];
        6'd28   : out_data = output_shifts[28];
        6'd29   : out_data = output_shifts[29];
        6'd30   : out_data = output_shifts[30];
        6'd31   : out_data = output_shifts[31];
        default : out_data = output_shifts[0];
    endcase
end

assign out_data_double_buffer = data_double_buffer;
assign out_threshold_comparator = min_sad_value[30];

endmodule
