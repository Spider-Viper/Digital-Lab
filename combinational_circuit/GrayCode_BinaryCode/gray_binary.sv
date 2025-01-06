////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025/01/01 17:26:35
// Design Name: gray_binary.sv
// Module Name: gray_binary
// Target Device: 
// Tool versions: vivado2023.2
// Description: 实现n位格雷码和n位二进制码之间相互转换,默认为8位
// Dependencies: 
// Revision: v1.0
// Additional Comments: 
////////////////////////////////////////////////////////////////////////////////

module gray_binary #(
    parameter WIDTH = 8
)(
    output reg [WIDTH-1:0]  code_out,
    output reg              gray_out_en,
    output reg              binary_out_en,
    input [WIDTH-1:0]       code_in,
    input                   en,
    input                   mode_sel,
    input                   rstn
);
    integer i;
    always @(*) begin
        if(rstn == 1'b0) begin      // 复位
            code_out = 0;
            gray_out_en = 1'b0;
            binary_out_en = 1'b0;
        end else begin
            if(en == 1) begin   // 转换使能
                if(mode_sel == 1) begin    // 格雷码转换为二进制码
                    gray_out_en = 1'b0;     // 格雷码输出无效
                    binary_out_en = 1'b1;   // 二进制码输出有效

                    code_out[WIDTH-1] = code_in[WIDTH-1];
                    for(i = 1; i <= WIDTH - 1; i = i + 1) begin
                        code_out[WIDTH-1-i] = code_out[WIDTH-i] ^ code_in[WIDTH-1-i];
                    end

                end else begin      // 二进制码转换为格雷码
                    gray_out_en = 1'b1;     // 格雷码输出有效
                    binary_out_en = 1'b0;   // 二进制码输出无效

                    code_out = code_in ^ (code_in >> 1);
                end
            end else begin      // 转换未使能
                code_out = 0;
                gray_out_en = 1'b0;
                binary_out_en = 1'b0;
            end
        end
    end
endmodule