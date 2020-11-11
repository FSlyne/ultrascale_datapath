#include <stdio.h>
#include "SOP_CDR_Control.h"

void SOP_CDR_Control(bool enable,\
						ap_uint<32> TDATAin,\
						bool SOP_in,\
						bool* CDRHOLD_out,\
						bool* PacketValid_out){
	#pragma HLS INTERFACE ap_ctrl_none register port=return
	#pragma HLS PIPELINE
	//#pragma HLS DATAFLOW
	#pragma HLS INTERFACE ap_none port=enable
	#pragma HLS INTERFACE ap_none port=TDATAin
	#pragma HLS INTERFACE ap_none port=SOP_in
	#pragma HLS INTERFACE ap_none port=CDRHOLD_out
	#pragma HLS INTERFACE ap_none port=PacketValid_out

	//Introduce the static variables to hold the values per frame
	static bool CDRHOLD_out_reg = 1;
	static bool Packet_valid_reg = 0;
	static ap_uint<4> NumConsequtiveNoData=0;

	//Other variables
	ap_uint<8> reg_numones=0;
	bool reset_error_cout_reg=0;
	ap_uint<32> comp;

	#pragma HLS RESET variable=reg_numones
	#pragma HLS RESET variable=NumConsequtiveNoData
	if(enable){
		//count the number of ones in the data
		reg_numones = TDATAin[0] + TDATAin[1] + TDATAin[2] + TDATAin[3] + TDATAin[4] + TDATAin[5] + TDATAin[6] + TDATAin[7]\
					+TDATAin[8] + TDATAin[9] + TDATAin[10] + TDATAin[11] + TDATAin[12] + TDATAin[13] + TDATAin[14] + TDATAin[15]\
					+TDATAin[16] + TDATAin[17] + TDATAin[18] + TDATAin[19] + TDATAin[20] + TDATAin[21] + TDATAin[22] + TDATAin[23]\
					+TDATAin[24] + TDATAin[25] + TDATAin[26] + TDATAin[27] + TDATAin[28] + TDATAin[29] + TDATAin[30] + TDATAin[31];
		if(SOP_in == 1){//Preamble detected. start of packet
			//de-assert CDRHOLD
			CDRHOLD_out_reg = 0;
			//assert packet valid until no data transmission is found
			Packet_valid_reg = 1;
			NumConsequtiveNoData=0;
		}

		if(reg_numones==0){//No data
			NumConsequtiveNoData++;
			//check if 10 consecutive no data is appearing
			if(NumConsequtiveNoData>=0x5){// no data transmission 10 times consecutively
				//assert CDRHOLD
				CDRHOLD_out_reg = 1;
				//de-assert packet valid until no data transmission is found
				Packet_valid_reg = 0;
			}
		}
	}

	*CDRHOLD_out = CDRHOLD_out_reg;
	*PacketValid_out = Packet_valid_reg;
}
