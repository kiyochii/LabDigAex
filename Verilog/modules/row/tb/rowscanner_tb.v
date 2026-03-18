`timescale 1ns / 1ps

module tb_row_scanner;

    reg clk;
    reg rst;
    reg inc_row;

    wire [1:0] row_idx;
    wire [3:0] row_out;

    row_scanner dut (
        .clk(clk),
        .rst(rst),
        .inc_row(inc_row),
        .row_idx(row_idx),
        .row_out(row_out)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    task check_row;
        input [1:0] expected_idx;
        input [3:0] expected_out;
        begin
            #1;
            if (row_idx !== expected_idx || row_out !== expected_out) begin
                $display("ERRO @ %0t ns | row_idx=%b esperado=%b | row_out=%b esperado=%b",
                         $time, row_idx, expected_idx, row_out, expected_out);
            end else begin
                $display("OK   @ %0t ns | row_idx=%b | row_out=%b",
                         $time, row_idx, row_out);
            end
        end
    endtask

    task pulse_inc;
        begin
            @(negedge clk);
            inc_row = 1'b1;
            @(negedge clk);
            inc_row = 1'b0;
        end
    endtask

    initial begin
        rst = 1'b1;
        inc_row = 1'b0;

        #20;
        rst = 1'b0;

        check_row(2'd0, 4'b0001);

        pulse_inc();
        check_row(2'd1, 4'b0010);

        pulse_inc();
        check_row(2'd2, 4'b0100);

        pulse_inc();
        check_row(2'd3, 4'b1000);

        pulse_inc();
        check_row(2'd0, 4'b0001);

        pulse_inc();
        check_row(2'd1, 4'b0010);

        $display("Fim do teste do row_scanner.");
        #20;
        $finish;
    end

endmodule