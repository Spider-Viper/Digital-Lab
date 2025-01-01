////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025/01/01 15:50:28
// Design Name: BCDtoEXCESS3.sv
// Module Name: BCDtoEXCESS3
// Target Device: 
// Tool versions: vivado2023.2
// Description: 实现4位8421BCD码转换为余3码电路
// Dependencies: 
// Revision: 
// Additional Comments: 
////////////////////////////////////////////////////////////////////////////////

module BCDtoEXCESS3(
    output reg  [3:0]   dout,
    output reg          out_en,
    input       [3:0]   din,
    input               en,
    input               rstn 
);
    always @(*) begin
        if(rstn == 1'b0) begin      // 复位
            dout = 4'b0000;
            out_en = 1'b0;      // 余3码转换输出无效
        end else begin
            if(en == 1'b1) begin    // 转换电路使能
                out_en = 1'b1;      // 输出有效
                dout = din + 'd3;
            end else begin      // 转换电路未使能
                out_en = 1'b0;      // 输出无效
                dout = 4'b0000;
            end
        end
    end

endmodule