############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project -reset SOP_CDR_Control
set_top SOP_CDR_Control
add_files SOP_CDR_Control.cpp
add_files -tb SOP_CDR_Control_test.cpp
add_files -tb XgPON_gt_rx_02.dat
add_files -tb XgPON_gt_rx_02.dat
add_files -tb XgPON_gt_rx_02_ref_res.dat
open_solution -reset "solution1"
set_part {xcvu095-ffva2104-2-e} -tool vivado
create_clock -period 10 -name default
#source "./ControlledBurst/solution1/directives.tcl"
csim_design -clean
csynth_design
#cosim_design -trace_level all -tool xsim
#export_design -format ip_catalog

#exit vivado HLS
exit
