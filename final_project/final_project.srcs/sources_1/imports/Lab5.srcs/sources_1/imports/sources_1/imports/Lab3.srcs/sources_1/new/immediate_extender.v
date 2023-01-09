`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 10:07:06 AM
// Design Name: 
// Module Name: immediate_extender
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: We extend a 16bit->32bit while maintaining sign
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module immediate_extender(
    input [15:0] imm,
    output reg [31:0] imm32
    );
    always @(*) begin 
        imm32 <= {{16{imm[15]}},imm};
    end
    
endmodule
