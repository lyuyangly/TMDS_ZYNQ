// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Sat Jul 17 18:48:15 2021
// Host        : LyuYang-PC running 64-bit LMDE 4 (debbie)
// Command     : write_verilog -force -mode synth_stub
//               /home/lyuyang/WORK/ZYNQ_TEST/vivado/ZYNQ_TEST.srcs/sources_1/ip/TMDSClkGen/TMDSClkGen_stub.v
// Design      : TMDSClkGen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module TMDSClkGen(clk_in1, clk_out1, clk_out2, clk_out3)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_out1,clk_out2,clk_out3" */;
  input clk_in1;
  output clk_out1;
  output clk_out2;
  output clk_out3;
endmodule
