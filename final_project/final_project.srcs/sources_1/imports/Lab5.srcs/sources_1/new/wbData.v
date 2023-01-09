`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2022 05:57:33 PM
// Design Name: 
// Module Name: wbData
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


module wbReg(
    input [31:0] wr,
    input [31:0] wdo,
    input wm2reg, 
    output reg [31:0] wbData
    );
    
    always @(*) begin
        case(wm2reg)
            1'b0: wbData <= wr;
            1'b1: wbData <= wdo;
        endcase
    
    end 
    
endmodule
