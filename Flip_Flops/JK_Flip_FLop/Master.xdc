set_property PACKAGE_PIN W5 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK]


#INPUT
set_property PACKAGE_PIN V17 [get_ports {J}]
set_property IOSTANDARD LVCMOS33 [get_ports {J}]
set_property PACKAGE_PIN V16 [get_ports {K}]
set_property IOSTANDARD LVCMOS33 [get_ports {K}]
#OUT
set_property PACKAGE_PIN U16 [get_ports {Q}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q}]
set_property PACKAGE_PIN E19 [get_ports {QB}]
set_property IOSTANDARD LVCMOS33 [get_ports {QB}]