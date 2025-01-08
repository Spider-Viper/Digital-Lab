module top(
    output freq_out_0,
    output freq_out_1,
    input clk_in,
    input rstn
);
    freq_div U_0(
        .clk_in(clk_in),
        .rstn(rstn),
        .freq_out(freq_out_0)
    );

    freq_div #(.FACTOR(5)) U_1(
        .clk_in(clk_in),
        .rstn(rstn),
        .freq_out(freq_out_1)
    );
endmodule