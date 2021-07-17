`timescale 1ns / 1ps
module tb_TMDSCtrlTop;

logic           SerialClk;
logic           PixelClk;
logic           RstB;
logic           VideoEn;
logic           VideoHSync;
logic           VideoVSync;
logic           VideoDE;
logic   [23:0]  VideoData;

glbl glbl();

VGACtrlTop U_VGACtrl (
    .PixelClk       (PixelClk       ),
    .RstB           (RstB           ),
    .VideoEn        (VideoEn        ),
    .VideoDin       (24'hdeadbe     ),
    .VideoDE        (VideoDE        ),
    .VideoHS        (VideoHSync     ),
    .VideoVS        (VideoVSync     ),
    .VideoReq       (),
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

initial forever #1 SerialClk = ~SerialClk;
initial forever #5 PixelClk  = ~PixelClk;

initial begin
    SerialClk = 1'b0;
    PixelClk = 1'b0;
    RstB = 1'b0;
    VideoEn = 1'b0;
    repeat(100) @(posedge PixelClk);
    RstB = 1'b1;
    repeat(100) @(posedge PixelClk);
    VideoEn = 1'b1;
    repeat(1650 * 750 + 1000) @(posedge PixelClk);
    $finish;
end

initial begin
    $vcdplusfile("wave.vpd");
    $vcdpluson(0);
end

endmodule

