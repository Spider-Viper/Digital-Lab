////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2024/12/31 16:05:06
// Design Name: decoder4_10.sv
// Module Name: decoder4_10 
// Target Device: 
// Tool versions: vivado2023.2
// Description: 
// Dependencies: 
// Revision: v1.0
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
            if(en == 1'b1) begin
                out_en = 1'b1;  // 其他情况下 输出有效
                case(din)
                    4'b0000: dout = 10'b00_0000_0001;
                    4'b0001: dout = 10'b00_0000_0010;
                    4'b0010: dout = 10'b00_0000_0100;
                    4'b0011: dout = 10'b00_0000_1000;
                    4'b0100: dout = 10'b00_0001_0000;
                    4'b0101: dout = 10'b00_0010_0000;
                    4'b0110: dout = 10'b00_0100_0000;
                    4'b0111: dout = 10'b00_1000_0000;
                    4'b1000: dout = 10'b01_0000_0000;
                    4'b1001: dout = 10'b10_0000_0000;
                    default: begin
                        dout = 10'b00_0000_0000;
                        out_en = 1'b0;  //输出无效
                    end
                endcase
            end else begin  // 输入未使能，输出无效
                dout = 10'b00_0000_0000;
                out_en = 1'b0;
            end
        end
    end

endmodule