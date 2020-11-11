#include <stdio.h>
#include "SOPDetect.h"

void SOPDetect(bool enable, ap_uint<32> TDATAin, ap_uint<8> Thresholdin, bool *SOP_detected, bool *Packet_detected){
	#pragma HLS INTERFACE ap_none port=TDATAin
	#pragma HLS INTERFACE ap_none port=enable
	#pragma HLS INTERFACE ap_ctrl_none port=return
	//#pragma HLS PIPELINE
	static bool SOP_reg=0;
	ap_uint<8> reg_numones=0;
	ap_uint<8> reg_numones2=0;
	static ap_uint<4> NumConsequtiveNoData=0;
	ap_uint<32> comp = 0;
	#pragma HLS RESET variable=SOP_reg
	#pragma HLS RESET variable=reg_numones
	#pragma HLS RESET variable=NumConsequtiveNoData
	if(enable){
		//count the number of ones in the data
		reg_numones = TDATAin[0] + TDATAin[1] + TDATAin[2] + TDATAin[3] + TDATAin[4] + TDATAin[5] + TDATAin[6] + TDATAin[7]\
					+TDATAin[8] + TDATAin[9] + TDATAin[10] + TDATAin[11] + TDATAin[12] + TDATAin[13] + TDATAin[14] + TDATAin[15]\
					+TDATAin[16] + TDATAin[17] + TDATAin[18] + TDATAin[19] + TDATAin[20] + TDATAin[21] + TDATAin[22] + TDATAin[23]\
					+TDATAin[24] + TDATAin[25] + TDATAin[26] + TDATAin[27] + TDATAin[28] + TDATAin[29] + TDATAin[30] + TDATAin[31];
		/*comp = (Preamble)^(TDATAin);
		reg_numones2 = comp[0] + comp[1] + comp[2] + comp[3] + comp[4] + comp[5] + comp[6] + comp[7]\
					+comp[8] + comp[9] + comp[10] + comp[11] + comp[12] + comp[13] + comp[14] + comp[15]\
					+comp[16] + comp[17] + comp[18] + comp[19] + comp[20] + comp[21] + comp[22] + comp[23]\
					+comp[24] + comp[25] + comp[26] + comp[27] + comp[28] + comp[29] + comp[30] + comp[31];*/
		if((reg_numones>=Thresholdin)){
			//set SOP_detected only at the begining of the burst
			if(SOP_reg==0){
				//SOP_reg was reset. this means it is begining of the burst
				*SOP_detected=1;
			}
			else{
				//SOP_reg was already set. this means it is not the begining of the burst. might be in the middle.
				*SOP_detected=0;
			}
			// set the SOP_reg.
			SOP_reg = 1;
		}
		else{
			*SOP_detected=0;
		}
		
		if(reg_numones==0){//No data
			NumConsequtiveNoData++;
			//check if 10 consequtive no data is appearing
			if(NumConsequtiveNoData>=0xa){
				SOP_reg=0;
			}
		}
		
		//clear the Nodata Indicator if there is any indication of data
		if(reg_numones>=Thresholdin-3){
			NumConsequtiveNoData = 0;
		}
		
		*Packet_detected = SOP_reg;
	}else{
		//Do Nothing. Keep the previous state of all the static variable;
		reg_numones = 0x00;
		*SOP_detected=0;
		*Packet_detected = 0;
	}

}

