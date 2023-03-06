`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/10 14:59:14
// Design Name: 
// Module Name: complex_multiplier
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


module complex_multiplier(
	input[11:0]		a,
	input[11:0]		b,
	input[11:0]		c,
	input[11:0]		d,
	
	input			clk,
	input			rst_n,
	input			en,
	
	output[23:0]	result_img,
	output[23:0]	result_real
    );
    
    wire[23:0]		result_ac;
    wire[23:0]		result_bd;
    wire[23:0]		result_ad;
    wire[23:0]		result_bc;
    
    wire[3:0]		result_rdy;
    wire[23:0]		mask;
    
    assign result_img  = (result_ad + result_bc)>>7;
    assign result_real = (result_ac + (~result_bd + 1'b1))>>7;
    
    booth_top m0 (
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(en),
    	.mult_1(a),
    	.mult_2(c),
    	.result(result_ac),
    	.result_rdy(result_rdy[0])
	);
	
	booth_top m1 (
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(en),
    	.mult_1(b),
    	.mult_2(d),
    	.result(result_bd),
    	.result_rdy(result_rdy[1])
	);
	
	booth_top m2 (
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(en),
    	.mult_1(a),
    	.mult_2(d),
    	.result(result_ad),
    	.result_rdy(result_rdy[2])
	);
	
	booth_top m3 (
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(en),
    	.mult_1(b),
    	.mult_2(c),
    	.result(result_bc),
    	.result_rdy(result_rdy[3])
	);
endmodule
