`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/10 16:04:46
// Design Name: 
// Module Name: butterfly
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


module butterfly(
	input[11:0]			x_m_0_real,
	input[11:0]			x_m_0_img,
	
	input[11:0]			x_n_0_real,
	input[11:0]			x_n_0_img,
	
	input				clk,
	input				rst_n,
	input[2:0]			index,
	
	output[11:0]		x_m_1_real,
	output[11:0]		x_m_1_img,
	
	output[11:0]		x_n_1_real,
	output[11:0]		x_n_1_img
    );
    wire[23:0]	x_m_1_real_long, x_m_1_img_long, x_n_1_real_long, x_n_1_img_long;
    
    wire[11:0]	r;
    wire[11:0]	i;
    
    spin_table st(
    	.index(index),
    	.rea(r),
    	.img(i)
    );
    
    wire[23:0]		result_img;
    wire[23:0]		result_real;
    
    
    assign x_m_1_real_long = (result_real + x_m_0_real);
    assign x_m_1_img_long  = (result_img + x_m_0_img);
    
    assign x_n_1_real_long = ((~result_real + 1'b1) + x_m_0_real);
    assign x_n_1_img_long  = ((~result_img + 1'b1) + x_m_0_img);
    
    complex_multiplier cm(
    	.a(r),
    	.b(i),
    	.c(x_n_0_real),
    	.d(x_n_0_img),
    	.clk(clk),
    	.rst_n(rst_n),
    	.en(1),
    	.result_img(result_img),
		.result_real(result_real)
    );
    
    assign x_m_1_real = (x_m_1_real_long[11:0]);
    assign x_m_1_img  = x_m_1_img_long[11:0];
    assign x_n_1_real = x_n_1_real_long[11:0];
    assign x_n_1_img  = x_n_1_img_long[11:0];
    
endmodule
