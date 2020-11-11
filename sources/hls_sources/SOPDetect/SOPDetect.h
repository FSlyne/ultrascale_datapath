#ifndef BURST_H_
#define BURST_H_
#include <stdbool.h>
#include "ap_axi_sdata.h"

#define PREAMBLE 0xAAAA
void SOPDetect(bool enable, ap_uint<32> TDATAin, ap_uint<8> Thresholdin, bool* SOP_detected, bool *Packet_detected);

#endif
