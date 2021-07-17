//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (lin64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Sat Jul 17 14:00:28 2021
//Host        : LyuYang-PC running 64-bit LMDE 4 (debbie)
//Command     : generate_target ZYNQ_PS7.bd
//Design      : ZYNQ_PS7
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ZYNQ_PS7,IP_Integrator,{x_ipProduct=Vivado 2015.2,x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ZYNQ_PS7,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,da_ps7_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "ZYNQ_PS7.hwdef" *) 
module ZYNQ_PS7
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FCLK_CLK0,
    FCLK_CLK1,
    FCLK_CLK2,
    FCLK_CLK3,
    FCLK_RESET0_N,
    FCLK_RESET1_N,
    FCLK_RESET2_N,
    FCLK_RESET3_N,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    S_AXI_GP0_ACLK,
    S_AXI_GP0_araddr,
    S_AXI_GP0_arburst,
    S_AXI_GP0_arcache,
    S_AXI_GP0_arid,
    S_AXI_GP0_arlen,
    S_AXI_GP0_arlock,
    S_AXI_GP0_arprot,
    S_AXI_GP0_arqos,
    S_AXI_GP0_arready,
    S_AXI_GP0_arsize,
    S_AXI_GP0_arvalid,
    S_AXI_GP0_awaddr,
    S_AXI_GP0_awburst,
    S_AXI_GP0_awcache,
    S_AXI_GP0_awid,
    S_AXI_GP0_awlen,
    S_AXI_GP0_awlock,
    S_AXI_GP0_awprot,
    S_AXI_GP0_awqos,
    S_AXI_GP0_awready,
    S_AXI_GP0_awsize,
    S_AXI_GP0_awvalid,
    S_AXI_GP0_bid,
    S_AXI_GP0_bready,
    S_AXI_GP0_bresp,
    S_AXI_GP0_bvalid,
    S_AXI_GP0_rdata,
    S_AXI_GP0_rid,
    S_AXI_GP0_rlast,
    S_AXI_GP0_rready,
    S_AXI_GP0_rresp,
    S_AXI_GP0_rvalid,
    S_AXI_GP0_wdata,
    S_AXI_GP0_wid,
    S_AXI_GP0_wlast,
    S_AXI_GP0_wready,
    S_AXI_GP0_wstrb,
    S_AXI_GP0_wvalid);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  output FCLK_CLK0;
  output FCLK_CLK1;
  output FCLK_CLK2;
  output FCLK_CLK3;
  output FCLK_RESET0_N;
  output FCLK_RESET1_N;
  output FCLK_RESET2_N;
  output FCLK_RESET3_N;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input S_AXI_GP0_ACLK;
  input [31:0]S_AXI_GP0_araddr;
  input [1:0]S_AXI_GP0_arburst;
  input [3:0]S_AXI_GP0_arcache;
  input [5:0]S_AXI_GP0_arid;
  input [3:0]S_AXI_GP0_arlen;
  input [1:0]S_AXI_GP0_arlock;
  input [2:0]S_AXI_GP0_arprot;
  input [3:0]S_AXI_GP0_arqos;
  output S_AXI_GP0_arready;
  input [2:0]S_AXI_GP0_arsize;
  input S_AXI_GP0_arvalid;
  input [31:0]S_AXI_GP0_awaddr;
  input [1:0]S_AXI_GP0_awburst;
  input [3:0]S_AXI_GP0_awcache;
  input [5:0]S_AXI_GP0_awid;
  input [3:0]S_AXI_GP0_awlen;
  input [1:0]S_AXI_GP0_awlock;
  input [2:0]S_AXI_GP0_awprot;
  input [3:0]S_AXI_GP0_awqos;
  output S_AXI_GP0_awready;
  input [2:0]S_AXI_GP0_awsize;
  input S_AXI_GP0_awvalid;
  output [5:0]S_AXI_GP0_bid;
  input S_AXI_GP0_bready;
  output [1:0]S_AXI_GP0_bresp;
  output S_AXI_GP0_bvalid;
  output [31:0]S_AXI_GP0_rdata;
  output [5:0]S_AXI_GP0_rid;
  output S_AXI_GP0_rlast;
  input S_AXI_GP0_rready;
  output [1:0]S_AXI_GP0_rresp;
  output S_AXI_GP0_rvalid;
  input [31:0]S_AXI_GP0_wdata;
  input [5:0]S_AXI_GP0_wid;
  input S_AXI_GP0_wlast;
  output S_AXI_GP0_wready;
  input [3:0]S_AXI_GP0_wstrb;
  input S_AXI_GP0_wvalid;

  wire GND_1;
  wire [14:0]PS7_DDR_ADDR;
  wire [2:0]PS7_DDR_BA;
  wire PS7_DDR_CAS_N;
  wire PS7_DDR_CKE;
  wire PS7_DDR_CK_N;
  wire PS7_DDR_CK_P;
  wire PS7_DDR_CS_N;
  wire [3:0]PS7_DDR_DM;
  wire [31:0]PS7_DDR_DQ;
  wire [3:0]PS7_DDR_DQS_N;
  wire [3:0]PS7_DDR_DQS_P;
  wire PS7_DDR_ODT;
  wire PS7_DDR_RAS_N;
  wire PS7_DDR_RESET_N;
  wire PS7_DDR_WE_N;
  wire PS7_FCLK_CLK0;
  wire PS7_FCLK_CLK1;
  wire PS7_FCLK_CLK2;
  wire PS7_FCLK_CLK3;
  wire PS7_FCLK_RESET0_N;
  wire PS7_FCLK_RESET1_N;
  wire PS7_FCLK_RESET2_N;
  wire PS7_FCLK_RESET3_N;
  wire PS7_FIXED_IO_DDR_VRN;
  wire PS7_FIXED_IO_DDR_VRP;
  wire [53:0]PS7_FIXED_IO_MIO;
  wire PS7_FIXED_IO_PS_CLK;
  wire PS7_FIXED_IO_PS_PORB;
  wire PS7_FIXED_IO_PS_SRSTB;
  wire [31:0]S_AXI_GP0_1_ARADDR;
  wire [1:0]S_AXI_GP0_1_ARBURST;
  wire [3:0]S_AXI_GP0_1_ARCACHE;
  wire [5:0]S_AXI_GP0_1_ARID;
  wire [3:0]S_AXI_GP0_1_ARLEN;
  wire [1:0]S_AXI_GP0_1_ARLOCK;
  wire [2:0]S_AXI_GP0_1_ARPROT;
  wire [3:0]S_AXI_GP0_1_ARQOS;
  wire S_AXI_GP0_1_ARREADY;
  wire [2:0]S_AXI_GP0_1_ARSIZE;
  wire S_AXI_GP0_1_ARVALID;
  wire [31:0]S_AXI_GP0_1_AWADDR;
  wire [1:0]S_AXI_GP0_1_AWBURST;
  wire [3:0]S_AXI_GP0_1_AWCACHE;
  wire [5:0]S_AXI_GP0_1_AWID;
  wire [3:0]S_AXI_GP0_1_AWLEN;
  wire [1:0]S_AXI_GP0_1_AWLOCK;
  wire [2:0]S_AXI_GP0_1_AWPROT;
  wire [3:0]S_AXI_GP0_1_AWQOS;
  wire S_AXI_GP0_1_AWREADY;
  wire [2:0]S_AXI_GP0_1_AWSIZE;
  wire S_AXI_GP0_1_AWVALID;
  wire [5:0]S_AXI_GP0_1_BID;
  wire S_AXI_GP0_1_BREADY;
  wire [1:0]S_AXI_GP0_1_BRESP;
  wire S_AXI_GP0_1_BVALID;
  wire [31:0]S_AXI_GP0_1_RDATA;
  wire [5:0]S_AXI_GP0_1_RID;
  wire S_AXI_GP0_1_RLAST;
  wire S_AXI_GP0_1_RREADY;
  wire [1:0]S_AXI_GP0_1_RRESP;
  wire S_AXI_GP0_1_RVALID;
  wire [31:0]S_AXI_GP0_1_WDATA;
  wire [5:0]S_AXI_GP0_1_WID;
  wire S_AXI_GP0_1_WLAST;
  wire S_AXI_GP0_1_WREADY;
  wire [3:0]S_AXI_GP0_1_WSTRB;
  wire S_AXI_GP0_1_WVALID;
  wire S_AXI_GP0_ACLK_1;

  assign FCLK_CLK0 = PS7_FCLK_CLK0;
  assign FCLK_CLK1 = PS7_FCLK_CLK1;
  assign FCLK_CLK2 = PS7_FCLK_CLK2;
  assign FCLK_CLK3 = PS7_FCLK_CLK3;
  assign FCLK_RESET0_N = PS7_FCLK_RESET0_N;
  assign FCLK_RESET1_N = PS7_FCLK_RESET1_N;
  assign FCLK_RESET2_N = PS7_FCLK_RESET2_N;
  assign FCLK_RESET3_N = PS7_FCLK_RESET3_N;
  assign S_AXI_GP0_1_ARADDR = S_AXI_GP0_araddr[31:0];
  assign S_AXI_GP0_1_ARBURST = S_AXI_GP0_arburst[1:0];
  assign S_AXI_GP0_1_ARCACHE = S_AXI_GP0_arcache[3:0];
  assign S_AXI_GP0_1_ARID = S_AXI_GP0_arid[5:0];
  assign S_AXI_GP0_1_ARLEN = S_AXI_GP0_arlen[3:0];
  assign S_AXI_GP0_1_ARLOCK = S_AXI_GP0_arlock[1:0];
  assign S_AXI_GP0_1_ARPROT = S_AXI_GP0_arprot[2:0];
  assign S_AXI_GP0_1_ARQOS = S_AXI_GP0_arqos[3:0];
  assign S_AXI_GP0_1_ARSIZE = S_AXI_GP0_arsize[2:0];
  assign S_AXI_GP0_1_ARVALID = S_AXI_GP0_arvalid;
  assign S_AXI_GP0_1_AWADDR = S_AXI_GP0_awaddr[31:0];
  assign S_AXI_GP0_1_AWBURST = S_AXI_GP0_awburst[1:0];
  assign S_AXI_GP0_1_AWCACHE = S_AXI_GP0_awcache[3:0];
  assign S_AXI_GP0_1_AWID = S_AXI_GP0_awid[5:0];
  assign S_AXI_GP0_1_AWLEN = S_AXI_GP0_awlen[3:0];
  assign S_AXI_GP0_1_AWLOCK = S_AXI_GP0_awlock[1:0];
  assign S_AXI_GP0_1_AWPROT = S_AXI_GP0_awprot[2:0];
  assign S_AXI_GP0_1_AWQOS = S_AXI_GP0_awqos[3:0];
  assign S_AXI_GP0_1_AWSIZE = S_AXI_GP0_awsize[2:0];
  assign S_AXI_GP0_1_AWVALID = S_AXI_GP0_awvalid;
  assign S_AXI_GP0_1_BREADY = S_AXI_GP0_bready;
  assign S_AXI_GP0_1_RREADY = S_AXI_GP0_rready;
  assign S_AXI_GP0_1_WDATA = S_AXI_GP0_wdata[31:0];
  assign S_AXI_GP0_1_WID = S_AXI_GP0_wid[5:0];
  assign S_AXI_GP0_1_WLAST = S_AXI_GP0_wlast;
  assign S_AXI_GP0_1_WSTRB = S_AXI_GP0_wstrb[3:0];
  assign S_AXI_GP0_1_WVALID = S_AXI_GP0_wvalid;
  assign S_AXI_GP0_ACLK_1 = S_AXI_GP0_ACLK;
  assign S_AXI_GP0_arready = S_AXI_GP0_1_ARREADY;
  assign S_AXI_GP0_awready = S_AXI_GP0_1_AWREADY;
  assign S_AXI_GP0_bid[5:0] = S_AXI_GP0_1_BID;
  assign S_AXI_GP0_bresp[1:0] = S_AXI_GP0_1_BRESP;
  assign S_AXI_GP0_bvalid = S_AXI_GP0_1_BVALID;
  assign S_AXI_GP0_rdata[31:0] = S_AXI_GP0_1_RDATA;
  assign S_AXI_GP0_rid[5:0] = S_AXI_GP0_1_RID;
  assign S_AXI_GP0_rlast = S_AXI_GP0_1_RLAST;
  assign S_AXI_GP0_rresp[1:0] = S_AXI_GP0_1_RRESP;
  assign S_AXI_GP0_rvalid = S_AXI_GP0_1_RVALID;
  assign S_AXI_GP0_wready = S_AXI_GP0_1_WREADY;
  GND GND
       (.G(GND_1));
  ZYNQ_PS7_processing_system7_0_0 PS7
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(PS7_FCLK_CLK0),
        .FCLK_CLK1(PS7_FCLK_CLK1),
        .FCLK_CLK2(PS7_FCLK_CLK2),
        .FCLK_CLK3(PS7_FCLK_CLK3),
        .FCLK_RESET0_N(PS7_FCLK_RESET0_N),
        .FCLK_RESET1_N(PS7_FCLK_RESET1_N),
        .FCLK_RESET2_N(PS7_FCLK_RESET2_N),
        .FCLK_RESET3_N(PS7_FCLK_RESET3_N),
        .MIO(FIXED_IO_mio[53:0]),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .S_AXI_GP0_ACLK(S_AXI_GP0_ACLK_1),
        .S_AXI_GP0_ARADDR(S_AXI_GP0_1_ARADDR),
        .S_AXI_GP0_ARBURST(S_AXI_GP0_1_ARBURST),
        .S_AXI_GP0_ARCACHE(S_AXI_GP0_1_ARCACHE),
        .S_AXI_GP0_ARID(S_AXI_GP0_1_ARID),
        .S_AXI_GP0_ARLEN(S_AXI_GP0_1_ARLEN),
        .S_AXI_GP0_ARLOCK(S_AXI_GP0_1_ARLOCK),
        .S_AXI_GP0_ARPROT(S_AXI_GP0_1_ARPROT),
        .S_AXI_GP0_ARQOS(S_AXI_GP0_1_ARQOS),
        .S_AXI_GP0_ARREADY(S_AXI_GP0_1_ARREADY),
        .S_AXI_GP0_ARSIZE(S_AXI_GP0_1_ARSIZE),
        .S_AXI_GP0_ARVALID(S_AXI_GP0_1_ARVALID),
        .S_AXI_GP0_AWADDR(S_AXI_GP0_1_AWADDR),
        .S_AXI_GP0_AWBURST(S_AXI_GP0_1_AWBURST),
        .S_AXI_GP0_AWCACHE(S_AXI_GP0_1_AWCACHE),
        .S_AXI_GP0_AWID(S_AXI_GP0_1_AWID),
        .S_AXI_GP0_AWLEN(S_AXI_GP0_1_AWLEN),
        .S_AXI_GP0_AWLOCK(S_AXI_GP0_1_AWLOCK),
        .S_AXI_GP0_AWPROT(S_AXI_GP0_1_AWPROT),
        .S_AXI_GP0_AWQOS(S_AXI_GP0_1_AWQOS),
        .S_AXI_GP0_AWREADY(S_AXI_GP0_1_AWREADY),
        .S_AXI_GP0_AWSIZE(S_AXI_GP0_1_AWSIZE),
        .S_AXI_GP0_AWVALID(S_AXI_GP0_1_AWVALID),
        .S_AXI_GP0_BID(S_AXI_GP0_1_BID),
        .S_AXI_GP0_BREADY(S_AXI_GP0_1_BREADY),
        .S_AXI_GP0_BRESP(S_AXI_GP0_1_BRESP),
        .S_AXI_GP0_BVALID(S_AXI_GP0_1_BVALID),
        .S_AXI_GP0_RDATA(S_AXI_GP0_1_RDATA),
        .S_AXI_GP0_RID(S_AXI_GP0_1_RID),
        .S_AXI_GP0_RLAST(S_AXI_GP0_1_RLAST),
        .S_AXI_GP0_RREADY(S_AXI_GP0_1_RREADY),
        .S_AXI_GP0_RRESP(S_AXI_GP0_1_RRESP),
        .S_AXI_GP0_RVALID(S_AXI_GP0_1_RVALID),
        .S_AXI_GP0_WDATA(S_AXI_GP0_1_WDATA),
        .S_AXI_GP0_WID(S_AXI_GP0_1_WID),
        .S_AXI_GP0_WLAST(S_AXI_GP0_1_WLAST),
        .S_AXI_GP0_WREADY(S_AXI_GP0_1_WREADY),
        .S_AXI_GP0_WSTRB(S_AXI_GP0_1_WSTRB),
        .S_AXI_GP0_WVALID(S_AXI_GP0_1_WVALID),
        .USB0_VBUS_PWRFAULT(GND_1));
endmodule
