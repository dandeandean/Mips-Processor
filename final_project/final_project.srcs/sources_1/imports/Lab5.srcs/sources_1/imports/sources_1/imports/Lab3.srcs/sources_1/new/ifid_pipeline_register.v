`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 10:00:31 AM
// Design Name: 
// Module Name: ifid_pipeline_register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This acts as a checkpoint after we have grabbed the instruction.
//              dinstOut is set to instOut
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ifid_pipeline_register(
    input wpcir,
    input [31:0] instOut,
    input clock,
    output reg[31:0] dinstOut
    );
    
    always @ (posedge clock) begin
        dinstOut <= instOut;
    end
endmodule
