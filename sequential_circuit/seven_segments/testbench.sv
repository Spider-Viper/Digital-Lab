`timescale 1ns/1ns

module tb;

    reg clk;
    reg rstn;
    wire [6:0] dout;

    initial begin
        clk = 0;
        forever begin
            #10;
            clk = ~clk;
        end
    end

    initial begin
        rstn <= 0;
        #50
        rstn <= 1;
    end

    seven_seg_top DUT_0(
        .dout(dout),
        .clk(clk),
        .rstn(rstn)
    );

endmodule