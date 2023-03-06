`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 21:14:18
// Design Name: 
// Module Name: tb_multiplier
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


module tb_multiplier();

	reg clk;
    reg rst_n;
    reg en;
    reg[8:0] mult_1;
    reg[8:0] mult_2;
    
    wire[16:0] prdct;
    wire	   rdy;
    multiplier mp(
    	.a(mult_1),
    	.b(mult_2),
    	.clk(clk),
    	.rst_n(rst_n),
    	.prdct(prdct),
    	.rdy(rdy)
    );
    initial begin
        // Initialize input values
        clk = 0;
        rst_n = 0;
        en = 0;
        mult_1 = 9'b1000_1101;
        mult_2 = 9'b0000_1111;
        #20
        rst_n = 1;
        en = 1;
        #100;
        $finish;
    end
	
	always #5 clk = ~clk;
endmodule
