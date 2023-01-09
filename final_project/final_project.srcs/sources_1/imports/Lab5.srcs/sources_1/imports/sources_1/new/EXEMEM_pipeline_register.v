`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2022 02:04:43 PM
// Design Name: 
// Module Name: EXEMEM_pipeline_register
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


module EXEMEM_pipeline_register(
    input ewreg,
    input em2reg,
    input ewmem,
    input [4:0] edestReg,
    input [31:0] r,
    input [31:0] eqb,
    input clock,
    output reg mwreg,
    output reg mm2reg,
    output reg mwmem,
    output reg [4:0] mdestReg,
    output reg [31:0] mr,
    output reg [31:0] mqb
    );
    always @(posedge clock) begin
        mwreg       <= ewreg; 
        mm2reg      <= em2reg;
        mwmem       <= ewmem;
        mdestReg    <= edestReg;
        mr          <= r;
        mqb         <= eqb;
    end
    
    
endmodule
