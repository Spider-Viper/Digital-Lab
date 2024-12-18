/*
 *	7段共阴极数码管顶层模块
*/
module seven_segments_top(
	output [7:0]	segs,
	input			clk,
	input			rstn
);
	wire [3:0]	counter;
	
	counter u0(
		.cnt(counter),
		.clk(clk),
		.rstn(rstn)
	);
	
	decoder u1(
		.segments(segs),
		.cnt(counter)
	);
	
endmodule