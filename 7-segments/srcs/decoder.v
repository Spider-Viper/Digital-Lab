/*
 *	7段共阴极数码管译码电路（不包括小数点）
 *	输入为计数器数值，范围：0~F
*/
/*
	数码管简图：
				a
			  f   b
			    g
			  e   c
			    d    h
				
			MSB			  LSB
			e d h c g b f a
*/

module decoder(
	input [3:0]			cnt,
	output reg [7:0]	segments
);
	always @(*) begin
		case(cnt)
			4'h0:	segments = 8'b1101_0111;
			4'h1:	segments = 8'b0001_0100;
			4'h2:	segments = 8'b1100_1101;
			4'h3:	segments = 8'b0101_1101;
			4'h4:	segments = 8'b0001_1110;
			4'h5:	segments = 8'b0101_1011;
			4'h6:	segments = 8'b1101_1011;
			4'h7:	segments = 8'b0001_0101;
			4'h8:	segments = 8'b1101_1111;
			4'h9:	segments = 8'b0101_1111;
			4'ha:	segments = 8'b1001_1111;
			4'hb:	segments = 8'b1101_1010;
			4'hc:	segments = 8'b1100_0011;
			4'hd:	segments = 8'b1101_1100;
			4'he:	segments = 8'b1100_1011;
			4'hf:	segments = 8'b1000_1011;
		endcase
	end
	
endmodule