#------------------------------------------------------------------------------
#  (c) Copyright 2013-2015 Xilinx, Inc. All rights reserved.
#
#  This file contains confidential and proprietary information
#  of Xilinx, Inc. and is protected under U.S. and
#  international copyright and other intellectual property
#  laws.
#
#  DISCLAIMER
#  This disclaimer is not a license and does not grant any
#  rights to the materials distributed herewith. Except as
#  otherwise provided in a valid license issued to you by
#  Xilinx, and to the maximum extent permitted by applicable
#  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
#  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
#  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
#  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
#  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
#  (2) Xilinx shall not be liable (whether in contract or tort,
#  including negligence, or under any other theory of
#  liability) for any loss or damage of any kind or nature
#  related to, arising under or in connection with these
#  materials, including for any direct, or any indirect,
#  special, incidental, or consequential loss or damage
#  (including loss of data, profits, goodwill, or any type of
#  loss or damage suffered as a result of any action brought
#  by a third party) even if such damage or loss was
#  reasonably foreseeable or Xilinx had been advised of the
#  possibility of the same.
#
#  CRITICAL APPLICATIONS
#  Xilinx products are not designed or intended to be fail-
#  safe, or for use in any application requiring fail-safe
#  performance, such as life-support or safety devices or
#  systems, Class III medical devices, nuclear facilities,
#  applications related to the deployment of airbags, or any
#  other applications that could lead to death, personal
#  injury, or severe property or environmental damage
#  (individually and collectively, "Critical
#  Applications"). Customer assumes the sole risk and
#  liability of any use of Xilinx products in Critical
#  Applications, subject only to applicable laws and
#  regulations governing limitations on product liability.
#
#  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
#  PART OF THIS FILE AT ALL TIMES.
#------------------------------------------------------------------------------


# UltraScale FPGAs Transceivers Wizard IP example design-level XDC file
# ----------------------------------------------------------------------------------------------------------------------

#set_property PACKAGE_PIN AM24 [get_ports ResetL]
#set_property IOSTANDARD LVCMOS18 [get_ports ResetL]

#set_property PACKAGE_PIN AM21 [get_ports LPMode]
#set_property IOSTANDARD LVCMOS18 [get_ports LPMode]

#########################################################################################################################################
############### GTY 10G ethernet constraints ############################################################################################

#------------------------------------------------------------------------------
# XXV_ETHERNET example design-level XDC file
# ----------------------------------------------------------------------------------------------------------------------
## init_clk should be lesser or equal to reference clock.
### Transceiver Reference Clock Placement
### Transceivers should be adjacent to allow timing constraints to be met easily.
### Full details of available transceiver locations can be found
### in the appropriate transceiver User Guide, or use the Transceiver Wizard.
create_clock -period 10.000 [get_ports dclk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports dclk_p]

set_property PACKAGE_PIN F31 [get_ports dclk_n]
set_property PACKAGE_PIN G31 [get_ports dclk_p]
create_clock -period 10.000 [get_ports dclk_n]
set_property IOSTANDARD DIFF_SSTL12 [get_ports dclk_n]

### These are sample constraints, please use correct constraints for your device
### update the gt_refclk pin location accordingly and un-comment the below two lines
create_clock -period 6.400 -name eth_gt_refclk_p [get_ports eth_gt_refclk_p]

set_property IOSTANDARD DIFF_SSTL12 [get_ports eth_gt_refclk_n]
set_property PACKAGE_PIN R8 [get_ports eth_gt_refclk_n]
set_property PACKAGE_PIN R9 [get_ports eth_gt_refclk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports eth_gt_refclk_p]

# Location constraints for differential reference clock buffers
# Note: the IP core-level XDC constrains the transceiver channel data pin locations
# ----------------------------------------------------------------------------------------------------------------------
create_clock -period 6.400 -name clk_mgtrefclk0_x0y3_p [get_ports mgtrefclk0_x0y3_p]
set_property PACKAGE_PIN AF39 [get_ports mgtrefclk0_x0y3_n]
set_property PACKAGE_PIN AF38 [get_ports mgtrefclk0_x0y3_p]


###Board constraints to be added here
### Below XDC constraints are for VCU108 board with xcvu095-ffva2104-2-e-es2 device
### Change these constraints as per your board and device
#### Push Buttons
set_property PACKAGE_PIN D9 [get_ports eth_sys_reset_phy]
#GPIO Push button->South on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports eth_sys_reset_phy]

set_property PACKAGE_PIN A10 [get_ports eth_restart_tx_rx]
#GPIO Push button->East on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports eth_restart_tx_rx]

### LEDs
set_property PACKAGE_PIN AT32 [get_ports eth_rx_gt_locked_led]
#GPIO LED0 on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports eth_rx_gt_locked_led]
##
set_property PACKAGE_PIN AV34 [get_ports eth_rx_block_lock_led]
#GPIO LED1 on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports eth_rx_block_lock_led]
##
set_property PACKAGE_PIN AY30 [get_ports {eth_completion_status[0]}]
#GPIO LED2 on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports {eth_completion_status[0]}]
##
set_property PACKAGE_PIN BB32 [get_ports {eth_completion_status[1]}]
#GPIO LED3 on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports {eth_completion_status[1]}]
##
set_property PACKAGE_PIN BF32 [get_ports {eth_completion_status[2]}]
#GPIO LED4 on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports {eth_completion_status[2]}]
##
set_property PACKAGE_PIN AV36 [get_ports {eth_completion_status[3]}]
#GPIO LED5 on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports {eth_completion_status[3]}]
##
set_property PACKAGE_PIN AY35 [get_ports {eth_completion_status[4]}]
#GPIO LED6 on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports {eth_completion_status[4]}]

set_property PACKAGE_PIN BC40 [get_ports send_continous_pkts]
#GPIO Dip-switch->SW0 on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports send_continous_pkts]


# Location constraints for other example design top-level ports
# Note: uncomment the following set_property constraints and replace "<>" with appropriate pin locations for your board
# ----------------------------------------------------------------------------------------------------------------------
set_property PACKAGE_PIN G22 [get_ports xgpon_gt_clk_freerun_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports xgpon_gt_clk_freerun_p]

set_property package_pin AW27 [get_ports hb_gtwiz_reset_all_in] 
#GPIO Push button->Center on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports hb_gtwiz_reset_all_in]

set_property PACKAGE_PIN E34 [get_ports link_down_latched_reset_in] 
#GPIO Push button->North on VCU108 board
set_property IOSTANDARD LVCMOS18 [get_ports link_down_latched_reset_in]

#set_property PACKAGE_PIN BA37 [get_ports link_status_out] 
##GPIO LED7 on VCU108 board
#set_property IOSTANDARD LVCMOS18 [get_ports link_status_out]

#set_property PACKAGE_PIN AV34 [get_ports link_down_latched_out]
#set_property IOSTANDARD LVCMOS12 [get_ports link_down_latched_out]

# Clock constraints for clocks provided as inputs to the core
# Note: the IP core-level XDC constrains clocks produced by the core, which drive user clocks via helper blocks
# ----------------------------------------------------------------------------------------------------------------------
create_clock -period 4.000 -name clk_freerun [get_ports xgpon_gt_clk_freerun_p]

#set_property ADAPT_CFG1 16'h1000 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[6].*gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST}]
#set_property DMONITOR_CFG1 8'h01 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[6].*gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST}]
#set_property RXCDR_CFG0 16'h2000 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[6].*gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST}]
#set_property RXCDR_CFG2 16'h0556 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[6].*gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST}]


set_property ADAPT_CFG1 16'h801E [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[3].*gen_gtye3_channel_inst[0].GTYE3_CHANNEL_PRIM_INST}]
set_property DMONITOR_CFG1 8'h01 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[3].*gen_gtye3_channel_inst[0].GTYE3_CHANNEL_PRIM_INST}]
set_property RXCDR_CFG0 16'h0801 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[3].*gen_gtye3_channel_inst[0].GTYE3_CHANNEL_PRIM_INST}]
set_property RXCDR_CFG1 16'h4A00 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[3].*gen_gtye3_channel_inst[0].GTYE3_CHANNEL_PRIM_INST}]
set_property RXCDR_CFG2 16'h01D9 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[3].*gen_gtye3_channel_inst[0].GTYE3_CHANNEL_PRIM_INST}]
set_property RXCDR_CFG4 16'h100A [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[3].*gen_gtye3_channel_inst[0].GTYE3_CHANNEL_PRIM_INST}]
set_property RXDFE_GC_CFG2 16'h0010 [get_cells -hierarchical -filter {NAME =~ *gen_channel_container[3].*gen_gtye3_channel_inst[0].GTYE3_CHANNEL_PRIM_INST}]

#constrain DMON_CLK to Line_rate/GT_internal_data_width = 10.3125Gbps/32 = 322.26MHz
#Therefore Period = 1/322.26MHz = 3.103ns
create_clock -period 3.103 -name DMON_CLK -waveform {0.000 1.5515} [get_pins -hierarchical -filter {NAME =~ */dmonClk_BUFG_0/O}]
create_clock -period 4.000 -name DRP_CLK -waveform {0.000 2.000} [get_pins -hierarchical -filter {NAME =~ */drpClk_BUFG/O}]

#Place the DrpClk BUFG and DmonClk BUFG to the same clock region or adjacent the transceiver GT. here we are using qsfp GTY X0Y12 at clock region X0Y3.
# If we look at the floor planning, There are no BUFGs available in the clock region X0Y3. The nearest Clock regions with available BUGFs are 
#X2Y0, X2Y1, X2Y2, X2Y3. On the io-planning layout, it seems X0Y3 is the nearest among them. So we choose a BUFGCE form X2Y3 clock region at BUFG site X0Y72
#for dmonClk_BUFG and BUFGCE from X2Y2 clock region at BUFG site X0Y50
set_property LOC BUFGCE_X0Y72 [get_cells GTH_eth_10G_to_XG_PON_if_inst/Xg_PON_if_qsfp_gty/dmonClk_BUFG_0]
set_property LOC BUFGCE_X0Y50 [get_cells GTH_eth_10G_to_XG_PON_if_inst/Xg_PON_if_qsfp_gty/drpClk_BUFG]

# False path constraints
# ----------------------------------------------------------------------------------------------------------------------
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *_cdc_sync_2stage*/i_in_meta_reg}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *_cdc_sync_2stage*/*stg_1_meta_reg*/D}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *bit_sync*inst/*_meta_reg*/D}]

##set_false_path -to [get_cells -hierarchical -filter {NAME =~ *reset_synchronizer*inst/rst_in_*_reg}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *reset_sync*inst/rst_in_meta_reg/D}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *reset_sync*inst/rst_in_meta_reg/PRE}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *reset_sync*inst/rst_in_sync1_reg/PRE}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *reset_sync*inst/rst_in_sync2_reg/PRE}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *reset_sync*inst/rst_in_sync3_reg/PRE}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *reset_sync*inst/rst_in_out_reg/PRE}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *_BCDR_inst_0/u_reset_sync/stretch_r_reg*/PRE}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *_BCDR_inst_0/u_sob_stretch_dmon_inst/stretch_r_reg*/PRE}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *_BCDR_inst_0/u_sob_stretch_dmon_inst/sync2_r_reg*/D}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *_BCDR_inst_0/u_sob_stretch_inst/stretch_r_reg*/PRE}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *_BCDR_inst_0/u_sob_stretch_inst/sync2_r_reg*/D}]




### Any other Constraints
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *_pkt_gen_mon_*/*/*_cdc_to_reg*/D}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *_pkt_gen_mon/*/*_cdc_to_reg*/D}]

set_false_path -to [get_pins -hierarchical -filter {NAME =~ *xg_PON_frame_sync_*/*/*_cdc_to_reg*/D}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *Xg_PON_if_*/*/*_cdc_to_reg*/D}]

#set_false_path -from [get_pins -hierarchical -filter {NAME =~ *_emulator_inst/vio_top_wrapper_inst/vio_top_inst/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT*.PROBE_OUT0_INST/Probe_out_reg*/C}] -to [get_pins -hierarchical -filter {NAME =~ *_emulator_inst/*_debug.eth_tx_axis_ila/inst/ila_core_inst/shifted_data_in_reg*_srl8/D}]
#set_false_path -from [get_pins -hierarchical -filter {NAME =~ *_emulator_inst/vio_top_wrapper_inst/vio_top_inst/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT*.PROBE_OUT0_INST/Probe_out_reg*/C}] -to [get_pins -hierarchical -filter {NAME =~ *_emulator_inst/PRBS_Generator_inst/ControlledBurstGen_inst/inst/init_data_reg*/CE}]
#set_false_path -from [get_pins -hierarchical -filter {NAME =~ *_XG_PON_if_inst/*_cdc_fifo_inst/lb_fifo_inst/U0/inst_fifo_gen/*.inst_prim/gf36e2_inst.sngfifo36e2/RDCLK}]
#set_false_path -to [get_pins -hierarchical -filter {NAME =~ *_XG_PON_if_inst/*_cdc_fifo_inst/lb_fifo_inst/U0/inst_fifo_gen/*.inst_prim/gf36e2_inst.sngfifo36e2/DIN*}]
#set_false_path -from [get_pins -hierarchical -filter {NAME =~ *_emulator_inst/Burst_checker_*_inst/inst/total_bits_accum_pre_reg*/C}] -to [get_pins -hierarchical -filter {NAME =~ *_emulator_inst/Burst_checker_*_inst/inst/total_bits_accumulated_V_1_data_reg_reg*/D}]
#set_false_path -to [get_pins -hierarchical -filter {NAME =~ *_emulator_inst/vio_top_wrapper_inst/vio_top_inst/inst/PROBE_IN_INST/probe_in_reg_reg*/D}]


set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins -hierarchical -filter {NAME =~ */channel_inst/*_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks -of_objects [get_pins -hierarchical -filter {NAME =~ */channel_inst/*_CHANNEL_PRIM_INST/TXOUTCLK}]] 2.560
set_max_delay -datapath_only -from [get_clocks -of_objects [get_pins -hierarchical -filter {NAME =~ */channel_inst/*_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks -of_objects [get_pins -hierarchical -filter {NAME =~ */channel_inst/*_CHANNEL_PRIM_INST/RXOUTCLK}]] 2.560
set_max_delay -from [get_clocks -of_objects [get_pins -hierarchical -filter {NAME =~ */channel_inst/*_CHANNEL_PRIM_INST/RXOUTCLK}]] -to [get_clocks dclk] -datapath_only 2.56
set_max_delay -from [get_clocks -of_objects [get_pins -hierarchical -filter {NAME =~ */channel_inst/*_CHANNEL_PRIM_INST/TXOUTCLK}]] -to [get_clocks dclk] -datapath_only 2.56
set_max_delay -from [get_clocks dclk] -to [get_clocks -of_objects [get_pins -hierarchical -filter {NAME =~ */channel_inst/*_CHANNEL_PRIM_INST/TXOUTCLK}]] -datapath_only 10.000
set_max_delay -from [get_clocks dclk] -to [get_clocks -of_objects [get_pins -hierarchical -filter {NAME =~ */channel_inst/*_CHANNEL_PRIM_INST/RXOUTCLK}]] -datapath_only 10.000


set_property PACKAGE_PIN E36 [get_ports microblaze_reset]
set_property IOSTANDARD LVCMOS18 [get_ports microblaze_reset]

#System Control Related Constraints
#I2C on SFP channel0, SCLK (MOD_DEF1) and SDATA (MOD_DEF2) on FM-S14
#is connected to FMC LA_16_P and LA_16_N respectively. This are following
#pin locations on VCU108 when FM-S14 is connected in FMC HPC0 slot
set_property PACKAGE_PIN AY8 [get_ports iic_fmc_hpc0_sfp0_scl]
set_property PACKAGE_PIN AY7 [get_ports iic_fmc_hpc0_sfp0_sda]
set_property IOSTANDARD LVCMOS18 [get_ports iic_fmc_hpc0_sfp0_scl]
set_property IOSTANDARD LVCMOS18 [get_ports iic_fmc_hpc0_sfp0_sda]

#Clock generator GBTCLK0, SCLK and SDATA of FM-S14 is connected to
#FMC LA_00_CC_P and LA_00_CC_N respectively. This are the following
#pin locations on VCU108 when FM-S14 is connected in FMC HPC0 slot
set_property PACKAGE_PIN AY9 [get_ports iic_fmc_hpc0_osc0_scl]
set_property PACKAGE_PIN BA9 [get_ports iic_fmc_hpc0_osc0_sda]
set_property IOSTANDARD LVCMOS18 [get_ports iic_fmc_hpc0_osc0_scl]
set_property IOSTANDARD LVCMOS18 [get_ports iic_fmc_hpc0_osc0_sda]

#Clock generator GBTCLK1, SCLK and SDATA of FM-S14 is connected to
#FMC LA_01_CC_P and LA_01_CC_N respectively. This are the following
#pin locations on VCU108 when FM-S14 is connected in FMC HPC0 slot
set_property PACKAGE_PIN BC10 [get_ports iic_fmc_hpc0_osc1_scl]
set_property PACKAGE_PIN BD10 [get_ports iic_fmc_hpc0_osc1_sda]
set_property IOSTANDARD LVCMOS18 [get_ports iic_fmc_hpc0_osc1_scl]
set_property IOSTANDARD LVCMOS18 [get_ports iic_fmc_hpc0_osc1_sda]

#setting internal pull up resistors and and slew properties
set_property DRIVE 8 [get_ports iic_fmc_hpc0_sfp0_scl]
set_property DRIVE 8 [get_ports iic_fmc_hpc0_sfp0_sda]
set_property SLEW SLOW [get_ports iic_fmc_hpc0_sfp0_scl]
set_property SLEW SLOW [get_ports iic_fmc_hpc0_sfp0_sda]

set_property DRIVE 8 [get_ports iic_fmc_hpc0_osc0_scl]
set_property DRIVE 8 [get_ports iic_fmc_hpc0_osc0_sda]
set_property SLEW SLOW [get_ports iic_fmc_hpc0_osc0_scl]
set_property SLEW SLOW [get_ports iic_fmc_hpc0_osc0_sda]

set_property DRIVE 8 [get_ports iic_fmc_hpc0_osc1_scl]
set_property DRIVE 8 [get_ports iic_fmc_hpc0_osc1_sda]
set_property SLEW SLOW [get_ports iic_fmc_hpc0_osc1_scl]
set_property SLEW SLOW [get_ports iic_fmc_hpc0_osc1_sda]

#set_property OUTPUT_IMPEDANCE RDRV_NONE_NONE [get_ports iic_fmc_hpc0_sfp0_scl_io]
#set_property OUTPUT_IMPEDANCE RDRV_NONE_NONE [get_ports iic_fmc_hpc0_sfp0_sda_io]
#set_property OUTPUT_IMPEDANCE RDRV_NONE_NONE [get_ports iic_fmc_hpc0_osc0_scl_io]
#set_property OUTPUT_IMPEDANCE RDRV_NONE_NONE [get_ports iic_fmc_hpc0_osc0_sda_io]
#set_property OUTPUT_IMPEDANCE RDRV_NONE_NONE [get_ports iic_fmc_hpc0_osc1_scl_io]
#set_property OUTPUT_IMPEDANCE RDRV_NONE_NONE [get_ports iic_fmc_hpc0_osc1_sda_io]

set_property PULLUP true [get_ports iic_fmc_hpc0_sfp0_scl]
set_property PULLUP true [get_ports iic_fmc_hpc0_sfp0_sda]
set_property PULLUP true [get_ports iic_fmc_hpc0_osc0_scl]
set_property PULLUP true [get_ports iic_fmc_hpc0_osc0_sda]
set_property PULLUP true [get_ports iic_fmc_hpc0_osc1_scl]
set_property PULLUP true [get_ports iic_fmc_hpc0_osc1_sda]

#set_property OFFCHIP_TERM NONE [get_ports iic_fmc_hpc0_sfp0_scl_io]
#set_property OFFCHIP_TERM NONE [get_ports iic_fmc_hpc0_sfp0_sda_io]
#set_property OFFCHIP_TERM NONE [get_ports iic_fmc_hpc0_osc0_scl_io]
#set_property OFFCHIP_TERM NONE [get_ports iic_fmc_hpc0_osc0_sda_io]
#set_property OFFCHIP_TERM NONE [get_ports iic_fmc_hpc0_osc1_scl_io]
#set_property OFFCHIP_TERM NONE [get_ports iic_fmc_hpc0_osc1_sda_io]


connect_debug_port dbg_hub/clk [get_nets dclk]









