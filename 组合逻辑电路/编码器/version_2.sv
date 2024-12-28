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
    output  reg[3:0]    out,
    output  reg         flag,
    input   [9:0]       in,
    input               en,
    input               model_sel   
);
    always @(*) begin
        flag = 1;
        if(en == 0) begin
            out = 4'd0;
            flag = 0;
        end else begin
            if(in[9])
                out = 4'd9;
            else if(in[8])
                out = 4'd8;
            else if(in[7])
                out = 4'd7;
            else if(in[6])
                out = 4'd6;
            else if(in[5])
                out = 4'd5;
            else if(in[4])
                out = 4'd4;
            else if(in[3])
                out = 4'd3;
            else if(in[2])
                out = 4'd2;
            else if(in[1])
                out = 4'd1;
            else
                out = 4'd0;
            
            // 对于普通编码器模式，若输入包含多位1时，输出编码无效
            if(model_sel == 0) begin
                if((in & (in - 1)) != 10'b00_0000_0000)
                    flag = 0;
            end

            //普通编码器模式和优先编码器模式下，若输入为0，则输出编码无效
            if(in == 0)
                flag = 0;
        end
    end
endmodule