module row_decoder (
    input  wire [1:0] row_idx,
    output reg  [3:0] row_out
);

    always @(*) begin
        case (row_idx)
            2'd0: row_out = 4'b0001;
            2'd1: row_out = 4'b0010;
            2'd2: row_out = 4'b0100;
            2'd3: row_out = 4'b1000;
            default: row_out = 4'b0001;
        endcase
    end

endmodule