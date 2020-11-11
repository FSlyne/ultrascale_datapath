open_hw
connect_hw_server

open_hw_target

open_hw_target {localhost:3121/xilinx_tcf/Digilent/210308A3BDF4}

set_property PROGRAM.FILE {C:/axi_eth_10g_to_PON_FMC_GTH/projects/10G_eth_FMC_GTH/10G_eth_FMC_GTH.runs/impl_1/top.bit} [get_hw_devices xcvu095_0]
set_property PROBES.FILE {C:/axi_eth_10g_to_PON_FMC_GTH/projects/10G_eth_FMC_GTH/10G_eth_FMC_GTH.runs/impl_1/top.ltx} [get_hw_devices xcvu095_0]
set_property FULL_PROBES.FILE {C:/axi_eth_10g_to_PON_FMC_GTH/projects/10G_eth_FMC_GTH/10G_eth_FMC_GTH.runs/impl_1/top.ltx} [get_hw_devices xcvu095_0]

current_hw_device [get_hw_devices xcvu095_0_1]
refresh_hw_device [lindex [get_hw_devices xcvu095_0_1] 0]

program_hw_devices [get_hw_devices xcvu095_0]

refresh_hw_device [lindex [get_hw_devices xcvu095_0] 0]

close_hw_target {localhost:3121/xilinx_tcf/Digilent/210308A3BDF4}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

open_hw_target {localhost:3121/xilinx_tcf/Digilent/210308A1CEDF}

set_property PROGRAM.FILE {C:/axi_eth_10g_to_PON_FMC_GTH/projects/10G_eth_FMC_GTH/10G_eth_FMC_GTH.runs/impl_1/top.bit} [get_hw_devices xcvu095_0_1]
set_property PROBES.FILE {C:/axi_eth_10g_to_PON_FMC_GTH/projects/10G_eth_FMC_GTH/10G_eth_FMC_GTH.runs/impl_1/top.ltx} [get_hw_devices xcvu095_0_1]
set_property FULL_PROBES.FILE {C:/axi_eth_10g_to_PON_FMC_GTH/projects/10G_eth_FMC_GTH/10G_eth_FMC_GTH.runs/impl_1/top.ltx} [get_hw_devices xcvu095_0_1]

current_hw_device [get_hw_devices xcvu095_0_1]
refresh_hw_device [lindex [get_hw_devices xcvu095_0_1] 0]

program_hw_devices [get_hw_devices xcvu095_0]

refresh_hw_device [lindex [get_hw_devices xcvu095_0] 0]

close_hw_target {localhost:3121/xilinx_tcf/Digilent/210308A1CEDF}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

open_hw_target {localhost:3121/xilinx_tcf/Digilent/210308A3BDFB}

set_property PROGRAM.FILE {C:/axi_eth_10g_to_PON_FMC_GTH/projects/10G_eth_FMC_GTH/10G_eth_FMC_GTH.runs/impl_1/top.bit} [get_hw_devices xcvu095_0_1]
set_property PROBES.FILE {C:/axi_eth_10g_to_PON_FMC_GTH/projects/10G_eth_FMC_GTH/10G_eth_FMC_GTH.runs/impl_1/top.ltx} [get_hw_devices xcvu095_0_1]
set_property FULL_PROBES.FILE {C:/axi_eth_10g_to_PON_FMC_GTH/projects/10G_eth_FMC_GTH/10G_eth_FMC_GTH.runs/impl_1/top.ltx} [get_hw_devices xcvu095_0_1]

current_hw_device [get_hw_devices xcvu095_0_1]
refresh_hw_device [lindex [get_hw_devices xcvu095_0_1] 0]

program_hw_devices [get_hw_devices xcvu095_0]

refresh_hw_device [lindex [get_hw_devices xcvu095_0] 0]

close_hw_target {localhost:3121/xilinx_tcf/Digilent/210308A3BDFB}
