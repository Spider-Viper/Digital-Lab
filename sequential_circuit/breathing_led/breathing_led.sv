////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025-01-09 10:38:21
// Design Name: breathing_led.sv
// Module Name: breathing_led
// Target Device: 
// Tool versions: 
// Description: 实现呼吸灯
//
// Dependencies: 
//
// Revision: 
//
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////

module breathing_led (
    output led,
    input clk,
    input rstn
);
    // 定义3个计数器的最大值
    parameter CNT_2US_MAX = 7'd100;
    parameter CNT_2MS_MAX = 10'd1000;
    parameter CNT_2S_MAX  = 10'd1000;

    // 定义3个计数器，分别计数2us，2ms，2s
    reg [6:0] cnt_2us;  // 2us 计数器
    reg [9:0] cnt_2ms;  // 2ms 计数器
    reg [9:0] cnt_2s  ;  // 2s  计数器

    // 定义过程标志，0表示由暗变亮的过程，1表示由亮变暗的过程
    reg bright_dim_flag;

    // 定义led暂存寄存器
    reg led_reg;

    // 实现2us计数
    always @(posedge clk, negedge rstn) begin
        if(rstn == 1'b0)
            cnt_2us <= 0;
        else begin
            if(cnt_2us == CNT_2US_MAX - 7'b1)
                cnt_2us <= 0;
            else
                cnt_2us <= cnt_2us + 1'b1;
        end 
    end

    // 实现2ms计数
    always @(posedge clk, negedge rstn) begin
        if(rstn == 1'b0)
            cnt_2ms <= 0;
        else begin
            if(cnt_2ms == CNT_2MS_MAX - 10'b1 && cnt_2us == CNT_2US_MAX - 7'b1)
                cnt_2ms <= 0;
            else if(cnt_2us == CNT_2US_MAX - 7'b1)
                cnt_2ms <= cnt_2ms + 7'b1;
            else
                cnt_2ms <= cnt_2ms;
        end
    end

    // 实现2s计数
    always @(posedge clk, negedge rstn) begin
        if(rstn == 1'b0)
            cnt_2s <= 0;
        else begin
            if(cnt_2s == CNT_2S_MAX - 10'b1 && cnt_2ms == CNT_2MS_MAX - 10'b1 && cnt_2us == CNT_2US_MAX - 7'b1)
                cnt_2s <= 0;
            else if(cnt_2ms == CNT_2MS_MAX - 10'b1 && cnt_2us == CNT_2US_MAX - 7'b1)
                cnt_2s <= cnt_2s + 10'b1;
            else
                cnt_2s <= cnt_2s;
        end
    end

    // 由暗到亮 由亮到暗过程转换
    always @(posedge clk, negedge rstn) begin
        if(rstn == 1'b0)
            bright_dim_flag <= 0;
        else begin
            if(cnt_2s == CNT_2S_MAX - 10'b1 && cnt_2ms == CNT_2MS_MAX - 10'b1 && cnt_2us == CNT_2US_MAX - 7'b1)
                bright_dim_flag <= ~bright_dim_flag;
            else
                bright_dim_flag <= bright_dim_flag;
        end
    end

    // led 输出
    always @(posedge clk, negedge rstn) begin
        if(rstn == 1'b0)
            led_reg <= 0;
        else begin
            if((bright_dim_flag == 1'b0 && cnt_2ms <= cnt_2s) || (bright_dim_flag == 1'b1 && cnt_2ms >= cnt_2s))
                led_reg <= 1'b1;
            else 
                led_reg <= 0;
        end
    end

    assign led = led_reg;


endmodule