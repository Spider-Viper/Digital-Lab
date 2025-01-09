////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025-01-09 15:48:13
// Design Name: debounce.sv
// Module Name: debounce
// Target Device: 
// Tool versions: 
// Description: 实现按键去抖动
//
// Dependencies: 
//
// Revision: v1.0
//
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////

module debounce(
    output key_out ,
    input  key_in  ,
    input  clk     ,
    input  rstn
	
);
	// 寄存按键输入信号
	reg key_in_reg_1;
	reg key_in_reg_2;

	reg key_out_reg ;

	// 定义计数器计数最大值
	parameter CNT_MAX = 'd5_000_000; // 系统时钟20ns，计时100ms，计数最大值为5_000_000

	// 定义计数器
	reg [22:0] cnt;

	// 将按键输入信号寄存两次
	always @(posedge clk, negedge rstn) begin
		if(rstn == 1'b0) begin
			key_in_reg_1 <= 1'b1;
			key_in_reg_2 <= 1'b1;
		end else begin
			key_in_reg_1 <= key_in;
			key_in_reg_2 <= key_in_reg_1;
		end
	end

	// 计数器进行计数
	always @(posedge clk, negedge rstn) begin
		if(rstn == 1'b0)
			cnt <= 0;
		else begin
			if(key_in_reg_1 != key_in_reg_2)	// 若先后两次寄存信号不同则说明按键按下或抬起
				cnt <= CNT_MAX;
			else begin
				if(cnt > 0)
					cnt <= cnt - 1'b1;
				else
					cnt <= 0;
			end
		end
	end

	// 输出消抖后按键信号
	always @(posedge clk, negedge rstn) begin
		if(rstn == 1'b0)
			key_out_reg <= 1'b1;
		else begin
			if(cnt == 1)
				key_out_reg <= key_in_reg_2;
			else
				key_out_reg <= key_out_reg;
		end
	end

	assign key_out = key_out_reg;
endmodule