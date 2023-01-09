`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2022 06:03:01 PM
// Design Name: 
// Module Name: a_mux
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


module a_mux(
    input [1:0] fwda,
    input [31:0] qa,
    input [31:0] er,
    input [31:0] mr,
    input [31:0] do,
    output reg [31:0] a
    );
    always @(*) begin 
        case(fwda) 
            2'b00: a <= qa;
            2'b01: a <= er;
            2'b10: a <= mr;
            2'b11: a <= do;
        endcase
    end
endmodule
