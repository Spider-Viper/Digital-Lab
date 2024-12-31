////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2024/12/31 16:05:06
// Design Name: decoder4_10.sv
// Module Name: decoder4_10 
// Target Device: 
// Tool versions: vivado2023.2
// Description: 利用移位操作实现译码器
// Dependencies: 
// Revision: v2.0
// Additional Comments: 
////////////////////////////////////////////////////////////////////////////////

module decoder4_10(
    output reg  [9:0]   dout,
    output reg          out_en,
    input       [3:0]   din,
    input               en,
    input               rstn
);

    always @(*) begin
        if(rstn == 1'b0) begin  // 复位
            dout = 10'b00_0000_0000;
            out_en = 1'b0;
        end else begin
            if(en == 1'b1) begin    // 译码使能
                out_en = 1'b1;  // 其他情况下 输出有效

                if(din >= 4'd0 && din <= 4'd9) begin    // 输入数据在0~9允许范围之内
                    dout = 1 << din;    // 1左移din位
                end else begin                          // 输入数据不在0~9允许范围之内，输出无效
                        dout = 10'b00_0000_0000;
                        out_en = 1'b0;
                end
            end else begin  // 译码未使能，输出无效
                dout = 10'b00_0000_0000;
                out_en = 1'b0;
            end
        end
    end

endmodule