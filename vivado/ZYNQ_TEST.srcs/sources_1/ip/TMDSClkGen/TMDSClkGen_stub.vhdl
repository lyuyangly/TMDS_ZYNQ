-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Sat Jul 17 18:48:16 2021
-- Host        : LyuYang-PC running 64-bit LMDE 4 (debbie)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/lyuyang/WORK/ZYNQ_TEST/vivado/ZYNQ_TEST.srcs/sources_1/ip/TMDSClkGen/TMDSClkGen_stub.vhdl
-- Design      : TMDSClkGen
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TMDSClkGen is
  Port ( 
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC
  );

end TMDSClkGen;

architecture stub of TMDSClkGen is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_in1,clk_out1,clk_out2,clk_out3";
begin
end;
