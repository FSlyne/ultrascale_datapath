#ifndef BURST_H_
#define BURST_H_
#include <stdbool.h>
#include "ap_axi_sdata.h"

#define PREAMBLE 0xAAAA
void ControlledBurstGen(bool enable,\
		unsigned int preamble_length,\
		bool add_delimiter,\
		unsigned int preamble,\
		unsigned int delimiter,\
		unsigned int burst_length,\
		unsigned int burst_period,\
		ap_axis<32,2,5,6>* cntr,\
		bool* axis_dataOut_TVALID,\
		bool* axis_dataOut_Ch0_VALID,\
		bool* axis_dataOut_Ch1_VALID);

void writeData(ap_axis<32,2,5,6>* axis_data,\
		unsigned int data, ap_uint<4> keep,\
		ap_uint<1> last);
#endif
