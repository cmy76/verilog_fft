`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/09 23:04:11
// Design Name: 
// Module Name: tb_booth_top
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


module tb_booth_top;

// Instantiate the booth_top module
booth_top uut (
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .mult_1(mult_1),
    .mult_2(mult_2),
    .result(result),
    .result_rdy(result_rdy)
);

// Define the clock signal
reg clk;
initial begin
    clk = 0;
    forever #5 clk = !clk;
end

// Define the reset signal
reg rst_n;
initial begin
    rst_n = 1;
end

// Define the enable signal
reg en;
initial begin
    en = 0;
end

// Define the input signals
reg [11:0] mult_1;
initial begin
    mult_1 = 8'h00;
end

reg [11:0] mult_2;
initial begin
    mult_2 = 8'h00;
end

// Define the output signals
wire [23:0] result;
wire result_rdy;

// Initialize the simulation
initial begin
    // Assert the reset signal
    rst_n = 0;
    // Wait for 2 clock cycles
    @(posedge clk);
    @(posedge clk);
    // De-assert the reset signal
    rst_n = 1;
    en = 1;
    #20;
    // Set the input values
    mult_1 = -7;
    mult_2 = -3;
    // Enable the module
    
    // Simulate for 10 clock cycles
    #20;
    mult_1 = 21;
    mult_2 = 54;
    #20;
    mult_1 = -35;
    mult_2 = 42;
    #20;
    
    mult_1 = -256;
    mult_2 = 42;
    #20;
    
    mult_1 = -128;
    mult_2 = 64;
    #20;
    // Disable the module
    en = 0;
    // End the simulation
    $finish;
end

endmodule

