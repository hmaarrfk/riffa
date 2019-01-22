# ----------------------------------------------------------------------
# Copyright (c) 2016, The Regents of the University of California All
# rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#
#     * Neither the name of The Regents of the University of California
#       nor the names of its contributors may be used to endorse or
#       promote products derived from this software without specific
#       prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL REGENTS OF THE
# UNIVERSITY OF CALIFORNIA BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
# DAMAGE.
# ----------------------------------------------------------------------
# With contributions from
# Mark Harfouche (Ramona Optics)
#----------------------------------------------------------------------------
# Filename:            ZCU106_Top.xdc
# Version:             1.00.a
# Verilog Standard:    Verilog-2001
# Description:         Xilinx Design Constraints for the ZCU106 board.
# These constrain the PCIE_REFCLK, its DSBUF, LED Pins, and PCIE_RESET_N pin
#
# Authors:              Dustin Richmond (@darichmond)
#                       Mark Harfouche (@hmaarrfk)
#-----------------------------------------------------------------------------
#
#########################################################################################################################
# User Constraints
#########################################################################################################################

###############################################################################
# User Time Names / User Time Groups / Time Specs
###############################################################################

###############################################################################
# User Physical Constraints
###############################################################################

#
# LED Status Indicators for Example Design.
# LED 0-2 should be all ON if link is up and functioning correctly
# LED 3 should be blinking if user application is receiving valid clock
#

#System Reset, User Reset, User Link Up, User Clk Heartbeat


#########################################################################################################################
# End User Constraints
#########################################################################################################################
#
#
#
#########################################################################################################################
# PCIE Core Constraints
#########################################################################################################################

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

set_property IOSTANDARD LVCMOS18 [get_port PCIE_RESET_N]
set_property PACKAGE_PIN L8      [get_port PCIE_RESET_N]
set_property PULLUP true [get_ports PCIE_RESET_N]

set_property IOSTANDARD LVCMOS12 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {LED[3]}]

set_property PACKAGE_PIN AL11    [get_ports {LED[0]}]
set_property PACKAGE_PIN AL13    [get_ports {LED[1]}]
set_property PACKAGE_PIN AK13    [get_ports {LED[2]}]
set_property PACKAGE_PIN AE15    [get_ports {LED[3]}]

set_false_path -to [get_ports -filter NAME=~LED*]

# ZCU106 PCIe board settings
# Their board definition file and their documentation are not consistent.....
# they flipped the pin number of RX[3] and RX[2]
# Does laneswizzling help>????
# https://teledynelecroy.com/doc/understanding-lane-reversal-and-polarity
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


set_property PACKAGE_PIN AB7 [get_ports PCIE_REFCLK_N]
set_property PACKAGE_PIN AB8 [get_ports PCIE_REFCLK_P]

###############################################################################
# Timing Constraints
###############################################################################
create_clock -period 10.000 -name pcie_refclk [get_pins refclk_ibuf/O]

###############################################################################
# Physical Constraints
###############################################################################

set_false_path -from [get_ports PCIE_RESET_N]
###############################################################################
# End
###############################################################################
