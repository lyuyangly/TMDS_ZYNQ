
################################################################
# This is a generated script based on design: ZYNQ_PS7
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source ZYNQ_PS7_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z020clg400-2

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name ZYNQ_PS7

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set S_AXI_GP0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_GP0 ]
  set_property -dict [ list CONFIG.ADDR_WIDTH {32} CONFIG.ARUSER_WIDTH {0} CONFIG.AWUSER_WIDTH {0} CONFIG.BUSER_WIDTH {0} CONFIG.DATA_WIDTH {32} CONFIG.FREQ_HZ {100000000} CONFIG.ID_WIDTH {6} CONFIG.MAX_BURST_LENGTH {16} CONFIG.NUM_READ_OUTSTANDING {8} CONFIG.NUM_WRITE_OUTSTANDING {8} CONFIG.PHASE {0.000} CONFIG.PROTOCOL {AXI3} CONFIG.READ_WRITE_MODE {READ_WRITE} CONFIG.RUSER_WIDTH {0} CONFIG.SUPPORTS_NARROW_BURST {1} CONFIG.WUSER_WIDTH {0}  ] $S_AXI_GP0

  # Create ports
  set FCLK_CLK0 [ create_bd_port -dir O -type clk FCLK_CLK0 ]
  set FCLK_CLK1 [ create_bd_port -dir O -type clk FCLK_CLK1 ]
  set FCLK_CLK2 [ create_bd_port -dir O -type clk FCLK_CLK2 ]
  set FCLK_CLK3 [ create_bd_port -dir O -type clk FCLK_CLK3 ]
  set FCLK_RESET0_N [ create_bd_port -dir O -type rst FCLK_RESET0_N ]
  set FCLK_RESET1_N [ create_bd_port -dir O -type rst FCLK_RESET1_N ]
  set FCLK_RESET2_N [ create_bd_port -dir O -type rst FCLK_RESET2_N ]
  set FCLK_RESET3_N [ create_bd_port -dir O -type rst FCLK_RESET3_N ]
  set S_AXI_GP0_ACLK [ create_bd_port -dir I -type clk S_AXI_GP0_ACLK ]

  # Create instance: PS7, and set properties
  set PS7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 PS7 ]
  set_property -dict [ list CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_EN_CLK0_PORT {1} CONFIG.PCW_EN_CLK1_PORT {1} \
CONFIG.PCW_EN_CLK2_PORT {1} CONFIG.PCW_EN_CLK3_PORT {1} \
CONFIG.PCW_EN_RST0_PORT {1} CONFIG.PCW_EN_RST1_PORT {1} \
CONFIG.PCW_EN_RST2_PORT {1} CONFIG.PCW_EN_RST3_PORT {1} \
CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {0} CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} CONFIG.PCW_MIO_0_PULLUP {disabled} \
CONFIG.PCW_MIO_10_PULLUP {disabled} CONFIG.PCW_MIO_11_PULLUP {disabled} \
CONFIG.PCW_MIO_12_PULLUP {disabled} CONFIG.PCW_MIO_13_PULLUP {disabled} \
CONFIG.PCW_MIO_14_PULLUP {disabled} CONFIG.PCW_MIO_15_PULLUP {disabled} \
CONFIG.PCW_MIO_16_SLEW {fast} CONFIG.PCW_MIO_17_SLEW {fast} \
CONFIG.PCW_MIO_18_SLEW {fast} CONFIG.PCW_MIO_19_SLEW {fast} \
CONFIG.PCW_MIO_1_SLEW {fast} CONFIG.PCW_MIO_20_SLEW {fast} \
CONFIG.PCW_MIO_21_SLEW {fast} CONFIG.PCW_MIO_22_SLEW {fast} \
CONFIG.PCW_MIO_23_SLEW {fast} CONFIG.PCW_MIO_24_SLEW {fast} \
CONFIG.PCW_MIO_25_SLEW {fast} CONFIG.PCW_MIO_26_SLEW {fast} \
CONFIG.PCW_MIO_27_SLEW {fast} CONFIG.PCW_MIO_28_SLEW {fast} \
CONFIG.PCW_MIO_29_SLEW {fast} CONFIG.PCW_MIO_2_SLEW {fast} \
CONFIG.PCW_MIO_30_SLEW {fast} CONFIG.PCW_MIO_31_SLEW {fast} \
CONFIG.PCW_MIO_32_SLEW {fast} CONFIG.PCW_MIO_33_SLEW {fast} \
CONFIG.PCW_MIO_34_SLEW {fast} CONFIG.PCW_MIO_35_SLEW {fast} \
CONFIG.PCW_MIO_36_SLEW {fast} CONFIG.PCW_MIO_37_SLEW {fast} \
CONFIG.PCW_MIO_38_SLEW {fast} CONFIG.PCW_MIO_39_SLEW {fast} \
CONFIG.PCW_MIO_3_SLEW {fast} CONFIG.PCW_MIO_40_SLEW {fast} \
CONFIG.PCW_MIO_41_SLEW {fast} CONFIG.PCW_MIO_42_SLEW {fast} \
CONFIG.PCW_MIO_43_SLEW {fast} CONFIG.PCW_MIO_44_SLEW {fast} \
CONFIG.PCW_MIO_45_SLEW {fast} CONFIG.PCW_MIO_47_PULLUP {disabled} \
CONFIG.PCW_MIO_4_SLEW {fast} CONFIG.PCW_MIO_50_PULLUP {disabled} \
CONFIG.PCW_MIO_51_PULLUP {disabled} CONFIG.PCW_MIO_5_SLEW {fast} \
CONFIG.PCW_MIO_6_SLEW {fast} CONFIG.PCW_MIO_9_PULLUP {disabled} \
CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {0} CONFIG.PCW_TTC1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J256M16 RE-125} CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_USB0_RESET_ENABLE {1} CONFIG.PCW_USB0_RESET_IO {MIO 46} \
CONFIG.PCW_USB0_USB0_IO {MIO 28 .. 39} CONFIG.PCW_USE_AXI_NONSECURE {0} \
CONFIG.PCW_USE_DMA0 {0} CONFIG.PCW_USE_DMA1 {0} \
CONFIG.PCW_USE_DMA2 {0} CONFIG.PCW_USE_DMA3 {0} \
CONFIG.PCW_USE_M_AXI_GP0 {0} CONFIG.PCW_USE_S_AXI_GP0 {1} \
CONFIG.PCW_WDT_PERIPHERAL_ENABLE {0}  ] $PS7

  # Create interface connections
  connect_bd_intf_net -intf_net PS7_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins PS7/DDR]
  connect_bd_intf_net -intf_net PS7_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins PS7/FIXED_IO]
  connect_bd_intf_net -intf_net S_AXI_GP0_1 [get_bd_intf_ports S_AXI_GP0] [get_bd_intf_pins PS7/S_AXI_GP0]

  # Create port connections
  connect_bd_net -net PS7_FCLK_CLK0 [get_bd_ports FCLK_CLK0] [get_bd_pins PS7/FCLK_CLK0]
  connect_bd_net -net PS7_FCLK_CLK1 [get_bd_ports FCLK_CLK1] [get_bd_pins PS7/FCLK_CLK1]
  connect_bd_net -net PS7_FCLK_CLK2 [get_bd_ports FCLK_CLK2] [get_bd_pins PS7/FCLK_CLK2]
  connect_bd_net -net PS7_FCLK_CLK3 [get_bd_ports FCLK_CLK3] [get_bd_pins PS7/FCLK_CLK3]
  connect_bd_net -net PS7_FCLK_RESET0_N [get_bd_ports FCLK_RESET0_N] [get_bd_pins PS7/FCLK_RESET0_N]
  connect_bd_net -net PS7_FCLK_RESET1_N [get_bd_ports FCLK_RESET1_N] [get_bd_pins PS7/FCLK_RESET1_N]
  connect_bd_net -net PS7_FCLK_RESET2_N [get_bd_ports FCLK_RESET2_N] [get_bd_pins PS7/FCLK_RESET2_N]
  connect_bd_net -net PS7_FCLK_RESET3_N [get_bd_ports FCLK_RESET3_N] [get_bd_pins PS7/FCLK_RESET3_N]
  connect_bd_net -net S_AXI_GP0_ACLK_1 [get_bd_ports S_AXI_GP0_ACLK] [get_bd_pins PS7/S_AXI_GP0_ACLK]

  # Create address segments
  create_bd_addr_seg -range 0x80000000 -offset 0x0 [get_bd_addr_spaces S_AXI_GP0] [get_bd_addr_segs PS7/S_AXI_GP0/GP0_DDR_LOWOCM] SEG_PS7_GP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x400000 -offset 0xE0000000 [get_bd_addr_spaces S_AXI_GP0] [get_bd_addr_segs PS7/S_AXI_GP0/GP0_IOP] SEG_PS7_GP0_IOP
  create_bd_addr_seg -range 0x1000000 -offset 0xFC000000 [get_bd_addr_spaces S_AXI_GP0] [get_bd_addr_segs PS7/S_AXI_GP0/GP0_QSPI_LINEAR] SEG_PS7_GP0_QSPI_LINEAR
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


