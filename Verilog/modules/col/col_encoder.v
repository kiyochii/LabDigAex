module col_encoder (
    input  wire [4:0] col_in,
    output reg        col_any,
    output reg        col_valid,
    output reg        col_error,
    output reg  [2:0] col_idx
);

    always @(*) begin
        col_any   = 1'b0;
        col_valid = 1'b0;
        col_error = 1'b0;
        col_idx   = 3'd0;

        case (col_in)
            5'b00000: begin
                col_any   = 1'b0;
                col_valid = 1'b0;
                col_error = 1'b0;
                col_idx   = 3'd0;
            end

            5'b00001: begin
                col_any   = 1'b1;
                col_valid = 1'b1;
                col_error = 1'b0;
                col_idx   = 3'd0;
            end

            5'b00010: begin
                col_any   = 1'b1;
                col_valid = 1'b1;
                col_error = 1'b0;
                col_idx   = 3'd1;
            end

            5'b00100: begin
                col_any   = 1'b1;
                col_valid = 1'b1;
                col_error = 1'b0;
                col_idx   = 3'd2;
            end

            5'b01000: begin
                col_any   = 1'b1;
                col_valid = 1'b1;
                col_error = 1'b0;
                col_idx   = 3'd3;
            end

            5'b10000: begin
                col_any   = 1'b1;
                col_valid = 1'b1;
                col_error = 1'b0;
                col_idx   = 3'd4;
            end

            default: begin
                col_any   = 1'b1;
                col_valid = 1'b0;
                col_error = 1'b1;
                col_idx   = 3'd0;
            end
        endcase
    end

endmodule