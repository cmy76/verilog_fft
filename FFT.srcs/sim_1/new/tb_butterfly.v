`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/10 16:34:45
// Design Name: 
// Module Name: tb_butterfly
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


module tb_butterfly();
	reg[11:0]			x_m_0_real;
	reg[11:0]			x_m_0_img;
	
	reg[11:0]			x_n_0_real;
	reg[11:0]			x_n_0_img;
	
	reg					clk;
	reg					rst_n;
	reg[2:0]			index;
	
	wire[11:0]			x_m_1_real;
	wire[11:0]			x_m_1_img;
	
	wire[11:0]			x_n_1_real;
	wire[11:0]			x_n_1_img;
	
	initial begin
		clk = 0;
		rst_n = 0;
		index = 0;
		x_m_0_real = 0;
		x_m_0_img = 0;
		x_n_0_real = 30;
		x_n_0_img = 0;
		#20;
		rst_n = 1;
		#40
		x_m_0_real = 10;
		x_m_0_img = 0;
		x_n_0_real = 20;
		x_n_0_img = 0;
		#40
		x_m_0_real = 20;
		x_m_0_img = 0;
		x_n_0_real = 10;
		x_n_0_img = 0;
		#40
		x_m_0_real = 30;
		x_m_0_img = 0;
		x_n_0_real = 0;
		x_n_0_img = 0;
	end
	
	always #20 begin
		clk=~clk;
	end

	butterfly bf(
		.x_m_0_real(x_m_0_real),
		.x_m_0_img(x_m_0_img),
		.x_n_0_real(x_n_0_real),
		.x_n_0_img(x_n_0_img),
		.clk(clk),
		.rst_n(rst_n),
		.index(index),
		.x_m_1_real(x_m_1_real),
		.x_m_1_img(x_m_1_img),
		.x_n_1_real(x_n_1_real),
		.x_n_1_img(x_n_1_img)
		);
		
		
endmodule
