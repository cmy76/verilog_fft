`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/10 15:41:15
// Design Name: 
// Module Name: spin_table
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


module spin_table(
	input[2:0]			index,
	
	output[11:0]		rea,
	output[11:0]		img
    );
    reg [11:0]			rea_tmp;
    reg [11:0]			img_tmp;
    always@(*) begin
    	case(index)
    		3'b000:begin
    			rea_tmp = 127;
    			img_tmp = 0;
    		end
    		3'b001:begin
    			rea_tmp = 90;
    			img_tmp = -90;
    		end
    		3'b010:begin
    			rea_tmp = 0;
    			img_tmp = -127;
    		end
    		3'b011:begin
    			rea_tmp = -90;
    			img_tmp = -90;
    		end
    		3'b100:begin
    			rea_tmp = -127;
    			img_tmp = 0;
    		end
    		3'b101:begin
    			rea_tmp = -90;
    			img_tmp = 90;
    		end
    		3'b110:begin
    			rea_tmp = 0;
    			img_tmp = 127;
    		end
    		3'b111:begin
    			rea_tmp = 90;
    			img_tmp = 90;
    		end
    	endcase
    end
    assign rea = rea_tmp;
    assign img = img_tmp;
endmodule
