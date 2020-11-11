############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project -reset SOPDetect
set_top SOPDetect
add_files SOPDetect.cpp
add_files -tb SOPDetect_test.cpp
add_files -tb XgPON_gt_rx_01.dat
open_solution -reset "solution1"
set_part {xcvu095-ffva2104-2-e} -tool vivado
create_clock -period 10 -name default
#source "./ControlledBurst/solution1/directives.tcl"
make all 
csim_design -clean
#csynth_design
#cosim_design -trace_level all -tool xsim
#export_design -format ip_catalog

#exit vivado HLS
exit
