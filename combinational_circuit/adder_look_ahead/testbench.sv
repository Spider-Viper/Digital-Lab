`timescale 1ns/1ns

module tb;
    reg     [7:0]   a   ;
    reg     [7:0]   b   ;
    reg             cin ;
    wire    [7:0]   sum ;
    wire            cout;

    integer i;

    adder #(.WIDTH(8)) DUT_0(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        a <= 0;
        b <= 0;
        cin <= 0;

        #100

        for(i = 0; i <= 29; i = i + 1) begin 
            a <= $random % 256;  // 生成范围在0~255之间的随机数
            b <= $random % 256;
            #30;
        end

        #100
        $stop;
    end
endmodule