//-----------------------------------------------------------------------------
// Copyright (C) 2009 OutputLogic.com
// This source file may be used and distributed without restriction
// provided that this copyright statement is not removed from the file
// and that any derivative work contains the original copyright notice
// and the associated disclaimer.
//
// THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS
// OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
// WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
//-----------------------------------------------------------------------------
// scrambler module for data[31:0],   lfsr[15:0]=1+x^8+x^16;
//-----------------------------------------------------------------------------
    /*scrambler scrambler_inst(
        .data_in()
        ,.scram_en()
        ,.scram_rst()
        ,.data_out()
        ,.rst()
        ,.clk()
    );*/
module scrambler(
  input [31:0] data_in,
  input scram_en,
  input scram_rst,
  output reg [31:0] data_out,
  input rst,
  input clk);

  reg [15:0] lfsr_q = 16'hDEAD;
  reg [15:0] lfsr_c = 16'h0000;
  reg [31:0] data_c = 32'h00000000;

  always @(*) begin
    lfsr_c[0] = lfsr_q[8];
    lfsr_c[1] = lfsr_q[9];
    lfsr_c[2] = lfsr_q[10];
    lfsr_c[3] = lfsr_q[11];
    lfsr_c[4] = lfsr_q[12];
    lfsr_c[5] = lfsr_q[13];
    lfsr_c[6] = lfsr_q[14];
    lfsr_c[7] = lfsr_q[15];
    lfsr_c[8] = lfsr_q[0] ^ lfsr_q[8];
    lfsr_c[9] = lfsr_q[1] ^ lfsr_q[9];
    lfsr_c[10] = lfsr_q[2] ^ lfsr_q[10];
    lfsr_c[11] = lfsr_q[3] ^ lfsr_q[11];
    lfsr_c[12] = lfsr_q[4] ^ lfsr_q[12];
    lfsr_c[13] = lfsr_q[5] ^ lfsr_q[13];
    lfsr_c[14] = lfsr_q[6] ^ lfsr_q[14];
    lfsr_c[15] = lfsr_q[7] ^ lfsr_q[15];

    data_c[0] = data_in[0] ^ lfsr_q[15];
    data_c[1] = data_in[1] ^ lfsr_q[14];
    data_c[2] = data_in[2] ^ lfsr_q[13];
    data_c[3] = data_in[3] ^ lfsr_q[12];
    data_c[4] = data_in[4] ^ lfsr_q[11];
    data_c[5] = data_in[5] ^ lfsr_q[10];
    data_c[6] = data_in[6] ^ lfsr_q[9];
    data_c[7] = data_in[7] ^ lfsr_q[8];
    data_c[8] = data_in[8] ^ lfsr_q[7] ^ lfsr_q[15];
    data_c[9] = data_in[9] ^ lfsr_q[6] ^ lfsr_q[14];
    data_c[10] = data_in[10] ^ lfsr_q[5] ^ lfsr_q[13];
    data_c[11] = data_in[11] ^ lfsr_q[4] ^ lfsr_q[12];
    data_c[12] = data_in[12] ^ lfsr_q[3] ^ lfsr_q[11];
    data_c[13] = data_in[13] ^ lfsr_q[2] ^ lfsr_q[10];
    data_c[14] = data_in[14] ^ lfsr_q[1] ^ lfsr_q[9];
    data_c[15] = data_in[15] ^ lfsr_q[0] ^ lfsr_q[8];
    data_c[16] = data_in[16] ^ lfsr_q[7];
    data_c[17] = data_in[17] ^ lfsr_q[6];
    data_c[18] = data_in[18] ^ lfsr_q[5];
    data_c[19] = data_in[19] ^ lfsr_q[4];
    data_c[20] = data_in[20] ^ lfsr_q[3];
    data_c[21] = data_in[21] ^ lfsr_q[2];
    data_c[22] = data_in[22] ^ lfsr_q[1];
    data_c[23] = data_in[23] ^ lfsr_q[0];
    data_c[24] = data_in[24] ^ lfsr_q[15];
    data_c[25] = data_in[25] ^ lfsr_q[14];
    data_c[26] = data_in[26] ^ lfsr_q[13];
    data_c[27] = data_in[27] ^ lfsr_q[12];
    data_c[28] = data_in[28] ^ lfsr_q[11];
    data_c[29] = data_in[29] ^ lfsr_q[10];
    data_c[30] = data_in[30] ^ lfsr_q[9];
    data_c[31] = data_in[31] ^ lfsr_q[8];
  end // always

  always @(posedge clk, posedge rst) begin
    if(rst) begin
      lfsr_q <= 16'hDEAD;
      data_out <= {32{1'b0}};
    end
    else begin
      lfsr_q <= scram_rst ? 16'hDEAD : scram_en ? lfsr_c : lfsr_q;
      data_out <= scram_en ? data_c : data_out;
    end
  end // always
endmodule // scrambler