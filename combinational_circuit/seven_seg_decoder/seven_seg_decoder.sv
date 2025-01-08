////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025/01/01 13:14:41
// Design Name: seven_seg_decoder.sv
// Module Name: seven_seg_decoder
// Target Device: 
// Tool versions: vivado2023.2
// Description: 七段数码管译码器
// Dependencies: 
// Revision: v1.0
// Additional Comments: 
////////////////////////////////////////////////////////////////////////////////

module seven_seg_decoder(
    output reg          a,b,c,d,e,f,g,
    output      [6:0]   dout,
    output reg          out_en,
    input       [3:0]   din,
    input               en,
    input               rstn
);
    always @(*) begin
       if(rstn == 0) begin  // 复位
            out_en = 0;     // 译码输出无效
            {g,f,e,d,c,b,a} = 7'b000_0000;  // 无显示
       end else begin
            if(en == 1) begin     // 译码使能
                out_en = 1;     // 译码输出有效
                case(din)
                    4'b0000 : {g,f,e,d,c,b,a} = 7'b011_1111;    // 0
                    4'b0001 : {g,f,e,d,c,b,a} = 7'b000_0110;    // 1
                    4'b0010 : {g,f,e,d,c,b,a} = 7'b101_1011;    // 2
                    4'b0011 : {g,f,e,d,c,b,a} = 7'b100_1111;    // 3
                    4'b0100 : {g,f,e,d,c,b,a} = 7'b110_0110;    // 4
                    4'b0101 : {g,f,e,d,c,b,a} = 7'b110_1101;    // 5
                    4'b0110 : {g,f,e,d,c,b,a} = 7'b111_1101;    // 6
                    4'b0111 : {g,f,e,d,c,b,a} = 7'b000_0111;    // 7
                    4'b1000 : {g,f,e,d,c,b,a} = 7'b111_1111;    // 8
                    4'b1001 : {g,f,e,d,c,b,a} = 7'b110_1111;    // 9
                    4'b1010 : {g,f,e,d,c,b,a} = 7'b111_0111;    // a
                    4'b1011 : {g,f,e,d,c,b,a} = 7'b111_1100;    // b
                    4'b1100 : {g,f,e,d,c,b,a} = 7'b011_1001;    // c
                    4'b1101 : {g,f,e,d,c,b,a} = 7'b101_1110;    // d
                    4'b1110 : {g,f,e,d,c,b,a} = 7'b111_1001;    // e
                    4'b1111 : {g,f,e,d,c,b,a} = 7'b111_0001;    // f
                    default : {g,f,e,d,c,b,a} = 7'b000_0000;    // 无显示
                endcase
            end else begin
                out_en = 0; // 译码输出无效
                {g,f,e,d,c,b,a} = 7'b000_0000;  //无显示
            end 
       end
    end
    assign dout = {g,f,e,d,c,b,a};  // 用于仿真测试

endmodule