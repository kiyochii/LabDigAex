module debounce_timer #(
    parameter integer CLK_FREQ_HZ   = 50000000,
    parameter integer DEBOUNCE_MS   = 20,
    parameter integer TIMER_COUNT_MAX = (CLK_FREQ_HZ/1000)*DEBOUNCE_MS
)(
    input  wire clk,
    input  wire rst,
    input  wire ena_timer,
    input  wire rst_timer,
    output reg  timer_done
);

    localparam integer COUNTER_WIDTH = $clog2(TIMER_COUNT_MAX + 1);

    reg [COUNTER_WIDTH-1:0] counter;

    always @(posedge clk) begin
        if (rst) begin
            counter     <= {COUNTER_WIDTH{1'b0}};
            timer_done  <= 1'b0;
        end else if (rst_timer) begin
            counter     <= {COUNTER_WIDTH{1'b0}};
            timer_done  <= 1'b0;
        end else if (ena_timer) begin
            if (!timer_done) begin
                if (counter == TIMER_COUNT_MAX - 1) begin
                    counter    <= counter;
                    timer_done <= 1'b1;
                end else begin
                    counter    <= counter + 1'b1;
                    timer_done <= 1'b0;
                end
            end
        end
    end

endmodule