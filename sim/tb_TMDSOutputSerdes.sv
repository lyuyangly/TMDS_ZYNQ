`timescale 1ns / 1ps
module tb_TMDSOutputSerdes;

logic           SerialClk;
logic           PixelClk;
logic           RstB;

glbl glbl();

TMDSOutputSerdes U_TCLK (
    .PixelClk       (PixelClk           ),
    .SerialClk      (SerialClk          ),
    .RstB           (RstB               ),
    .DataOut        (10'b11111_00000    ),
    .DataOut_P      (),
    .DataOut_N      ()
);

TMDSOutputSerdes U_DATA (
    .PixelClk       (PixelClk           ),
    .SerialClk      (SerialClk          ),
    .RstB           (RstB               ),
    .DataOut        (10'b10_1101_1011   ),
    .DataOut_P      (),
    .DataOut_N      ()
);

initial forever #1 SerialClk = ~SerialClk;
initial forever #5 PixelClk  = ~PixelClk;

initial begin
    SerialClk = 1'b0;
    PixelClk = 1'b0;
    RstB = 1'b0;
    repeat(100) @(posedge SerialClk);
    RstB = 1'b1;
    repeat(1000) @(posedge SerialClk);
    $finish;
end

initial begin
    $vcdplusfile("wave.vpd");
    $vcdpluson(0);
end

endmodule

