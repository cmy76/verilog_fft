`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/08 16:04:28
// Design Name: 
// Module Name: mult_cell
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


module    mult_cell(
    input[15:0]         mult_1,
    input[7:0]          mult_2,

    input[15:0]         mult_pre,
    
    input               clk,
    input               rst_n,
    input               en,

    output reg          rdy,
    
	output reg[15:0]    mult_1_shift,
    output reg[7:0]     mult_2_shift,
    output reg[15:0]    mult_next
);

always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        mult_next <= 0;
        mult_1_shift <= 0;
        rdy <= 0;
        mult_2_shift <= 0;
    end
    else if(en) begin
        mult_1_shift <= mult_1 << 1;
        rdy <= 1;
        mult_2_shift <= {0, mult_2[7:1]};
        if(mult_2[0]) begin
            mult_next <= mult_pre + mult_1;
        end
        else begin
            mult_next <= mult_pre;
        end
    end
    else begin
        mult_next <= 0;
        mult_1_shift <= 0;
        rdy <= 0;
        mult_2_shift <= 0;
    end
end

endmodule
