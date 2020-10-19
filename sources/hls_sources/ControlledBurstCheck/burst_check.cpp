#include <stdio.h>
#include "burst_check.h"

void ControlledBurstCheck(bool enable,\
						unsigned int burst_length,\
						unsigned int burst_period,\
						ap_uint<32>* TDATAin,\
						ap_uint<4>* TKEEPin,\
						bool TVALIDin,\
						bool TLASTin,\
						ap_uint<32> *numerrors){
	#pragma HLS INTERFACE ap_none port=TLASTin
	#pragma HLS INTERFACE ap_none port=TVALIDin
	#pragma HLS INTERFACE ap_none port=TKEEPin
	#pragma HLS INTERFACE ap_none port=TDATAin
	#pragma HLS INTERFACE ap_ctrl_none port=return
	//#pragma HLS PIPELINE
	static ap_uint<32> ref_data = 0;
	static ap_uint<32> reg_numerrors=0;
	bool reset_error_cout_reg=0;
	ap_uint<32> comp;
	/*#pragma HLS RESET variable=data_count
	#pragma HLS RESET variable=init_data
	#pragma HLS RESET variable=frame_count*/
	#pragma HLS RESET variable=reg_numerrors

	if(enable){
		if(TVALIDin){
			//compare the data
			if(*TKEEPin == 0xf)
				comp = (ref_data^0xadab5aac)^(*TDATAin);
			else if(*TKEEPin == 0x7)
				comp = (ref_data^0x00ab5aac)^(0x00 , TDATAin->range(23, 0));
			else if(*TKEEPin == 0x3)
				comp = (ref_data^0x00005aac)^(0x0000 , TDATAin->range(15,0));
			else if(*TKEEPin == 0x1)
				comp = (ref_data^0x000000ac)^(0x000000 , TDATAin->range(7,0));
			else
				comp = 0;

			reg_numerrors += comp[0] + comp[1] + comp[2] + comp[3] + comp[4] + comp[5] + comp[6] + comp[7]\
						+comp[8] + comp[9] + comp[10] + comp[11] + comp[12] + comp[13] + comp[14] + comp[15]\
						+comp[16] + comp[17] + comp[18] + comp[19] + comp[20] + comp[21] + comp[22] + comp[23]\
						+comp[24] + comp[25] + comp[26] + comp[27] + comp[28] + comp[29] + comp[30] + comp[31];
			if(TLASTin){//last data of the incoming frame
				ref_data = 0;
				reset_error_cout_reg = 1;
			}else{
				ref_data++;
			}
		}
		*numerrors = reg_numerrors;
		if(reset_error_cout_reg){
			reg_numerrors=0;
		}
	}else{
		;
	}

}

