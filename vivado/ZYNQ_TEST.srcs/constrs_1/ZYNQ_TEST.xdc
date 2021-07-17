set_property PACKAGE_PIN K17 [get_ports ClkIn]
set_property PACKAGE_PIN E17 [get_ports RstB]
set_property PACKAGE_PIN M15 [get_ports {LED[3]}]
set_property PACKAGE_PIN G14 [get_ports {LED[2]}]
set_property PACKAGE_PIN M17 [get_ports {LED[1]}]
set_property PACKAGE_PIN G15 [get_ports {LED[0]}]
set_property PACKAGE_PIN M19 [get_ports {KEY[3]}]
set_property PACKAGE_PIN M20 [get_ports {KEY[2]}]
set_property PACKAGE_PIN L16 [get_ports {KEY[1]}]
set_property PACKAGE_PIN F16 [get_ports {KEY[0]}]
set_property PACKAGE_PIN H16 [get_ports TMDSClk_P]
set_property PACKAGE_PIN D19 [get_ports {TMDSData_P[0]}]
set_property PACKAGE_PIN C20 [get_ports {TMDSData_P[1]}]
set_property PACKAGE_PIN B19 [get_ports {TMDSData_P[2]}]
set_property PACKAGE_PIN F17 [get_ports HDMIOutEN]

set_property IOSTANDARD LVCMOS33 [get_ports ClkIn]
set_property IOSTANDARD LVCMOS33 [get_ports RstB]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {KEY[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports HDMIOutEN]

set_clock_groups -asynchronous -group clk_fpga_0 -group clk_fpga_1 -group clk_fpga_2 -group clk_fpga_3 -group clk_out1_TMDSClkGen -group clk_out2_TMDSClkGen -group clk_out3_TMDSClkGen

