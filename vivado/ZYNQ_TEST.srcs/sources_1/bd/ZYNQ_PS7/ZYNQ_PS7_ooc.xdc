################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name S_AXI_GP0_ACLK -period 10 [get_ports S_AXI_GP0_ACLK]
create_clock -name PS7_FCLK_CLK0 -period 20 [get_pins PS7/FCLK_CLK0]
create_clock -name PS7_FCLK_CLK1 -period 20 [get_pins PS7/FCLK_CLK1]
create_clock -name PS7_FCLK_CLK2 -period 20 [get_pins PS7/FCLK_CLK2]
create_clock -name PS7_FCLK_CLK3 -period 20 [get_pins PS7/FCLK_CLK3]

################################################################################