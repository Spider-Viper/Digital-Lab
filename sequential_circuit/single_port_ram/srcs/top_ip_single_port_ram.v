////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025-02-17 14:05:42
// Design Name: top_ip_single_port_ram.v
// Module Name: 
// Target Device: 
// Tool versions: 
// Description:
//
// Dependencies:
//
// Revision:
//
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module top_ip_single_port_ram(
    input clk,
    input rstn
);
    wire ram_en;            // ram使能
    wire ram_we;            // ram读写选择
    wire [4:0] ram_addr;    // ram地址
    wire [7:0] ram_w_data;  // ram写数据
    wire [7:0] ram_r_data;  // ram读数据

    read_write_control u0(
        .ram_en(ram_en),
        .ram_we(ram_we),
        .ram_addr(ram_addr),
        .ram_w_data(ram_w_data),
        .ram_r_data(ram_r_data),
        .clk(clk),
        .rstn(rstn)
    );

    blk_mem_gen_0 u1 (
        .clka(clk),         // input  wire          clk
        .ena(ram_en),       // input  wire          ram_en
        .wea(ram_we),       // input  wire          ram_we
        .addra(ram_addr),   // input  wire [4 : 0]  ram_addr
        .dina(ram_w_data),  // input  wire [7 : 0]  ram_w_data
        .douta(ram_r_data)  // output wire [7 : 0]  ram_r_data
    );
endmodule