module AxiMemRdCtrl (
    input                   ACLK        ,
    input                   ARESETn     ,
    output      [3:0]       ARID        ,
    output  reg [31:0]      ARADDR      ,
    output      [3:0]       ARLEN       ,
    output      [1:0]       ARLOCK      ,
    output      [2:0]       ARSIZE      ,
    output      [1:0]       ARBURST     ,
    output      [3:0]       ARCACHE     ,
    output      [2:0]       ARPROT      ,
    output      [3:0]       ARQOS       ,
    output  reg             ARVALID     ,
    input                   ARREADY     ,
    input       [3:0]       RID         ,
    input       [31:0]      RDATA       ,
    input       [1:0]       RRESP       ,
    input                   RLAST       ,
    input                   RVALID      ,
    output  reg             RREADY      ,
    input                   VideoClk    ,
    input                   VideoRstB   ,
    input                   VideoReq    ,
    output  reg             VideoEn     ,
    output      [23:0]      VideoData
);

// 1280 X 720 DDR 0x00100000 - 0x40000000
localparam  FB_BASE_ADDR = 32'h3000_0000;
localparam  FB_MAX_ADDR  = 32'd3686400;

localparam  S_IDLE = 3'h1;
localparam  S_ARSU = 3'h2;
localparam  S_RDWT = 3'h4;

reg     [2:0]   RState;
reg     [31:0]  RdAddr;
reg     [3:0]   RCnt;
wire            wr_en;
wire            wr_afull;
wire            rd_aempty;

always @(posedge ACLK or negedge ARESETn)
    if (~ARESETn) begin
        RdAddr  <= 32'h0;
        RState  <= S_IDLE;
        RCnt    <= 4'h0;
        ARVALID <= 1'b0;
        RREADY  <= 1'b0;
        ARADDR  <= 32'h0;
    end
    else begin
        case (RState)
            S_IDLE: begin
                RREADY  <= 1'b0;
                if (~wr_afull) begin
                    ARVALID <= 1'b1;
                    ARADDR  <= FB_BASE_ADDR + RdAddr;
                    RState  <= S_ARSU;
                end
            end
            S_ARSU: begin
                if (ARVALID & ARREADY) begin
                    ARVALID <= 1'b0;
                    RREADY  <= 1'b1;
                    RState  <= S_RDWT;
                    RCnt    <= 4'h0;
                end
            end
            S_RDWT: begin
                RCnt <= RCnt + ((RVALID & RREADY) ? 4'h1 : 4'h0);
                if (RVALID & RREADY & RLAST & (RCnt == ARLEN)) begin
                    RREADY  <= 1'b0;
                    RState  <= S_IDLE;
                    RCnt    <= 4'h0;
                    if (RdAddr < FB_MAX_ADDR - 32'd32)
                        RdAddr  <= RdAddr + 32'd32;
                    else
                        RdAddr  <= RdAddr + 32'd32 - FB_MAX_ADDR;
                end
            end
            default: RState <= S_IDLE;
        endcase
    end

assign ARID     = 4'h0;
assign ARLEN    = 4'h7;
assign ARLOCK   = 2'h0;
assign ARSIZE   = 3'h2;
assign ARBURST  = 2'h1;
assign ARCACHE  = 4'h0;
assign ARPROT   = 3'h1;
assign ARQOS    = 4'h0;

assign wr_en = (ARID == RID) & (RState == S_RDWT) & RVALID & RREADY;

async_fifo #(
    .DP             (4096           ),
    .DW             (24             )
)   U_FBFIFO (
    .wr_clk         (ACLK           ),
    .wr_reset_n     (ARESETn        ),
    .wr_en          (wr_en          ),
    .wr_data        (RDATA[23:0]    ),
    .full           (),
    .afull          (wr_afull       ),
    .rd_clk         (VideoClk       ),
    .rd_reset_n     (VideoRstB      ),
    .rd_en          (VideoReq       ),
    .rd_data        (VideoData      ),
    .empty          (),
    .aempty         (rd_aempty      )
);

always @(posedge VideoClk or negedge VideoRstB)
    if (~VideoRstB)
        VideoEn <= 1'b0;
    else if (~rd_aempty)
        VideoEn <= 1'b1;

endmodule

