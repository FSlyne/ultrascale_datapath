#include <stdio.h>
#include <stdbool.h>
#include "SOP_CDR_Control.h"

#include <iostream>
#include <cstdlib>
#include <cstring>
#include <sstream>
#include <fstream>
#include <string>
#include <sstream>

using namespace std;

#define BUF_SIZE 64
#define SAMPLES_TO_SCAN 100

int main(){
	int pass =1;
	char res_filename[BUF_SIZE]={0};
    char dat_filename[BUF_SIZE]={0};
	int line_no = 1;
	FILE *stimfile;
	int Test_file_number = 2;
	// Open stimulus .dat file for reading
	sprintf(dat_filename, "XgPON_gt_rx_%02d", Test_file_number);
	strcat(dat_filename,".dat");
	stimfile = fopen(dat_filename, "r");

	int sample_no[SAMPLES_TO_SCAN]={0};
	int TDATA_in[SAMPLES_TO_SCAN]={0};
	bool SOPIN[SAMPLES_TO_SCAN]={0};
	int enable[SAMPLES_TO_SCAN]={0};

	if (stimfile == NULL)
	{
		printf("ERROR: Can't open %s\n",dat_filename);
		exit(999);
	}
	else
	{
		printf("INFO: Reading %s\n",dat_filename);
		while (fgetc(stimfile) != EOF && line_no-1 < SAMPLES_TO_SCAN)
		{
			fscanf(stimfile,"%d,%x,%d,%d",&sample_no[line_no-1],&TDATA_in[line_no-1],\
					&SOPIN[line_no-1], &enable[line_no-1]);
			line_no++;
		}

	}
	fclose(stimfile);

	bool CDRHOLD_out[SAMPLES_TO_SCAN]={0};
	bool PacketValid_out[SAMPLES_TO_SCAN]={0};
	int i;
	for(i=0;i<SAMPLES_TO_SCAN; i++){
		SOP_CDR_Control((bool)enable[i],  (ap_uint<32> )TDATA_in[i], (bool)SOPIN[i],\
				&CDRHOLD_out[i], &PacketValid_out[i]);
		/*if(i==25){
			//pause here //created for debug probe
			i=25;
		}*/
		/*if(refNumErrorsOut[i] == numErrorshwOut.to_int())
			pass=1;
		else{
			pass=0;
			break;
		}*/
	}

    // Open golden results .res file for reading
    FILE* ref_res_file;
    int serial_ID[SAMPLES_TO_SCAN]={0};
    int CDRHOLD_out_res[SAMPLES_TO_SCAN]={0};
	int PacketValid_out_res[SAMPLES_TO_SCAN]={0};

    sprintf(res_filename, "XgPON_gt_rx_%02d_ref_res", Test_file_number);
    strcat(res_filename,".dat");
    if ((ref_res_file = fopen(res_filename, "r")) == 0)
    {
        printf("ERROR: Can't open %s\n", res_filename);
        exit(888);
    }
    else
    {
		printf("INFO: Writing %s\n",res_filename);
		line_no =1;
		while (fgetc(stimfile) != EOF && line_no-1 < SAMPLES_TO_SCAN)
		{
			fscanf(ref_res_file,"%d,%d,%d",&serial_ID[line_no-1],\
					&CDRHOLD_out_res[line_no-1], &PacketValid_out_res[line_no-1]);
			line_no++;
		}
    }
    fclose(ref_res_file);
    for(i=0;i<SAMPLES_TO_SCAN-1; i++){
		if(((int)CDRHOLD_out[i] == CDRHOLD_out_res[i]) && \
				((int)PacketValid_out[i] == PacketValid_out_res[i]))
			pass=1;
		else{
			if(1){
				//STOP here to debug the error
				;
			}
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
		return 0;
	}
}
