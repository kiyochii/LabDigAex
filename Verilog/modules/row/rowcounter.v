module row_counter (
    input  wire       clk,
    input  wire       rst,
    input  wire       inc_row,
    output reg  [1:0] row_idx
);

    always @(posedge clk) begin
        if (rst) begin
            row_idx <= 2'd0;
        end else if (inc_row) begin
            row_idx <= row_idx + 2'd1;
        end
    end

endmodule