`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 16:46:32
// Design Name: 
// Module Name: mult_cell_tb
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


`timescale 1ns / 1ps

module mult_cell_tb();

reg [7:0] mult_1;
reg [7:0] mult_2;

reg [15:0] mult_pre;

reg clk;
reg rst_n;
reg en;

wire rdy;

wire [7:0] mult_2_shift;
wire [15:0] mult_next;

mult_cell uut (
    .mult_1(mult_1),
    .mult_2(mult_2),
    .mult_pre(mult_pre),
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .rdy(rdy),
    .mult_2_shift(mult_2_shift),
    .mult_next(mult_next)
);

initial begin
    clk = 0;
    forever #5 clk = !clk;
end

initial begin
    rst_n = 1;
    en = 0;
    #10 rst_n = 0;
    #10 rst_n = 1;

    #100 $finish;
end

initial begin
    mult_1 = 1;
    mult_2 = 3;
    mult_pre = 1;
    #20 en = 1;
    #20 en = 0;

    #20 $finish;
end

endmodule

