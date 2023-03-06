`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/09 15:58:17
// Design Name: 
// Module Name: tb_booth
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


module tb_booth();

reg [2:0] mult_1;
reg [11:0] mult_2;

reg [23:0] mult_pre;

reg clk;
reg rst_n;
reg en;

wire rdy;

wire [23:0] mult_next;

booth uut (
    .mult_1(mult_1),
    .mult_2(mult_2),
    .mult_pre(mult_pre),
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .rdy(rdy),
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

    #160 $finish;
end

initial begin
    mult_1 = 3'b000;
    mult_2 = -63;
    mult_pre = 20; 
    #20 en = 1;
    
    mult_1 = 3'b001;
    #20
    mult_1 = 3'b010;
    #20
    mult_1 = 3'b011;
    #20
    mult_1 = 3'b100;
	#20
	mult_1 = 3'b101;
	#20
	mult_1 = 3'b110;
	#20
	mult_1 = 3'b111;
    #20 $finish;
end

endmodule
