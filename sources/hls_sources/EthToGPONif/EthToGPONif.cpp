#include <stdio.h>
#include "EthToGPONif.h"

void EthToGPONif(bool enable,\
						unsigned int preamble_length,\
						unsigned int preamble,\
						unsigned int delimiter,\
						ap_axis<32,1,5,6>* dataIn,\
						ap_axis<32,1,5,6>* dataOut){
//#pragma HLS PIPELINE
#pragma HLS INTERFACE axis off port=dataIn
#pragma HLS INTERFACE axis off port=dataOut

	static unsigned int init_data = 0;
	static unsigned int data_count = 0;
	#pragma HLS RESET variable=data_count
	#pragma HLS RESET variable=init_data

	if(enable){

	}else{
		;
	}

}


void writeData(ap_axis<32,2,5,6>* axis_data,\
		unsigned int data,\
		ap_uint<4> keep,\
		ap_uint<1> user,\
		ap_uint<1> last){
#pragma HLS INLINE
	axis_data->data = data;
	axis_data->dest = 0;
	axis_data->id   = 0;
	axis_data->keep = keep;
	axis_data->strb = 0;
	axis_data->user = user;
	axis_data->last = last;
}
