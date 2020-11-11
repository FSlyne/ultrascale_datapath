#ifndef SOP_CDR_Control_H_
#define SOP_CDR_Control_H_
#include <stdbool.h>
#include "ap_axi_sdata.h"

#define PREAMBLE 0xAAAA
void SOP_CDR_Control(bool enable,\
						ap_uint<32> TDATAin,\
						bool SOP_in,\
						bool* CDRHOLD_out,\
						bool* PacketValid_out);
#endif
