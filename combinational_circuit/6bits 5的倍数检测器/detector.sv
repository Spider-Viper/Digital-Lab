////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025/01/03 10:27:28
// Design Name: detector.sv
// Module Name: detector
// Target Device: 
// Tool versions: vivado2023.2
// Description: 5的倍数检测器
// Dependencies: 
// Revision: v1.0
// Additional Comments: 
////////////////////////////////////////////////////////////////////////////////

module detector(
    output reg  dout,       // 检测结果输出端口
    output reg  out_en,     // 检测结果输出使能端口
    input [5:0] din,        // 6位数据输入端口
    input       en,         // 检测使能端口
    input       rstn        // 复位端口 低电平有效
);

    reg [2:0] num_1,num_2,num_3,num_4;  // 定义临时变量
    always @(*) begin
        if(rstn == 0) begin     // 系统复位
            dout = 0;
            out_en = 0;     // 检测输出无效
        end else begin
            if(en == 1) begin   // 检测使能
                out_en = 1;
                num_1 = din[5:3] >= 3'b101 ? din[5:3] - 3'b101 : din[5:3];
                num_2 = {num_1,din[2]} >= 3'b101 ? {num_1,din[2]} - 3'b101 : {num_1,din[2]};
                num_3 = {num_2,din[1]} >= 3'b101 ? {num_2,din[1]} - 3'b101 : {num_2,din[1]};
                num_4 = {num_3,din[0]} >= 3'b101 ? {num_3,din[0]} - 3'b101 : {num_3,din[0]};
                if(num_4 == 0) begin    // 最终余数为0
                    dout = 1'b1;    // 是5的倍数
                end else begin  // 最终余数非0
                    dout = 1'b0;    // 非5的倍数
                end
            end else begin      // 检测未使能
                dout = 0;
                out_en = 0;
            end
        end
    end

endmodule