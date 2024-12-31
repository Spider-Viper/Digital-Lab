`timescale 1ns/1ns

module tb;
    reg [3:0]   din;
    reg         en;
    reg         rstn;
    wire [9:0]  dout;
    wire        out_en;

    integer i;

    // instance UUT
    decoder4_10 UUT_0(
        .dout(dout),
        .out_en(out_en),
        .din(din),
        .en(en),
        .rstn(rstn)
    );

    // initial signal
    initial begin
        din = 4'b0000;
        en = 1'b0;
        rstn = 1'b0;
        #50
        rstn = 1'b1;

        #300
        en = 1'b1;
        #30

        for(i = 0; i <= 15; i = i + 1) begin
            din = din + 1;
            #30;
        end

        en = 1'b0;

        for(i = 0; i <= 9; i = i + 1) begin
            din = din + 1;
            #30;
        end
        
        #200
        $finish;
    end

endmodule