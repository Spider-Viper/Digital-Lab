`timescale 1ns/1ns

module tb;
    reg clk;
    reg rstn;
    wire led;

    parameter CNT_2US_MAX = 'd10;
    parameter CNT_2MS_MAX = 'd100;
    parameter CNT_2S_MAX  = 'd100;

    initial begin
        clk = 0;
        forever begin
            #10;
            clk = ~clk;
        end
    end

    initial begin
        rstn = 0;
        #50
        rstn = 1;
    end

    breathing_led #(
        .CNT_2US_MAX(CNT_2US_MAX),
        .CNT_2MS_MAX(CNT_2MS_MAX),
        .CNT_2S_MAX(CNT_2S_MAX)
    )DUT_0(
        .clk(clk),
        .rstn(rstn),
        .led(led)
    );
endmodule