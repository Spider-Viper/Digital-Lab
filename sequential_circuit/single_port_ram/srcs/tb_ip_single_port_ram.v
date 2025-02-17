`timescale 1ns/1ns
module tb_ip_single_port_ram();
    reg clk;
    reg rstn;

    initial begin
        clk = 1'b0;
        #30
        forever begin
            #10 clk = ~clk;
        end
    end

    initial begin
        rstn = 1'b0;
        #300
        rstn = 1'b1;
    end

    top_ip_single_port_ram DUT(
        .clk(clk),
        .rstn(rstn)
    );
    
endmodule