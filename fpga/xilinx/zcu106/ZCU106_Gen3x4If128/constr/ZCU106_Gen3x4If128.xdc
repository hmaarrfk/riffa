#
# SYS reset (input) signal.  The sys_reset_n signal should be
# obtained from the PCI Express interface if possible.  For
# slot based form factors, a system reset signal is usually
# present on the connector.  For cable based form factors, a
# system reset signal may not be available.  In this case, the
# system reset signal must be generated locally by some form of
# supervisory circuit.  You may change the IOSTANDARD and LOC
# to suit your requirements and VCCO voltage banking rules.
# Some 7 series devices do not have 3.3 V I/Os available.
# Therefore the appropriate level shift is required to operate
# with these devices that contain only 1.8 V banks.
#

# See the PCIe example design for this
# set_property BOARD_PART_PIN pcie_perstn_rst [get_ports pcie_perstn]
set_property PULLUP true [get_ports PCIE_RESET_N]
set_property IOSTANDARD LVCMOS18 [get_port PCIE_RESET_N]
set_property PACKAGE_PIN L8      [get_port PCIE_RESET_N]
set_false_path -from [get_ports PCIE_RESET_N]

#
# LED Status Indicators for Example Design.
# LED 0-2 should be all ON if link is up and functioning correctly
# LED 3 should be blinking if user application is receiving valid clock
#

set_property IOSTANDARD LVCMOS12 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS12 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS12 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS12 [get_ports {LED[7]}]

set_property PACKAGE_PIN AL11    [get_ports {LED[0]}]
set_property PACKAGE_PIN AL13    [get_ports {LED[1]}]
set_property PACKAGE_PIN AK13    [get_ports {LED[2]}]
set_property PACKAGE_PIN AE15    [get_ports {LED[3]}]
set_property PACKAGE_PIN AM8     [get_ports {LED[4]}]
set_property PACKAGE_PIN AM9     [get_ports {LED[5]}]
set_property PACKAGE_PIN AM10    [get_ports {LED[6]}]
set_property PACKAGE_PIN AM11    [get_ports {LED[7]}]

# Decrease the drive strenght to ensure that we can have high speed ports
# on the same banks
set_property DRIVE 8 [get_ports {LED[0]}]
set_property DRIVE 8 [get_ports {LED[1]}]
set_property DRIVE 8 [get_ports {LED[2]}]
set_property DRIVE 8 [get_ports {LED[3]}]
set_property DRIVE 8 [get_ports {LED[4]}]
set_property DRIVE 8 [get_ports {LED[5]}]
set_property DRIVE 8 [get_ports {LED[6]}]
set_property DRIVE 8 [get_ports {LED[7]}]

# This tells the optimizer not to worry about optimizing paths to the LEDs
set_false_path -to [get_ports -filter NAME=~LED*]

# ZCU106 PCIe board settings
# Their board definition file and their documentation are not consistent.....
# they flipped the pin number of RX[3] and RX[2]
# Does laneswizzling help>????
# https://teledynelecroy.com/doc/understanding-lane-reversal-and-polarity
# Something really weird is going on when I look at the final constraints
# file.
# You can export it with the tcl command
#     write_xdc test.xdc
# But RX[3] and RX[2] are not visible in that document.
set_property PACKAGE_PIN AJ2 [get_ports {PCI_EXP_RXP[3]}]
set_property PACKAGE_PIN AJ1 [get_ports {PCI_EXP_RXN[3]}]
set_property PACKAGE_PIN AH4 [get_ports {PCI_EXP_TXP[3]}]
set_property PACKAGE_PIN AH3 [get_ports {PCI_EXP_TXN[3]}]

set_property PACKAGE_PIN AG2 [get_ports {PCI_EXP_RXP[2]}]
set_property PACKAGE_PIN AG1 [get_ports {PCI_EXP_RXN[2]}]
set_property PACKAGE_PIN AG6 [get_ports {PCI_EXP_TXP[2]}]
set_property PACKAGE_PIN AG5 [get_ports {PCI_EXP_TXN[2]}]

set_property PACKAGE_PIN AF4 [get_ports {PCI_EXP_RXP[1]}]
set_property PACKAGE_PIN AF3 [get_ports {PCI_EXP_RXN[1]}]
set_property PACKAGE_PIN AE6 [get_ports {PCI_EXP_TXP[1]}]
set_property PACKAGE_PIN AE5 [get_ports {PCI_EXP_TXN[1]}]

set_property PACKAGE_PIN AE2 [get_ports {PCI_EXP_RXP[0]}]
set_property PACKAGE_PIN AE1 [get_ports {PCI_EXP_RXN[0]}]
set_property PACKAGE_PIN AD4 [get_ports {PCI_EXP_TXP[0]}]
set_property PACKAGE_PIN AD3 [get_ports {PCI_EXP_TXN[0]}]


set_property PACKAGE_PIN AB7 [get_ports sys_clk_n]
set_property PACKAGE_PIN AB8 [get_ports sys_clk_p]

create_clock -period 10.000 -name sys_clk [get_ports sys_clk_p]