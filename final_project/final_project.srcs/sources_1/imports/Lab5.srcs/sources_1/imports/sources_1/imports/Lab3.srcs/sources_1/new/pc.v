`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 10:39:09 AM
// Design Name: 
// Module Name: pc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  pc is set to value of nextPc
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module program_counter_register(
    input [31:0] nextPc,
    input clock,
    output reg [31:0] pc
    );
    initial pc <= 100; // This is where we set the PC to be 100 initially
    always @ (posedge clock) begin
        pc <= nextPc;
    end
endmodule
