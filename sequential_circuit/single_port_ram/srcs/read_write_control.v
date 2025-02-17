////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025-02-17 13:46:57
// Design Name: read_write_control.v
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

module read_write_control(
    output reg       ram_en,        // ram使能端口
    output           ram_we,        // ram读写选择端口，低电平为读出数据，高电平为写入数据
    output reg [4:0] ram_addr,      // ram地址端口
    output reg [7:0] ram_w_data,    // ram写入数据
    input      [7:0] ram_r_data,    // ram读出数据
    input            clk,
    input            rstn
);

    // ram使能
    always @(posedge clk, negedge rstn) begin
        if(rstn == 1'b0)
            ram_en <= 1'b0;
        else
            ram_en <= 1'b1; 
    end

    // 读写控制计数器
    reg [5:0] cnt;
    always @(posedge clk, negedge rstn) begin
        if(rstn == 1'b0)
            cnt <= 6'b0;
        else if(cnt == 6'd63 && ram_en == 1'b1)
            cnt <= 6'b0;
        else if(ram_en == 1'b1)
            cnt <= cnt + 1'b1;
        else
            cnt <= 6'b0;
    end

    // 读写选择 cnt 0~31 进行写数据； cnt 32~63 进行读数据
    assign ram_we = (cnt <= 6'd31 && ram_en == 1'b1)? 1'b1 : 1'b0;

    // ram地址
    always @(posedge clk, negedge rstn) begin
        if(rstn == 1'b0)
            ram_addr <= 5'b0;
        else if(ram_addr == 5'd31 && ram_en == 1'b1)
            ram_addr <= 5'b0;
        else if(ram_en == 1'b1)
            ram_addr <= ram_addr + 1'b1;
        else
            ram_addr <= 5'b0;
    end

    // ram写入数据
    always @(posedge clk, negedge rstn) begin
        if(rstn == 1'b0)
            ram_w_data <= 8'b0;
        else if(ram_w_data < 8'd31 && ram_we)
            ram_w_data <= ram_w_data + 1'b1;
        else
            ram_w_data <= 8'b0;
    end
endmodule