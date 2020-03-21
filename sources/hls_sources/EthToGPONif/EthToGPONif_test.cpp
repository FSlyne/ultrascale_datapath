#include <stdio.h>
#include <stdbool.h>
#include "EthToGPONif.h"

int main(){
	int pass =0;
	int NumCycles = 30, i=0, preamble_length = 2;
	unsigned int burst_period =8, burst_length =6, preamble = 0x05560556,\
				 delimiter = 0xb2c50fa1;
	ap_axis<32, 2, 5, 6> hwOut;
	int enable[30] = {1, 1, 1, 1, 1, 1, 1, 1,\
					  1, 1, 1, 1, 1, 1, 1, 1,\
					  1, 1, 1, 1, 1, 1, 1, 1,\
					  0, 0, 1, 1, 1, 1};
	int refOut[30] = {0x05560556, 0x05560556, 0xb2c50fa1, 0xadab5aac, 0xadab5aad, 0xadab5aae, 0, 0,\
					  0x05560556, 0x05560556, 0xb2c50fa1, 0xadab5aac, 0xadab5aad, 0xadab5aae, 0, 0,\
					  0x05560556, 0x05560556, 0xb2c50fa1, 0xadab5aac, 0xadab5aad, 0xadab5aae, 0, 0,\
					  0, 0, 0x05560556, 0x05560556, 0xb2c50fa1, 0xadab5aac};
	for(i=0;i<NumCycles; i++){
		EthToGPONif(enable[i], preamble_length, preamble, delimiter, burst_length, burst_period, &hwOut);
		/*if(i==25){
			//pause here //created for debug probe
			i=25;
		}*/
		if(refOut[i] == hwOut.data.to_int())
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
