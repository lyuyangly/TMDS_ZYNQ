module VGACtrlTop (
    input               PixelClk,
    input               RstB,
    input               VideoEn,
    input       [23:0]  VideoDin,
    output  reg         VideoDE,
    output  reg         VideoHS,
    output  reg         VideoVS,
    output              VideoReq,
    output      [11:0]  VideoXPos,
    output      [11:0]  VideoYPos,
    output  reg [23:0]  VideoDout
);

// VGA 1280 X 720 Timing
localparam  H_SYNC  = 12'd40;
localparam  H_BACK  = 12'd220;
localparam  H_DISP  = 12'd1280;
localparam  H_FRONT = 12'd110;
localparam  V_SYNC  = 12'd5;
localparam  V_BACK  = 12'd20;
localparam  V_DISP  = 12'd720;
localparam  V_FRONT = 12'd5;
localparam  H_TOTAL = H_SYNC + H_BACK + H_DISP + H_FRONT;
localparam  V_TOTAL = V_SYNC + V_BACK + V_DISP + V_FRONT;

reg     [11:0]  HCnt;
reg     [11:0]  VCnt;

always @(posedge PixelClk or negedge RstB)
    if (~RstB) begin
        HCnt <= 12'd0;
        VCnt <= 12'd0;
    end
    else if (~VideoEn) begin
        HCnt <= 12'd0;
        VCnt <= 12'd0;
    end
    else begin
        if (HCnt < H_TOTAL - 12'd1)
            HCnt <= HCnt + 12'd1;
        else begin
            HCnt <= 12'd0;
            if (VCnt < V_TOTAL - 12'd1)
                VCnt <= VCnt + 12'd1;
            else
                VCnt <= 12'd0;
        end
    end

assign VideoReq  = (HCnt >= H_SYNC + H_BACK && HCnt < H_SYNC + H_BACK + H_DISP) && (VCnt >= V_SYNC + V_BACK && VCnt < V_SYNC + V_BACK + V_DISP);
assign VideoXPos = VideoReq ? HCnt - (H_SYNC + H_BACK) : 12'd0;
assign VideoYPos = VideoReq ? VCnt - (V_SYNC + V_BACK) : 12'd0;

always @(posedge PixelClk or negedge RstB)
    if (~RstB) begin
        VideoDE     <= 1'b0;
        VideoHS     <= 1'b0;
        VideoVS     <= 1'b0;
        VideoDout   <= 24'hFFFFFF;
    end
    else if (~VideoEn) begin
        VideoDE     <= 1'b0;
        VideoHS     <= 1'b0;
        VideoVS     <= 1'b0;
        VideoDout   <= 24'hFFFFFF;
    end
    else begin
        VideoDE     <= VideoReq;
        VideoHS     <= HCnt < H_SYNC;
        VideoVS     <= VCnt < V_SYNC;
        VideoDout   <= VideoReq ? VideoDin : 24'hFFFFFF;
    end

endmodule

