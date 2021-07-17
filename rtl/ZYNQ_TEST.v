module ZYNQ_TEST (
    input                   ClkIn,
    input                   RstB,
    output                  TMDSClk_P,
    output                  TMDSClk_N,
    output      [2:0]       TMDSData_P,
    output      [2:0]       TMDSData_N,
    input       [3:0]       KEY,
    output      [3:0]       LED,
    output                  HDMIOutEN
);

wire            RstSync;
wire            PixelClk;
wire            SerialClk;
wire            VideoHSync;
wire            VideoVSync;
wire            VideoDE;
wire    [23:0]  VideoData;
wire            VideoReq;
wire    [11:0]  VideoXPos;
wire    [11:0]  VideoYPos;
wire            VideoEn;
wire    [23:0]  VideoDin;

wire            ACLK;
wire            ARESETn;
wire    [3:0]   ARID;
wire    [31:0]  ARADDR;
wire    [3:0]   ARLEN;
wire    [1:0]   ARLOCK;
wire    [2:0]   ARSIZE;
wire    [1:0]   ARBURST;
wire    [3:0]   ARCACHE;
wire    [2:0]   ARPROT;
wire    [3:0]   ARQOS;
wire            ARVALID;
wire            ARREADY;
wire    [5:0]   RID;
wire    [31:0]  RDATA;
wire    [1:0]   RRESP;
wire            RLAST;
wire            RVALID;
wire            RREADY;

wire            FCLK_RESET0_N;

assign PLResetN = RstB & FCLK_RESET0_N & KEY[3];

TMDSClkGen U_TMDSClkGen (
    .clk_in1        (ClkIn              ),
    .clk_out1       (PixelClk           ),
    .clk_out2       (SerialClk          ),
    .clk_out3       (ACLK               )
);

RstSync U_RstSync_A (
    .Clk            (ACLK               ),
    .RstB           (PLResetN           ),
    .RstSync        (ARESETn            )
);

RstSync U_RstSync_P (
    .Clk            (PixelClk           ),
    .RstB           (PLResetN           ),
    .RstSync        (RstSync            )
);

AxiMemRdCtrl U_AxiMemRdCtrl (
    .ACLK           (ACLK               ),
    .ARESETn        (ARESETn            ),
    .ARID           (ARID               ),
    .ARADDR         (ARADDR             ),
    .ARLEN          (ARLEN              ),
    .ARLOCK         (ARLOCK             ),
    .ARSIZE         (ARSIZE             ),
    .ARBURST        (ARBURST            ),
    .ARCACHE        (ARCACHE            ),
    .ARPROT         (ARPROT             ),
    .ARQOS          (ARQOS              ),
    .ARVALID        (ARVALID            ),
    .ARREADY        (ARREADY            ),
    .RID            (RID[3:0]           ),
    .RDATA          (RDATA              ),
    .RRESP          (RRESP              ),
    .RLAST          (RLAST              ),
    .RVALID         (RVALID             ),
    .RREADY         (RREADY             ),
    .VideoClk       (PixelClk           ),
    .VideoRstB      (RstSync            ),
    .VideoReq       (VideoReq           ),
    .VideoEn        (VideoEn            ),
    .VideoData      (VideoDin           )
);

VGACtrlTop U_VGACtrl (
    .PixelClk       (PixelClk           ),
    .RstB           (RstSync            ),
    .VideoEn        (VideoEn            ),
    .VideoDin       (VideoDin           ),
    .VideoDE        (VideoDE            ),
    .VideoHS        (VideoHSync         ),
    .VideoVS        (VideoVSync         ),
    .VideoReq       (VideoReq           ),
    .VideoXPos      (),
    .VideoYPos      (),
    .VideoDout      (VideoData          )
);

TMDSCtrlTop U_TMDSCtrl (
    .PixelClk       (PixelClk           ),
    .SerialClk      (SerialClk          ),
    .RstB           (RstSync            ),
    .VideoDin       (VideoData          ),
    .VideoDE        (VideoDE            ),
    .VideoHSync     (VideoHSync         ),
    .VideoVSync     (VideoVSync         ),
    .TMDSClk_P      (TMDSClk_P          ),
    .TMDSClk_N      (TMDSClk_N          ),
    .TMDSData_P     (TMDSData_P         ),
    .TMDSData_N     (TMDSData_N         )
);

assign LED = 4'ha;
assign HDMIOutEN = 1'b1;

ZYNQ_PS7 U_PS7 (
    .FCLK_CLK0              (),
    .FCLK_CLK1              (),
    .FCLK_CLK2              (),
    .FCLK_CLK3              (),
    .FCLK_RESET0_N          (FCLK_RESET0_N  ),
    .FCLK_RESET1_N          (),
    .FCLK_RESET2_N          (),
    .FCLK_RESET3_N          (),
    .S_AXI_GP0_ACLK         (ACLK           ),
    .S_AXI_GP0_araddr       (ARADDR         ),
    .S_AXI_GP0_arburst      (ARBURST        ),
    .S_AXI_GP0_arcache      (ARCACHE        ),
    .S_AXI_GP0_arid         ({2'h0, ARID}   ),
    .S_AXI_GP0_arlen        (ARLEN          ),
    .S_AXI_GP0_arlock       (ARLOCK         ),
    .S_AXI_GP0_arprot       (ARPROT         ),
    .S_AXI_GP0_arqos        (ARQOS          ),
    .S_AXI_GP0_arready      (ARREADY        ),
    .S_AXI_GP0_arsize       (ARSIZE         ),
    .S_AXI_GP0_arvalid      (ARVALID        ),
    .S_AXI_GP0_awaddr       (32'h0          ),
    .S_AXI_GP0_awburst      (2'h0           ),
    .S_AXI_GP0_awcache      (4'h0           ),
    .S_AXI_GP0_awid         (6'h0           ),
    .S_AXI_GP0_awlen        (4'h0           ),
    .S_AXI_GP0_awlock       (2'h0           ),
    .S_AXI_GP0_awprot       (3'h1           ),
    .S_AXI_GP0_awqos        (4'h0           ),
    .S_AXI_GP0_awready      (),
    .S_AXI_GP0_awsize       (3'h0           ),
    .S_AXI_GP0_awvalid      (1'b0           ),
    .S_AXI_GP0_bid          (),
    .S_AXI_GP0_bready       (1'b0           ),
    .S_AXI_GP0_bresp        (),
    .S_AXI_GP0_bvalid       (),
    .S_AXI_GP0_rdata        (RDATA          ),
    .S_AXI_GP0_rid          (RID            ),
    .S_AXI_GP0_rlast        (RLAST          ),
    .S_AXI_GP0_rready       (RREADY         ),
    .S_AXI_GP0_rresp        (RRESP          ),
    .S_AXI_GP0_rvalid       (RVALID         ),
    .S_AXI_GP0_wdata        (32'h0          ),
    .S_AXI_GP0_wid          (6'h0           ),
    .S_AXI_GP0_wlast        (1'b0           ),
    .S_AXI_GP0_wready       (),
    .S_AXI_GP0_wstrb        (4'h0           ),
    .S_AXI_GP0_wvalid       (1'b0           )
);

endmodule

