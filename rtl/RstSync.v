module RstSync (
    input           Clk,
    input           RstB,
    output          RstSync
);

reg     [2:0]   RstFF;

always @(posedge Clk or negedge RstB)
    if (~RstB)
        RstFF <= 3'h0;
    else
        RstFF <= {RstFF[1:0], 1'b1};

assign RstSync = RstFF[2];

endmodule
