#include <stdio.h>
#include <stdbool.h>
#include "SOPDetect.h"

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
	
	int sample_no[SAMPLES_TO_SCAN]={0};;
	int sample[SAMPLES_TO_SCAN]={0};;
	int enable[SAMPLES_TO_SCAN]={0};;
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
			fscanf(stimfile,"%d,%x,%d",&sample_no[line_no-1],&sample[line_no-1],&enable[line_no-1]);
			line_no++;
		}
		
	}
	fclose(stimfile);

	int i;
	ap_uint<8> Thresholdin = 0x08;
	bool SOP_detected[SAMPLES_TO_SCAN];
	bool Packet_detected[SAMPLES_TO_SCAN];
	for(i=0;i<SAMPLES_TO_SCAN; i++){
		SOPDetect(enable[i], (ap_uint<32> )sample[i],  Thresholdin, &SOP_detected[i], &Packet_detected[i] );
	}


    // Open golden results .res file for reading
    FILE* ref_res_file;
    int SOP_detected_ref[SAMPLES_TO_SCAN]={0};
    int Packet_detected_ref[SAMPLES_TO_SCAN]={0};
	int sample_in_ref[SAMPLES_TO_SCAN]={0};
    int serial_ID[SAMPLES_TO_SCAN]={0};

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
		while (line_no-1 < SAMPLES_TO_SCAN)
		{
			fscanf(ref_res_file,"%d,%x,%d,%d",&serial_ID[line_no-1],&sample_in_ref[line_no-1],&SOP_detected_ref[line_no-1],&Packet_detected_ref[line_no-1]);
			line_no++;
		}
    }
    fclose(ref_res_file);
    for(i=0;i<SAMPLES_TO_SCAN; i++){
		if(SOP_detected[i] == SOP_detected_ref[i])
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
		return 1;
	}
}
