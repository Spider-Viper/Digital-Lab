`timescale 1ns / 1ns

module top_tb();
	reg clk;
	reg rstn;
	wire [7:0] segs;
	
	initial begin
		clk = 1'b0;
		rstn = 1'b0;
		#300
		rstn = 1'b1;
	end
	
	always #10 clk = ~clk;
	
	top u0(
		.segs(segs),
		.clk(clk),
		.rstn(rstn)
	);
	
endmodule