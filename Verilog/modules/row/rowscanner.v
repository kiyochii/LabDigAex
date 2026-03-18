module row_scanner (
    input  wire       clk,
    input  wire       rst,
    input  wire       inc_row,
    output wire [1:0] row_idx,
    output wire [3:0] row_out
);

    row_counter u_row_counter (
        .clk(clk),
        .rst(rst),
        .inc_row(inc_row),
        .row_idx(row_idx)
    );

    row_decoder u_row_decoder (
        .row_idx(row_idx),
        .row_out(row_out)
    );

endmodule