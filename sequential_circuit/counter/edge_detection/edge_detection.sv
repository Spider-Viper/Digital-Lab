////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025-01-09 18:21:39
// Design Name: edge_detection.sv
// Module Name: edge_detection
// Target Device: 
// Tool versions: 
// Description: 上升沿/下降沿检测电路
//
// Dependencies: 
//
// Revision: v1.0
//
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////

module edge_detection(
	output edge_out,
	input  clk     ,
	input  rstn    ,
	input  edge_in
);
	reg reg_1;
	reg reg_2;
	reg reg_3;

	always @(posedge clk, negedge rstn) begin
		if(rstn == 1'b0) begin
			reg_1 <= 1'b0;
			reg_2 <= 1'b0;
			reg_3 <= 1'b0;
		end else begin
			reg_1 <= edge_in;
			reg_2 <= reg_1;
			reg_3 <= reg_2;
		end
	end

	// 上升沿检测
	assign edge_out = reg_2 & ~reg_3;
	// 方式二
	// assign edge_out = (reg_2 && ~reg_3)? 1 : 0;
	
	// 下降沿检测
	assign edge_out = ~reg_2 & reg_3;
	// 方式二
	// assign edge_out = (~reg_2 && reg_3)? 1 : 0;
	
endmodule