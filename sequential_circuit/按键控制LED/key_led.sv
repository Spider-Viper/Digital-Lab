////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025-01-09 18:40:11
// Design Name: key_led.sv
// Module Name: key_led
// Target Device: 
// Tool versions: 
// Description: 按键每按下一次，led状态翻转一次
//
// Dependencies: 
//
// Revision: v1.0
//
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////

module key_led(
	output led   ,
	input  clk   ,
	input  rstn  ,
	input  key_in
);

	reg  led_reg  ;

	wire key_out  ;
	wire edge_out ;

	// 例化消抖电路
	debounce u_debounce(
		.clk(clk),
		.rstn(rstn),
		.key_in(key_in),
		.key_out(key_out)
	);
	// 例化边沿检测电路
	edge_detection u_edge_detection(
		.clk(clk),
		.rstn(rstn),
		.edge_in(key_out),
		.edge_out(edge_out)
	);
	// led信号输出
	always @(posedge clk, negedge rstn) begin
		if(rstn == 1'b0)
			led_reg <= 0;
		else begin
			if(edge_out == 1'b1)
				led_reg <= ~led_reg;
			else
				led_reg <= led_reg;
		end
	end
	assign led = led_reg;
endmodule