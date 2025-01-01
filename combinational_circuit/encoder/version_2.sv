////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2024/12/28 15:13:10
// Design Name: version_2.sv
// Module Name: encoder10_4
// Target Device: 
// Tool versions: vivado2023.2
// Description: 对version_1进行优化，复用数据通路，减少硬件资源的使用
// Dependencies: 
// Revision: v2.0
// Additional Comments: 
////////////////////////////////////////////////////////////////////////////////


module encoder10_4(
    output  reg[3:0]    dout,
    output  reg         out_en,
    input   [9:0]       din,
    input               en,
    input               model_sel   
);
    always @(*) begin
        out_en = 1;
        if(en == 0) begin
            dout = 4'd0;
            out_en = 0;
        end else begin
            if(din[9])
                dout = 4'd9;
            else if(din[8])
                dout = 4'd8;
            else if(din[7])
                dout = 4'd7;
            else if(din[6])
                dout = 4'd6;
            else if(din[5])
                dout = 4'd5;
            else if(din[4])
                dout = 4'd4;
            else if(din[3])
                dout = 4'd3;
            else if(din[2])
                dout = 4'd2;
            else if(din[1])
                dout = 4'd1;
            else
                dout = 4'd0;
            
            // 对于普通编码器模式，若输入包含多位1时，输出编码无效
            if(model_sel == 0) begin
                if((din & (din - 1)) != 10'b00_0000_0000)
                    out_en = 0;
            end

            //普通编码器模式和优先编码器模式下，若输入为0，则输出编码无效
            if(din == 0)
                out_en = 0;
        end
    end
endmodule