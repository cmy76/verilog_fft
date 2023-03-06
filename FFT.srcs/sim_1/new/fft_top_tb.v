`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/11 18:04:41
// Design Name: 
// Module Name: fft_top_tb
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


module fft_top_tb();
  
  // Inputs
  reg [11:0] x_0;
  reg [11:0] x_1;
  reg [11:0] x_2;
  reg [11:0] x_3;
  reg [11:0] x_4;
  reg [11:0] x_5;
  reg [11:0] x_6;
  reg [11:0] x_7;
  reg clk;
  reg rst_n;
  
  // Outputs
  wire [11:0] y_0_r;
  wire [11:0] y_1_r;
  wire [11:0] y_2_r;
  wire [11:0] y_3_r;
  wire [11:0] y_4_r;
  wire [11:0] y_5_r;
  wire [11:0] y_6_r;
  wire [11:0] y_7_r;
  wire [11:0] y_0_i;
  wire [11:0] y_1_i;
  wire [11:0] y_2_i;
  wire [11:0] y_3_i;
  wire [11:0] y_4_i;
  wire [11:0] y_5_i;
  wire [11:0] y_6_i;
  wire [11:0] y_7_i;
  
  // Instantiate the Unit Under Test (UUT)
  fft_top uut (
    .x_0(x_0), 
    .x_1(x_1), 
    .x_2(x_2), 
    .x_3(x_3), 
    .x_4(x_4), 
    .x_5(x_5), 
    .x_6(x_6), 
    .x_7(x_7),
    .clk(clk),
    .rst_n(rst_n),
    .y_0_r(y_0_r),
    .y_1_r(y_1_r),
    .y_2_r(y_2_r),
    .y_3_r(y_3_r),
    .y_4_r(y_4_r),
    .y_5_r(y_5_r),
    .y_6_r(y_6_r),
    .y_7_r(y_7_r),
    .y_0_i(y_0_i),
    .y_1_i(y_1_i),
    .y_2_i(y_2_i),
    .y_3_i(y_3_i),
    .y_4_i(y_4_i),
    .y_5_i(y_5_i),
    .y_6_i(y_6_i),
    .y_7_i(y_7_i));
    
    // Initialize Inputs
  initial begin
    x_0 = 12'd0;
    x_1 = 12'd10;
    x_2 = 12'd0;
    x_3 = -10;
    x_4 = 0;
    x_5 = 10;
    x_6 = 0;
    x_7 = -10;
    clk = 0;
    rst_n = 0;
    #20
    rst_n = 1;
  end
  
  // Generate Clock
  always begin
    #5 clk = ~clk;
  end
endmodule

