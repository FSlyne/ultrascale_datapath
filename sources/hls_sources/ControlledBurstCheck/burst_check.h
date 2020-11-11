#ifndef BURST_H_
#define BURST_H_
#include <stdbool.h>
#include "ap_axi_sdata.h"

#define PREAMBLE 0xAAAA
void ControlledBurstCheck(bool enable,\
		ap_uint<32> TDATAin,\
		bool TVALIDin,\
		ap_uint<4> TKEEPin,\
		bool TLASTin,\
		ap_uint<32> *num_frames_recvd,\
		ap_uint<32> *num_errors_this_fr,\
		ap_uint<32> *total_bits_this_fr,\
		ap_uint<64> *num_errors_accumulated,\
		ap_uint<64> *total_bits_accumulated);
#endif
