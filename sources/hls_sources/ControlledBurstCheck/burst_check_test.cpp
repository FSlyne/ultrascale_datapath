#include <stdio.h>
#include <stdbool.h>
#include "burst_check.h"

int main(){
	int pass =0;
	int NumCycles = 30, i=0, preamble_length = 2;
	unsigned int burst_period =8, burst_length =6;
	ap_uint<32> numErrorshwOut;
	int enable[30] = {1, 1, 1, 1, 1, 1, 1, 1,\
					  1, 1, 1, 1, 1, 1, 0, 0,\
					  1, 1, 1, 1, 1, 1, 0, 0,\
					  0, 0, 1, 1, 1, 1};
	ap_uint<32> ref_axis_tData_In[30] = {0xadab5aac, 0xadab5aad, 0xadab5aae, 0xadab5aaf, 0xadab5aa8, 0xadab5aa9, 0, 0,\
										0xadab5aac, 0xadab5aad, 0xadab5aae, 0xadab5aaf, 0xadab5aa8, 0xadab5aa9, 0, 0,\
										0xadab5aac, 0xadab5aad, 0xadab5aae, 0xadab5aaf, 0xadab5aa8, 0xadab5aa9, 0, 0,\
										0, 0, 0xadab5aac, 0xadab5aad, 0xadab5aae, 0xadab5aaf};
	ap_uint<4> ref_axis_tKeep_In[30] = {0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0, 0x0,\
										0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0x0, 0x0,\
										0xf, 0xf, 0xf, 0xf, 0xf, 0x3, 0x0, 0x0,\
										0x0, 0x0, 0xf, 0xf, 0xf, 0x1};
	bool ref_axis_tLast_In[30] = {0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,\
									0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1};
	bool ref_axis_tValid_In[30] = {1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0,\
									1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1};
	int refNumErrorsOut[30] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,\
								0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

	for(i=0;i<NumCycles; i++){
		ControlledBurstCheck(enable[i], burst_length, burst_period, &ref_axis_tData_In[i], &ref_axis_tKeep_In[i],\
				ref_axis_tValid_In[i], ref_axis_tLast_In[i], &numErrorshwOut);
		/*if(i==25){
			//pause here //created for debug probe
			i=25;
		}*/
		if(refNumErrorsOut[i] == numErrorshwOut.to_int())
			pass=1;
		else{
			pass=0;
			break;
		}
	}
	if(pass){
		fprintf(stdout, "----------Pass!------------\n");
		return 0;
	}
	else{
		fprintf(stdout, "----------Fail!------------\n");
		return 1;
	}
}
