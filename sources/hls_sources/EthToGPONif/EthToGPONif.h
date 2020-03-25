#ifndef BURST_H_
#define BURST_H_
#include <stdbool.h>
#include "ap_axi_sdata.h"

#define PREAMBLE 0xAAAA
void EthToGPONif(bool enable,\
		unsigned int preamble_length,\
		unsigned int preamble,\
		unsigned int delimiter,\
		ap_axis<32,1,5,6>* dataIn,\
		ap_axis<32,2,5,6>* cntr);

void writeData(ap_axis<32,2,5,6>* axis_data,\
		unsigned int data,\
		ap_uint<4> keep,\
		ap_uint<1> user,\
		ap_uint<1> last);
#endif
