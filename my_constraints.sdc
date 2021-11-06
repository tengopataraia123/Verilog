## Generated SDC file "C:/Users/user/Desktop/Verilog/my_constraints.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.1 Build 720 11/11/2020 Patches 1.02i SJ Lite Edition"

## DATE    "Sat Nov 06 11:47:29 2021"

##
## DEVICE  "5CSEMA4U23C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {actual_clock} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {actual_clock}] -rise_to [get_clocks {actual_clock}] -setup 0.170  
set_clock_uncertainty -rise_from [get_clocks {actual_clock}] -rise_to [get_clocks {actual_clock}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {actual_clock}] -fall_to [get_clocks {actual_clock}] -setup 0.170  
set_clock_uncertainty -rise_from [get_clocks {actual_clock}] -fall_to [get_clocks {actual_clock}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {actual_clock}] -rise_to [get_clocks {actual_clock}] -setup 0.170  
set_clock_uncertainty -fall_from [get_clocks {actual_clock}] -rise_to [get_clocks {actual_clock}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {actual_clock}] -fall_to [get_clocks {actual_clock}] -setup 0.170  
set_clock_uncertainty -fall_from [get_clocks {actual_clock}] -fall_to [get_clocks {actual_clock}] -hold 0.060  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {SW[0]}]
set_input_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {SW[1]}]
set_input_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {SW[2]}]
set_input_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {SW[3]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {LED[0]}]
set_output_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {LED[1]}]
set_output_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {LED[2]}]
set_output_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {LED[3]}]
set_output_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {LED[4]}]
set_output_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {LED[5]}]
set_output_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {LED[6]}]
set_output_delay -add_delay  -clock [get_clocks {actual_clock}]  1.000 [get_ports {LED[7]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

