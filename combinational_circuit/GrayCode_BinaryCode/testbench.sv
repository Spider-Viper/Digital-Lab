`timescale 1ns/1ns

module tb;
    reg [7:0] code_in;
    reg en;
    reg model_sel;
    reg rstn;
    wire [7:0] code_out;
    wire gray_out_en;
    wire binary_out_en;

    integer i;

    gray_binary DUT_0(
        .code_in(code_in),
        .code_out(code_out),
        .en(en),
        .model_sel(model_sel),
        .gray_out_en(gray_out_en),
        .binary_out_en(binary_out_en),
        .rstn(rstn)
    );

    initial begin
        rstn <= 0;
        en <= 0;
        model_sel <= 0;
        code_in <= 8'b0000_0000;
        #50
        rstn <= 1;

        #100
        en <= 1;    // 开始编码转换

        // 二进制码转换为格雷码
        for (i = 0; i <= 8'b1111_1111; i = i + 1) begin
            #30;
            code_in <= i;
        end

        #200

        // 格雷码转换为二进制码
        model_sel <= 1;
        for (i = 0; i <= 8'b1111_1111; i = i + 1) begin
            #30;
            code_in <= i;
        end

        en <= 1'b0;     // 停止编码转换

        // 二进制码转换为格雷码
        model_sel <= 0;
        for (i = 0; i <= 8'b1111_1111; i = i + 1) begin
            #30;
            code_in <= i;
        end

        #200

        // 格雷码转换为二进制码
        model_sel <= 1;
        for (i = 0; i <= 8'b1111_1111; i = i + 1) begin
            #30;
            code_in <= i;
        end

        #100
        $stop;

    end
endmodule