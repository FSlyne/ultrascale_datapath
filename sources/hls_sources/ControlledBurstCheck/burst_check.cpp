#include <stdio.h>
#include "burst_check.h"

void ControlledBurstCheck(bool enable,\
						ap_uint<32> TDATAin,\
						bool TVALIDin,\
						ap_uint<4> TKEEPin,\
						bool TLASTin,\
						ap_uint<32> *num_frames_recvd,\
						ap_uint<32> *num_errors_this_fr,\
						ap_uint<32> *total_bits_this_fr,\
						ap_uint<64> *num_errors_accumulated,\
						ap_uint<64> *total_bits_accumulated){
	#pragma HLS INTERFACE ap_ctrl_none register port=return
	#pragma HLS PIPELINE
	#pragma HLS INTERFACE ap_none register port=num_frames_recvd
	#pragma HLS INTERFACE ap_none register port=num_errors_this_fr
	#pragma HLS INTERFACE ap_none register port=total_bits_this_fr
	#pragma HLS INTERFACE ap_none register port=num_errors_accumulated
	#pragma HLS INTERFACE ap_none register port=total_bits_accumulated
	//#pragma HLS PIPELINE
	//#pragma HLS DATAFLOW
	/*#pragma HLS INTERFACE ap_none port=TLASTin
	#pragma HLS INTERFACE ap_none port=TVALIDin
	#pragma HLS INTERFACE ap_none port=TKEEPin
	#pragma HLS INTERFACE ap_none port=TDATAin
	//#pragma HLS INTERFACE ap_ctrl_none port=return*/

	//Introduce the static variables to hold the values per frame
	static ap_uint<32> ref_data = 0;
	static ap_uint<32> reg_numerrors=0;//num errors accumulated tracker on each clk cycle
	static ap_uint<32> reg_numbits=0; //num bits received accumulated tracker on each clk cycle
	static ap_uint<32> frame_count = 0;
	static ap_uint<32> num_errors_prev_fr = 0; //number of errors in the previous frame
	static ap_uint<32> num_bits_recvd_prev_fr = 0;
	static ap_uint<64> num_errors_accum_prev_fr = 0; //number of errors accumulated till the previous frame
	static ap_uint<64> total_bits_accum_prev_fr = 0; //number of bits received till the previous frame
	//Other variables
	bool reset_error_cout_reg=0;
	ap_uint<32> comp;
	/*#pragma HLS RESET variable=data_count
	#pragma HLS RESET variable=init_data*/
	#pragma HLS RESET variable=frame_count
	#pragma HLS RESET variable=reg_numerrors
	#pragma HLS RESET variable=reg_numbits
	#pragma HLS RESET variable=num_errors_prev_fr
	#pragma HLS RESET variable=num_bits_recvd_prev_fr
	#pragma HLS RESET variable=num_errors_accum_prev_fr
	#pragma HLS RESET variable=total_bits_accum_prev_fr

	if(enable){
		if(TVALIDin){
			//compare the data
			if(TKEEPin == 0xf){
				comp = (ref_data^0xadab5aac)^(TDATAin);
				reg_numbits += 32;
			}else if(TKEEPin == 0x7){
				comp = (ref_data^0x00ab5aac)^(0x00 , TDATAin.range(23, 0));
				reg_numbits += 24;
			}else if(TKEEPin == 0x3){
				comp = (ref_data^0x00005aac)^(0x0000 , TDATAin.range(15,0));
				reg_numbits += 16;
			}else if(TKEEPin == 0x1){
				reg_numbits += 8;
				comp = (ref_data^0x000000ac)^(0x000000 , TDATAin.range(7,0));
			}else{
				reg_numbits += 0;
				comp = 0;
			}
			//count and accumulate the number of error on each clk when tvalid is high
			reg_numerrors += comp[0] + comp[1] + comp[2] + comp[3] + comp[4] + comp[5] + comp[6] + comp[7]\
						+comp[8] + comp[9] + comp[10] + comp[11] + comp[12] + comp[13] + comp[14] + comp[15]\
						+comp[16] + comp[17] + comp[18] + comp[19] + comp[20] + comp[21] + comp[22] + comp[23]\
						+comp[24] + comp[25] + comp[26] + comp[27] + comp[28] + comp[29] + comp[30] + comp[31];
			if(TLASTin){//last data of the incoming frame
				ref_data = 0;
				frame_count++;
				/**num_frames_recvd = frame_count;
				*num_errors_this_fr = reg_numerrors; //update the num errors value for current frame
				*total_bits_this_fr = reg_numbits; //update the num bits received value for current frame
				*num_errors_accumulated = num_errors_accum_prev_fr + reg_numerrors; //update the num errors accumulated value for current frame
				*total_bits_accumulated = total_bits_accum_prev_fr + reg_numbits;*/ //update the num bits accumulated value for current frame

				num_errors_prev_fr = reg_numerrors; // update the num_errors per frame tracker
				num_bits_recvd_prev_fr = reg_numbits; // update the num_bits recvd per frame tracker
				num_errors_accum_prev_fr += reg_numerrors; // update the num_errors accumulated tracker
				total_bits_accum_prev_fr += reg_numbits; // update the num_bits received accumulated tracker
				reset_error_cout_reg = 1;
			}else{
				/**num_frames_recvd = frame_count;
				*num_errors_this_fr = num_errors_prev_fr; //keep the value of the previous frame
				*total_bits_this_fr = num_bits_recvd_prev_fr;//keep the value of the previous frame
				*num_errors_accumulated = num_errors_accum_prev_fr;
				*total_bits_accumulated = total_bits_accum_prev_fr;*/
				ref_data++;
			}
		}/*else{
			*num_frames_recvd = frame_count;
			*num_errors_this_fr = num_errors_prev_fr; //Updates on each Tlast
			*total_bits_this_fr = num_bits_recvd_prev_fr; //Updates on each Tlast
			*num_errors_accumulated = num_errors_accum_prev_fr; //Updates on each Tlast
			*total_bits_accumulated = total_bits_accum_prev_fr; //Updates on each Tlast
		}*/
		*num_frames_recvd = frame_count;
		*num_errors_this_fr = num_errors_prev_fr; //Updates on each Tlast
		*total_bits_this_fr = num_bits_recvd_prev_fr; //Updates on each Tlast
		*num_errors_accumulated = num_errors_accum_prev_fr; //Updates on each Tlast
		*total_bits_accumulated = total_bits_accum_prev_fr; //Updates on each Tlast

		if(reset_error_cout_reg){//reset the count variable for number of bits rercvd and num errors
			reg_numerrors = 0;
			reg_numbits = 0;
		}
	}

}

