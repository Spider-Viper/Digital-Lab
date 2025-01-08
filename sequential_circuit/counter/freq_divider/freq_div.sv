////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025-01-08 12:39:01
// Design Name: freq_div.sv
// Module Name: freq_div
// Target Device: 
// Tool versions: 
// Description: 实现奇偶分频电路
//
// Dependencies: 
//
// Revision: v1.0
//
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////

module freq_div #(
    parameter FACTOR = 'd4  // 默认4分频
)(
    output freq_out,
    input  clk_in  ,
    input  rstn
);

    // 分频输出信号寄存器_偶数分频
    reg freq_out_even;
    // 分频输出信号寄存器_奇数分频
    reg freq_out_odd ;
    reg freq_out_up  ;   // 上升沿分频
    reg freq_out_down;   // 下降沿分频

    // 计算计数器位数_偶数分频
    localparam WIDTH_EVEN = $clog2(FACTOR / 2);
    // 计算计数器位数_奇数分频
    localparam WIDTH_ODD  = $clog2(FACTOR)    ;

    // 定义偶数分频计数器
    reg [WIDTH_EVEN-1:0] cnt_even;
    // 定义奇数分频计数器
    reg [WIDTH_ODD-1:0]  cnt_odd ; 


    // *************************************偶数分频************************************* //
    // 偶数分频计数器
    always @(posedge clk_in, negedge rstn) begin
        if(rstn == 1'b0)
            cnt_even <= 0;
        else begin
            if(cnt_even < FACTOR / 2 - 1'b1)
                cnt_even <= cnt_even + 1'b1;
            else
                cnt_even <= 0;
        end
    end
    // 输出偶数分频信号
    always @(posedge clk_in, negedge rstn) begin
        if(rstn == 1'b0)
            freq_out_even <= 0;
        else begin
            if(cnt_even == FACTOR / 2 - 1'b1)
                freq_out_even <= ~freq_out_even;
            else
                freq_out_even <= freq_out_even;
        end 
    end

    // *************************************奇数分频************************************* //
    // 奇数分频计数器
    always @(posedge clk_in, negedge rstn) begin
        if(rstn == 1'b0)
            cnt_odd <= 0;
        else begin
            if(cnt_odd < FACTOR - 1'b1)
                cnt_odd <= cnt_odd + 1'b1;
            else
                cnt_odd <= 0;
        end
    end
    // 上升沿分频
    always @(posedge clk_in, negedge rstn) begin
        if(rstn == 1'b0)
            freq_out_up <= 1'b0;
        else begin
            if(cnt_odd == ((FACTOR - 1) / 2 - 1) || cnt_odd == (FACTOR - 1))
                freq_out_up <= ~freq_out_up;
            else
                freq_out_up <= freq_out_up;
        end
    end
    // 下降沿分频
    always @(negedge clk_in, negedge rstn) begin
        if(rstn == 1'b0)
            freq_out_down <= 1'b0;
        else begin
            if(cnt_odd == ((FACTOR - 1) / 2 - 1) || cnt_odd == (FACTOR - 1))
                freq_out_down <= ~freq_out_down;
            else
                freq_out_down <= freq_out_down; 
        end
    end
    // 输出奇数分频信号
    assign freq_out_odd = freq_out_up & freq_out_down;  // 若freq_out_up和freq_out_down默认初始值为高电平，则需要进行或运算，否则输出分频信号占空比并非50%
    
    // *************************************最终分频信号************************************* //
    // 输出最终分频信号
    assign freq_out = (~FACTOR[0])? freq_out_even : freq_out_odd;   // 利用最低为判断是否为偶数
    // is_even 偶数的最低位为0 取反后为1 is_even便为真
endmodule