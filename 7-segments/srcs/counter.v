/*
 *	每隔1秒，计数器加1
 *	利用计数器原理实现计时1s
 *	当计时达到1s，计数器加1
*/
module counter(
	output reg [3:0] 	cnt,	// 输出计数器数值
	input				clk,
	input				rstn	// 低电平复位
);
	//	计时1s
	reg [25:0] register;	// 系统时钟50MHz,计时1s，寄存器存储数值范围为：0~49999999，寄存器位数为：n = 26	
	always @(posedge clk or negedge rstn) begin
		if(!rstn)
			register <= 26'd0;
		else begin
			if(register < 26'd49_999_999)
				register <= register + 1'b1;
			else
				register <= 26'd0;
		end
	end
	
	// 计数器加1
	always @(posedge clk or negedge rstn) begin
		if(!rstn)
			cnt <= 4'b0000;
		else begin
			if(register == 26'd49_999_999)	// 计时达到1s，计数器加1
				cnt <= cnt + 1'b1;
			else
				cnt <= cnt;
		end
	end
	
endmodule