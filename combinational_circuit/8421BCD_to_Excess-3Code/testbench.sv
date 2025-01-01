`timescale 1ns/1ns

module tb;
    reg  [3:0]   din;
    reg          en;
    reg          rstn;
    wire [3:0]   dout;
    wire         out_en;

    BCDtoEXCESS3 DUT_0(
        .din(din),
        .dout(dout),
        .en(en),
        .rstn(rstn),
        .out_en(out_en)
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