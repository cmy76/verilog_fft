`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/11 12:56:52
// Design Name: 
// Module Name: fft_top
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


module fft_top(
	input[11:0]			x_0,
	input[11:0]			x_1,
	input[11:0]			x_2,
	input[11:0]			x_3,
	input[11:0]			x_4,
	input[11:0]			x_5,
	input[11:0]			x_6,
	input[11:0]			x_7,
	
	input				clk,
	input				rst_n,
	
	output[11:0]			y_0_r,
	output[11:0]			y_1_r,
	output[11:0]			y_2_r,
	output[11:0]			y_3_r,
	output[11:0]			y_4_r,
	output[11:0]			y_5_r,
	output[11:0]			y_6_r,
	output[11:0]			y_7_r,

	output[11:0]			y_0_i,
	output[11:0]			y_1_i,
	output[11:0]			y_2_i,
	output[11:0]			y_3_i,
	output[11:0]			y_4_i,
	output[11:0]			y_5_i,
	output[11:0]			y_6_i,
	output[11:0]			y_7_i
    );
    
   	wire[11:0]			stage_0_real[7:0];
   	wire[11:0]			stage_0_img[7:0];
   
   	wire[11:0]			stage_1_real[7:0];
   	wire[11:0]			stage_1_img[7:0];

    butterfly bf0_0(
		.x_m_0_real(x_0),
		.x_m_0_img(0),
		.x_n_0_real(x_4),
		.x_n_0_img(0),
		.clk(clk),
		.rst_n(rst_n),
		.index(0),
		.x_m_1_real(stage_0_real[0]),
		.x_m_1_img(stage_0_img[0]),
		.x_n_1_real(stage_0_real[1]),
		.x_n_1_img(stage_0_img[1])
	);

   
    butterfly bf0_1(
		.x_m_0_real(x_1),
		.x_m_0_img(0),
		.x_n_0_real(x_5),
		.x_n_0_img(0),
		.clk(clk),
		.rst_n(rst_n),
		.index(0),
		.x_m_1_real(stage_0_real[2]),
		.x_m_1_img(stage_0_img[2]),
		.x_n_1_real(stage_0_real[3]),
		.x_n_1_img(stage_0_img[3])
	);

	butterfly bf0_2(
		.x_m_0_real(x_2),
		.x_m_0_img(0),
		.x_n_0_real(x_6),
		.x_n_0_img(0),
		.clk(clk),
		.rst_n(rst_n),
		.index(0),
		.x_m_1_real(stage_0_real[4]),
		.x_m_1_img(stage_0_img[4]),
		.x_n_1_real(stage_0_real[5]),
		.x_n_1_img(stage_0_img[5])
	);

	butterfly bf0_3(
		.x_m_0_real(x_3),
		.x_m_0_img(0),
		.x_n_0_real(x_7),
		.x_n_0_img(0),
		.clk(clk),
		.rst_n(rst_n),
		.index(0),
		.x_m_1_real(stage_0_real[6]),
		.x_m_1_img(stage_0_img[6]),
		.x_n_1_real(stage_0_real[7]),
		.x_n_1_img(stage_0_img[7])
	);

	butterfly bf1_0(
		.x_m_0_real(stage_0_real[0]),
		.x_m_0_img(stage_0_img[0]),
		.x_n_0_real(stage_0_real[2]),
		.x_n_0_img(stage_0_img[2]),
		.clk(clk),
		.rst_n(rst_n),
		.index(0),
		.x_m_1_real(stage_1_real[0]),
		.x_m_1_img(stage_1_img[0]),
		.x_n_1_real(stage_1_real[2]),
		.x_n_1_img(stage_1_img[2])
	);

	butterfly bf1_1(
		.x_m_0_real(stage_0_real[1]),
		.x_m_0_img(stage_0_img[1]),
		.x_n_0_real(stage_0_real[3]),
		.x_n_0_img(stage_0_img[3]),
		.clk(clk),
		.rst_n(rst_n),
		.index(2),
		.x_m_1_real(stage_1_real[1]),
		.x_m_1_img(stage_1_img[1]),
		.x_n_1_real(stage_1_real[3]),
		.x_n_1_img(stage_1_img[3])
	);

	butterfly bf1_2(
		.x_m_0_real(stage_0_real[4]),
		.x_m_0_img(stage_0_img[4]),
		.x_n_0_real(stage_0_real[6]),
		.x_n_0_img(stage_0_img[6]),
		.clk(clk),
		.rst_n(rst_n),
		.index(0),
		.x_m_1_real(stage_1_real[4]),
		.x_m_1_img(stage_1_img[4]),
		.x_n_1_real(stage_1_real[6]),
		.x_n_1_img(stage_1_img[6])
	);

	butterfly bf1_3(
		.x_m_0_real(stage_0_real[5]),
		.x_m_0_img(stage_0_img[5]),
		.x_n_0_real(stage_0_real[7]),
		.x_n_0_img(stage_0_img[7]),
		.clk(clk),
		.rst_n(rst_n),
		.index(2),
		.x_m_1_real(stage_1_real[5]),
		.x_m_1_img(stage_1_img[5]),
		.x_n_1_real(stage_1_real[7]),
		.x_n_1_img(stage_1_img[7])
	);

	butterfly bf2_0(
		.x_m_0_real(stage_1_real[0]),
		.x_m_0_img(stage_1_img[0]),
		.x_n_0_real(stage_1_real[4]),
		.x_n_0_img(stage_1_img[4]),
		.clk(clk),
		.rst_n(rst_n),
		.index(0),
		.x_m_1_real(y_0_r),
		.x_m_1_img(y_0_i),
		.x_n_1_real(y_4_r),
		.x_n_1_img(y_4_i)
	);

	butterfly bf2_1(
		.x_m_0_real(stage_1_real[1]),
		.x_m_0_img(stage_1_img[1]),
		.x_n_0_real(stage_1_real[5]),
		.x_n_0_img(stage_1_img[5]),
		.clk(clk),
		.rst_n(rst_n),
		.index(1),
		.x_m_1_real(y_1_r),
		.x_m_1_img(y_1_i),
		.x_n_1_real(y_5_r),
		.x_n_1_img(y_5_i)
	);

	butterfly bf2_2(
		.x_m_0_real(stage_1_real[2]),
		.x_m_0_img(stage_1_img[2]),
		.x_n_0_real(stage_1_real[6]),
		.x_n_0_img(stage_1_img[6]),
		.clk(clk),
		.rst_n(rst_n),
		.index(2),
		.x_m_1_real(y_2_r),
		.x_m_1_img(y_2_i),
		.x_n_1_real(y_6_r),
		.x_n_1_img(y_6_i)
	);

	butterfly bf2_3(
		.x_m_0_real(stage_1_real[3]),
		.x_m_0_img(stage_1_img[3]),
		.x_n_0_real(stage_1_real[7]),
		.x_n_0_img(stage_1_img[7]),
		.clk(clk),
		.rst_n(rst_n),
		.index(3),
		.x_m_1_real(y_3_r),
		.x_m_1_img(y_3_i),
		.x_n_1_real(y_7_r),
		.x_n_1_img(y_7_i)
	);
   
endmodule
