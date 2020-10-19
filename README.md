# GTH ethernet-10G to Xg-PON GTH/GTY to connect with vOLT

#### Author - Sandip Das

This project creates a 10G ethernet core to interface with vOLT or on-board ethernet emulator ports, and uses the ethernet frames to transfer as a burst over GTH/GTY 10G optical interfaces. Also performs Burst mode recovery at the receive end.


## Recreating this project from tcl generation script
### A. Recreating the hardware project from tcl generation script
To recreate this project, Follow the instructions below.
- Make sure you have vivado full version installed in your system (Design edition or system edition).
- A Valid `Board-license` available for `VCU-108 board`. (Comes with the VCU-108 board)
- A Valid `Board-license` available for `VCU-108 board`. (Comes with the VCU-108 board)
- clone this repository using git clone. It will be cloned on a directory named `GTH_eth_10G_to_PON_GTHGTY` inside the parent directory. This is the project directory.  `https://github.com/prince5290/GTH_eth_10G_to_PON_GTHGTY.git`
- Open vivado tcl shell. On windows, this can be launched from the start menu. In Linux, open a terminal, and run `vivado.sh` in non-gui (`tcl`) mode.
    ```sh
    ./<vivado install dir>/bin/vivado.sh -mode tcl
    ```
- go to the cloned repository
    ```sh
    $ cd <parent dir>/GTH_eth_10G_to_PON_GTHGTY
    $ git status
    ```
- Go to the `sources` sub-directory and run the `recreate_project.tcl` script
    ```sh
    $ cd sources
    $ source recreate_project.tcl
    ```
### B. Creating the Software project in SDK
Once the SDK in launched, the software project cannot be created automatically using the `tcl` script, Please follow the instructions below to recreate the SDK project.
1. create a blank xilinx software application project (make sure to use the exported hardware platform). Use new bsp option
2. For this project, I used project name as `iic_sys_ctrl` and the bsp file was created as `iic_sys_ctrl_bsp`. the hardware platform name was `top_hw_platform_0`.
3. once the project is created, add all the software files from the `sources/sw_sources/` directory.
4. to do this, right click on the src of the procject on the `SDK->import files->General->Filesystem` and then provide the directory to import those files.
5. The project might build automatically once import is done. Perform a `Generate linker script` and followed be give it another build using `ctrl+b` shortcut
6. Check if everything finishes `OK without any error`, `Enjoy`!!
