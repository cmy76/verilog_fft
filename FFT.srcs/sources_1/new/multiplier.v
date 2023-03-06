`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 21:09:13
// Design Name: 
// Module Name: multiplier
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


module multiplier(
	input[8:0]			a,
	input[8:0]			b,
	
	input				clk,
	input				rst_n,
	
	output[16:0]		prdct,
	output				rdy
    );
    
    mult_top mt(
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(1),
    	.mult_1(a[7:0]),
    	.mult_2(b[7:0]),
    	.result(prdct[15:0]),
    	.result_rdy(rdy)
    );
    
    assign prdct[16] = ~(a[8] & b[8]);
endmodule
