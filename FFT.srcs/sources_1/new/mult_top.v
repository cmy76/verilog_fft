`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 16:56:37
// Design Name: 
// Module Name: mult_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mult_top(
	input           clk,
    input           rst_n,
    input           en,

    input[7:0]      mult_1,
    input[7:0]      mult_2,

    output[15:0]    result,
    output			result_rdy
    );

    wire[7:0]       rdy;
    wire[15:0]      product[7:0];
    wire[7:0]       mult_2_shift[7:0];
	wire[15:0]		mult_1_shift[7:0];
    mult_cell step0(
        .mult_1({{(8){1'b0}}, mult_1}),
        .mult_2(mult_2),
        .mult_pre(0),
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .rdy(rdy[0]),
        .mult_next(product[0]),
        .mult_1_shift(mult_1_shift[0]),
        .mult_2_shift(mult_2_shift[0])
    );

    genvar               i ;
    generate
        for(i=1; i<=8-1; i=i+1) begin: mult_stepx
            mult_cell
            u_mult_step
            (
                .mult_1(mult_1_shift[i-1]),
                .mult_2(mult_2_shift[i-1]),
                .mult_pre(product[i-1]),
                .clk(clk),
                .rst_n(rst_n),
                .en(rdy[i-1]),
                .rdy(rdy[i]),
                .mult_next(product[i]),
                .mult_1_shift(mult_1_shift[i]),
                .mult_2_shift(mult_2_shift[i])
            );
        end
    endgenerate
    assign result = product[7];
    assign result_rdy = rdy[7];
endmodule
