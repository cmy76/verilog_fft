`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/10 15:53:46
// Design Name: 
// Module Name: tb_spin_table
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

module tb_spin_table();
// 声明需要测试的模块
spin_table uut (
	.index(index),
	.rea(rea),
	.img(img)
);

// 声明测试模块的输入信号
reg [2:0] index;

// 声明测试模块的输出信号
wire [7:0] rea;
wire [7:0] img;

// 定义测试用例
initial begin
	// 设置测试模块的输入信号
	index = 0;
	#20;
	// 打印测试模块的输出信号
	$display("index = %d, rea = %d, img = %d", index, rea, img);

	// 修改测试模块的输入信号，并打印测试模块的输出信号
	index = 1;
	#20;
	$display("index = %d, rea = %d, img = %d", index, rea, img);

	// 修改测试模块的输入信号，并打印测试模块的输出信号
	index = 2;
	#20;
	$display("index = %d, rea = %d, img = %d", index, rea, img);

	// 修改测试模块的输入信号，并打印测试模块的输出信号
	index = 3;
	#20;
	$display("index = %d, rea = %d, img = %d", index, rea, img);
	index = 4;
	#20;
	index = 5;
	#20;
	index = 6;
	#20;
	index = 7;
	#20;
	// 修改测试模块的
end
endmodule