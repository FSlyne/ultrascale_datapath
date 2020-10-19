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
						bool* axis_dataOut_TVALID,\
						bool* axis_dataOut_Ch0_VALID,\
						bool* axis_dataOut_Ch1_VALID){
//#pragma HLS PIPELINE

#pragma HLS INTERFACE axis off port=dataOut


	static unsigned int init_data = 0;
	static unsigned int data_count = 0;
	static unsigned int frame_count = 0;
	static bool Ch0_VALID = 1;
	static bool Ch1_VALID = 0;

	ap_uint<4> keep_array[4] = {0x1, 0x3, 0x7, 0xf};
	#pragma HLS RESET variable=data_count
	#pragma HLS RESET variable=init_data
	#pragma HLS RESET variable=init_data
	#pragma HLS RESET variable=frame_count
	#pragma HLS RESET variable=Ch0_VALID
	#pragma HLS RESET variable=Ch1_VALID

	if(enable){
		//assign the channel valids here
		*axis_dataOut_Ch0_VALID = Ch0_VALID;
		*axis_dataOut_Ch1_VALID = Ch1_VALID;
		if (data_count<burst_period-1){
			if(data_count<burst_length-1){
				if(data_count<preamble_length){
					*axis_dataOut_TVALID=true;
					writeData(dataOut, preamble, 0xf, 0); //insert preamble for clock synchronization
				}else if((data_count == preamble_length) && add_delimiter){
					*axis_dataOut_TVALID=true;
					writeData(dataOut, delimiter, 0xf, 0); //insert delimiter for frame correction
				}
				else{
					*axis_dataOut_TVALID=true;
					writeData(dataOut, init_data^ 0xadab5aac, 0xf, 0);
					init_data++;
				}
			}else if(data_count==burst_length-1){
				frame_count++;
				*axis_dataOut_TVALID=true;
				writeData(dataOut, init_data^ 0xadab5aac, keep_array[frame_count%4], 1);
				init_data++;
			}else if(data_count==burst_length){
				*axis_dataOut_TVALID=false;
				writeData(dataOut, 0, 0, 0);
				init_data++;
			}else{
				*axis_dataOut_TVALID=false;
				writeData(dataOut, 0, 0, 0);
			}
			data_count++;
		}else{
			//toggle the channel valid after the period of the burst
			if (data_count==burst_period-1){//Next of Last data of the burst
				//toggle the channel valids
				if(Ch0_VALID){
					Ch0_VALID = 0;
					Ch1_VALID = 1;
				}else{
					Ch0_VALID = 1;
					Ch1_VALID = 0;
				}
			}
			*axis_dataOut_TVALID=false;

			writeData(dataOut, 0, 0, 0);
			data_count=0;
			init_data = 0;
		}
	}else{
		;
	}

}


void writeData(ap_axis<32,2,5,6>* axis_data,\
		unsigned int data, ap_uint<4> keep,\
		ap_uint<1> last){
#pragma HLS INLINE
	axis_data->data = data;
	axis_data->dest = 0;
	axis_data->id   = 0;
	axis_data->keep = keep;
	axis_data->strb = 0;
	axis_data->user = 0;
	axis_data->last = last;
}
