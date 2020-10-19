#ifndef BURST_H_
#define BURST_H_
#include <stdbool.h>
#include "ap_axi_sdata.h"

#define PREAMBLE 0xAAAA
void ControlledBurstCheck(bool enable,\
		unsigned int burst_length,\
		unsigned int burst_period,\
		ap_uint<32>* TDATAin,\
		ap_uint<4>* TKEEPin,\
		bool TVALIDin,\
		bool TLASTin,\
		ap_uint<32> *numerrors);

#endif
