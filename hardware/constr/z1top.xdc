## This file is a general .xdc for the PYNQ-Z1 board Rev. C
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal 125 MHz

set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { CLK_125MHZ_FPGA }]; #IO_L13P_T2_MRCC_35 Sch=sysclk
create_clock -name sys_clk_pin -period 20.00 -waveform {0 10} -add [get_ports { CLK_125MHZ_FPGA }];

## RGB LEDs

set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports { LEDS[4] }]; #IO_L22N_T3_AD7N_35 Sch=led4_b
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { led4_g }]; #IO_L16P_T2_35 Sch=led4_g
#set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { led4_r }]; #IO_L21P_T3_DQS_AD14P_35 Sch=led4_r
#set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { led5_b }]; #IO_0_35 Sch=led5_b
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { led5_g }]; #IO_L22P_T3_AD7P_35 Sch=led5_g
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { LEDS[5] }]; #IO_L23N_T3_35 Sch=led5_r

## LEDs

set_property -dict { PACKAGE_PIN M21   IOSTANDARD LVCMOS33 } [get_ports { LEDS[0] }]; #IO_L6N_T0_VREF_34 Sch=led[0]
set_property -dict { PACKAGE_PIN L21   IOSTANDARD LVCMOS33 } [get_ports { LEDS[1] }]; #IO_L6P_T0_34 Sch=led[1]
set_property -dict { PACKAGE_PIN K21   IOSTANDARD LVCMOS33 } [get_ports { LEDS[2] }]; #IO_L21N_T3_DQS_AD14N_35 Sch=led[2]
set_property -dict { PACKAGE_PIN K22   IOSTANDARD LVCMOS33 } [get_ports { LEDS[3] }]; #IO_L23P_T3_35 Sch=led[3]

## Buttons

set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { BUTTONS[0] }]; #IO_L4P_T0_35 Sch=btn[0]
set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports { BUTTONS[1] }]; #IO_L4N_T0_35 Sch=btn[1]
set_property -dict { PACKAGE_PIN AA18   IOSTANDARD LVCMOS33 } [get_ports { BUTTONS[2] }]; #IO_L9N_T1_DQS_AD3N_35 Sch=btn[2]
set_property -dict { PACKAGE_PIN AB18   IOSTANDARD LVCMOS33 } [get_ports { BUTTONS[3] }]; #IO_L9P_T1_DQS_AD3P_35 Sch=btn[3]

## Serials

set_property -dict { PACKAGE_PIN R14   IOSTANDARD LVCMOS33 } [get_ports { FPGA_SERIAL_RX }]; #IO_L4P_T0_35 Sch=btn[0]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { FPGA_SERIAL_TX }]; #IO_L4N_T0_35 Sch=btn[1]



