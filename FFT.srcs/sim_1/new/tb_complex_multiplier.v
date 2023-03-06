`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/10 15:31:10
// Design Name: 
// Module Name: tb_complex_multiplier
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


module tb_complex_multiplier();
	reg[11:0] a;
	reg[11:0] b;
	reg[11:0] c;
	reg[11:0] d;
	reg clk;
	reg rst_n;
	reg en;
	
	wire[23:0] result_img;
	wire[23:0] result_real;
	
	complex_multiplier dut(
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.clk(clk),
		.rst_n(rst_n),
		.en(en),
		.result_img(result_img),
		.result_real(result_real)
	);
	
	initial begin
		a = 12'h001;
		b = 12'h003;
		c = 12'h002;
		d = 12'h004;
		clk = 0;
		rst_n = 1;
		en = 1;
		
		#10
		
		a = 12'h003;
		b = 12'h005;
		c = 12'h004;
		d = 12'h006;
		
		#10
		
		$finish;
	end
	
	always begin
		#5 clk = ~clk;
	end
endmodule

