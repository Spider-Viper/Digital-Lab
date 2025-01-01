`timescale 1ns/1ns

module tb;
    reg  [3:0]   din;
    reg          en;
    reg          rstn;
    wire [6:0]   dout;
    wire         a,b,c,d,e,f,g;
    wire         out_en;

    seven_seg_decoder DUT_0(
        .din(din),
        .en(en),
        .rstn(rstn),
        .out_en(out_en),
        .a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),
        .dout(dout)
    );

    integer i;

    initial begin
        din <= 4'b0000;
        en <= 1'b0;
        rstn <= 1'b0;
        #50
        rstn <= 1'b1;

        #300
        en <= 1'b1;

        for(i = 0; i <= 15; i = i + 1) begin
            #30;
            din <= din + 1'b1;
        end

        #200
        en <= 1'b0;

        for(i = 0; i <= 9; i = i + 1) begin
            #30;
            din <= din + 1'b1;
        end

        #500

        $stop;
    end

endmodule