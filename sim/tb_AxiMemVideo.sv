`timescale 1ns / 1ps
module tb_AxiMemVideo;

logic           SerialClk;
logic           PixelClk;
logic           RstB;
logic           VideoEn;
logic           VideoHSync;
logic           VideoVSync;
logic           VideoDE;
logic           VideoReq;
logic   [23:0]  VideoData;
logic   [23:0]  PixelData;

logic           ACLK;
logic           ARESETn;
logic   [3:0]   ARID;
logic   [31:0]  ARADDR;
logic   [3:0]   ARLEN;
logic   [1:0]   ARLOCK;
logic   [2:0]   ARSIZE;
logic   [1:0]   ARBURST;
logic           ARVALID;
logic           ARREADY;
logic   [3:0]   RID;
logic   [31:0]  RDATA;
logic   [1:0]   RRESP;
logic           RLAST;
logic           RVALID;
logic           RREADY;

glbl glbl();

mem_axi #(
    .WIDTH_CID          (2              ),
    .WIDTH_ID           (2              ),
    .P_SLV_ID           (0              ),
    .P_SIZE_IN_BYTES    (1024*1024*4    )
) U_MEM (
    .ACLK           (ACLK           ),
    .ARESETn        (ARESETn        ),
    .AWID           (0              ),
    .AWADDR         (0              ),
    .AWLEN          (0              ),
    .AWLOCK         (0              ),
    .AWSIZE         (0              ),
    .AWBURST        (0              ),
    .AWVALID        (0              ),
    .AWREADY        (),
    .WID            (0              ),
    .WDATA          (0              ),
    .WSTRB          (0              ),
    .WLAST          (0              ),
    .WVALID         (0              ),
    .WREADY         (),
    .BID            (),
    .BRESP          (),
    .BVALID         (),
    .BREADY         (1'b1           ),
    .ARID           (ARID           ),
    .ARADDR         (ARADDR         ),
    .ARLEN          (ARLEN          ),
    .ARLOCK         (0              ),
    .ARSIZE         (ARSIZE         ),
    .ARBURST        (ARBURST        ),
    .ARVALID        (ARVALID        ),
    .ARREADY        (ARREADY        ),
    .RID            (RID            ),
    .RDATA          (RDATA          ),
    .RRESP          (RRESP          ),
    .RLAST          (RLAST          ),
    .RVALID         (RVALID         ),
    .RREADY         (RREADY         ),
    .CSYSREQ        (1'b0           ),
    .CSYSACK        (),
    .CACTIVE        ()
);

AxiMemRdCtrl U_AxiMemRdCtrl (
    .ACLK           (ACLK           ),
    .ARESETn        (ARESETn        ),
    .ARID           (ARID           ),
    .ARADDR         (ARADDR         ),
    .ARLEN          (ARLEN          ),
    .ARLOCK         (ARLOCK         ),
    .ARSIZE         (ARSIZE         ),
    .ARBURST        (ARBURST        ),
    .ARVALID        (ARVALID        ),
    .ARREADY        (ARREADY        ),
    .RID            (RID            ),
    .RDATA          (RDATA          ),
    .RRESP          (RRESP          ),
    .RLAST          (RLAST          ),
    .RVALID         (RVALID         ),
    .RREADY         (RREADY         ),
    .VideoClk       (PixelClk       ),
    .VideoRstB      (RstB           ),
    .VideoReq       (VideoReq       ),
    .VideoEn        (VideoEn        ),
    .VideoData      (PixelData      )
);

VGACtrlTop U_VGACtrl (
    .PixelClk       (PixelClk       ),
    .RstB           (RstB           ),
    .VideoEn        (VideoEn        ),
    .VideoDin       (PixelData      ),
    .VideoDE        (VideoDE        ),
    .VideoHS        (VideoHSync     ),
    .VideoVS        (VideoVSync     ),
    .VideoReq       (VideoReq       ),
    .VideoXPos      (),
    .VideoYPos      (),
    .VideoDout      (VideoData      )
);

TMDSCtrlTop U_TMDSCtrl (
    .PixelClk       (PixelClk       ),
    .SerialClk      (SerialClk      ),
    .RstB           (RstB           ),
    .VideoDin       (VideoData      ),
    .VideoDE        (VideoDE        ),
    .VideoHSync     (VideoHSync     ),
    .VideoVSync     (VideoVSync     ),
    .TMDSClk_P      (),
    .TMDSClk_N      (),
    .TMDSData_P     (),
    .TMDSData_N     ()
);

initial forever #2 ACLK      = ~ACLK;
initial forever #1 SerialClk = ~SerialClk;
initial forever #5 PixelClk  = ~PixelClk;

initial begin
    SerialClk = 1'b0;
    PixelClk = 1'b0;
    RstB = 1'b0;
    repeat(10) @(posedge PixelClk);
    RstB = 1'b1;
    repeat(10) @(posedge PixelClk);
    repeat(1650 * 750 + 1000) @(posedge PixelClk);
    $finish;
end

initial begin
    ACLK = 1'b0;
    ARESETn = 1'b0;
    repeat(100) @(posedge ACLK);
    ARESETn = 1'b1;
end

initial begin
    $vcdplusfile("wave.vpd");
    $vcdpluson(0);
end

endmodule

