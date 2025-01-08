`timescale 1ns/1ns
module tb;
    reg     clk_in    ;
    reg     rstn      ;
    wire    freq_out_0;
    wire    freq_out_1;

    freq_div DUT_0(                 // 默认4分频
        .clk_in(clk_in),
        .rstn(rstn),
        .freq_out(freq_out_0)
    );

    freq_div #(.FACTOR(5)) DUT_1(   // 5分频
        .clk_in(clk_in),
        .rstn(rstn),
        .freq_out(freq_out_1)
    );

    // 产生输入时钟 周期为20ns
    initial begin
        clk_in = 0;
        forever begin
            #10;
            clk_in = ~clk_in;
        end
    end

    // 复位
    initial begin
        rstn <= 0;
        #50;
        rstn <= 1;
    end
endmodule