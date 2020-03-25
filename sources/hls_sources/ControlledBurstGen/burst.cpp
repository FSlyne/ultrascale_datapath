#include <stdio.h>
#include "burst.h"

void ControlledBurstGen(bool enable,\
						unsigned int preamble_length,\
						bool add_delimiter,\
						unsigned int preamble,\
						unsigned int delimiter,\
						unsigned int burst_length,\
						unsigned int burst_period,\
						ap_axis<32,2,5,6>* dataOut,\
						bool* axis_dataOut_TVALID){
//#pragma HLS PIPELINE

#pragma HLS INTERFACE axis off port=dataOut


	static unsigned int init_data = 0;
	static unsigned int data_count = 0;
	#pragma HLS RESET variable=data_count
	#pragma HLS RESET variable=init_data
	#pragma HLS RESET variable=init_data

	if(enable){
		if (data_count<burst_period-1){
			if(data_count<burst_length-1){
				if(data_count<preamble_length){
					*axis_dataOut_TVALID=true;
					writeData(dataOut, preamble, 0); //insert preamble for clock synchronization
				}else if((data_count == preamble_length) && add_delimiter){
					*axis_dataOut_TVALID=true;
					writeData(dataOut, delimiter, 0); //insert delimiter for frame correction
				}
				else{
					*axis_dataOut_TVALID=true;
					writeData(dataOut, init_data^ 0xadab5aac, 0);
					init_data++;
				}
			}else if(data_count==burst_length-1){
				*axis_dataOut_TVALID=true;
				writeData(dataOut, init_data^ 0xadab5aac, 1);
				init_data++;
			}else if(data_count==burst_length){
				*axis_dataOut_TVALID=false;
				writeData(dataOut, 0, 0);
				init_data++;
			}else{
				*axis_dataOut_TVALID=false;
				writeData(dataOut, 0, 0);
			}
			data_count++;
		}else{
			*axis_dataOut_TVALID=false;
			writeData(dataOut, 0, 0);
			data_count=0;
			init_data = 0;
		}
	}else{
		;
	}

}


void writeData(ap_axis<32,2,5,6>* axis_data,\
		unsigned int data,\
		ap_uint<1> last){
#pragma HLS INLINE
	axis_data->data = data;
	axis_data->dest = 0;
	axis_data->id   = 0;
	axis_data->keep = 15;
	axis_data->strb = 0;
	axis_data->user = 0;
	axis_data->last = last;
}
