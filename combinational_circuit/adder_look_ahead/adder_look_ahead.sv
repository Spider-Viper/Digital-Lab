////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
// Create Date: 2025/01/03 16:50:33
// Design Name: adder_look_ahead.sv
// Module Name: adder
// Target Device: 
// Tool versions: vivado2023.2
// Description: N位超前进位加法器 默认4位加法器
// Dependencies: 
// Revision: 
// Additional Comments: 
////////////////////////////////////////////////////////////////////////////////

module adder #(
    parameter WIDTH = 4
)(
    output  [WIDTH-1:0]     sum     ,
    output                  cout    ,
    input   [WIDTH-1:0]     a       ,
    input   [WIDTH-1:0]     b       ,
    input                   cin
);
    genvar i;

    // generate signal and propagate signal
    wire [WIDTH-1:0] generate_signal ;
    wire [WIDTH-1:0] propagate_signal;

    assign generate_signal = a & b;
    assign propagate_signal = a ^ b;

    // carry
    wire [WIDTH:0] carry;

    assign carry[0] = cin;

    // style 1
    // assign carry[1] = generate_signal[0] | (propagate_signal[0] & carry[0]);
    // assign carry[2] = generate_signal[1] | (propagate_signal[1] & carry[1]);
    // assign carry[3] = generate_signal[2] | (propagate_signal[2] & carry[2]);
    // assign carry[4] = generate_signal[3] | (propagate_signal[3] & carry[3]);
    // assign carry[5] = generate_signal[4] | (propagate_signal[4] & carry[4]);
    // assign carry[6] = generate_signal[5] | (propagate_signal[5] & carry[5]);
    // assign carry[7] = generate_signal[6] | (propagate_signal[6] & carry[6]);
    // assign carry[8] = generate_signal[7] | (propagate_signal[7] & carry[7]);
    
    // style 2
    generate
        for(i = 1; i <= WIDTH; i = i + 1) begin
            assign carry[i] = generate_signal[i-1] | (propagate_signal[i-1] & carry[i-1]);
        end
    endgenerate

    // summatiom
    assign sum = a ^ b ^ carry[WIDTH-1:0];

    // final cout
    assign cout = carry[WIDTH];
endmodule