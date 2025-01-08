////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025-01-08 19:57:19
// Design Name: seven_seg_top.sv
// Module Name: seven_seg_top
// Target Device: 
// Tool versions: 
// Description: 数码管动态显示电路
//
// Dependencies: 
//
// Revision: v1.0
//
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////

module seven_seg_top(
    output [6:0] dout,
    input clk,
    input rstn
);

reg freq_div_1Hz; // 分频后时钟，1Hz
reg [3:0]cnt;    // 计数器

// 实现计数器
always @(posedge freq_div_1Hz, negedge rstn) begin
    if(rstn == 1'b0)
        cnt <= 0;
    else begin
        if(cnt < 4'b1111)
            cnt <= cnt + 1'b1;
        else
            cnt <= 0;
    end
end

// 例化分频电路
freq_div #(.FACTOR('d50_000_000)) u_freq_div(   // 系统时钟50MHz，分频因子50_000_000，输出1Hz时钟
    .freq_out(freq_div_1Hz),
    .clk_in(clk),
    .rstn(rstn)
);

// 例化译码器
seven_seg_decoder u_seven_seg_decoder(
    .dout(dout),
    .din(cnt),
    .rstn(rstn)
);

endmodule