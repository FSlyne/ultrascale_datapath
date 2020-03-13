module BCDR_QuickLock (

    input               enable,
    input               drpClk,
    input               dmonClk,  
    output reg  [9:0]   drpAddr,
    output reg  [15:0]  drpDin,
    input       [15:0]  drpDout,
    output reg          drpEn,
    output reg          drpWe,
    input               drpRdy,
    output reg          cdrOvrd,
    input       [6:0]   cdrPiCode,
    input               sop,
    input               reset,
    input       [5:0]   waitTime,
    input       [6:0]   threshold,
    input       [6:0]   stepSize,
    output      [12:0]  debug
);

endmodule