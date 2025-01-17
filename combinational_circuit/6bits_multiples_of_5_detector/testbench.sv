`timescale 1ns/1ns

module tb;
    reg [5:0]   din     ;
    reg         en      ;
    reg         rstn    ;
    wire        dout    ;
    wire        out_en  ;

    integer     i       ;

    detector DUT_0(
        .din(din)       ,
        .en(en)         ,
        .rstn(rstn)     ,
        .dout(dout)     ,
        .out_en(out_en)
    );

    initial begin

        // 信号初始化 系统复位
        din <= 0;
        en <= 0;
        rstn <= 0;
        #50
        rstn <= 1;

        // 检测使能
        #150
        en <= 1;

        for(i = 0; i <= 63; i = i + 1) begin

            #30;
            din <= din + 1;

        end

        // 关闭检测使能
        #100
        en <= 0;

        for(i = 0; i <= 63; i = i + 1) begin

            #30;
            din <= din + 1;

        end

        // 停止仿真
        #200
        $stop;

    end
endmodule