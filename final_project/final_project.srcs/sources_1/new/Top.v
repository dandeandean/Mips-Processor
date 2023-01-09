`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2022 10:05:51 PM
// Design Name: 
// Module Name: Top
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


module Top(
    input clock,
    output [31:0] eqa,
    output [31:0] eqb,
    output [31:0] mr
    );
    
    datapath dp(.clock(clock), .eqa(eqa), .eqb(eqb), .mr(mr)); 
    
    
endmodule
