////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2024/12/28 15:09:49
// Design Name: version_1.sv
// Module Name: encoder10_4
// Target Device: 
// Tool versions: vivado2023.2
// Description: 
//      设计10线-4线BCD编码器，具有普通编码器和优先编码器功能
//      首先分别设计一个普通编码器和一个优先编码器,然后根据模式选择位model_sel，利用多路选择器选择普通编码器或者优先编码器作为最终输出
// Dependencies: 
// Revision: V1.0
// Additional Comments: 
////////////////////////////////////////////////////////////////////////////////

module encoder10_4(
    output  reg[3:0]    out,
    output  reg         flag,
    input   [9:0]       in,
    input               en,
    input               model_sel
);

always @(*) begin
    flag = 1;   // 输出标志位为1，默认输出有效
    if(en == 0) begin   // 使能无效，不进行编码，输出标志位为0，输出无效
        out = 4'b0;
        flag = 0;
    end else begin
        case(model_sel)
            1'b0 : begin    // 模式选择位为0，普通编码器模式
                case(in)
                    10'b00_0000_0001 : out = 4'd0;
                    10'b00_0000_0010 : out = 4'd1;
                    10'b00_0000_0100 : out = 4'd2;
                    10'b00_0000_1000 : out = 4'd3;
                    10'b00_0001_0000 : out = 4'd4;
                    10'b00_0010_0000 : out = 4'd5;
                    10'b00_0100_0000 : out = 4'd6;
                    10'b00_1000_0000 : out = 4'd7;
                    10'b01_0000_0000 : out = 4'd8;
                    10'b10_0000_0000 : out = 4'd9;
                    default : begin     // 输出编码无效
                        out = 4'd0;
                        flag = 0;
                    end
                endcase
            end

            1'b1 : begin    // 模式选择位为1， 优先编码器模式
                casex(in)
                    10'b1x_xxxx_xxxx : out = 4'd9;
                    10'b01_xxxx_xxxx : out = 4'd8;
                    10'b00_1xxx_xxxx : out = 4'd7;
                    10'b00_01xx_xxxx : out = 4'd6;
                    10'b00_001x_xxxx : out = 4'd5;
                    10'b00_0001_xxxx : out = 4'd4;
                    10'b00_0000_1xxx : out = 4'd3;
                    10'b00_0000_01xx : out = 4'd2;
                    10'b00_0000_001x : out = 4'd1;
                    10'b00_0000_0001 : out = 4'd0;
                    default : begin
                        out = 4'd0;
                        flag = 0;
                    end
                endcase
            end
            default : begin     // 模式位为其他
                out = 4'd0;
                flag = 0;
            end
        endcase
    end
end

endmodule