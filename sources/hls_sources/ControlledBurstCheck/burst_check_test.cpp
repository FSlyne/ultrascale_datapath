#include <stdio.h>
#include <stdbool.h>
#include "burst_check.h"

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
	bool TVALID_in[SAMPLES_TO_SCAN]={0};
	int TKEEP_in[SAMPLES_TO_SCAN]={0};
	bool TLAST_in[SAMPLES_TO_SCAN]={0};
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
			fscanf(stimfile,"%d,%x,%d,%x,%d,%d",&sample_no[line_no-1],&TDATA_in[line_no-1],\
					&TVALID_in[line_no-1], &TKEEP_in[line_no-1], &TLAST_in[line_no-1],\
					&enable[line_no-1]);
			line_no++;
		}

	}
	fclose(stimfile);

	ap_uint<32> num_frames_recvd[SAMPLES_TO_SCAN]={0};
	ap_uint<32> num_errors_this_fr[SAMPLES_TO_SCAN]={0};
	ap_uint<32> total_bits_this_fr[SAMPLES_TO_SCAN]={0};
	ap_uint<64> num_errors_accumulated[SAMPLES_TO_SCAN]={0};
	ap_uint<64> total_bits_accumulated[SAMPLES_TO_SCAN]={0};
	int i;
	for(i=0;i<SAMPLES_TO_SCAN; i++){
		ControlledBurstCheck((bool)enable[i],  (ap_uint<32> )TDATA_in[i], TVALID_in[i],\
				(ap_uint<4> )TKEEP_in[i], TLAST_in[i], &num_frames_recvd[i],\
				&num_errors_this_fr[i], &total_bits_this_fr[i], &num_errors_accumulated[i],\
				&total_bits_accumulated[i]);
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
    int num_frames_recvd_res[SAMPLES_TO_SCAN]={0};
	int num_errors_this_fr_res[SAMPLES_TO_SCAN]={0};
	int total_bits_this_fr_res[SAMPLES_TO_SCAN]={0};
	int num_errors_accumulated_res[SAMPLES_TO_SCAN]={0};
	int total_bits_accumulated_res[SAMPLES_TO_SCAN]={0};

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
			fscanf(ref_res_file,"%d,%d,%d,%d,%d,%d",&serial_ID[line_no-1],\
					&num_frames_recvd_res[line_no-1], &num_errors_this_fr_res[line_no-1],\
					&total_bits_this_fr_res[line_no-1], &num_errors_accumulated_res[line_no-1],\
					&total_bits_accumulated_res[line_no-1]);
			line_no++;
		}
    }
    fclose(ref_res_file);
    for(i=0;i<SAMPLES_TO_SCAN; i++){
		if(((int)num_errors_this_fr[i] == num_errors_this_fr_res[i]) && \
				((int)num_errors_this_fr[i] == num_errors_this_fr_res[i]) && \
				((int)total_bits_this_fr[i] == total_bits_this_fr_res[i]) && \
				((int)num_errors_accumulated[i] == num_errors_accumulated_res[i]) && \
				((int)total_bits_accumulated[i] == total_bits_accumulated_res[i]))
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
